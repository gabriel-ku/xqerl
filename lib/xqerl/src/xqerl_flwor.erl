%% -------------------------------------------------------------------
%%
%% xqerl - XQuery processor
%%
%% Copyright (c) 2017-2018 Zachary N. Dean  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc Handles parts of a FLWOR statement that see the entire tuple stream as one unit.
%% @NOTE much of this could be done in-line in the tuple stream. Ordering/grouping as each tuple comes in.
%%       Windows clauses would be difficult since they look forward.
%% @NOTE The FLWOR could possibly be turned into process-to-process messaging, one tuple at a time. 
%%       The return portion being a process that returns to the original process... 
%%       ... something to think about with huge data set aggregation.  

-module(xqerl_flwor).

-include("xqerl.hrl").

-define(atint(I), #xqAtomicValue{type = 'xs:integer', value = I}).

-export([windowclause/3]).
-export([windowclause/5]).
-export([orderbyclause/2]).
-export([groupbyclause/1]).

-export([simple_map/3]).

-export([optimize/2]).

%% -export([test/1]).
%% test(Term) ->
%%    replace_var_with_context_item(<<0>>, Term).


-define(BOOL_CALL(Arg),{'function-call', 
                    #qname{namespace = <<"http://www.w3.org/2005/xpath-functions">>,
                           local_name = <<"boolean">>}, 1, [Arg]}).

% internal use
%% -export([int_order_1/2]).
   
add_position(List) ->
   List1 = ?seq:to_list(List),
   add_position(List1, 1, []).

add_position([], _Cnt, Acc) ->
   lists:reverse(Acc);
add_position([H|T], Cnt, Acc) ->
   New = {H, ?atint(Cnt)},
   add_position(T, Cnt + 1, [New|Acc]);
add_position(H, Cnt, Acc) ->
   New = {H, ?atint(Cnt)},
   add_position([], Cnt + 1, [New|Acc]).

do_atomize([],_) -> {<<>>, []};
do_atomize([V],C) -> do_atomize(V,C);
do_atomize(#xqNode{} = N,Coll) ->
   A = ?seq:singleton_value(xqerl_types:atomize(N)),
   #xqAtomicValue{value = Val} = A,
   {xqerl_coll:sort_key(Val, Coll), A};
do_atomize(#xqAtomicValue{value = Val, type = T} = A,_)
   when T =:= 'xs:gYearMonth' orelse
        T =:= 'xs:gYear' orelse
        T =:= 'xs:gMonthDay' orelse
        T =:= 'xs:gDay' orelse
        T =:= 'xs:gMonth' orelse
        T =:= 'xs:date' orelse
        T =:= 'xs:dateTime' orelse
        T =:= 'xs:time' ->
    #xqAtomicValue{value = Val, type = T} = A ,
    {xqerl_coll:sort_key(Val, T), A};
do_atomize(#xqAtomicValue{value = Val} = A,Coll) ->
       {xqerl_coll:sort_key(Val, Coll), A};
do_atomize(_,_) ->
   ?err('XPTY0004').


%% takes {{{K1,C1},{KN,CN}}, {V1,V2,VN}} and returns {K1,KN,V1,V2,VN} grouped
groupbyclause(KeyVals) ->
   % atomize where needed
   KeyVals1 = 
     lists:map(fun({K1,V}) ->
                     KC = tuple_to_list(K1),
                     {
                      lists:map(fun({K,C}) ->
                                     do_atomize(K,C)
                               end, KC), 
                      list_to_tuple(lists:map(fun({Va,_}) -> Va;
                                   (Va) -> Va
                                end, tuple_to_list(V)))
                     }
               end, KeyVals),
    
   Keys = [K || {K,_V} <- KeyVals1],
   UKeys = unique(Keys),
   Mapped = lists:foldl(fun({K,V},Acc) ->
                     upsert(K,V,Acc)
               end, maps:new(), KeyVals1),
   All = lists:foldl(fun(Ks,Acc) ->
                           K = [K || {K,_V} <- Ks],
                           Vs = [V || {_K,V} <- Ks],
                  V = reverse(maps:get(K, Mapped)),
                  V1 = lists:map(fun(ListVal) ->
                                       ?seq:from_list(ListVal)
                                 end, V),
                  New = list_to_tuple(Vs ++ V1) ,
                  [New|Acc]
               end, [], UKeys),
   lists:reverse(All).

%% takes single list from expression and the start function and returns 
%% {SPrev,S, SPos,SNext,EPrev,E, EPos,ENext, W} 
%% can only be tumbling with no end function
windowclause(L, StartFun, WType) ->
   case add_position(L) of
      [] -> [];
      L1 ->
         Bw = winstart([[]|L1], StartFun, []),
         %?dbg("BW",Bw),
         Bw2 = lists:map(fun(B) ->
                               L2 = element(9, B),
                               S = ?seq:from_list(L2),
                               case xqerl_types:instance_of(S, WType) of
                                  #xqAtomicValue{value = true} ->
                                     setelement(9, B, S);
                                  _ ->
                                     ?err('XPTY0004')
                               end
                         end, Bw),
         lists:reverse(Bw2)
   end.

%% takes single list from expression and the start/end functions and returns 
%% {SPrev,S, SPos,SNext,EPrev,E, EPos,ENext, W} 
%% Type is tumbling or sliding
windowclause(L, StartFun, EndFun, {Type, Only}, WType) ->
   case add_position(L) of
      [] -> [];
      L1 ->
         Bw = winstart([[]|L1], StartFun, EndFun, Type, Only),
         %?dbg("BW",Bw),
         Bw2 = lists:map(fun(B) ->
                               L2 = element(9, B),
                               S = ?seq:from_list(L2),
                               case xqerl_types:instance_of(S, WType) of
                                  #xqAtomicValue{value = true} ->
                                     setelement(9, B, S);
                                  _ ->
                                     ?err('XPTY0004')
                               end
                         end, Bw),
         lists:reverse(Bw2)
   end;
windowclause(L, StartFun, EndFun, Type, WType) ->
   windowclause(L, StartFun, EndFun, {Type, false}, WType).


% tumbling window with no end function, means window as of each 'true'
winstart([[],{S, SPos}] = L, StartFun, Acc) ->
   case bool(StartFun({S,SPos,[],[]})) of
      true ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, {S,SPos,[],[],S,SPos,[],[],[S]});
            A ->
               R = lists:reverse(element(9, A)),
               winstart(L, StartFun, []) ++ [setelement(9, A, R)]
         end;
      _ ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, []);
            {S1,SPos1,SPrev1,SNext1,_,_, _,_,W} ->
               NewAcc = {S1,SPos1,SPrev1,SNext1,S,SPos,[],[],[S|W]},
               winstart(tl(L), StartFun, NewAcc)
         end
   end;
winstart([[],{S, SPos},{SNext, _}|_] = L, StartFun, Acc) ->
   case bool(StartFun({S,SPos,[],SNext})) of
      true ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, {S,SPos,[],SNext,S,SPos,[],SNext,[S]});
            A ->
               R = lists:reverse(element(9, A)),
               winstart(L, StartFun, []) ++ [setelement(9, A, R)]
         end;
      _ ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, []);
            {S1,SPos1,SPrev1,SNext1,_,_, _,_,W} ->
               NewAcc = {S1,SPos1,SPrev1,SNext1,S,SPos,[],SNext,[S|W]},
               winstart(tl(L), StartFun, NewAcc)
         end
   end;
