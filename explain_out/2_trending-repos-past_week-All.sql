"id","estRows","task","access object","operator info"
"Sort_294","100.00","root","","Column#355:desc"
"└─Projection_296","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.description, Column#353, Column#354, Column#466, Column#510, Column#355, Column#403, Column#422"
"  └─HashJoin_298","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    ├─HashJoin_300(Build)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    │ ├─HashJoin_301(Build)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_id)]"
"    │ │ ├─HashAgg_355(Build)","1.00","root","","group by:gharchive_dev.github_repos.repo_id, funcs:group_concat(distinct gharchive_dev.collections.name separator "","")->Column#422, funcs:firstrow(gharchive_dev.github_repos.repo_id)->gharchive_dev.github_repos.repo_id"
"    │ │ │ └─Projection_356","89.82","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.collections.name"
"    │ │ │   └─HashJoin_358","89.82","root","","inner join, equal:[eq(gharchive_dev.collection_items.repo_name, gharchive_dev.github_repos.repo_name)]"
"    │ │ │     ├─HashJoin_387(Build)","79.00","root","","inner join, equal:[eq(gharchive_dev.collection_items.collection_id, gharchive_dev.collections.id)]"
"    │ │ │     │ ├─TableReader_411(Build)","81.98","root","","data:Selection_410"
"    │ │ │     │ │ └─Selection_410","81.98","cop[tikv]","","eq(gharchive_dev.collections.public, 1)"
"    │ │ │     │ │   └─TableFullScan_409","83.00","cop[tikv]","table:c","keep order:false"
"    │ │ │     │ └─TableReader_402(Probe)","79.00","root","","data:Selection_401"
"    │ │ │     │   └─Selection_401","79.00","cop[tikv]","","not(isnull(gharchive_dev.collection_items.collection_id))"
"    │ │ │     │     └─TableFullScan_400","79.00","cop[tikv]","table:ci","keep order:false"
"    │ │ │     └─Selection_412(Probe)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id)), not(isnull(gharchive_dev.github_repos.repo_name))"
"    │ │ │       └─CTEFullScan_413","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ │ └─HashJoin_303(Probe)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    │ │   ├─Projection_306(Build)","13.41","root","","gharchive_dev.github_events.repo_id, substring_index(Column#402, ,, 5)->Column#403"
"    │ │   │ └─HashAgg_307","13.41","root","","group by:gharchive_dev.github_events.repo_id, funcs:group_concat(distinct gharchive_dev.github_events.actor_login order by Column#401 desc separator "","")->Column#402, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"    │ │   │   └─HashAgg_308","13.41","root","","group by:gharchive_dev.github_events.actor_login, gharchive_dev.github_events.repo_id, funcs:count(1)->Column#401, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"    │ │   │     └─HashJoin_319","13.41","root","","anti semi join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.blacklist_users.login)]"
"    │ │   │       ├─IndexReader_351(Build)","6.00","root","","index:IndexFullScan_350"
"    │ │   │       │ └─IndexFullScan_350","6.00","cop[tikv]","table:bu, index:blacklist_users_login_uindex(login)","keep order:false, stats:pseudo"
"    │ │   │       └─IndexHashJoin_328(Probe)","16.76","root","","inner join, inner:IndexLookUp_325, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"    │ │   │         ├─HashAgg_331(Build)","1.00","root","","group by:gharchive_dev.github_repos.repo_id, funcs:firstrow(gharchive_dev.github_repos.repo_id)->gharchive_dev.github_repos.repo_id"
"    │ │   │         │ └─Selection_332","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"    │ │   │         │   └─CTEFullScan_333","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ │   │         └─IndexLookUp_325(Probe)","16.76","root","partition:push_event,pull_request_event,issues_event,pull_request_review_event",""
"    │ │   │           ├─IndexRangeScan_322(Build)","46.76","cop[tikv]","table:ge, index:index_ge_on_repo_id_created_at(repo_id, created_at)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:46) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:46)], keep order:false"
"    │ │   │           └─Selection_324(Probe)","16.76","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%bot%"", 92)), or(or(and(eq(gharchive_dev.github_events.type, ""PullRequestEvent""), eq(gharchive_dev.github_events.action, ""opened"")), and(eq(gharchive_dev.github_events.type, ""IssuesEvent""), eq(gharchive_dev.github_events.action, ""opened""))), or(and(eq(gharchive_dev.github_events.type, ""PullRequestReviewEvent""), eq(gharchive_dev.github_events.action, ""created"")), and(eq(gharchive_dev.github_events.type, ""PushEvent""), eq(gharchive_dev.github_events.action, """"))))"
"    │ │   │             └─TableRowIDScan_323","46.76","cop[tikv]","table:ge","keep order:false"
"    │ │   └─CTEFullScan_305(Probe)","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ └─HashAgg_414(Probe)","1340.66","root","","group by:gharchive_dev.github_events.repo_id, funcs:count(1)->Column#466, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"    │   └─IndexHashJoin_423","1340.66","root","","inner join, inner:IndexReader_420, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"    │     ├─Selection_426(Build)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"    │     │ └─CTEFullScan_427","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │     └─IndexReader_420(Probe)","1340.66","root","partition:pull_request_event","index:Selection_419"
"    │       └─Selection_419","1340.66","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92))"
"    │         └─IndexRangeScan_418","1340.66","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) eq(gharchive_dev.github_events.type, PullRequestEvent) eq(gharchive_dev.github_events.action, opened) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:46) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:46)], keep order:false"
"    └─HashAgg_443(Probe)","1340.66","root","","group by:gharchive_dev.github_events.repo_id, funcs:count(1)->Column#510, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"      └─IndexHashJoin_453","1340.66","root","","inner join, inner:IndexLookUp_450, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"        ├─Selection_456(Build)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"        │ └─CTEFullScan_457","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"        └─IndexLookUp_450(Probe)","1340.66","root","partition:push_event",""
"          ├─IndexRangeScan_447(Build)","2736.00","cop[tikv]","table:ge, index:index_ge_on_repo_id_created_at(repo_id, created_at)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:46) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:46)], keep order:false"
"          └─Selection_449(Probe)","1340.66","cop[tikv]","","eq(gharchive_dev.github_events.type, ""PushEvent""), not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92))"
"            └─TableRowIDScan_448","2736.00","cop[tikv]","table:ge","keep order:false"
"CTE_2","100.00","root","","Non-Recursive CTE"
"└─Projection_130(Seed Part)","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.description, Column#141, ifnull(Column#185, 0)->Column#200, Column#193"
"  └─Projection_131","100.00","root","","cast(plus(plus(Column#145, ifnull(Column#189, 0)), mul(div(1, cast(plus(1, timestampdiff(YEAR, gharchive_dev.github_repos.created_at, 2023-09-03 14:35:46)), decimal(20,0) BINARY)), 200)), decimal(65,4) BINARY)->Column#193, gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, Column#141, Column#185"
"    └─Projection_282","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.created_at, Column#141, Column#145, Column#185, Column#189"
"      └─TopN_134","100.00","root","","Column#541:desc, offset:0, count:100"
"        └─Projection_283","360736.75","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.created_at, Column#141, Column#145, Column#185, Column#189, cast(plus(plus(Column#145, ifnull(Column#189, 0)), mul(div(1, cast(plus(1, timestampdiff(YEAR, gharchive_dev.github_repos.created_at, 2023-09-03 14:35:46)), decimal(20,0) BINARY)), 200)), decimal(65,4) BINARY)->Column#541"
"          └─HashJoin_137","360736.75","root","","CARTESIAN anti semi join, other cond:eq(gharchive_dev.github_repos.repo_name, gharchive_dev.blacklist_repos.name)"
"            ├─TableReader_278(Build)","6.00","root","","data:TableFullScan_277"
"            │ └─TableFullScan_277","6.00","cop[tikv]","table:br","keep order:false"
"            └─HashJoin_146(Probe)","450920.94","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"              ├─TableReader_276(Build)","174312.20","root","partition:fork_event","MppVersion: 1, data:ExchangeSender_275"
"              │ └─ExchangeSender_275","174312.20","mpp[tiflash]","","ExchangeType: PassThrough"
"              │   └─Selection_239","174312.20","mpp[tiflash]","","gt(cast(Column#186, decimal(20,0) BINARY), mul(0.9, cast(Column#185, decimal(20,0) BINARY)))"
"              │     └─Projection_271","217890.25","mpp[tiflash]","","Column#185, Column#186, Column#189, gharchive_dev.github_events.repo_id"
"              │       └─HashAgg_272","217890.25","mpp[tiflash]","","group by:gharchive_dev.github_events.repo_id, funcs:sum(Column#532)->Column#185, funcs:count(distinct gharchive_dev.github_events.actor_id)->Column#186, funcs:sum(Column#533)->Column#189, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"              │         └─ExchangeReceiver_274","217890.25","mpp[tiflash]","",""
"              │           └─ExchangeSender_273","217890.25","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.repo_id, collate: binary]"
"              │             └─HashAgg_269","217890.25","mpp[tiflash]","","group by:Column#539, Column#540, funcs:count(1)->Column#532, funcs:sum(Column#538)->Column#533"
"              │               └─Projection_281","3651465.64","mpp[tiflash]","","plus(mul(div(cast(timestampdiff(SECOND, 2023-08-27 14:35:46, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 604800), 3), 1)->Column#538, gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_id"
"              │                 └─Selection_258","3651465.64","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""ForkEvent""), ge(gharchive_dev.github_events.created_at, 2023-08-27 14:35:46), le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:46)"
"              │                   └─TableFullScan_257","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
"              └─IndexJoin_172(Probe)","450920.94","root","","inner join, inner:Selection_167, outer key:gharchive_dev.github_events.repo_id, inner key:gharchive_dev.github_repos.repo_id, equal cond:eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id), other cond:or(lt(gharchive_dev.github_repos.stars, 50000), gt(div(cast(Column#141, decimal(20,0) BINARY), cast(gharchive_dev.github_repos.stars, decimal(10,0) BINARY)), 0.01))"
"                ├─TableReader_217(Build)","450920.94","root","partition:watch_event","MppVersion: 1, data:ExchangeSender_216"
"                │ └─ExchangeSender_216","450920.94","mpp[tiflash]","","ExchangeType: PassThrough"
"                │   └─Selection_180","450920.94","mpp[tiflash]","","gt(cast(Column#142, decimal(20,0) BINARY), mul(0.9, cast(Column#141, decimal(20,0) BINARY)))"
"                │     └─Projection_212","563651.17","mpp[tiflash]","","Column#141, Column#142, Column#145, gharchive_dev.github_events.repo_id"
"                │       └─HashAgg_213","563651.17","mpp[tiflash]","","group by:gharchive_dev.github_events.repo_id, funcs:sum(Column#523)->Column#141, funcs:count(distinct gharchive_dev.github_events.actor_id)->Column#142, funcs:sum(Column#524)->Column#145, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"                │         └─ExchangeReceiver_215","563651.17","mpp[tiflash]","",""
"                │           └─ExchangeSender_214","563651.17","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.repo_id, collate: binary]"
"                │             └─HashAgg_210","563651.17","mpp[tiflash]","","group by:Column#536, Column#537, funcs:count(1)->Column#523, funcs:sum(Column#535)->Column#524"
"                │               └─Projection_280","9445823.64","mpp[tiflash]","","plus(mul(div(cast(timestampdiff(SECOND, 2023-08-27 14:35:46, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 604800), 3), 2)->Column#535, gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_id"
"                │                 └─Selection_199","9445823.64","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""WatchEvent""), ge(gharchive_dev.github_events.created_at, 2023-08-27 14:35:46), le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:46)"
"                │                   └─TableFullScan_198","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
"                └─Selection_167(Probe)","2525.35","root","","not(like(lower(gharchive_dev.github_repos.repo_name), ""%fuck%"", 92))"
"                  └─TableReader_166","2525.35","root","","data:Selection_165"
"                    └─Selection_165","2525.35","cop[tikv]","","eq(gharchive_dev.github_repos.is_deleted, 0), gt(gharchive_dev.github_repos.forks, 5), gt(gharchive_dev.github_repos.pushed_at, 2023-06-03 14:35:46), gt(gharchive_dev.github_repos.stars, 5), lt(gharchive_dev.github_repos.created_at, 2023-09-02 14:35:46)"
"                      └─TableRangeScan_164","450920.94","cop[tikv]","table:r","range: decided by [gharchive_dev.github_events.repo_id], keep order:false"
