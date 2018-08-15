-module('prod_SwitchExpr_SUITE').
-include_lib("common_test/include/ct.hrl").
-compile({nowarn_unused_function,[environment/2]}).
-export([all/0,
         suite/0]).
-export([init_per_suite/1,
         end_per_suite/1]).
-export(['switch-001'/1]).
-export(['switch-002'/1]).
-export(['switch-003'/1]).
-export(['switch-004'/1]).
-export(['switch-005'/1]).
-export(['switch-006'/1]).
-export(['switch-007'/1]).
-export(['switch-008'/1]).
-export(['switch-009'/1]).
-export(['switch-010'/1]).
-export(['switch-011'/1]).
-export(['switch-012'/1]).
-export(['switch-013'/1]).
-export(['switch-014'/1]).
-export(['switch-015'/1]).
-export(['switch-016'/1]).
-export(['switch-017'/1]).
-export(['switch-018'/1]).
-export(['switch-901'/1]).
-export(['switch-902'/1]).
-export(['switch-903'/1]).
-export(['switch-904'/1]).
-export(['switch-905'/1]).
-export(['switch-906'/1]).
-export(['switch-907'/1]).
-export(['switch-908'/1]).
-export(['switch-909'/1]).
suite() -> [{timetrap,{seconds,5}}].
end_per_suite(_Config) -> 
   ct:timetrap({seconds,60}), 
   xqerl_module:unload(all).
init_per_suite(Config) -> 
   xqerl_db:install([node()]),
   xqerl_module:one_time_init(), 
   {ok,_} = application:ensure_all_started(xqerl),
   DD = filename:dirname(filename:dirname(?config(data_dir, Config))),
   TD = filename:join(DD, "QT3-test-suite"),
   __BaseDir = filename:join(TD, "prod"),
   [{base_dir, __BaseDir}|Config].
