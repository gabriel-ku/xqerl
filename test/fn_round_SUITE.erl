-module('fn_round_SUITE').
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([suite/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export(['fn-roundint1args-1'/1]).
-export(['fn-roundint1args-2'/1]).
-export(['fn-roundint1args-3'/1]).
-export(['fn-roundintg1args-1'/1]).
-export(['fn-roundintg1args-2'/1]).
-export(['fn-roundintg1args-3'/1]).
-export(['fn-rounddec1args-1'/1]).
-export(['fn-rounddec1args-2'/1]).
-export(['fn-rounddec1args-3'/1]).
-export(['fn-rounddbl1args-1'/1]).
-export(['fn-rounddbl1args-2'/1]).
-export(['fn-rounddbl1args-3'/1]).
-export(['fn-roundflt1args-1'/1]).
-export(['fn-roundflt1args-2'/1]).
-export(['fn-roundflt1args-3'/1]).
-export(['fn-roundlng1args-1'/1]).
-export(['fn-roundlng1args-2'/1]).
-export(['fn-roundlng1args-3'/1]).
-export(['fn-roundusht1args-1'/1]).
-export(['fn-roundusht1args-2'/1]).
-export(['fn-roundusht1args-3'/1]).
-export(['fn-roundnint1args-1'/1]).
-export(['fn-roundnint1args-2'/1]).
-export(['fn-roundnint1args-3'/1]).
-export(['fn-roundpint1args-1'/1]).
-export(['fn-roundpint1args-2'/1]).
-export(['fn-roundpint1args-3'/1]).
-export(['fn-roundulng1args-1'/1]).
-export(['fn-roundulng1args-2'/1]).
-export(['fn-roundulng1args-3'/1]).
-export(['fn-roundnpi1args-1'/1]).
-export(['fn-roundnpi1args-2'/1]).
-export(['fn-roundnpi1args-3'/1]).
-export(['fn-roundnni1args-1'/1]).
-export(['fn-roundnni1args-2'/1]).
-export(['fn-roundnni1args-3'/1]).
-export(['fn-roundsht1args-1'/1]).
-export(['fn-roundsht1args-2'/1]).
-export(['fn-roundsht1args-3'/1]).
-export(['K-RoundFunc-1'/1]).
-export(['K-RoundFunc-2'/1]).
-export(['K-RoundFunc-2a'/1]).
-export(['K-RoundFunc-3'/1]).
-export(['K-RoundFunc-4'/1]).
-export(['K-RoundFunc-5'/1]).
-export(['K-RoundFunc-6'/1]).
-export(['K-RoundFunc-7'/1]).
-export(['K-RoundFunc-8'/1]).
-export(['K-RoundFunc-9'/1]).
-export(['K2-RoundFunc-1'/1]).
-export(['K2-RoundFunc-2'/1]).
-export(['K2-RoundFunc-3'/1]).
-export(['K2-RoundFunc-4'/1]).
-export(['K2-RoundFunc-5'/1]).
-export(['K2-RoundFunc-6'/1]).
-export(['K2-RoundFunc-7'/1]).
-export(['K2-RoundFunc-8'/1]).
-export(['K2-RoundFunc-9'/1]).
-export(['K2-RoundFunc-10'/1]).
-export(['K2-RoundFunc-11'/1]).
-export(['K2-RoundFunc-12'/1]).
-export(['K2-RoundFunc-13'/1]).
-export(['K2-RoundFunc-14'/1]).
-export(['K2-RoundFunc-15'/1]).
-export(['K2-RoundFunc-16'/1]).
-export(['K2-RoundFunc-17'/1]).
-export(['K2-RoundFunc-18'/1]).
-export(['K2-RoundFunc-19'/1]).
-export(['K2-RoundFunc-20'/1]).
-export(['K2-RoundFunc-21'/1]).
-export(['K2-RoundFunc-22'/1]).
-export(['K2-RoundFunc-23'/1]).
-export(['K2-RoundFunc-24'/1]).
-export(['K2-RoundFunc-25'/1]).
-export(['K2-RoundFunc-26'/1]).
-export(['K2-RoundFunc-27'/1]).
-export(['K2-RoundFunc-28'/1]).
-export(['K2-RoundFunc-29'/1]).
-export(['K2-RoundFunc-30'/1]).
-export(['K2-RoundFunc-31'/1]).
-export(['K2-RoundFunc-32'/1]).
-export(['K2-RoundFunc-33'/1]).
-export(['K2-RoundFunc-34'/1]).
-export(['K2-RoundFunc-35'/1]).
-export(['K2-RoundFunc-36'/1]).
-export(['K2-RoundFunc-37'/1]).
-export(['K2-RoundFunc-38'/1]).
-export(['K2-RoundFunc-39'/1]).
-export(['K2-RoundFunc-40'/1]).
-export(['K2-RoundFunc-41'/1]).
-export(['K2-RoundFunc-42'/1]).
-export(['K2-RoundFunc-43'/1]).
-export(['K2-RoundFunc-44'/1]).
-export(['K2-RoundFunc-45'/1]).
-export(['K2-RoundFunc-46'/1]).
-export(['K2-RoundFunc-47'/1]).
-export(['K2-RoundFunc-48'/1]).
-export(['K2-RoundFunc-49'/1]).
-export(['K2-RoundFunc-50'/1]).
-export(['K2-RoundFunc-51'/1]).
-export(['K2-RoundFunc-52'/1]).
-export(['K2-RoundFunc-53'/1]).
-export(['K2-RoundFunc-54'/1]).
-export(['K2-RoundFunc-55'/1]).
-export(['K2-RoundFunc-56'/1]).
-export(['K2-RoundFunc-57'/1]).
-export(['K2-RoundFunc-58'/1]).
-export(['K2-RoundFunc-59'/1]).
-export(['K2-RoundFunc-60'/1]).
-export(['K2-RoundFunc-61'/1]).
-export(['K2-RoundFunc-62'/1]).
-export(['K2-RoundFunc-63'/1]).
-export(['K2-RoundFunc-64'/1]).
-export(['K2-RoundFunc-65'/1]).
-export(['K2-RoundFunc-66'/1]).
-export(['K2-RoundFunc-67'/1]).
-export(['K2-RoundFunc-68'/1]).
-export(['K2-RoundFunc-69'/1]).
-export(['K2-RoundFunc-70'/1]).
-export(['K2-RoundFunc-71'/1]).
-export(['K2-RoundFunc-72'/1]).
-export(['K2-RoundFunc-73'/1]).
-export(['K2-RoundFunc-74'/1]).
-export(['K2-RoundFunc-75'/1]).
-export(['K2-RoundFunc-76'/1]).
-export(['K2-RoundFunc-77'/1]).
-export(['K2-RoundFunc-78'/1]).
-export(['K2-RoundFunc-79'/1]).
-export(['K2-RoundFunc-80'/1]).
-export(['K2-RoundFunc-81'/1]).
-export(['K2-RoundFunc-82'/1]).
-export(['K2-RoundFunc-83'/1]).
-export(['K2-RoundFunc-84'/1]).
-export(['K2-RoundFunc-85'/1]).
-export(['K2-RoundFunc-86'/1]).
-export(['K2-RoundFunc-87'/1]).
-export(['K2-RoundFunc-88'/1]).
-export(['K2-RoundFunc-89'/1]).
-export(['K2-RoundFunc-90'/1]).
-export(['K2-RoundFunc-91'/1]).
-export(['K2-RoundFunc-92'/1]).
-export(['K2-RoundFunc-93'/1]).
-export(['K2-RoundFunc-94'/1]).
-export(['K2-RoundFunc-95'/1]).
-export(['K2-RoundFunc-96'/1]).
-export(['K2-RoundFunc-97'/1]).
-export(['K2-RoundFunc-98'/1]).
-export(['K2-RoundFunc-99'/1]).
-export(['K2-RoundFunc-100'/1]).
-export(['K2-RoundFunc-101'/1]).
-export(['K2-RoundFunc-102'/1]).
-export(['K2-RoundFunc-103'/1]).
-export(['K2-RoundFunc-104'/1]).
-export(['K2-RoundFunc-105'/1]).
-export(['K2-RoundFunc-106'/1]).
-export(['K2-RoundFunc-107'/1]).
-export(['K2-RoundFunc-108'/1]).
-export(['K2-RoundFunc-109'/1]).
-export(['K2-RoundFunc-110'/1]).
-export(['K2-RoundFunc-111'/1]).
-export(['K2-RoundFunc-112'/1]).
-export(['K2-RoundFunc-113'/1]).
-export(['K2-RoundFunc-114'/1]).
-export(['K2-RoundFunc-115'/1]).
-export(['K2-RoundFunc-116'/1]).
-export(['K2-RoundFunc-117'/1]).
-export(['K2-RoundFunc-118'/1]).
-export(['K2-RoundFunc-119'/1]).
-export(['K2-RoundFunc-120'/1]).
-export(['K2-RoundFunc-121'/1]).
-export(['K2-RoundFunc-122'/1]).
-export(['K2-RoundFunc-123'/1]).
-export(['K2-RoundFunc-124'/1]).
-export(['K2-RoundFunc-125'/1]).
-export(['K2-RoundFunc-126'/1]).
-export(['K2-RoundFunc-127'/1]).
-export(['K2-RoundFunc-128'/1]).
-export(['K2-RoundFunc-129'/1]).
-export(['K2-RoundFunc-130'/1]).
-export(['K2-RoundFunc-131'/1]).
-export(['K2-RoundFunc-132'/1]).
-export(['K2-RoundFunc-133'/1]).
-export(['K2-RoundFunc-134'/1]).
-export(['K2-RoundFunc-135'/1]).
-export(['K2-RoundFunc-136'/1]).
-export(['K2-RoundFunc-137'/1]).
-export(['K2-RoundFunc-138'/1]).
-export(['K2-RoundFunc-139'/1]).
-export(['K2-RoundFunc-140'/1]).
-export(['K2-RoundFunc-141'/1]).
-export(['K2-RoundFunc-142'/1]).
-export(['K2-RoundFunc-143'/1]).
-export(['K2-RoundFunc-144'/1]).
-export(['K2-RoundFunc-145'/1]).
-export(['K2-RoundFunc-146'/1]).
-export(['K2-RoundFunc-147'/1]).
-export(['K2-RoundFunc-148'/1]).
-export(['K2-RoundFunc-149'/1]).
-export(['K2-RoundFunc-150'/1]).
-export(['K2-RoundFunc-151'/1]).
-export(['K2-RoundFunc-152'/1]).
-export(['K2-RoundFunc-153'/1]).
-export(['K2-RoundFunc-154'/1]).
-export(['K2-RoundFunc-155'/1]).
-export(['K2-RoundFunc-156'/1]).
-export(['K2-RoundFunc-157'/1]).
-export(['K2-RoundFunc-158'/1]).
-export(['K2-RoundFunc-159'/1]).
-export(['K2-RoundFunc-160'/1]).
-export(['K2-RoundFunc-161'/1]).
-export(['K2-RoundFunc-162'/1]).
-export(['K2-RoundFunc-163'/1]).
-export(['K2-RoundFunc-164'/1]).
-export(['K2-RoundFunc-165'/1]).
-export(['K2-RoundFunc-166'/1]).
-export(['K2-RoundFunc-167'/1]).
-export(['K2-RoundFunc-168'/1]).
-export(['K2-RoundFunc-169'/1]).
-export(['K2-RoundFunc-170'/1]).
-export(['K2-RoundFunc-171'/1]).
-export(['K2-RoundFunc-172'/1]).
-export(['K2-RoundFunc-173'/1]).
-export(['K2-RoundFunc-174'/1]).
-export(['K2-RoundFunc-175'/1]).
-export(['K2-RoundFunc-176'/1]).
-export(['K2-RoundFunc-177'/1]).
-export(['K2-RoundFunc-178'/1]).
-export(['K2-RoundFunc-179'/1]).
-export(['K2-RoundFunc-180'/1]).
-export(['K2-RoundFunc-181'/1]).
-export(['K2-RoundFunc-182'/1]).
-export(['K2-RoundFunc-183'/1]).
-export(['K2-RoundFunc-184'/1]).
-export(['K2-RoundFunc-185'/1]).
-export(['K2-RoundFunc-186'/1]).
-export(['K2-RoundFunc-187'/1]).
-export(['K2-RoundFunc-188'/1]).
-export(['K2-RoundFunc-189'/1]).
-export(['K2-RoundFunc-190'/1]).
-export(['fn-round-1'/1]).
-export(['fn-round-decimal-2'/1]).
-export(['fn-round-decimal-3'/1]).
-export(['fn-round-decimal-4'/1]).
-export(['fn-round-decimal-5'/1]).
-export(['fn-round-decimal-6'/1]).
-export(['fn-round-decimal-7'/1]).
-export(['fn-round-decimal-8'/1]).
-export(['fn-round-decimal-9'/1]).
-export(['fn-round-decimal-10'/1]).
-export(['fn-round-decimal-11'/1]).
-export(['fn-round-decimal-12'/1]).
-export(['fn-round2args-1'/1]).
-export(['fn-round2args-2'/1]).
-export(['fn-round2args-3'/1]).
-export(['fn-round2args-4'/1]).
suite() ->[{timetrap,{seconds,5}}].
end_per_suite(_Config) -> erlang:erase().
init_per_suite(Config) -> ok
,Config.
all() -> [
   'fn-roundint1args-1',
   'fn-roundint1args-2',
   'fn-roundint1args-3',
   'fn-roundintg1args-1',
   'fn-roundintg1args-2',
   'fn-roundintg1args-3',
   'fn-rounddec1args-1',
   'fn-rounddec1args-2',
   'fn-rounddec1args-3',
   'fn-rounddbl1args-1',
   'fn-rounddbl1args-2',
   'fn-rounddbl1args-3',
   'fn-roundflt1args-1',
   'fn-roundflt1args-2',
   'fn-roundflt1args-3',
   'fn-roundlng1args-1',
   'fn-roundlng1args-2',
   'fn-roundlng1args-3',
   'fn-roundusht1args-1',
   'fn-roundusht1args-2',
   'fn-roundusht1args-3',
   'fn-roundnint1args-1',
   'fn-roundnint1args-2',
   'fn-roundnint1args-3',
   'fn-roundpint1args-1',
   'fn-roundpint1args-2',
   'fn-roundpint1args-3',
   'fn-roundulng1args-1',
   'fn-roundulng1args-2',
   'fn-roundulng1args-3',
   'fn-roundnpi1args-1',
   'fn-roundnpi1args-2',
   'fn-roundnpi1args-3',
   'fn-roundnni1args-1',
   'fn-roundnni1args-2',
   'fn-roundnni1args-3',
   'fn-roundsht1args-1',
   'fn-roundsht1args-2',
   'fn-roundsht1args-3',
   'K-RoundFunc-1',
   'K-RoundFunc-2',
   'K-RoundFunc-2a',
   'K-RoundFunc-3',
   'K-RoundFunc-4',
   'K-RoundFunc-5',
   'K-RoundFunc-6',
   'K-RoundFunc-7',
   'K-RoundFunc-8',
   'K-RoundFunc-9',
   'K2-RoundFunc-1',
   'K2-RoundFunc-2',
   'K2-RoundFunc-3',
   'K2-RoundFunc-4',
   'K2-RoundFunc-5',
   'K2-RoundFunc-6',
   'K2-RoundFunc-7',
   'K2-RoundFunc-8',
   'K2-RoundFunc-9',
   'K2-RoundFunc-10',
   'K2-RoundFunc-11',
   'K2-RoundFunc-12',
   'K2-RoundFunc-13',
   'K2-RoundFunc-14',
   'K2-RoundFunc-15',
   'K2-RoundFunc-16',
   'K2-RoundFunc-17',
   'K2-RoundFunc-18',
   'K2-RoundFunc-19',
   'K2-RoundFunc-20',
   'K2-RoundFunc-21',
   'K2-RoundFunc-22',
   'K2-RoundFunc-23',
   'K2-RoundFunc-24',
   'K2-RoundFunc-25',
   'K2-RoundFunc-26',
   'K2-RoundFunc-27',
   'K2-RoundFunc-28',
   'K2-RoundFunc-29',
   'K2-RoundFunc-30',
   'K2-RoundFunc-31',
   'K2-RoundFunc-32',
   'K2-RoundFunc-33',
   'K2-RoundFunc-34',
   'K2-RoundFunc-35',
   'K2-RoundFunc-36',
   'K2-RoundFunc-37',
   'K2-RoundFunc-38',
   'K2-RoundFunc-39',
   'K2-RoundFunc-40',
   'K2-RoundFunc-41',
   'K2-RoundFunc-42',
   'K2-RoundFunc-43',
   'K2-RoundFunc-44',
   'K2-RoundFunc-45',
   'K2-RoundFunc-46',
   'K2-RoundFunc-47',
   'K2-RoundFunc-48',
   'K2-RoundFunc-49',
   'K2-RoundFunc-50',
   'K2-RoundFunc-51',
   'K2-RoundFunc-52',
   'K2-RoundFunc-53',
   'K2-RoundFunc-54',
   'K2-RoundFunc-55',
   'K2-RoundFunc-56',
   'K2-RoundFunc-57',
   'K2-RoundFunc-58',
   'K2-RoundFunc-59',
   'K2-RoundFunc-60',
   'K2-RoundFunc-61',
   'K2-RoundFunc-62',
   'K2-RoundFunc-63',
   'K2-RoundFunc-64',
   'K2-RoundFunc-65',
   'K2-RoundFunc-66',
   'K2-RoundFunc-67',
   'K2-RoundFunc-68',
   'K2-RoundFunc-69',
   'K2-RoundFunc-70',
   'K2-RoundFunc-71',
   'K2-RoundFunc-72',
   'K2-RoundFunc-73',
   'K2-RoundFunc-74',
   'K2-RoundFunc-75',
   'K2-RoundFunc-76',
   'K2-RoundFunc-77',
   'K2-RoundFunc-78',
   'K2-RoundFunc-79',
   'K2-RoundFunc-80',
   'K2-RoundFunc-81',
   'K2-RoundFunc-82',
   'K2-RoundFunc-83',
   'K2-RoundFunc-84',
   'K2-RoundFunc-85',
   'K2-RoundFunc-86',
   'K2-RoundFunc-87',
   'K2-RoundFunc-88',
   'K2-RoundFunc-89',
   'K2-RoundFunc-90',
   'K2-RoundFunc-91',
   'K2-RoundFunc-92',
   'K2-RoundFunc-93',
   'K2-RoundFunc-94',
   'K2-RoundFunc-95',
   'K2-RoundFunc-96',
   'K2-RoundFunc-97',
   'K2-RoundFunc-98',
   'K2-RoundFunc-99',
   'K2-RoundFunc-100',
   'K2-RoundFunc-101',
   'K2-RoundFunc-102',
   'K2-RoundFunc-103',
   'K2-RoundFunc-104',
   'K2-RoundFunc-105',
   'K2-RoundFunc-106',
   'K2-RoundFunc-107',
   'K2-RoundFunc-108',
   'K2-RoundFunc-109',
   'K2-RoundFunc-110',
   'K2-RoundFunc-111',
   'K2-RoundFunc-112',
   'K2-RoundFunc-113',
   'K2-RoundFunc-114',
   'K2-RoundFunc-115',
   'K2-RoundFunc-116',
   'K2-RoundFunc-117',
   'K2-RoundFunc-118',
   'K2-RoundFunc-119',
   'K2-RoundFunc-120',
   'K2-RoundFunc-121',
   'K2-RoundFunc-122',
   'K2-RoundFunc-123',
   'K2-RoundFunc-124',
   'K2-RoundFunc-125',
   'K2-RoundFunc-126',
   'K2-RoundFunc-127',
   'K2-RoundFunc-128',
   'K2-RoundFunc-129',
   'K2-RoundFunc-130',
   'K2-RoundFunc-131',
   'K2-RoundFunc-132',
   'K2-RoundFunc-133',
   'K2-RoundFunc-134',
   'K2-RoundFunc-135',
   'K2-RoundFunc-136',
   'K2-RoundFunc-137',
   'K2-RoundFunc-138',
   'K2-RoundFunc-139',
   'K2-RoundFunc-140',
   'K2-RoundFunc-141',
   'K2-RoundFunc-142',
   'K2-RoundFunc-143',
   'K2-RoundFunc-144',
   'K2-RoundFunc-145',
   'K2-RoundFunc-146',
   'K2-RoundFunc-147',
   'K2-RoundFunc-148',
   'K2-RoundFunc-149',
   'K2-RoundFunc-150',
   'K2-RoundFunc-151',
   'K2-RoundFunc-152',
   'K2-RoundFunc-153',
   'K2-RoundFunc-154',
   'K2-RoundFunc-155',
   'K2-RoundFunc-156',
   'K2-RoundFunc-157',
   'K2-RoundFunc-158',
   'K2-RoundFunc-159',
   'K2-RoundFunc-160',
   'K2-RoundFunc-161',
   'K2-RoundFunc-162',
   'K2-RoundFunc-163',
   'K2-RoundFunc-164',
   'K2-RoundFunc-165',
   'K2-RoundFunc-166',
   'K2-RoundFunc-167',
   'K2-RoundFunc-168',
   'K2-RoundFunc-169',
   'K2-RoundFunc-170',
   'K2-RoundFunc-171',
   'K2-RoundFunc-172',
   'K2-RoundFunc-173',
   'K2-RoundFunc-174',
   'K2-RoundFunc-175',
   'K2-RoundFunc-176',
   'K2-RoundFunc-177',
   'K2-RoundFunc-178',
   'K2-RoundFunc-179',
   'K2-RoundFunc-180',
   'K2-RoundFunc-181',
   'K2-RoundFunc-182',
   'K2-RoundFunc-183',
   'K2-RoundFunc-184',
   'K2-RoundFunc-185',
   'K2-RoundFunc-186',
   'K2-RoundFunc-187',
   'K2-RoundFunc-188',
   'K2-RoundFunc-189',
   'K2-RoundFunc-190',
   'fn-round-1',
   'fn-round-decimal-2',
   'fn-round-decimal-3',
   'fn-round-decimal-4',
   'fn-round-decimal-5',
   'fn-round-decimal-6',
   'fn-round-decimal-7',
   'fn-round-decimal-8',
   'fn-round-decimal-9',
   'fn-round-decimal-10',
   'fn-round-decimal-11',
   'fn-round-decimal-12',
   'fn-round2args-1',
   'fn-round2args-2',
   'fn-round2args-3',
   'fn-round2args-4'].
environment('empty') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('atomic') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.w3.org/XQueryTest","atomic"}]},
{resources, []},
{modules, []}
];
environment('atomic-xq') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/atomic.xml",".","http://www.w3.org/fots/docs/atomic.xml"}]},
{schemas, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/atomic.xsd","http://www.w3.org/XQueryTest"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-mod') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/works-mod.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/works.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('staff') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/staff.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('works-and-staff') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/works.xml","$works",""},
{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/staff.xml","$staff",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('auction') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/auction.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.example.com/AuctionWatch","ma"},
{"http://www.w3.org/1999/xlink","xlink"},
{"http://www.example.com/auctioneers#anyzone","anyzone"},
{"http://www.example.com/auctioneers#eachbay","eachbay"},
{"http://www.example.com/auctioneers#yabadoo","yabadoo"}]},
{resources, []},
{modules, []}
];
environment('qname') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/QName-source.xml",".",""}]},
{schemas, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/docs/QName-schema.xsd","http://www.example.com/QNameXSD"}]},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.example.com/QNameXSD",""}]},
{resources, []},
{modules, []}
];
environment('math') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, [{"http://www.w3.org/2005/xpath-functions/math","math"}]},
{resources, []},
{modules, []}
];
environment('emptydoc') ->
[{sources, []},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('e0') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/fn/abs/e0.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('e1') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/fn/abs/e1.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
];
environment('e-1') ->
[{sources, [{"file:///C:/git/zadean/xqerl/test/QT3_1_0/fn/abs/e-1.xml",".",""}]},
{schemas, []},
{collections, []},
{'static-base-uri', []},
{params, []},
{namespaces, []},
{resources, []},
{modules, []}
].
'fn-roundint1args-1'(_Config) ->
   Qry = "fn:round(xs:int(\"-2147483648\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -2147483648
            xs:integer
         
      ",
 case  begin Tst1 = xqerl:run("-2147483648"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:integer' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-roundint1args-2'(_Config) ->
   Qry = "fn:round(xs:int(\"-1873914410\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1873914410
      ",
 Tst = xqerl:run("-1873914410"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundint1args-3'(_Config) ->
   Qry = "fn:round(xs:int(\"2147483647\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         2147483647
      ",
 Tst = xqerl:run("2147483647"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundintg1args-1'(_Config) ->
   Qry = "fn:round(xs:integer(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundintg1args-2'(_Config) ->
   Qry = "fn:round(xs:integer(\"830993497117024304\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         830993497117024304
      ",
 Tst = xqerl:run("830993497117024304"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundintg1args-3'(_Config) ->
   Qry = "fn:round(xs:integer(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-rounddec1args-1'(_Config) ->
   Qry = "fn:round(xs:decimal(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-rounddec1args-2'(_Config) ->
   Qry = "fn:round(xs:decimal(\"617375191608514839\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            617375191608514839
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("617375191608514839"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-rounddec1args-3'(_Config) ->
   Qry = "fn:round(xs:decimal(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-rounddbl1args-1'(_Config) ->
   Qry = "fn:round(xs:double(\"-1.7976931348623157E308\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1.7976931348623157E308
      ",
 Tst = xqerl:run("-1.7976931348623157E308"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-rounddbl1args-2'(_Config) ->
   Qry = "fn:round(xs:double(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            0
            xs:double
         
      ",
 case  begin Tst1 = xqerl:run("0"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-rounddbl1args-3'(_Config) ->
   Qry = "fn:round(xs:double(\"1.7976931348623157E308\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1.7976931348623157E308
      ",
 Tst = xqerl:run("1.7976931348623157E308"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundflt1args-1'(_Config) ->
   Qry = "fn:round(xs:float(\"-3.4028235E38\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         xs:float(\"-3.4028235E38\")
      ",
 Tst = xqerl:run("xs:float(\"-3.4028235E38\")"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundflt1args-2'(_Config) ->
   Qry = "fn:round(xs:float(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            xs:float
            0
         
      ",
 case  begin Tst2 = xqerl:run("0"),
  ResVal2 = xqerl_types:value(Res),
  TstVal2 = xqerl_types:value(Tst2),
  ResVal2 == TstVal2 end andalso xqerl_types:type(Res) == 'xs:float' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-roundflt1args-3'(_Config) ->
   Qry = "fn:round(xs:float(\"3.4028235E38\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         xs:float(\"3.4028235E38\")
      ",
 Tst = xqerl:run("xs:float(\"3.4028235E38\")"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundlng1args-1'(_Config) ->
   Qry = "fn:round(xs:long(\"-92233720368547758\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -92233720368547758
      ",
 Tst = xqerl:run("-92233720368547758"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundlng1args-2'(_Config) ->
   Qry = "fn:round(xs:long(\"-47175562203048468\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -47175562203048468
      ",
 Tst = xqerl:run("-47175562203048468"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundlng1args-3'(_Config) ->
   Qry = "fn:round(xs:long(\"92233720368547758\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         92233720368547758
      ",
 Tst = xqerl:run("92233720368547758"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundusht1args-1'(_Config) ->
   Qry = "fn:round(xs:unsignedShort(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundusht1args-2'(_Config) ->
   Qry = "fn:round(xs:unsignedShort(\"44633\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         44633
      ",
 Tst = xqerl:run("44633"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundusht1args-3'(_Config) ->
   Qry = "fn:round(xs:unsignedShort(\"65535\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         65535
      ",
 Tst = xqerl:run("65535"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnint1args-1'(_Config) ->
   Qry = "fn:round(xs:negativeInteger(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnint1args-2'(_Config) ->
   Qry = "fn:round(xs:negativeInteger(\"-297014075999096793\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -297014075999096793
      ",
 Tst = xqerl:run("-297014075999096793"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnint1args-3'(_Config) ->
   Qry = "fn:round(xs:negativeInteger(\"-1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundpint1args-1'(_Config) ->
   Qry = "fn:round(xs:positiveInteger(\"1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundpint1args-2'(_Config) ->
   Qry = "fn:round(xs:positiveInteger(\"52704602390610033\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         52704602390610033
      ",
 Tst = xqerl:run("52704602390610033"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundpint1args-3'(_Config) ->
   Qry = "fn:round(xs:positiveInteger(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundulng1args-1'(_Config) ->
   Qry = "fn:round(xs:unsignedLong(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundulng1args-2'(_Config) ->
   Qry = "fn:round(xs:unsignedLong(\"130747108607674654\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         130747108607674654
      ",
 Tst = xqerl:run("130747108607674654"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundulng1args-3'(_Config) ->
   Qry = "fn:round(xs:unsignedLong(\"184467440737095516\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         184467440737095516
      ",
 Tst = xqerl:run("184467440737095516"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnpi1args-1'(_Config) ->
   Qry = "fn:round(xs:nonPositiveInteger(\"-999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -999999999999999999
      ",
 Tst = xqerl:run("-999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnpi1args-2'(_Config) ->
   Qry = "fn:round(xs:nonPositiveInteger(\"-475688437271870490\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -475688437271870490
      ",
 Tst = xqerl:run("-475688437271870490"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnpi1args-3'(_Config) ->
   Qry = "fn:round(xs:nonPositiveInteger(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnni1args-1'(_Config) ->
   Qry = "fn:round(xs:nonNegativeInteger(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnni1args-2'(_Config) ->
   Qry = "fn:round(xs:nonNegativeInteger(\"303884545991464527\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         303884545991464527
      ",
 Tst = xqerl:run("303884545991464527"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundnni1args-3'(_Config) ->
   Qry = "fn:round(xs:nonNegativeInteger(\"999999999999999999\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         999999999999999999
      ",
 Tst = xqerl:run("999999999999999999"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundsht1args-1'(_Config) ->
   Qry = "fn:round(xs:short(\"-32768\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -32768
      ",
 Tst = xqerl:run("-32768"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundsht1args-2'(_Config) ->
   Qry = "fn:round(xs:short(\"-5324\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -5324
      ",
 Tst = xqerl:run("-5324"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-roundsht1args-3'(_Config) ->
   Qry = "fn:round(xs:short(\"32767\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         32767
      ",
 Tst = xqerl:run("32767"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K-RoundFunc-1'(_Config) ->
   Qry = "round()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   if is_tuple(Res) andalso element(1,Res) == 'xqError' andalso element(4,element(2,Res)) == "XPST0017" -> {comment, "Correct error"};
           true -> ct:fail({Res, 'XPST0017'}) end.
'K-RoundFunc-2'(_Config) ->
   {skip,"XP20 XQ10"}.
'K-RoundFunc-2a'(_Config) ->
   Qry = "round(1, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K-RoundFunc-3'(_Config) ->
   Qry = "empty(round(()))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-4'(_Config) ->
   Qry = "round(1) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-5'(_Config) ->
   Qry = "round(1.1) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-6'(_Config) ->
   Qry = "round(xs:double(1)) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-7'(_Config) ->
   Qry = "round(xs:float(1)) eq 1",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-8'(_Config) ->
   Qry = "round(2.4999) eq 2",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K-RoundFunc-9'(_Config) ->
   Qry = "round(-2.5) eq -2",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
      ",
   case xqerl_seq2:singleton_value(Res) of {xqAtomicValue,'xs:boolean',true} -> {comment, "assert-true"};
           _ -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-1'(_Config) ->
   Qry = "round(xs:unsignedShort(.)) instance of xs:unsignedShort",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-2'(_Config) ->
   Qry = "round(xs:unsignedLong(.)) instance of xs:unsignedLong",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-3'(_Config) ->
   Qry = "round(xs:unsignedInt(.)) instance of xs:unsignedInt",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-4'(_Config) ->
   Qry = "round(xs:unsignedByte(.)) instance of xs:unsignedByte",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-5'(_Config) ->
   Qry = "round(xs:positiveInteger(.)) instance of xs:positiveInteger",
   Env = xqerl_test:handle_environment(environment('e1')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-6'(_Config) ->
   Qry = "round(xs:nonPositiveInteger(.)) instance of xs:nonPositiveInteger",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-7'(_Config) ->
   Qry = "round(xs:nonNegativeInteger(.)) instance of xs:nonNegativeInteger",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-8'(_Config) ->
   Qry = "round(xs:negativeInteger(.)) instance of xs:negativeInteger",
   Env = xqerl_test:handle_environment(environment('e-1')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-9'(_Config) ->
   Qry = "round(xs:long(.)) instance of xs:long",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-10'(_Config) ->
   Qry = "round(xs:int(.)) instance of xs:int",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-11'(_Config) ->
   Qry = "round(xs:short(.)) instance of xs:short",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-12'(_Config) ->
   Qry = "round(xs:byte(.)) instance of xs:byte",
   Env = xqerl_test:handle_environment(environment('e0')),
   Qry1 = lists:flatten(Env ++ Qry),
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            
            
         
      ",
 case (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',false}) orelse (xqerl_seq2:singleton_value(Res) == {xqAtomicValue,'xs:boolean',true}) of true -> {comment, "any-of"};
   Q -> ct:fail(['any-of', {Res,Exp,Q}]) end.
'K2-RoundFunc-13'(_Config) ->
   Qry = "round(xs:double(\"INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         INF
      ",
   case xqerl_test:string_value(Res) of
             "INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-14'(_Config) ->
   Qry = "round(xs:double(\"-INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -INF
      ",
   case xqerl_test:string_value(Res) of
             "-INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-15'(_Config) ->
   Qry = "round(xs:double(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-16'(_Config) ->
   Qry = "round(xs:double(\"-0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-17'(_Config) ->
   Qry = "round(xs:float(\"INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         INF
      ",
   case xqerl_test:string_value(Res) of
             "INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-18'(_Config) ->
   Qry = "round(xs:float(\"-INF\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -INF
      ",
   case xqerl_test:string_value(Res) of
             "-INF" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-19'(_Config) ->
   Qry = "round(xs:float(\"0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-20'(_Config) ->
   Qry = "round(xs:float(\"-0\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-21'(_Config) ->
   Qry = "fn:round(xs:float(\"NaN\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         NaN
      ",
   case xqerl_test:string_value(Res) of
             "NaN" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-22'(_Config) ->
   Qry = "fn:round(xs:double(\"NaN\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         NaN
      ",
   case xqerl_test:string_value(Res) of
             "NaN" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-23'(_Config) ->
   Qry = "fn:round(xs:float(\"0.01\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-24'(_Config) ->
   Qry = "fn:round(xs:double(\"0.01\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-25'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.01\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
 Tst = xqerl:run("-0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-26'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.01\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-27'(_Config) ->
   Qry = "fn:round(xs:float(\"0.04\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-28'(_Config) ->
   Qry = "fn:round(xs:double(\"0.04\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-29'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.04\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-30'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.04\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-31'(_Config) ->
   Qry = "fn:round(xs:float(\"0.05\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-32'(_Config) ->
   Qry = "fn:round(xs:double(\"0.05\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-33'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.05\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-34'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.05\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-35'(_Config) ->
   Qry = "fn:round(xs:float(\"0.06\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-36'(_Config) ->
   Qry = "fn:round(xs:double(\"0.06\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-37'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.06\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-38'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.06\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-39'(_Config) ->
   Qry = "fn:round(xs:float(\"0.09\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-40'(_Config) ->
   Qry = "fn:round(xs:double(\"0.09\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-41'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.09\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-42'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.09\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-43'(_Config) ->
   Qry = "fn:round(xs:float(\"0.00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-44'(_Config) ->
   Qry = "fn:round(xs:double(\"0.00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-45'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-46'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.00\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-47'(_Config) ->
   Qry = "fn:round(xs:float(\"0.11\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-48'(_Config) ->
   Qry = "fn:round(xs:double(\"0.11\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-49'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.11\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-50'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.11\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-51'(_Config) ->
   Qry = "fn:round(xs:float(\"0.14\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-52'(_Config) ->
   Qry = "fn:round(xs:double(\"0.14\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-53'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.14\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-54'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.14\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            xs:double
            -0
         
      ",
 case xqerl_test:string_value(Res) == "-0" andalso xqerl_types:type(Res) == 'xs:double' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'K2-RoundFunc-55'(_Config) ->
   Qry = "fn:round(xs:float(\"0.15\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-56'(_Config) ->
   Qry = "fn:round(xs:double(\"0.15\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-57'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.15\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-58'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.15\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-59'(_Config) ->
   Qry = "fn:round(xs:float(\"0.16\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-60'(_Config) ->
   Qry = "fn:round(xs:double(\"0.16\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-61'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.16\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-62'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.16\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-63'(_Config) ->
   Qry = "fn:round(xs:float(\"0.19\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-64'(_Config) ->
   Qry = "fn:round(xs:double(\"0.19\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-65'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.19\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-66'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.19\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-67'(_Config) ->
   Qry = "fn:round(xs:float(\"0.10\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-68'(_Config) ->
   Qry = "fn:round(xs:double(\"0.10\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-69'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.10\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-70'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.10\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-71'(_Config) ->
   Qry = "fn:round(xs:float(\"0.41\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-72'(_Config) ->
   Qry = "fn:round(xs:double(\"0.41\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-73'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.41\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-74'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.41\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-75'(_Config) ->
   Qry = "fn:round(xs:float(\"0.44\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-76'(_Config) ->
   Qry = "fn:round(xs:double(\"0.44\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-77'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.44\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-78'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.44\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-79'(_Config) ->
   Qry = "fn:round(xs:float(\"0.45\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-80'(_Config) ->
   Qry = "fn:round(xs:double(\"0.45\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-81'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.45\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-82'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.45\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-83'(_Config) ->
   Qry = "fn:round(xs:float(\"0.46\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-84'(_Config) ->
   Qry = "fn:round(xs:double(\"0.46\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-85'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.46\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-86'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.46\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-87'(_Config) ->
   Qry = "fn:round(xs:float(\"0.49\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-88'(_Config) ->
   Qry = "fn:round(xs:double(\"0.49\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-89'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.49\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-90'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.49\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-91'(_Config) ->
   Qry = "fn:round(xs:float(\"0.40\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-92'(_Config) ->
   Qry = "fn:round(xs:double(\"0.40\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-93'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.40\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-94'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.40\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-95'(_Config) ->
   Qry = "fn:round(xs:float(\"0.51\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
   case xqerl_test:string_value(Res) of
             "1" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-96'(_Config) ->
   Qry = "fn:round(xs:double(\"0.51\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
   case xqerl_test:string_value(Res) of
             "1" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-97'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.51\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-98'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.51\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-99'(_Config) ->
   Qry = "fn:round(xs:float(\"0.54\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-100'(_Config) ->
   Qry = "fn:round(xs:double(\"0.54\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-101'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.54\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-102'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.54\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-103'(_Config) ->
   Qry = "fn:round(xs:float(\"0.55\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-104'(_Config) ->
   Qry = "fn:round(xs:double(\"0.55\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-105'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.55\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-106'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.55\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-107'(_Config) ->
   Qry = "fn:round(xs:float(\"0.56\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-108'(_Config) ->
   Qry = "fn:round(xs:double(\"0.56\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-109'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.56\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-110'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.56\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-111'(_Config) ->
   Qry = "fn:round(xs:float(\"0.59\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-112'(_Config) ->
   Qry = "fn:round(xs:double(\"0.59\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-113'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.59\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-114'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.59\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-115'(_Config) ->
   Qry = "fn:round(xs:float(\"0.50\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-116'(_Config) ->
   Qry = "fn:round(xs:double(\"0.50\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-117'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.50\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-118'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.50\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-119'(_Config) ->
   Qry = "fn:round(xs:float(\"0.61\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-120'(_Config) ->
   Qry = "fn:round(xs:double(\"0.61\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-121'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.61\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-122'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.61\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-123'(_Config) ->
   Qry = "fn:round(xs:float(\"0.64\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-124'(_Config) ->
   Qry = "fn:round(xs:double(\"0.64\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-125'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.64\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-126'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.64\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-127'(_Config) ->
   Qry = "fn:round(xs:float(\"0.65\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-128'(_Config) ->
   Qry = "fn:round(xs:double(\"0.65\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-129'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.65\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-130'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.65\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-131'(_Config) ->
   Qry = "fn:round(xs:float(\"0.66\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-132'(_Config) ->
   Qry = "fn:round(xs:double(\"0.66\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-133'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.66\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-134'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.66\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-135'(_Config) ->
   Qry = "fn:round(xs:float(\"0.69\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-136'(_Config) ->
   Qry = "fn:round(xs:double(\"0.69\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-137'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.69\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-138'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.69\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-139'(_Config) ->
   Qry = "fn:round(xs:float(\"0.60\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-140'(_Config) ->
   Qry = "fn:round(xs:double(\"0.60\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-141'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.60\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-142'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.60\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-143'(_Config) ->
   Qry = "fn:round(xs:float(\"0.91\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-144'(_Config) ->
   Qry = "fn:round(xs:double(\"0.91\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-145'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.91\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-146'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.91\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-147'(_Config) ->
   Qry = "fn:round(xs:float(\"0.94\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-148'(_Config) ->
   Qry = "fn:round(xs:double(\"0.94\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-149'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.94\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-150'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.94\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-151'(_Config) ->
   Qry = "fn:round(xs:float(\"0.95\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-152'(_Config) ->
   Qry = "fn:round(xs:double(\"0.95\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-153'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.95\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-154'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.95\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-155'(_Config) ->
   Qry = "fn:round(xs:float(\"0.96\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-156'(_Config) ->
   Qry = "fn:round(xs:double(\"0.96\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-157'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.96\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-158'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.96\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-159'(_Config) ->
   Qry = "fn:round(xs:float(\"0.99\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-160'(_Config) ->
   Qry = "fn:round(xs:double(\"0.99\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-161'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.99\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-162'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.99\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-163'(_Config) ->
   Qry = "fn:round(xs:float(\"0.90\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-164'(_Config) ->
   Qry = "fn:round(xs:double(\"0.90\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         1
      ",
 Tst = xqerl:run("1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-165'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.90\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-166'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.90\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -1
      ",
 Tst = xqerl:run("-1"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-167'(_Config) ->
   Qry = "fn:round(xs:float(\"0.101\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
 Tst = xqerl:run("0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'K2-RoundFunc-168'(_Config) ->
   Qry = "fn:round(xs:double(\"0.101\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-169'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.101\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-170'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.101\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-171'(_Config) ->
   Qry = "fn:round(xs:float(\"0.104\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-172'(_Config) ->
   Qry = "fn:round(xs:double(\"0.104\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-173'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.104\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-174'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.104\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-175'(_Config) ->
   Qry = "fn:round(xs:float(\"0.105\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-176'(_Config) ->
   Qry = "fn:round(xs:double(\"0.105\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-177'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.105\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-178'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.105\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-179'(_Config) ->
   Qry = "fn:round(xs:float(\"0.106\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-180'(_Config) ->
   Qry = "fn:round(xs:double(\"0.106\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-181'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.106\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-182'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.106\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-183'(_Config) ->
   Qry = "fn:round(xs:float(\"0.109\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-184'(_Config) ->
   Qry = "fn:round(xs:double(\"0.109\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-185'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.109\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-186'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.109\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-187'(_Config) ->
   Qry = "fn:round(xs:float(\"0.100\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-188'(_Config) ->
   Qry = "fn:round(xs:double(\"0.100\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         0
      ",
   case xqerl_test:string_value(Res) of
             "0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-189'(_Config) ->
   Qry = "fn:round(xs:float(\"-0.100\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'K2-RoundFunc-190'(_Config) ->
   Qry = "fn:round(xs:double(\"-0.100\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         -0
      ",
   case xqerl_test:string_value(Res) of
             "-0" -> {comment, "assert-string-value"};
             _ -> ct:fail({xqerl_test:string_value(Res),Exp}) end.
'fn-round-1'(_Config) ->
   Qry = "for $x in (1, xs:decimal(2), xs:float(3), xs:double(4)) 
            return if ((round($x)) instance of xs:integer) then \"integer\" 
           else if ((round($x)) instance of xs:decimal) then \"decimal\" 
           else if ((round($x)) instance of xs:float) then \"float\"
           else if ((round($x)) instance of xs:double) then \"double\" 
           else error()",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         \"integer\", \"decimal\", \"float\", \"double\"
      ",
 Tst = xqerl:run("\"integer\", \"decimal\", \"float\", \"double\""),
  ResVal = xqerl_test:string_value(Res),
  TstVal = xqerl_test:string_value(Tst),
  if ResVal == TstVal -> {comment, "assert-deep-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round-decimal-2'(_Config) ->
   Qry = "fn:round(xs:decimal(\"12.1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            12
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("12"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-3'(_Config) ->
   Qry = "fn:round(xs:decimal(\"12.7\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            13
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("13"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-4'(_Config) ->
   Qry = "fn:round(xs:decimal(\"12.5\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            13
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("13"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-5'(_Config) ->
   Qry = "fn:round(xs:decimal(\"-12.7\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -13
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-13"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-6'(_Config) ->
   Qry = "fn:round(xs:decimal(\"-12.1\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-7'(_Config) ->
   Qry = "fn:round(xs:decimal(\"-12.5\"))",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-8'(_Config) ->
   Qry = "fn:round(-12.567, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12.57
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12.57"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-9'(_Config) ->
   Qry = "fn:round(-12.567, 4)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -12.567
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-12.567"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-10'(_Config) ->
   Qry = "fn:round(-12.567, 0)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -13
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-13"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-11'(_Config) ->
   Qry = "fn:round(-1234.567, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            -1200
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("-1200"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round-decimal-12'(_Config) ->
   Qry = "fn:round(1.567, -3)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            0
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("0"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round2args-1'(_Config) ->
   Qry = "fn:round(1.125, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
         
            1.13
            xs:decimal
         
      ",
 case  begin Tst1 = xqerl:run("1.13"),
  ResVal1 = xqerl_types:value(Res),
  TstVal1 = xqerl_types:value(Tst1),
  ResVal1 == TstVal1 end andalso xqerl_types:type(Res) == 'xs:decimal' of true -> {comment, "any-of"};
   _ -> ct:fail(['all-of', {Res,Exp}]) end.
'fn-round2args-2'(_Config) ->
   Qry = "fn:round(8452, -2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        8500
      ",
 Tst = xqerl:run("8500"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round2args-3'(_Config) ->
   Qry = "fn:round(3.1415e0, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        3.14e0
      ",
 Tst = xqerl:run("3.14e0"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
'fn-round2args-4'(_Config) ->
   Qry = "fn:round(35.425, 2)",
   Qry1 = Qry,
   Res = xqerl:run(Qry1),
   ResXml = xqerl_node:to_xml(Res),
   Options = [{'result',Res}],
   Exp = "
        35.43
      ",
 Tst = xqerl:run("35.43"),
  ResVal = xqerl_types:value(Res),
  TstVal = xqerl_types:value(Tst),
  if ResVal == TstVal -> {comment, "assert-eq"};
    true -> ct:fail({Res,Exp}) end.
