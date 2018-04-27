-module('fn_idref_SUITE').
-include_lib("common_test/include/ct.hrl").
-compile({nowarn_unused_function,[environment/2]}).
-export([all/0,
         suite/0]).
-export([init_per_suite/1,
         end_per_suite/1]).
-export(['fn-idref-1'/1]).
-export(['fn-idref-2'/1]).
-export(['fn-idref-3'/1]).
-export(['fn-idref-4'/1]).
-export(['fn-idref-5'/1]).
-export(['fn-idref-6'/1]).
-export(['fn-idref-7'/1]).
-export(['fn-idref-8'/1]).
-export(['fn-idref-9'/1]).
-export(['fn-idref-10'/1]).
-export(['fn-idref-11'/1]).
-export(['fn-idref-12'/1]).
-export(['fn-idref-13'/1]).
-export(['fn-idref-14'/1]).
-export(['fn-idref-15'/1]).
-export(['fn-idref-16'/1]).
-export(['fn-idref-17'/1]).
-export(['fn-idref-18'/1]).
-export(['fn-idref-19'/1]).
-export(['fn-idref-20'/1]).
-export(['fn-idref-21'/1]).
-export(['fn-idref-23'/1]).
-export(['fn-idref-30'/1]).
-export(['fn-idref-31'/1]).
-export(['fn-idref-32'/1]).
-export(['fn-idref-33'/1]).
-export(['fn-idref-34'/1]).
-export(['fn-idref-dtd-5'/1]).
-export(['fn-idref-dtd-6'/1]).
-export(['fn-idref-dtd-7'/1]).
-export(['fn-idref-dtd-8'/1]).
-export(['fn-idref-dtd-9'/1]).
-export(['fn-idref-dtd-10'/1]).
-export(['fn-idref-dtd-11'/1]).
-export(['fn-idref-dtd-12'/1]).
-export(['fn-idref-dtd-13'/1]).
-export(['fn-idref-dtd-14'/1]).
-export(['fn-idref-dtd-15'/1]).
-export(['fn-idref-dtd-16'/1]).
-export(['fn-idref-dtd-17'/1]).
-export(['fn-idref-dtd-18'/1]).
-export(['fn-idref-dtd-19'/1]).
-export(['fn-idref-dtd-20'/1]).
-export(['fn-idref-dtd-21'/1]).
-export(['fn-idref-22'/1]).
-export(['fn-idref-dtd-23'/1]).
-export(['fn-idref-dtd-24'/1]).
-export(['fn-idref-dtd-25'/1]).
-export(['K2-SeqIDREFFunc-1'/1]).
-export(['K2-SeqIDREFFunc-2'/1]).
-export(['K2-SeqIDREFFunc-3'/1]).
-export(['cbcl-idref-001'/1]).
-export(['cbcl-idref-002'/1]).
-export(['cbcl-idref-003'/1]).
suite() -> [{timetrap,{seconds,5}}].
end_per_suite(_Config) -> 
   ct:timetrap({seconds,60}), 
   xqerl_module:unload(all).