winstart([{SPrev,_},{S, SPos}], StartFun, Acc) ->
   case bool(StartFun({S,SPos,SPrev,[]})) of
      true ->
         case Acc of
            [] ->
               [{S,SPos,SPrev,[],S,SPos,SPrev,[],[S]}];
            A ->
               R = lists:reverse(element(9, A)),
               [{S,SPos,SPrev,[],S,SPos,SPrev,[],S} , setelement(9, A, R)]
         end;
      _ ->
         case Acc of
            [] ->
               [];
            {S1,SPos1,SPrev1,SNext1,_,_, _,_,W} ->
               [{S1,SPos1,SPrev1,SNext1,S,SPos,SPrev,[],lists:reverse([S|W])}]
         end
   end;
winstart([{SPrev,_},{S, SPos},{SNext, _}|_] = L, StartFun, Acc) ->
   case bool(StartFun({S,SPos,SPrev,SNext})) of
      true ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, 
                        {S,SPos,SPrev,SNext,S,SPos,SPrev,SNext,[S]});
            A ->
               R = lists:reverse(element(9, A)),
               winstart(L, StartFun, []) ++ [setelement(9, A, R)]
         end;
      _ ->
         case Acc of
            [] ->
               winstart(tl(L), StartFun, []);
            {S1,SPos1,SPrev1,SNext1,_,_, _,_,W} ->
               NewAcc = {S1,SPos1,SPrev1,SNext1,S,SPos,SPrev,SNext,[S|W]},
               winstart(tl(L), StartFun, NewAcc)
         end
   end.


winstart([], _StartFun, _EndFun, _Type, _Only) ->
   [];
winstart([{SPrev,_}] = L, StartFun, EndFun, _Type, Only) ->
   case bool(StartFun({[],[],SPrev,[]})) of
      true ->
         {Win, _Rest} = winend(SPrev, [], [], [], L, EndFun, [], Only),
         % could send Win someplace now
         Win;
      _ ->
         []
   end;
winstart([[],{S, SPos},{SNext, _}|_] = L, StartFun, EndFun, Type, Only) ->
   case bool(StartFun({S,SPos,[],SNext})) of
      true ->
         {Win, Rest} = winend([], S, SPos, SNext, L, EndFun, [], Only),
         % could send Win someplace now
         if Type == tumbling ->
               winstart(Rest, StartFun, EndFun, Type, Only) ++ Win;
            true ->
               winstart(tl(L), StartFun, EndFun, Type, Only) ++ Win
         end;
      _ ->
         winstart(tl(L), StartFun, EndFun, Type, Only)
   end;
winstart([[],{S, SPos}] = L, StartFun, EndFun, Type, Only) ->
   case bool(StartFun({S,SPos,[],[]})) of
      true ->
         {Win, _Rest} = winend([], S, SPos, [], L, EndFun, [], Only),
         % could send Win someplace now
         Win;
%%          if Type == tumbling ->
%%                winstart(Rest, StartFun, EndFun, Type, Only) ++ Win;
%%             true ->
%%                winstart(tl(L), StartFun, EndFun, Type, Only) ++ Win
%%          end;
      _ ->
%%          []
         winstart(tl(L), StartFun, EndFun, Type, Only)
   end;
winstart([{SPrev,_},{S, SPos}] = L, StartFun, EndFun, Type, Only) ->
   case bool(StartFun({S,SPos,SPrev,[]})) of
      true ->
         {Win, _Rest} = winend(SPrev, S, SPos, [], L, EndFun, [], Only),
         % could send Win someplace now
         Win;
      _ ->
%%          []
         winstart(tl(L), StartFun, EndFun, Type, Only)
   end;
winstart([{SPrev,_},{S, SPos},{SNext, _}|_] = L,StartFun,EndFun,Type,Only) ->
   case bool(StartFun({S,SPos,SPrev,SNext})) of
      true ->
         {Win, Rest} = winend(SPrev, S, SPos, SNext, L, EndFun, [], Only),
         % could send Win someplace now
         if Type == tumbling ->
               winstart(Rest, StartFun, EndFun, Type, Only) ++ Win;
            true ->
               winstart(tl(L), StartFun, EndFun, Type, Only) ++ Win
         end;
      _ ->
         winstart(tl(L), StartFun, EndFun, Type, Only)
   end.


