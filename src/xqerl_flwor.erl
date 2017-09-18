%% -------------------------------------------------------------------
%%
%% xqerl - XQuery processor
%%
%% Copyright (c) 2017 Zachary N. Dean  All Rights Reserved.
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


-export([split_clauses/1]).

-export([expand_nodes/1]).
-export([expand_nodes/2]).

%-export([append_position/1]).
-export([sort_grouping/1]).

-export([windowclause/2]).
-export([windowclause/4]).
-export([orderbyclause/2]).
-export([groupbyclause/1]).

-export([simple_map/3]).

-export([stream_append/2]).
-export([stream_new/0]).
-export([stream_iter/1]).
-export([stream_next/1]).
-export([stream_from_list/1]).
-export([stream_to_list/1]).

-export([allow_empty/2]).
   
allow_empty(Seq,true) ->
   case ?seq:is_empty(Seq) of
      true ->
         stream_append({?seq:empty()},stream_new());
      _ ->
         Seq
   end;
allow_empty(Seq,_) -> Seq.
   

stream_append({Sz,_} = Stream1, Stream2) when is_integer(Sz), Sz >= 0 ->
   concat_streams(Stream2,Stream1);
stream_append(VariableTuple, Stream) ->
   gb_trees:enter(gb_trees:size(Stream)+1, VariableTuple, Stream).
stream_new() ->
   gb_trees:empty().
stream_iter(Stream) ->
   gb_trees:iterator(Stream).
stream_next(Stream) ->
   gb_trees:next(Stream).

stream_to_list(Stream) ->
   gb_trees:values(Stream).
stream_from_list(List) ->
   lists:foldl(fun(Item,Stream) ->
                     stream_append(Item, Stream)
               end, stream_new(), List).


concat_streams(Seq1,Seq2) ->
   Iter = stream_iter(Seq2),
   FunLoop = fun Loop(CurrIter,CurrSeq) ->
                    case stream_next(CurrIter) of
                       none ->
                          CurrSeq;
                       {_Key,Value,NewIter} ->
                          NewSeq = stream_append(Value, CurrSeq),
                          Loop(NewIter,NewSeq)
                    end
             end,
   FunLoop(Iter,Seq1).


expand_nodes([Nodes]) when is_map(Nodes) ->
   xqerl_context:get_context_item(Nodes);
expand_nodes(Nodes) when is_map(Nodes) ->
   xqerl_context:get_context_item(Nodes);
expand_nodes(Nodes) when is_list(Nodes) ->
   lists:flatmap(fun(Node) ->
                   expand_nodes(Node)
             end, Nodes);
expand_nodes(Node) ->
   [Node].

expand_nodes(Node, allow_empty) ->
   case expand_nodes(Node) of
      [] ->
         [[]];
      N ->
         N
   end.

%% append_position(Stream) ->
%%    Iter = stream_iter(Stream),
%%    fun Loop(It, Vars2) ->
%%                case gb_trees:next(It2) of
%%                   none -> % list complete
%%                      ?dbg("Vars2",Vars2), 
%%                      Vars2; 
%%                   {K2,V2,I2} ->
%%                      % innermost loop sets the variable tuple
%%                      NewVars2 = gb_trees:enter(gb_trees:size(Vars2)+1, [K1,V1,K2,V2], Vars2), 
%%                      IterFun2(I2, NewVars2)
%%                end
%%         end(Iter2,Vars1))   
%%    append_position(lists:flatten(List), 1, []).
%% 
%% append_position([], _Cnt, Acc) ->
%%    lists:reverse(Acc);
%% append_position([H|T], Cnt, Acc) ->
%%    New = case element(1, H) of
%%       E when is_atom(E) ->
%%          erlang:append_element({H}, [?atint(Cnt)]);
%%       _E ->
%%          erlang:append_element(H, [?atint(Cnt)])
%%    end,
%%    append_position(T, Cnt + 1, [New|Acc]).


add_position(List) when is_list(List) ->
   add_position(List, 1, []);
add_position(List) ->
   List1 = ?seq:to_list(List),
   add_position(List1, 1, []).

add_position([], _Cnt, Acc) ->
   lists:reverse(Acc);
add_position([H|T], Cnt, Acc) ->
   %io:format("H CNT ~p ~p~n",[H,Cnt]),
   New = {H, ?atint(Cnt)},
   add_position(T, Cnt + 1, [New|Acc]);
add_position(H, Cnt, Acc) ->
   %io:format("H CNT ~p ~p~n",[H,Cnt]),
   New = {H, ?atint(Cnt)},
   add_position([], Cnt + 1, [New|Acc]).