init_per_suite(Config) -> 
   ok = application:ensure_started(mnesia),
   ok = application:ensure_started(xqerl_db),
   xqerl_module:one_time_init(), 
   DD = filename:dirname(filename:dirname(?config(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   __BaseDir = filename:join(TD, "fn"),
   [{base_dir, __BaseDir}|Config].
all() -> [
'fn-idref-1', 
'fn-idref-2', 
'fn-idref-3', 
'fn-idref-4', 
'fn-idref-5', 
'fn-idref-6', 
'fn-idref-7', 
'fn-idref-8', 
'fn-idref-9', 
'fn-idref-10', 
'fn-idref-11', 
'fn-idref-12', 
'fn-idref-13', 
'fn-idref-14', 
'fn-idref-15', 
'fn-idref-16', 
'fn-idref-17', 
'fn-idref-18', 
'fn-idref-19', 
'fn-idref-20', 
'fn-idref-21', 
'fn-idref-23', 
'fn-idref-30', 
'fn-idref-31', 
'fn-idref-32', 
'fn-idref-33', 
'fn-idref-34', 
'fn-idref-dtd-5', 
'fn-idref-dtd-6', 
'fn-idref-dtd-7', 
'fn-idref-dtd-8', 
'fn-idref-dtd-9', 
'fn-idref-dtd-10', 
'fn-idref-dtd-11', 
'fn-idref-dtd-12', 
'fn-idref-dtd-13', 
'fn-idref-dtd-14', 
'fn-idref-dtd-15', 
'fn-idref-dtd-16', 
'fn-idref-dtd-17', 
'fn-idref-dtd-18', 
'fn-idref-dtd-19', 
'fn-idref-dtd-20', 
'fn-idref-dtd-21', 
'fn-idref-22', 
'fn-idref-dtd-23', 
'fn-idref-dtd-24', 
'fn-idref-dtd-25', 
'K2-SeqIDREFFunc-1', 
'K2-SeqIDREFFunc-2', 
'K2-SeqIDREFFunc-3', 
'cbcl-idref-001', 
'cbcl-idref-002', 
'cbcl-idref-003'
].
environment('empty',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('atomic',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{schemas, [{filename:join(__BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('atomic-xq',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/atomic.xml"), ".","http://www.w3.org/fots/docs/atomic.xml"}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, [{filename:join(__BaseDir, "../docs/atomic.xsd"),"http://www.w3.org/XQueryTest"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('works-mod',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works-mod.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('works',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('staff',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/staff.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('works-and-staff',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/works.xml"), "$works",[]}, 
{filename:join(__BaseDir, "../docs/staff.xml"), "$staff",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('auction',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/auction.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.example.com/AuctionWatch","ma"}, 
{"http://www.w3.org/1999/xlink","xlink"}, 
{"http://www.example.com/auctioneers#anyzone","anyzone"}, 
{"http://www.example.com/auctioneers#eachbay","eachbay"}, 
{"http://www.example.com/auctioneers#yabadoo","yabadoo"}, 
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('qname',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../docs/QName-source.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{schemas, [{filename:join(__BaseDir, "../docs/QName-schema.xsd"),"http://www.example.com/QNameXSD"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('math',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('array',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('map',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('array-and-map',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, []}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, [{"http://www.w3.org/2005/xpath-functions/array","array"}, 
{"http://www.w3.org/2005/xpath-functions/map","map"}]},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('id-idref-dtd',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "id/iddtd.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
]; 
environment('id-idref',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "id/id.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, [{filename:join(__BaseDir, "id/id.xsd"),"http://www.w3.org/XQueryTest/ididrefs"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('id-idref3',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "id/id2.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, [{filename:join(__BaseDir, "id/id.xsd"),"http://www.w3.org/XQueryTest/ididrefs"}]}, 
{resources, []}, 
{modules, []}
]; 
environment('functx_book',__BaseDir) ->
[{'decimal-formats', []}, 
{sources, [{filename:join(__BaseDir, "../app/FunctxFn/functx_book.xml"), ".",[]}]}, 
{collections, []}, 
{'static-base-uri', []}, 
{params, []}, 
{vars, []}, 
{namespaces, []},
{schemas, []}, 
{resources, []}, 
{modules, []}
].
'fn-idref-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"argument 1\", / ,\"Argument 3\")", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-1.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0017") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(1 to 10)[fn:idref(\"argument1\")]", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"argument1\", \"A\")", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-4'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "
        import module namespace copy=\"http://www.w3.org/QT3/copy\";
        let $var := copy:copy(/*) return fn:idref(\"argument1\", $var)
      ", 
   try xqerl_module:compile(filename:join(__BaseDir, "id/copy.xq")) catch _:_ -> ok end, 
   {Env,Opts} = xqerl_test:handle_environment(environment('works-mod',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-4.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"FODC0001") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-9'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-10'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-11'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-12'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-13'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-14'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-15'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-16'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-17'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-18'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-19'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-20'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-21'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-23'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-30'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-31'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-32'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-33'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-34'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   {skip,"Validation Environment"}. 
'fn-idref-dtd-5'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"id1\",/IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-5.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-6'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"nomatchingid\", /IDS[1])", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-6.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_empty(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-7'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"id4\", /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-7.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-4") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-8'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "<results>{fn:idref((\"id1\", \"id2\"), /IDS[1])}</results>", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-8.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XQDY0025") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-9'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref((\"id1\", \"nomatching\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-9.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-10'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:count(fn:idref(\"nomatching1 nomatching2\", /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-10.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"0") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-11'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:count(fn:idref(\"\", /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-11.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "0") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-12'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:node-name(fn:idref(\"id2\", /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-12.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "anIdRef") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-13'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(fn:idref(\"id1\", /IDS[1])) is (fn:idref(\"id1\", /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-13.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-14'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(fn:idref(\"id1\", /IDS[1])) is (fn:idref(\"id2\", /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-14.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_false(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-15'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:idref((\"id1\",\"id1\"), /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-15.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-16'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "count(fn:idref((\"id1\",\"ID1\"), /IDS[1]))", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-16.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-17'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(fn:lower-case(\"ID1\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-17.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-18'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(fn:upper-case(\"id5\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-18.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-6") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-19'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(fn:concat(\"i\",\"d1\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-19.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-20'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(xs:string(\"id1\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-20.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-21'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(fn:string-join((\"id\",\"1\"),\"\"), /IDS[1])/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-21.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-22'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"argument1\",.)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('empty',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-22.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPDY0002") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-23'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "declare ordering ordered;  
        <results>{fn:idref(\"id4\", /IDS[1])}</results>", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-23.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<results anIdRef=\"id4\"/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-24'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "<results>{fn:idref(\"language\", /)}</results>", 
   {Env,Opts} = xqerl_test:handle_environment(environment('functx_book',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-24.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<results refs='context language'/>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'fn-idref-dtd-25'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "fn:idref(\"id1\")/name(..)", 
   {Env,Opts} = xqerl_test:handle_environment(environment('id-idref-dtd',__BaseDir)),
   Qry1 = lists:flatten(Env ++ Qry),
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "fn-idref-dtd-25.xq"), Qry1),
             xqerl:run(Mod,Opts) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_string_value(Res, "elementwithidrefattr-1") of 
      true -> {comment, "String correct"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K2-SeqIDREFFunc-1'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "idref((), ())", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K2-SeqIDREFFunc-1.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K2-SeqIDREFFunc-2'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(1, 2, 3)[idref(\"ncname\", .)]", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K2-SeqIDREFFunc-2.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'K2-SeqIDREFFunc-3'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "(1, 2, 3)[idref(\"ncname\")]", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "K2-SeqIDREFFunc-3.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-idref-001'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "
      	declare function local:generate($arg as xs:integer?) as xs:string* { if ($arg = 0) then () else 'id1', 'id2' }; 
      	let $doc := document { <root /> } return fn:empty( fn:idref( local:generate(0), $doc) )
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-idref-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-idref-002'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "
      	let $doc := document { <root /> } return fn:empty( fn:idref( (), $doc) )
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-idref-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end,
   case xqerl_test:assert_error(Res,"XPST0005") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end]) of 
      true -> {comment, "any-of"};
      _ -> false 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'cbcl-idref-003'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "
      	declare function local:generate($arg as xs:integer?) as xs:string* { if ($arg = 0) then () else 'id1', 'id2' }; 
      	let $doc := document { <root /> } return fn:empty( $doc/fn:idref( local:generate(0)) )
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "cbcl-idref-003.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_true(Res) of 
      true -> {comment, "Empty"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.