winend(SPrev,S,SPos,SNext,[[],{E, EPos},{ENext, _}|_] = L, EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,E,EPos,[],ENext})) of
      true ->
         {[{S,SPos,SPrev,SNext,E,EPos,[],ENext, ?seq:append(E, Acc)}], tl(L)};
      _ ->
         winend(SPrev,S,SPos,SNext,tl(L), EndFun, ?seq:append(E, Acc), Only)
   end;
winend(SPrev,S,SPos,SNext,[[],{E, EPos}] = L, EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,E,EPos,[],[]})) of
      true ->
         {[{S,SPos,SPrev,SNext,E,EPos,[],[], ?seq:append(E, Acc)}], tl(L)};
      _ ->
         winend(SPrev,S,SPos,SNext,tl(L), EndFun, ?seq:append(E, Acc), Only)
   end;
winend(SPrev,S,SPos,SNext,[{EPrev,_},{E, EPos}], EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,E,EPos,EPrev,[]})) of
      true ->
         {[{S,SPos,SPrev,SNext,E,EPos,EPrev,[], ?seq:append(E, Acc)}], []};
      _ ->
         if Only == true ->
               {[], []};
            true ->
               {[{S,SPos,SPrev,SNext,E,EPos,EPrev,[], ?seq:append(E, Acc)}], []}
         end
   end;
winend(SPrev,S,SPos,SNext,[{EPrev,_}], EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,[],[],EPrev,[]})) of
      true ->
         {[{S,SPos,SPrev,SNext,[],[],EPrev,[], Acc}], []};
      _ ->
         if Only == true ->
               {[], []};
            true ->
               {[{S,SPos,SPrev,SNext,[],[],EPrev,[], Acc}], []}
         end
   end;
winend(SPrev,S,SPos,SNext,[{EPrev,_},{E, EPos},{ENext, _}|_] = L, 
       EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,E,EPos,EPrev,ENext})) of
      true ->
         {[{S,SPos,SPrev,SNext,E,EPos,EPrev,ENext, ?seq:append(E, Acc)}], 
          tl(L)};
      _ ->
         winend(SPrev,S,SPos,SNext,tl(L), EndFun, ?seq:append(E, Acc), Only)
   end.

%% functions for group by
unique(KeysAll) ->
   unique(KeysAll, maps:new(), []).

unique([], _Map, Acc) ->
   lists:reverse(Acc);
unique([H|T], Map, Acc) ->
   H1 = [Q || {Q,_} <- H],
   case maps:is_key(H1, Map) of 
      true ->
         unique(T, Map, Acc);
      _ ->
         unique(T, maps:put(H1, true, Map), [H|Acc])
   end.

upsert(K,V,Map) ->
   H1 = [Q || {Q,_} <- K],
   case maps:find(H1, Map) of
      error ->
         maps:put(H1, append(V,[]), Map);
      {ok, Val} ->
         maps:put(H1, append(V,Val), Map)
   end.

append(Tup,[]) ->
   Sz = erlang:tuple_size(Tup),
   lists:map(fun(I) ->
                   [erlang:element(I, Tup)]
             end, lists:seq(1, Sz));
append(Tup,List) ->
   Sz = erlang:tuple_size(Tup),
   lists:map(fun(I) ->
                   V = lists:nth(I, List),
                   [erlang:element(I, Tup)|V]
             end, lists:seq(1, Sz)).

reverse(List) ->
   Sz = erlang:length(List),
   lists:map(fun(I) ->
                  lists:flatten(lists:reverse(lists:nth(I, List)))
             end, lists:seq(1, Sz)).

%% int_order_1(Tuple,Clauses) ->
%%    Cs = lists:map(fun({C,D,E}) ->
%%                    V = C(Tuple),
%%                    {V,D,E}
%%              end, Clauses),
%%    {Tuple,Cs}.
%% 
%% pmap(F, [L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,
%%          L11,L12,L13,L14,L15,L16,L17,L18,L19,L20|T]) ->
%%    S = self(),
%%    Ref = make_ref(),
%%    Pids = lists:map(fun(I) ->
%%                           spawn(fun() ->
%%                                       do_f(S,Ref,F,I) 
%%                                 end)
%%                     end, [L1,L2,L3,L4,L5,L6,L7,L8,L9,L10,
%%          L11,L12,L13,L14,L15,L16,L17,L18,L19,L20]),
%%    H = gather(Pids,Ref),
%%    H ++ pmap(F,T);
%% pmap(F, [L1,L2,L3,L4,L5,L6,L7,L8,L9,L10|T]) ->
%%    S = self(),
%%    Ref = make_ref(),
%%    Pids = lists:map(fun(I) ->
%%                           spawn(fun() ->
%%                                       do_f(S,Ref,F,I) 
%%                                 end)
%%                     end, [L1,L2,L3,L4,L5,L6,L7,L8,L9,L10]),
%%    H = gather(Pids,Ref),
%%    H ++ pmap(F,T);
%% pmap(F, L) ->
%%    lists:map(fun(I) ->
%%                    F(I)
%%              end,L).
%% 
%% do_f(Parent,Ref,F,I) ->
%%    Parent ! {self(),Ref,F(I)}.
%% 
%% gather([Pid|T],Ref) ->
%%    receive
%%       {Pid,Ref,Ret} ->
%%          %?dbg("Ret",Ret),
%%          [Ret|gather(T,Ref)]
%%    end;
%% gather([],_) ->
%%    [].


% Clauses are funs that take an entire VarStream tuple
orderbyclause(VarStream, Clauses) ->
   %?dbg("orderbyclause 1",erlang:system_time()),
   F = fun(Tuple) ->
             Cs = lists:map(fun({C,D,E}) ->
                             V = C(Tuple),
                             {V,D,E}
                       end, Clauses),
             {Tuple,Cs}
       end,
%%    Set = rpc:pmap({?MODULE,int_order_1}, [Clauses], VarStream),
   Set = lists:map(F, VarStream),
%%    Set = pmap(F, VarStream),
   %?dbg("orderbyclause 2",erlang:system_time()),
   Sorted = lists:sort(fun(A,B) ->
                             do_order(A,B)
                       end, Set),
   %?dbg("orderbyclause 3",erlang:system_time()),
   [T || {T,_} <- Sorted].