%% takes {{K1,KN}, {V1,V2,VN}} and returns {K1,KN,V1,V2,VN} grouped
groupbyclause(KeyVals) ->
   KeyVals1 = [
               {
                list_to_tuple(
                  [case ?seq:singleton_value(K2) of
                      #xqNode{} = N ->
                         ?seq:singleton_value(xqerl_node:atomize_nodes(N));
                      #xqAtomicValue{} = A ->
                         A
                   end || 
                   K2 <- tuple_to_list(K1)
                  ]
                 ),V} || 
               {K1,V} <- KeyVals
             ],
   Keys = [K || {K,_V} <- KeyVals1],

   %?dbg("KeyVals1",KeyVals1),
   UKeys = unique(Keys),
   %?dbg("UKeys",UKeys),
   Mapped = lists:foldl(fun({K,V},Acc) ->
                     upsert(K,V,Acc)
               end, maps:new(), KeyVals1),
   All = lists:foldl(fun(K,Acc) ->
                  V = reverse(maps:get(K, Mapped)),
                  V1 = lists:map(fun(ListVal) ->
                                       ?seq:from_list(ListVal)
                                 end, V),
                  New = list_to_tuple(tuple_to_list(K) ++ V1) ,
                  %?dbg("V1",V1),
                  [New|Acc]
               end, [], UKeys),
   lists:reverse(All).

%% takes single list from expression and the start function and returns {SPrev,S, SPos,SNext,EPrev,E, EPos,ENext, W} 
%% can only be tumbling with no end function
windowclause(L, StartFun) ->
   case add_position(L) of
      [] -> stream_from_list([]);
      L1 ->
         Bw = winstart([[]|L1], StartFun, []),
         %?dbg("BW",Bw),
         stream_from_list(lists:reverse(Bw))
   end.

%% takes single list from expression and the start/end functions and returns {SPrev,S, SPos,SNext,EPrev,E, EPos,ENext, W} 
%% Type is tumbling or sliding
windowclause(L, StartFun, EndFun, {Type, Only}) ->
   case add_position(L) of
      [] -> stream_from_list([]);
      L1 ->
         Bw = winstart([[]|L1], StartFun, EndFun, Type, Only),
         %?dbg("BW",Bw),
         stream_from_list(lists:reverse(Bw))
   end;
windowclause(L, StartFun, EndFun, Type) ->
   windowclause(L, StartFun, EndFun, {Type, false}).


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
               winstart(tl(L), StartFun, {S,SPos,SPrev,SNext,S,SPos,SPrev,SNext,[S]});
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
         {Win, _Rest} = winend(SPrev, [], [], [], L, EndFun, ?seq:empty(), Only),
         Win;
      _ ->
         []
   end;
winstart([[],{S, SPos},{SNext, _}|_] = L, StartFun, EndFun, Type, Only) ->
   case bool(StartFun({S,SPos,[],SNext})) of
      true ->
         {Win, Rest} = winend([], S, SPos, SNext, L, EndFun, ?seq:empty(), Only),
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
         {Win, _Rest} = winend([], S, SPos, [], L, EndFun, ?seq:empty(), Only),
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
         {Win, _Rest} = winend(SPrev, S, SPos, [], L, EndFun, ?seq:empty(), Only),
         Win;
      _ ->
%%          []
         winstart(tl(L), StartFun, EndFun, Type, Only)
   end;
winstart([{SPrev,_},{S, SPos},{SNext, _}|_] = L, StartFun, EndFun, Type, Only) ->
   case bool(StartFun({S,SPos,SPrev,SNext})) of
      true ->
         {Win, Rest} = winend(SPrev, S, SPos, SNext, L, EndFun, ?seq:empty(), Only),
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
winend(SPrev,S,SPos,SNext,[{EPrev,_},{E, EPos},{ENext, _}|_] = L, EndFun, Acc, Only) ->
   case bool(EndFun({S,SPos,SPrev,SNext,E,EPos,EPrev,ENext})) of
      true ->
         {[{S,SPos,SPrev,SNext,E,EPos,EPrev,ENext, ?seq:append(E, Acc)}], tl(L)};
      _ ->
         winend(SPrev,S,SPos,SNext,tl(L), EndFun, ?seq:append(E, Acc), Only)
   end.







%% functions for group by
unique(KeysAll) ->
   unique(KeysAll, maps:new(), []).

unique([], _Map, Acc) ->
   lists:reverse(Acc);
unique([H|T], Map, Acc) ->
   case maps:is_key(H, Map) of 
      true ->
         unique(T, Map, Acc);
      _ ->
         unique(T, maps:put(H, true, Map), [H|Acc])
   end.

upsert(K,V,Map) ->
   case maps:find(K, Map) of
      error ->
         maps:put(K, append(V,[]), Map);
      {ok, Val} ->
         maps:put(K, append(V,Val), Map)
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

% Clauses are funs that take an entire VarStream tuple
orderbyclause(VarStream, Clauses) ->
   stream_from_list(
   lists:sort(fun(A,B) ->
                    do_order(A,B,Clauses)
              end, stream_to_list(VarStream) )).


