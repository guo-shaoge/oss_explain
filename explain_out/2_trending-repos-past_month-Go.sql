"id","estRows","task","access object","operator info"
"Sort_293","100.00","root","","Column#355:desc"
"└─Projection_295","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.description, Column#353, Column#354, Column#466, Column#510, Column#355, Column#403, Column#422"
"  └─HashJoin_297","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    ├─HashJoin_299(Build)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    │ ├─HashJoin_300(Build)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_id)]"
"    │ │ ├─HashAgg_354(Build)","1.00","root","","group by:gharchive_dev.github_repos.repo_id, funcs:group_concat(distinct gharchive_dev.collections.name separator "","")->Column#422, funcs:firstrow(gharchive_dev.github_repos.repo_id)->gharchive_dev.github_repos.repo_id"
"    │ │ │ └─Projection_355","89.82","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.collections.name"
"    │ │ │   └─HashJoin_357","89.82","root","","inner join, equal:[eq(gharchive_dev.collection_items.repo_name, gharchive_dev.github_repos.repo_name)]"
"    │ │ │     ├─HashJoin_386(Build)","79.00","root","","inner join, equal:[eq(gharchive_dev.collection_items.collection_id, gharchive_dev.collections.id)]"
"    │ │ │     │ ├─TableReader_410(Build)","81.98","root","","data:Selection_409"
"    │ │ │     │ │ └─Selection_409","81.98","cop[tikv]","","eq(gharchive_dev.collections.public, 1)"
"    │ │ │     │ │   └─TableFullScan_408","83.00","cop[tikv]","table:c","keep order:false"
"    │ │ │     │ └─TableReader_401(Probe)","79.00","root","","data:Selection_400"
"    │ │ │     │   └─Selection_400","79.00","cop[tikv]","","not(isnull(gharchive_dev.collection_items.collection_id))"
"    │ │ │     │     └─TableFullScan_399","79.00","cop[tikv]","table:ci","keep order:false"
"    │ │ │     └─Selection_411(Probe)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id)), not(isnull(gharchive_dev.github_repos.repo_name))"
"    │ │ │       └─CTEFullScan_412","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ │ └─HashJoin_302(Probe)","100.00","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"    │ │   ├─Projection_305(Build)","13.41","root","","gharchive_dev.github_events.repo_id, substring_index(Column#402, ,, 5)->Column#403"
"    │ │   │ └─HashAgg_306","13.41","root","","group by:gharchive_dev.github_events.repo_id, funcs:group_concat(distinct gharchive_dev.github_events.actor_login order by Column#401 desc separator "","")->Column#402, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"    │ │   │   └─HashAgg_307","13.41","root","","group by:gharchive_dev.github_events.actor_login, gharchive_dev.github_events.repo_id, funcs:count(1)->Column#401, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"    │ │   │     └─HashJoin_318","13.41","root","","anti semi join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.blacklist_users.login)]"
"    │ │   │       ├─IndexReader_350(Build)","6.00","root","","index:IndexFullScan_349"
"    │ │   │       │ └─IndexFullScan_349","6.00","cop[tikv]","table:bu, index:blacklist_users_login_uindex(login)","keep order:false, stats:pseudo"
"    │ │   │       └─IndexHashJoin_327(Probe)","16.76","root","","inner join, inner:IndexLookUp_324, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"    │ │   │         ├─HashAgg_330(Build)","1.00","root","","group by:gharchive_dev.github_repos.repo_id, funcs:firstrow(gharchive_dev.github_repos.repo_id)->gharchive_dev.github_repos.repo_id"
"    │ │   │         │ └─Selection_331","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"    │ │   │         │   └─CTEFullScan_332","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ │   │         └─IndexLookUp_324(Probe)","16.76","root","partition:push_event,pull_request_event,issues_event,pull_request_review_event",""
"    │ │   │           ├─IndexRangeScan_321(Build)","46.76","cop[tikv]","table:ge, index:index_ge_on_repo_id_created_at(repo_id, created_at)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:42) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:42)], keep order:false"
"    │ │   │           └─Selection_323(Probe)","16.76","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%bot%"", 92)), or(or(and(eq(gharchive_dev.github_events.type, ""PullRequestEvent""), eq(gharchive_dev.github_events.action, ""opened"")), and(eq(gharchive_dev.github_events.type, ""IssuesEvent""), eq(gharchive_dev.github_events.action, ""opened""))), or(and(eq(gharchive_dev.github_events.type, ""PullRequestReviewEvent""), eq(gharchive_dev.github_events.action, ""created"")), and(eq(gharchive_dev.github_events.type, ""PushEvent""), eq(gharchive_dev.github_events.action, """"))))"
"    │ │   │             └─TableRowIDScan_322","46.76","cop[tikv]","table:ge","keep order:false"
"    │ │   └─CTEFullScan_304(Probe)","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │ └─HashAgg_413(Probe)","1340.66","root","","group by:gharchive_dev.github_events.repo_id, funcs:count(1)->Column#466, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"    │   └─IndexHashJoin_422","1340.66","root","","inner join, inner:IndexReader_419, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"    │     ├─Selection_425(Build)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"    │     │ └─CTEFullScan_426","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"    │     └─IndexReader_419(Probe)","1340.66","root","partition:pull_request_event","index:Selection_418"
"    │       └─Selection_418","1340.66","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92))"
"    │         └─IndexRangeScan_417","1340.66","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) eq(gharchive_dev.github_events.type, PullRequestEvent) eq(gharchive_dev.github_events.action, opened) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:42) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:42)], keep order:false"
"    └─HashAgg_442(Probe)","1340.66","root","","group by:gharchive_dev.github_events.repo_id, funcs:count(1)->Column#510, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"      └─IndexHashJoin_452","1340.66","root","","inner join, inner:IndexLookUp_449, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"        ├─Selection_455(Build)","80.00","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"        │ └─CTEFullScan_456","100.00","root","CTE:toprepos AS tr","data:CTE_2"
"        └─IndexLookUp_449(Probe)","1340.66","root","partition:push_event",""
"          ├─IndexRangeScan_446(Build)","2736.00","cop[tikv]","table:ge, index:index_ge_on_repo_id_created_at(repo_id, created_at)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:42) le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:42)], keep order:false"
"          └─Selection_448(Probe)","1340.66","cop[tikv]","","eq(gharchive_dev.github_events.type, ""PushEvent""), not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92))"
"            └─TableRowIDScan_447","2736.00","cop[tikv]","table:ge","keep order:false"
"CTE_2","100.00","root","","Non-Recursive CTE"
"└─Projection_130(Seed Part)","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.description, Column#141, ifnull(Column#185, 0)->Column#200, Column#193"
"  └─Projection_131","100.00","root","","cast(plus(plus(Column#144, ifnull(Column#188, 0)), mul(div(1, cast(plus(1, timestampdiff(YEAR, gharchive_dev.github_repos.created_at, 2023-09-03 14:35:42)), decimal(20,0) BINARY)), 200)), decimal(65,4) BINARY)->Column#193, gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, Column#141, Column#185"
"    └─Projection_281","100.00","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.created_at, Column#141, Column#144, Column#185, Column#188"
"      └─TopN_134","100.00","root","","Column#541:desc, offset:0, count:100"
"        └─Projection_282","19583.40","root","","gharchive_dev.github_repos.repo_id, gharchive_dev.github_repos.repo_name, gharchive_dev.github_repos.description, gharchive_dev.github_repos.primary_language, gharchive_dev.github_repos.created_at, Column#141, Column#144, Column#185, Column#188, cast(plus(plus(Column#144, ifnull(Column#188, 0)), mul(div(1, cast(plus(1, timestampdiff(YEAR, gharchive_dev.github_repos.created_at, 2023-09-03 14:35:42)), decimal(20,0) BINARY)), 200)), decimal(65,4) BINARY)->Column#541"
"          └─HashJoin_137","19583.40","root","","CARTESIAN anti semi join, other cond:eq(gharchive_dev.github_repos.repo_name, gharchive_dev.blacklist_repos.name)"
"            ├─TableReader_277(Build)","6.00","root","","data:TableFullScan_276"
"            │ └─TableFullScan_276","6.00","cop[tikv]","table:br","keep order:false"
"            └─HashJoin_146(Probe)","24479.25","root","","left outer join, equal:[eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)]"
"              ├─IndexJoin_171(Build)","24479.25","root","","inner join, inner:Selection_166, outer key:gharchive_dev.github_events.repo_id, inner key:gharchive_dev.github_repos.repo_id, equal cond:eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id), other cond:or(lt(gharchive_dev.github_repos.stars, 50000), gt(div(cast(Column#141, decimal(20,0) BINARY), cast(gharchive_dev.github_repos.stars, decimal(10,0) BINARY)), 0.01))"
"              │ ├─TableReader_216(Build)","450920.94","root","partition:watch_event","MppVersion: 1, data:ExchangeSender_215"
"              │ │ └─ExchangeSender_215","450920.94","mpp[tiflash]","","ExchangeType: PassThrough"
"              │ │   └─Selection_179","450920.94","mpp[tiflash]","","gt(cast(Column#142, decimal(20,0) BINARY), mul(0.9, cast(Column#141, decimal(20,0) BINARY)))"
"              │ │     └─Projection_211","563651.17","mpp[tiflash]","","Column#141, Column#142, Column#144, gharchive_dev.github_events.repo_id"
"              │ │       └─HashAgg_212","563651.17","mpp[tiflash]","","group by:gharchive_dev.github_events.repo_id, funcs:sum(Column#523)->Column#141, funcs:count(distinct gharchive_dev.github_events.actor_id)->Column#142, funcs:sum(Column#524)->Column#144, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"              │ │         └─ExchangeReceiver_214","563651.17","mpp[tiflash]","",""
"              │ │           └─ExchangeSender_213","563651.17","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.repo_id, collate: binary]"
"              │ │             └─HashAgg_209","563651.17","mpp[tiflash]","","group by:Column#536, Column#537, funcs:count(1)->Column#523, funcs:sum(Column#535)->Column#524"
"              │ │               └─Projection_279","9445823.64","mpp[tiflash]","","plus(mul(div(cast(timestampdiff(SECOND, 2023-08-03 14:35:42, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 2678400), 3), 2)->Column#535, gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_id"
"              │ │                 └─Selection_198","9445823.64","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""WatchEvent""), ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:42), le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:42)"
"              │ │                   └─TableFullScan_197","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
"              │ └─Selection_166(Probe)","27.97","root","","not(like(lower(gharchive_dev.github_repos.repo_name), ""%fuck%"", 92))"
"              │   └─TableReader_165","27.97","root","","data:Selection_164"
"              │     └─Selection_164","27.97","cop[tikv]","","eq(gharchive_dev.github_repos.is_deleted, 0), eq(gharchive_dev.github_repos.primary_language, ""Go""), gt(gharchive_dev.github_repos.forks, 5), gt(gharchive_dev.github_repos.pushed_at, 2023-06-03 14:35:42), gt(gharchive_dev.github_repos.stars, 5), lt(gharchive_dev.github_repos.created_at, 2023-09-02 14:35:42)"
"              │       └─TableRangeScan_163","450920.94","cop[tikv]","table:r","range: decided by [gharchive_dev.github_events.repo_id], keep order:false"
"              └─TableReader_275(Probe)","174312.20","root","partition:fork_event","MppVersion: 1, data:ExchangeSender_274"
"                └─ExchangeSender_274","174312.20","mpp[tiflash]","","ExchangeType: PassThrough"
"                  └─Selection_238","174312.20","mpp[tiflash]","","gt(cast(Column#186, decimal(20,0) BINARY), mul(0.9, cast(Column#185, decimal(20,0) BINARY)))"
"                    └─Projection_270","217890.25","mpp[tiflash]","","Column#185, Column#186, Column#188, gharchive_dev.github_events.repo_id"
"                      └─HashAgg_271","217890.25","mpp[tiflash]","","group by:gharchive_dev.github_events.repo_id, funcs:sum(Column#532)->Column#185, funcs:count(distinct gharchive_dev.github_events.actor_id)->Column#186, funcs:sum(Column#533)->Column#188, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"                        └─ExchangeReceiver_273","217890.25","mpp[tiflash]","",""
"                          └─ExchangeSender_272","217890.25","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.repo_id, collate: binary]"
"                            └─HashAgg_268","217890.25","mpp[tiflash]","","group by:Column#539, Column#540, funcs:count(1)->Column#532, funcs:sum(Column#538)->Column#533"
"                              └─Projection_280","3651465.64","mpp[tiflash]","","plus(mul(div(cast(timestampdiff(SECOND, 2023-08-03 14:35:42, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 2678400), 3), 1)->Column#538, gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_id"
"                                └─Selection_257","3651465.64","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""ForkEvent""), ge(gharchive_dev.github_events.created_at, 2023-08-03 14:35:42), le(gharchive_dev.github_events.created_at, 2023-09-03 14:35:42)"
"                                  └─TableFullScan_256","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