do_order({_,[]},{_,[]}) ->
   true;
do_order({TA,[{ValA,descending,Empty}|RestA]},{TB,[{ValB,_,_}|RestB]}) ->
   if ValA == [] andalso ValB == [] -> % stable sort by empty function
         true;
      Empty == greatest andalso ValA == [] ->
         true;
      Empty == greatest andalso ValB == [] ->
         false;
      Empty == greatest andalso ValA == #xqAtomicValue{type = 'xs:float', 
                                                       value = nan};
      Empty == greatest andalso ValA == #xqAtomicValue{type = 'xs:double', 
                                                       value = nan} ->
         true;
      Empty == least andalso ValA == [] ->
         false;
      Empty == least andalso ValB == [] ->
         true;
      Empty == least andalso ValB == #xqAtomicValue{type = 'xs:float', 
                                                    value = nan};
      Empty == least andalso ValB == #xqAtomicValue{type = 'xs:double', 
                                                    value = nan} ->
         true;
      true ->
         case val(xqerl_operators:greater_than(ValA, ValB)) of
            true  ->
               true;
            _ ->
               case val(xqerl_operators:equal(ValA, ValB)) of
                  true ->
                     do_order({TA,RestA},{TB,RestB});
                  _ ->
                     false                           
               end
         end
   end;
do_order({TA,[{ValA,ascending,Empty}|RestA]},{TB,[{ValB,_,_}|RestB]}) ->
   if ValA == [] andalso ValB == [] -> % stable sort by empty function
         true;
      Empty == greatest andalso ValA == [] ->
         false;
      Empty == greatest andalso ValB == [] ->
         true;
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:float', 
                                                       value = nan};
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:double', 
                                                       value = nan} ->
         true;
      Empty == least andalso ValA == [] ->
         true;
      Empty == least andalso ValB == [] ->
         false;
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:float', 
                                                    value = nan};
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:double', 
                                                    value = nan} ->
         true;
      true ->
         case val(xqerl_operators:less_than(ValA, ValB)) of
            true ->
               true;
            _ ->
               case val(xqerl_operators:equal(ValA, ValB)) of
                  true ->
                     do_order({TA,RestA},{TB,RestB});
                  _ ->
                     false                           
               end
         end
   end.

val(T) -> xqerl_types:value(T).

bool(T) -> xqerl_operators:eff_bool_val(T).

simple_map(Ctx, Seq, MapFun) ->
   ?seq:map(Ctx, MapFun, Seq).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   Static optimizations of FLWOR statements   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Attempts to optimize a FLWOR statement by reordering clauses 