do_order(_A,_B,[]) ->
   true;
do_order(A,B,[{Fun,descending,Empty}|Funs]) ->
   ValA = Fun(A),
   ValB = Fun(B),
   if Empty == greatest andalso ValA == [] ->
         true;
      Empty == greatest andalso ValB == [] ->
         false;
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:float', value = "NaN"};
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:double', value = "NaN"} ->
         true;
      Empty == least andalso ValA == [] ->
         false;
      Empty == least andalso ValB == [] ->
         true;
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:float', value = "NaN"};
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:double', value = "NaN"} ->
         true;
      Empty == default andalso ValA == [] ->
         case xqerl_context:get_default_order_for_empty_sequences() of
            greatest ->
               true;
            _ ->
               false
         end;
      Empty == default andalso ValB == [] ->
         case xqerl_context:get_default_order_for_empty_sequences() of
            greatest ->
               false;
            _ ->
               true
         end;
      true ->
         case val(xqerl_operators:greater_than(ValA, ValB)) of
            true  ->
               true;
            _ ->
               case val(xqerl_operators:equal(ValA, ValB)) of
                  true ->
                     do_order(A,B,Funs);
                  _ ->
                     false                           
               end
         end
   end;
do_order(A,B,[{Fun,ascending,Empty}|Funs]) ->
   %?dbg("in",{A,B}),
   ValA = Fun(A), %W
   ValB = Fun(B), %V
   %?dbg("in",{ValA,ValB}),
   if ValA == ValB ->
         true; % stable sort
      Empty == greatest andalso ValA == [] ->
         false;
      Empty == greatest andalso ValB == [] ->
         true;
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:float', value = "NaN"};
      Empty == greatest andalso ValB == #xqAtomicValue{type = 'xs:double', value = "NaN"} ->
         true;
      Empty == least andalso ValA == [] ->
         true;
      Empty == least andalso ValB == [] ->
         false;
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:float', value = "NaN"};
      Empty == least andalso ValA == #xqAtomicValue{type = 'xs:double', value = "NaN"} ->
         true;
      Empty == default andalso ValA == [] ->
         case xqerl_context:get_default_order_for_empty_sequences() of
            greatest ->
               false;
            _ ->
               true
         end;
      Empty == default andalso ValB == [] ->
         case xqerl_context:get_default_order_for_empty_sequences() of
            greatest ->
               true;
            _ ->
               false
         end;
      true ->
         case val(xqerl_operators:less_than(ValA, ValB)) of
            true ->
               true;
            _ ->
               case val(xqerl_operators:equal(ValA, ValB)) of
                  true ->
                     do_order(A,B,Funs);
                  _ ->
                     false                           
               end
         end
   end.





sort_grouping(Groups) ->
   Lets = [E || E <- Groups, element(1, E) == 'let'],
   Vars = [E || E <- Groups, element(1, E) == 'xqGroupBy'],
   Lets ++ Vars.

   




split_clauses(Clauses) ->
   split_clauses(Clauses, []).

split_clauses([], Acc) ->
   Acc;
split_clauses(List, Acc) ->
   {Fors,Rest} = lists:splitwith(fun({for,_}) -> true;
                                    ({'let',_}) -> true;
                                    %({where,_}) -> true;
                                    (#xqWindow{}) -> true;
                                    (_) -> false
                                 end,
                                 List),
   %?dbg("Fors",Fors),
   if Fors == [] ->
         {Grps,Rest1} = lists:splitwith(fun(#xqGroupBy{}) -> true;
                                           (_) -> false
                                       end,
                                       List),
         if Grps == [] ->
               {Ords,Rest2} = lists:splitwith(fun({order,_,_}) -> true;
                                                 (_) -> false
                                             end,
                                             List),
               if Ords == [] ->
                  {Wheres,Rest3} = lists:splitwith(fun({where,_}) -> true;
                                                    (_) -> false
                                                end,
                                                List),
                  if Wheres == [] ->
                        [H|T] = Rest,
                        split_clauses(T,    Acc ++ [{count,[H]}]);
                     true ->
                        split_clauses(Rest3, Acc ++ [{where, Wheres}])
                  end;
                  true ->
                     split_clauses(Rest2, Acc ++ [{order, Ords}])
               end;
            true ->
               split_clauses(Rest1, Acc ++ [{group, Grps}])
         end;
      true ->
         split_clauses(Rest, Acc ++ [{for_let, Fors}])
   end.




val(T) ->
   xqerl_types:value(T).

bool(T) ->
   Bool = xqerl_fn:boolean([], T),
   (?seq:singleton_value(Bool))#xqAtomicValue.value.

%   T#xqAtomicValue.value.



simple_map(Ctx, Seq, MapFun) ->
   ?seq:map(Ctx, MapFun, Seq).