all() -> [
'switch-001', 
'switch-002', 
'switch-003', 
'switch-004', 
'switch-005', 
'switch-006', 
'switch-007', 
'switch-008', 
'switch-009', 
'switch-010', 
'switch-011', 
'switch-012', 
'switch-013', 
'switch-014', 
'switch-015', 
'switch-016', 
'switch-017', 
'switch-018', 
'switch-901', 
'switch-902', 
'switch-903', 
'switch-904', 
'switch-905', 
'switch-906', 
'switch-907', 
'switch-908', 
'switch-909'
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
].
'switch-001'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $animal as xs:string := \"Cat\"; 
        <out>{ switch ($animal) 
            case \"Cow\" return \"Moo\" 
            case \"Cat\" return \"Meow\" 
            case \"Duck\" return \"Quack\" 
            default return \"What's that odd noise?\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-001.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Meow</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-002'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $animal as xs:string := \"Dog\"; 
        <out>{ switch ($animal) 
            case \"Cow\" return \"Moo\"
            case \"Cat\" return \"Meow\" 
            case \"Duck\" return \"Quack\" 
            default return \"What's that odd noise?\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-002.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>What's that odd noise?</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-003'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $animal as xs:string := \"!?!?\"; 
        <out>{ switch (upper-case($animal)) 
            case \"COW\" return \"Moo\"
            case \"CAT\" return \"Meow\" 
            case \"DUCK\" return \"Quack\" 
            case lower-case($animal) return \"Oink\" 
            default return \"What's that odd noise?\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-003.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Oink</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-004'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $animal as xs:string := \"goose\"; 
        <out>{ switch (upper-case($animal)) 
            case \"COW\" return \"Moo\" 
            case \"CAT\" return \"Meow\" 
            case \"DUCK\" case \"GOOSE\" return \"Quack\" 
            case \"PIG\" case \"SWINE\" return \"Oink\" 
            default return \"What's that odd noise?\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-004.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Quack</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-005'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $animal as xs:string := \"duck\"; 
        <out>{ switch (upper-case($animal)) 
            case \"COW\" return \"Moo\" 
            case \"CAT\" return \"Meow\" 
            case \"DUCK\" case \"GOOSE\" return \"Quack\" 
            case \"PIG\" case \"SWINE\" return \"Oink\" 
            default return \"What's that odd noise?\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-005.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Quack</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-006'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $number as xs:decimal := 42; 
        <out>{ switch ($number) case 21 return \"Moo\" 
            case current-time() return \"Meow\" 
            case 42 return \"Quack\" 
            default return 3.14159 }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-006.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Quack</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-007'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := <a>42</a>; 
        <out>{ switch ($in) 
            case 42 return \"Moo\" 
            case \"42\" return \"Meow\" 
            case 42e0 return \"Quack\" 
            case \"42e0\" return \"Oink\" 
            default return \"Expletive deleted\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-007.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Meow</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-008'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := \"42\"; 
        <out>{ switch ($in) 
            case 42 return \"Moo\" 
            case <a>42</a> return \"Meow\" 
            case 42e0 return \"Quack\" 
            case \"42e0\" return \"Oink\" 
            default return \"Expletive deleted\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-008.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Meow</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-009'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := (); 
        <out>{ switch ($in) 
            case 42 return \"Moo\" 
            case <a>42</a> return \"Meow\" 
            case 42e0 return \"Quack\" 
            case \"42e0\" return \"Oink\" 
            case () return \"Woof\" 
            default return \"Expletive deleted\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-009.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Woof</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-010'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 21; 
        <out>{ switch ($in) 
            case 42 return \"Moo\" 
            case <a>42</a> return \"Meow\" 
            case 42e0 return \"Quack\" 
            case \"42e0\" return \"Oink\" 
            case () return \"Woof\" 
            default return \"Expletive deleted\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-010.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Expletive deleted</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-011'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := xs:double('NaN'); 
        <out>{ switch ($in) 
            case 42 return \"Moo\" 
            case <a>42</a> return \"Meow\" 
            case 42e0 return \"Quack\" 
            case \"42e0\" return \"Oink\" 
            case xs:float('NaN') return \"Woof\" 
            default return \"Expletive deleted\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-011.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Woof</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-012'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 25; 
        declare variable $zero := 0; 
        <out>{ switch ($in) 
            case 42 return $in div $zero 
            case 25 return \"Baa\" 
            case 39 return $in div $zero 
            default return \"Woof\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-012.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Baa</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-013'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 25; 
        declare variable $zero := 0; 
        <out>{ switch ($in) 
            case 42 return \"Quack\" 
            case 25 return \"Baa\" 
            case $in div $zero return \"Neigh\" 
            default return \"Woof\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-013.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_xml(Res,"<out>Baa</out>") of 
      true -> {comment, "XML Deep equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-014'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " 
         let $v := xs:QName('a')
         return switch($v)
            case $v return 1
            default return 2
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-014.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-015'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " 
         let $v := xs:date('2001-01-01')
         return switch($v)
         case $v return 1
         default return 2
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-015.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-016'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " 
         let $v := xs:dateTime('2001-01-01T12:00:00')
         return switch($v)
         case current-dateTime() return 1
         default return 2
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-016.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"2") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-017'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " 
         let $v := current-dateTime()
         return switch($v)
         case xs:dateTime('2001-01-01T12:00:00') return 1
         default return 2
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-017.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"2") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-018'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = " 
         let $v := xs:time('00:00:00Z')
         return switch($v)
         case xs:time('24:00:00Z') return 1
         default return 2
      ", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-018.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_eq(Res,"1") of 
      true -> {comment, "Equal"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-901'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch (1 to $in) 
            case 1 return \"Moo\" 
            case 2 return \"Meow\" 
            case 3 return \"Quack\" 
            case 4 return \"Oink\" 
            default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-901.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-902'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) 
            case 1 return \"Moo\" 
            case 5 return \"Meow\" 
            case 3 return \"Quack\" 
            case ($in to 4) return \"Oink\" 
            default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-902.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPTY0004") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-903'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-903.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-904'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) 
            case 1 return \"Moo\" 
            case 5 return \"Meow\" 
            case 3 return \"Quack\" 
            case ($in to 4) return \"Oink\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-904.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-905'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) 
            case 1 return \"Moo\" 
            case 5 return \"Meow\" return \"Quack\" 
            case ($in to 4) return \"Oink\" 
            default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-905.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-906'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) 
            case 1 return \"Moo\", \"Boo\" 
            case 5 return \"Meow\" 
            case 7 return \"Quack\" 
            case 4 return \"Oink\" 
            default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-906.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-907'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch $in 
            case 1 return \"Moo\", \"Boo\" 
            case 5 return \"Meow\" 
            case 7 return \"Quack\" 
            case 4 return \"Oink\" 
            default return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-907.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case lists:any(fun({comment,_}) -> true; (_) -> false end, [
   case xqerl_test:assert_error(Res,"XPST0003") of 
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
'switch-908'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) { 
            case 1 return \"Moo\", \"Boo\" 
            case 5 return \"Meow\" 
            case 7 return \"Quack\" 
            case 4 return \"Oink\" 
            default return \"Baa\" } }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-908.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end. 
'switch-909'(Config) ->
   __BaseDir = ?config(base_dir, Config),
   Qry = "xquery version \"3.0\"; 
        declare variable $in := 2; 
        <out>{ switch ($in) 
            case 1: return \"Moo\", \"Boo\" 
            case 5: return \"Meow\" 
            case 7: return \"Quack\" 
            case 4: return \"Oink\" 
            default: return \"Baa\" }</out>", 
   Qry1 = Qry,
   io:format("Qry1: ~p~n",[Qry1]),
   Res = try Mod = xqerl_module:compile(filename:join(__BaseDir, "switch-909.xq"), Qry1),
             xqerl:run(Mod) of D -> D catch _:E -> E end,
   Out =    case xqerl_test:assert_error(Res,"XPST0003") of 
      true -> {comment, "Correct error"};
      {false, F} -> F 
   end, 
   case Out of
      {comment, C} -> {comment, C};
      Err -> ct:fail(Err)
   end.