%% and removing unused variables 
-spec optimize(#xqFlwor{}, digraph:graph()) ->
   Result :: #xqFlwor{} | any().
optimize(#xqFlwor{} = FL, Digraph) ->
   {B2, F2} = fold_changes(FL, Digraph),
   case strip_empty_flwor(F2) of
      #xqFlwor{} ->
         {B3,F3} = replace_trailing_for_in_return(F2, Digraph),
         {B4,F4} = fold_for_count(F3, Digraph),
         {B5,F5} = maybe_lift_simple_return(F4, Digraph),
         {B6,F6} = maybe_lift_lets_in_return(F5, Digraph),
         F7 = if B2 orelse B3 orelse B4 orelse B5 orelse B6 ->
                    % keep cycling until completely optimized
                    optimize(F6, Digraph);
                 true ->
                    F6
              end,
%?dbg("F7",F7),
         case F7 of
            #xqFlwor{} ->
               Cl8 = combine_wheres(F7#xqFlwor.loop),
               leading_where_as_if(F7#xqFlwor{loop = Cl8}, Digraph);
            Other ->
               Other
         end;
      Empty ->
         Empty
   end;
optimize(FL, _) -> FL.
  
%% STEP 1 
%% done in parser, splits and statements in where 

%% STEP 2 
-spec fold_changes(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
fold_changes(#xqFlwor{} = FL, G) ->
   {B0,F0} = maybe_split_for(FL, G),
   {B1,F1} = maybe_lift_let(F0, G),
   {B2,F2} = maybe_inline_let(F1, G),
   {B3,F3} = remove_unused_variables(F2, G),
   {B4,F4} = maybe_lift_nested_for_expression(F3),
   {B5,F5} = maybe_lift_nested_let_clause(F4),
   {B6,F6} = maybe_lift_where_clause(F5, G),
   {B7,F7} = where_clause_as_predicate(F6, G),
   {B8,F8} = positional_where_clause_as_predicate(F7, G),
   B = B0 orelse B1 orelse B2 orelse B3 orelse 
       B4 orelse B5 orelse B6 orelse B7 orelse B8, 
   {B,F8}.

%% STEP 2.1.a 
%% attempts to split 'for' clauses into a let and for clause 
%% that appear after other for clauses
%% and do not rely on each other 
%% them, returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_split_for(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_split_for(#xqFlwor{loop = Clauses} = FL, G) ->
   Fors = [{for,V} || 
           {for,V} <- Clauses],
   case Fors of
      [] ->
         {false,FL};
      [_] ->
         {false,FL};
      _ ->
         F = fun({for,#xqVar{id = Id0,
                             empty = false} = FV} = V) when Id0 < 10000 ->
                   D = fun(O) ->
                             not relies_on(V, O, G)
                       end,
                   case lists:any(D, Fors) of
                      true -> % does not depend on some
                         #xqVar{id = Id,name = Nm,expr = Ex,type = Ty} = FV,
                         ?dbg("spliting for",Nm),
                         Let = {'let',#xqVar{id = Id,name = Nm,
                                             expr = Ex,
                                             type = maybe_many_type(Ty)}},
                         For = {'for',FV#xqVar{id = Id + 10000,
                                               expr = #xqVarRef{name = Nm}}},
                         FVx = vertex_name(For),
                         LVx = vertex_name(Let),
                         digraph:add_vertex(G, FVx),
                         digraph:add_vertex(G, LVx),
                         
                         digraph:add_edge(G, LVx, FVx),
                         digraph:add_edge(G, FVx, LVx),
                         
                         [Let,For];
                      false ->
                         [V]
                   end;
                (O) ->
                   [O]
             end,
         Loop = lists:flatmap(F, Clauses),
         {Loop =/= Clauses, FL#xqFlwor{loop = Loop}}
   end.
%;
%maybe_split_for(FL, _) ->
%   {false,FL}.


%% STEP 2.1.b 
%% attempts to lift 'let' clauses above other statements that do not use 
%% them, returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_let(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_let(#xqFlwor{loop = Clauses} = FL, G) ->
   PosList = to_pos_list(Clauses),
   Lets = [{P,V} || 
           {P,V} <- PosList,
           element(1, V) == 'let',
           shiftable_expression(V),
           P > 1],
   F = fun({P,Let},{Ch,All}) ->
             {Ch1,All1} = do_lift_let({P,Let},All,G),
             {Ch1 orelse Ch, All1}
       end,  
   {Changed,NewPosList} = lists:foldl(F, {false,PosList}, Lets),
   {Changed,FL#xqFlwor{loop = from_pos_list(NewPosList)}}.

do_lift_let({P,Let},All,G) ->
   Seq = lists:reverse(lists:seq(1, P - 1)),
   Pred = fun(Pos) ->
                {_,Val} = lists:keyfind(Pos, 1, All),
                (not relies_on(Let, Val, G)) andalso
                  element(2,vertex_name(Let)) =/= element(2,vertex_name(Val)) 
          end,
   Skip = [lists:keyfind(A, 1, All) || A <- lists:takewhile(Pred, Seq)],
   case get_first_for_window(Skip) of
      [] ->
         {false,All};
      I ->
         ?dbg("Lifting let variable",Let),
         {true,insert_at(Let, I,remove_from(P, All))}
   end. 

do_lift_where({P,Where},All,G) ->
   Seq = lists:reverse(lists:seq(1, P - 1)),
   Pred = fun(Pos) ->
                case lists:keyfind(Pos, 1, All) of
                   {_,{count,_}} ->
                      false;
                   {_,{group_by,_,_}} ->
                      false;
                   {_,Val} ->
                      not relies_on(Where, Val, G)
                end
          end,
   Skip = lists:reverse([lists:keyfind(A, 1, All) || 
                         A <- lists:takewhile(Pred, Seq)]),
   case get_first_non_where(Skip) of
      [] ->
         {false,All};
      I ->     
         ?dbg("Lifting where",Where),
         {true,insert_at(Where, I, remove_from(P, All))}
   end. 

get_first_for_window([{I,{'for',#xqVar{empty = false}}}|_]) ->
   I;
get_first_for_window([{I,#xqWindow{}}|_]) ->
   I;
get_first_for_window([_|T]) ->
   get_first_for_window(T);
get_first_for_window([]) -> [].
   
get_first_non_where([]) -> [];
get_first_non_where([{_,{'where',_,_}}|T]) ->
   get_first_non_where(T);
get_first_non_where([{I,_}|_]) ->
   I.
   

%% STEP 2.2 
%% attempts to replace any static/atomic variables set with a 'let' clause 
%% with their value inline, and remove the let clause
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
%% TODO: implement, need a good way to scope variables here 
-spec maybe_inline_let(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_inline_let(#xqFlwor{id = _Id, loop = _Clauses, return = _Return} = FL, _G) ->
   % lets that rely on nothing are static
   %   PosList = to_pos_list(Clauses),
   %   Lets = [{P,V} || 
   %           {P,V} <- PosList,
   %           element(1, V) == 'let',
   %           shiftable_expression(V),
   %           relies_on(V, [], G)
   %           ],
   % for each let
   % remove all edges
   % remove vertex
   % replace every use of variable with expr (#xqVarRef{name = Name})   
   %   ?dbg("Lets",Lets),
   {false,FL}.

%% STEP 2.3 
%% removes any unused variables created in let or count clauses
%% also removes variables from DiGraph 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec remove_unused_variables(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
remove_unused_variables(#xqFlwor{loop = Clauses} = FL, G) ->
   PosList = to_pos_list(Clauses),
   Lets = [{P,V} || 
           {P,V} <- PosList,
           element(1, V) == 'let' orelse element(1, V) == 'count',
           [] == relies_on([], V, G)
           ],
   if Lets == [] ->
         {false,FL};
      true ->
         F = fun({P,Let},CurrList) ->
                   VN = vertex_name(Let),
                   ?dbg("removing unused variable",VN),
                   true = digraph:del_vertex(G, VN),
                   remove_from(P, CurrList)
             end,
         % foldr to not screw up indexes
         NewFl = lists:foldr(F, PosList, Lets),
         {true, FL#xqFlwor{loop = from_pos_list(NewFl)}}
   end.

%% STEP 2.4 
%% move simple (only for,let,where) flwors out of sub-for 
%% expressions(not allowing empty, or with position) 
%% place before for clause 
%% sub-return becomes new for-expression 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_nested_for_expression(#xqFlwor{}) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_nested_for_expression(#xqFlwor{loop = Clauses} = FL) ->
   F = fun({for, #xqVar{empty = false, 
                        name = N,
                        position = undefined,
                        expr = #xqFlwor{loop = Loop0,
                                        return = Ret}} = V}, _) ->
             ?dbg("Flattening FLWOR",N),
             Loop = Loop0 ++ [{for,V#xqVar{expr = Ret}}],
             {Loop,true};
          (O,Changed0) ->
             {O,Changed0}
       end,
   {C1,Changed} = lists:mapfoldl(F, false, Clauses),
   if Changed ->
         {true, FL#xqFlwor{loop = lists:flatten(C1)}};
      true ->
         {false,FL}
   end.

%% STEP 2.5
%% move leading let clauses out of sub-flwors in for or let clauses
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_nested_let_clause(#xqFlwor{}) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_nested_let_clause(#xqFlwor{loop = Clauses} = FL) ->
   F = fun({Typ, #xqVar{name = N,
                        expr = #xqFlwor{loop = [{'let',_}=L|T]} = Fl1} = V}, _) 
             when Typ == 'for';
                  Typ == 'let' ->
             ?dbg("Lifting let from sub-FLWOR",N),
             Loop = [L, {Typ,V#xqVar{expr = Fl1#xqFlwor{loop = T}}}],
             {Loop,true};
          (O,Changed0) ->
             {O,Changed0}
       end,
   {C1,Changed} = lists:mapfoldl(F, false, Clauses),
   if Changed ->
         {true, FL#xqFlwor{loop = lists:flatten(C1)}};
      true ->
         {false,FL}
   end.

%% STEP 2.6
%% lift 'where' clauses above other statements that do not use them 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_where_clause(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_where_clause(#xqFlwor{loop = Clauses} = FL, G) ->
   PosList = to_pos_list(Clauses),
   Lets = [{P,V} || 
           {P,V} <- PosList,
           element(1, V) == 'where',
           shiftable_expression(V),
           P > 1],
   F = fun({P,Let},{Ch,All}) ->
             {Ch1,All1} = do_lift_where({P,Let},All,G),
             {Ch1 orelse Ch, All1}
       end,  
   {Changed,NewPosList} = lists:foldl(F, {false,PosList}, Lets),
   {Changed,FL#xqFlwor{loop = from_pos_list(NewPosList)}}.


%% STEP 2.7
%% 'where' clauses directly following 'for' clauses become predicates 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
%% TODO: implement 
-spec where_clause_as_predicate(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
where_clause_as_predicate(#xqFlwor{id = _Id, loop = Clauses, 
                                 return = _Return} = FL, G) ->
   NewClauses = merge_for_where(Clauses, G),
   if Clauses == NewClauses ->
         {false, FL};
      true ->
         {true, FL#xqFlwor{loop = NewClauses}}
   end.

merge_for_where([{for,#xqVar{name = FName,
                             empty = false,
                             expr = Expr, position = undefined} = FVar} = For,
                 {'where',WId,WExpr} = Where|T], G) ->
   WName = vertex_name(Where),
   FVName = vertex_name(For),
   case relies_on_for_no_pos(Where, For, G) of
      true ->
         % relies on for variable, so replace with 'context-item'
         ?dbg("Lifting where into for as predicate",WExpr),
         FVarRef = #xqVarRef{name = FName},
         ?dbg("removing where clause",WName),
         digraph:add_edge(G, WName, FVName),
         case catch replace_var_with_context_item(FVarRef, WExpr) of
            {error,predicate} ->
               [For,Where|merge_for_where(T, G)];
            WExpr2 ->
               ?dbg("removed where clause",{FVarRef,WExpr2}),
               [{for,FVar#xqVar{expr = {postfix,WId,Expr,[{predicate,?BOOL_CALL(WExpr2)}]}}}
               |merge_for_where(T, G)]
         end;
      false ->
         ?dbg("Lifting where into for as predicate",WExpr),
         ?dbg("removing where clause",WName),
         digraph:add_edge(G, WName, FVName),
         [{for,FVar#xqVar{expr = {postfix,WId,Expr,[{predicate,?BOOL_CALL(WExpr)}]}}}
          |merge_for_where(T, G)]
   end;
merge_for_where([H|T], G) ->
   [H|merge_for_where(T, G)];
merge_for_where([],_) ->
   [].

replace_var_with_context_item(_, predicate) ->
   % an internal predicate cannot use the outside context item
   throw({error,predicate});
replace_var_with_context_item(FVarRef, [H|T]) when H == FVarRef ->
   ['context-item'|replace_var_with_context_item(FVarRef, T)];
replace_var_with_context_item(FVarRef, [H|T]) when is_list(H) ->
   replace_var_with_context_item(FVarRef, H) ++ replace_var_with_context_item(FVarRef, T);
replace_var_with_context_item(FVarRef, [H|T]) ->
   [replace_var_with_context_item(FVarRef, H)
   |replace_var_with_context_item(FVarRef, T)];
replace_var_with_context_item(FVarRef, T) when T == FVarRef ->
   'context-item';
replace_var_with_context_item(FVarRef, T) when is_tuple(T) ->
   List = tuple_to_list(T),
   New = [replace_var_with_context_item(FVarRef, L) || L <- List],
   list_to_tuple(New);
replace_var_with_context_item(_, WExpr) ->
   WExpr.


%% STEP 2.8
%% 'where' clauses using positional variables from 'for' clauses 
%% become predicates 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
%% TODO: implement 
-spec positional_where_clause_as_predicate(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
positional_where_clause_as_predicate(#xqFlwor{id = _Id, loop = _Clauses, 
                                 return = _Return} = FL, _G) ->
   {false,FL}.

%% STEP 3
%% replace empty FLWOR with its return 
%% returns FLWOR :: #xqFlwor{} | any() 
-spec strip_empty_flwor(#xqFlwor{}) ->
   #xqFlwor{} | any().
strip_empty_flwor(#xqFlwor{loop = [], return = Return}) ->
   Return;
strip_empty_flwor(#xqFlwor{} = FL) ->
   FL.

%% STEP 4
%% if last clause is for loop and return is simply that variable 
%% replace return with 'for' expression
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec replace_trailing_for_in_return(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
replace_trailing_for_in_return(#xqFlwor{id = _Id,
                                        loop = Clauses,
                                        return = Return} = FL, G) 
   when Clauses =/= [] ->
   case lists:last(Clauses) of
      {for,#xqVar{name = N, expr = E, type = Ty}} = F ->
         if Return == #xqVarRef{name = N} ->
               VN = vertex_name(F),
               true = digraph:del_vertex(G, VN),
               NewClauses = lists:droplast(Clauses),
               ?dbg("Flatten last for", N),
               {true,FL#xqFlwor{loop = NewClauses,
                                return = {do_ensure,E,maybe_many_type(Ty)}}};
            true ->
               {false,FL}
         end;
      {'let',#xqVar{name = N, expr = E, type = Ty}} = F ->
         CanShift = shiftable_expression(F),
         if Return == #xqVarRef{name = N} andalso CanShift ->
               %VN = vertex_name(F),
               %true = digraph:del_vertex(G, VN),
               %ok = swap_vertex(VN, 0, G),
               NewClauses = lists:droplast(Clauses),
               ?dbg("Flatten last let", N),
               {true,FL#xqFlwor{loop = NewClauses,
                                return = {do_ensure,E,Ty}}};
            true ->
               {false,FL}
         end;
      _ ->
         {false,FL}
   end;
replace_trailing_for_in_return(FL,_) ->
   {false,FL}.

%swap_vertex(Old,New,G) ->
%   OldVerts = digraph_utils:reaching([Old], G),
%   ?dbg("OldVerts",OldVerts),
%   ok.


%% STEP 5
fold_for_count(F, G) ->
   {B1,F1} = flatten_leading_for_flwor(F),
   if B1 ->
         {B1,F1};
      true ->
         {B2,F2} = maybe_lift_count_clause_to_position(F, G),
         if B2 ->
               {B2,F2};
            true ->
               maybe_lift_count_clause_to_let(F, G)
         end
   end.

%% STEP 5.1
%% if first clause is for loop and expression is flwor 
%% move flwor above for and set return as expression
%% positional variable (if any) becomes count clause 
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec flatten_leading_for_flwor(#xqFlwor{}) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
flatten_leading_for_flwor(#xqFlwor{loop = Clauses} = FL) ->
   F = fun({for, #xqVar{name = N,
                        position = PositionVar,
                        expr = #xqFlwor{loop = Loop0,
                                        return = Ret}} = V}, _) ->
             ?dbg("Flattening FLWOR",N),
             Rst = if PositionVar == undefined ->
                         [{for,V#xqVar{expr = Ret}}];
                      true ->
                         [{for,V#xqVar{expr = Ret,
                                  position = undefined}},{'count',PositionVar}]
                   end,
             Loop = Loop0 ++ Rst,
             {Loop,true};
          (O,Changed0) ->
             {O,Changed0}
       end,
   {C1,Changed} = lists:mapfoldl(F, false, Clauses),
   if Changed ->
         {true, FL#xqFlwor{loop = lists:flatten(C1)}};
      true ->
         {false,FL}
   end.

%% STEP 5.2
%% if first clause is for loop without position
%% and second is count clause  
%% move count clause to position
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_count_clause_to_position(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_count_clause_to_position(
  #xqFlwor{loop = [{for,#xqVar{name = N,position = undefined} = F},
                   {count,#xqVar{id = CI,name = CN}}|T]} = FL, _G) ->
   ?dbg("moving count to position",N),
   Loop = [{for,F#xqVar{position = #xqPosVar{id = CI,name = CN}}}|T],
   {true, FL#xqFlwor{loop = Loop}};
maybe_lift_count_clause_to_position(#xqFlwor{} = FL, _) ->
   {false,FL}.

%% STEP 5.3
%% if first clause is for loop with position
%% and second is count clause  
%% move count clause to let clause set to position variable
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_count_clause_to_let(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{}}.
maybe_lift_count_clause_to_let(
  #xqFlwor{loop = [{for,#xqVar{id = I,name = N,
                               position = #xqPosVar{id = PI,name = PN}}} = F,
                   {count,#xqVar{id = CI, name = CN} = C}|T]} = FL, G) ->
   ?dbg("moving count to let",N),
   % add dependency
   V1 = {CI,sim_name(CN)},
   V2 = {PI,sim_name(PN)},
   V3 = {I,sim_name(N)},
   digraph:add_edge(G, V2, V1),
   digraph:add_edge(G, V3, V1),
   Loop = [F,{'let',C#xqVar{expr = #xqVarRef{name = PN}}}|T],
   {true, FL#xqFlwor{loop = Loop}};
maybe_lift_count_clause_to_let(#xqFlwor{} = FL, _) ->
   {false,FL}.

%% STEP 6
%% if return is a simple-flwor lift body into current clauses
%% replace return with sub-return
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_simple_return(#xqFlwor{}, digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{} | any()}.
maybe_lift_simple_return(
  #xqFlwor{loop = Clauses,
           return = #xqFlwor{loop = Loop0,
                             return = Return0} = Return} = FL, G) ->
   case is_simple_flwor(Return) of
      true ->
         %?dbg("simplfying FLWOR",Return0),
         {true, optimize(FL#xqFlwor{loop = Clauses ++ Loop0,
                                    return = Return0}, G)};
      false ->
         {false,FL}
   end;
maybe_lift_simple_return(#xqFlwor{} = FL, _) ->
   {false,FL}.

%% STEP 7
%% if return is a flwor lift leading lets in body into current clauses
%% returns {Changed :: boolean(), FLWOR :: #xqFlwor{}} 
-spec maybe_lift_lets_in_return(#xqFlwor{} | any(), digraph:graph()) ->
   {Changed :: boolean(),Result :: #xqFlwor{} | any()}.
maybe_lift_lets_in_return(
  #xqFlwor{loop = Clauses,
           return = #xqFlwor{loop = [{'let',_} = L|T]} = F2} = FL, G) ->
   Loop = Clauses ++ [L],
   {true, optimize(FL#xqFlwor{loop = Loop,
                              return = F2#xqFlwor{loop = T}},G) };
maybe_lift_lets_in_return(FL, _) ->
   {false,FL}.


%% STEP 8 
%% combine consecutive where clauses into and statements 
-spec combine_wheres([any()]) -> [any()].
combine_wheres([]) -> 
   [];
combine_wheres([{where, I, A},{where, J, B}|T]) ->
   NewA = {where, erlang:min(I, J), {'and', A, B}},
   combine_wheres([NewA|T]);
combine_wheres([H|T]) ->
   [H|combine_wheres(T)].

%% STEP 9
%% should the first clause be 'where', change to logical branch
-spec leading_where_as_if(#xqFlwor{}, digraph:graph()) ->
         {'if-then-else',_, _, _} | #xqFlwor{}.
leading_where_as_if(#xqFlwor{id = Id, loop = [{where, I, A}], return = Ret}, 
                    _) ->
   {'if-then-else',A, {Id,Ret}, {I,'empty-sequence'}};
leading_where_as_if(#xqFlwor{id = Id, loop = [{where, I, A}|Rest]} = F, 
                    Digraph) ->
   {'if-then-else',
    A, 
    {Id,optimize(F#xqFlwor{loop = Rest},Digraph)}, 
    {I,'empty-sequence'}};
leading_where_as_if(O,_) -> O.







sim_name(#qname{namespace = N, local_name = L}) -> {N,L}.

vertex_name(#xqWindow{win_variable = #xqVar{id = I, name = N}}) ->
   {I,sim_name(N)};
vertex_name({_, #xqPosVar{id = I, name = N}}) ->
   {I,sim_name(N)};
vertex_name({T, #xqVar{id = I, name = N}}) when T == 'for';
                                                T == 'let';
                                                T == 'count' ->
   {I,sim_name(N)};
vertex_name({Type,I,_}) when is_atom(Type) ->
   {I,Type}.
  
%% can this clause be moved? based on it's expression 
-spec shiftable_expression(any()) -> boolean().
shiftable_expression({'let',#xqVar{expr = Expr}}) -> 
   shiftable_expression_1(Expr);
shiftable_expression({where,_,Expr}) -> 
   shiftable_expression_1(Expr);
shiftable_expression(_) -> 
   false.

shiftable_expression_1(Expr) ->
   F = fun O([]) ->
            true;
           O(T) when is_tuple(T) ->
            O(tuple_to_list(T));
           O(L) when is_list(L) ->
            lists:foldl(fun(X,A) -> A andalso O(X) end, true, L);
           O(direct_cons) ->
            false;
           O(comp_cons) ->
            false;
           O(_) ->
            true
         end,
   F(Expr).

win_vertex_names(#xqWindow{win_variable = W1,
                           s     = S1,
                           spos  = S2,
                           sprev = S3,
                           snext = S4,
                           e     = E1,
                           epos  = E2,
                           eprev = E3,
                           enext = E4}) ->
   F = fun(undefined) -> [];
          (#xqVar{} = V) ->
            [vertex_name({for,V})];
          (#xqPosVar{} = V) ->
            [vertex_name({for,V})]
       end,
   lists:flatmap(F, [W1,S1,S2,S3,S4,E1,E2,E3,E4]).

relies_on(This, [], G) -> % relies on nothing
   Cn = vertex_name(This),
   Rg = [R || 
         R <- digraph_utils:reaching([Cn], G),
         R =/= Cn ],
   Rg == [];  
relies_on([], That, G) -> % replied upon by something
   Vn =
      case That of
         {'for',#xqVar{position = #xqPosVar{} = P}} ->
            [vertex_name(That),vertex_name({for,P})];
         #xqWindow{} = W ->
            win_vertex_names(W);
         _ ->
            [vertex_name(That)]
      end,
   Rg = [R || 
         R <- digraph_utils:reachable(Vn, G),
         %ok == ?dbg("R",{R,Vn,digraph_utils:reaching(Vn, G)}),
         is_tuple(R),
         not lists:member(R, Vn) ],
   Rg;
relies_on(This, That, G) -> % this relies on that
   Cn = vertex_name(This),
   Vn =
      case That of
         {'for',#xqVar{position = #xqPosVar{} = P}} ->
            [vertex_name(That),vertex_name({for,P})];
         #xqWindow{} = W ->
            win_vertex_names(W);
         _ ->
            [vertex_name(That)]
      end,
   Rg = [R || 
         R <- digraph_utils:reaching([Cn], G),
         lists:member(R, Vn) ],
   Rg =/= [].  

relies_on_for_no_pos(This, That, G) -> % this relies on that
   Cn = vertex_name(This),
   Vn =
      case That of
         {'for',#xqVar{}} ->
            [vertex_name(That)];
         _ ->
            []
      end,
   Rg = [R || 
         R <- digraph_utils:reaching([Cn], G),
         lists:member(R, Vn) ],
   Rg =/= [].  

from_pos_list(PList) ->
   [V || {_,V} <- PList].
   
to_pos_list(List) ->
   F = fun(V,I) ->
             {{I,V},I + 1}
       end,
   {L1,_} = lists:mapfoldl(F, 1, List),
   L1.

remove_from(Pos,[{I,_}|T]) when Pos == I ->
   pull_forw(T);
remove_from(Pos,[H|T]) ->
   [H | remove_from(Pos,T)].
   
insert_at(Val,Pos,[{I,_} = H|T]) when Pos > I ->
   [H|insert_at(Val,Pos,T)];
insert_at(Val,Pos,[{I,_} = H|T]) when Pos == I ->
   [{I,Val}|push_back([H|T])] .
 
push_back([]) -> [];
push_back([{I,V}|T]) -> 
   [{I + 1,V}|push_back(T)].

pull_forw([]) -> [];
pull_forw([{I,V}|T]) -> 
   [{I - 1,V}|pull_forw(T)].

  
-spec is_simple_flwor(any()) -> boolean().
is_simple_flwor(#xqFlwor{loop = C}) ->
   Pred = fun({'for',_}) ->
                true;
             ({'let',_}) ->
                true;
             ({'where',_}) ->
                true;
             (_) ->
                false
          end,             
   lists:all(Pred, C).

maybe_many_type(Type = #xqSeqType{occur = one}) ->
   Type#xqSeqType{occur = one_or_many};
maybe_many_type(Type) -> Type.


