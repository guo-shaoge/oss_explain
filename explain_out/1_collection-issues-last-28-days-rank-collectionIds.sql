"id","estRows","task","access object","operator info"
"Sort_167","0.37","root","","Column#160"
"└─Projection_169","0.37","root","","gharchive_dev.collection_items.repo_id, gharchive_dev.collection_items.repo_name, ifnull(Column#148, 0)->Column#159, ifnull(Column#150, 0)->Column#160, ifnull(Column#156, 0)->Column#161, ifnull(Column#158, 0)->Column#162, ifnull(mul(div(cast(minus(Column#148, Column#156), decimal(20,0) BINARY), cast(Column#156, decimal(20,0) BINARY)), 100), 0)->Column#163, ifnull(minus(Column#150, Column#158), 0)->Column#164, Column#136"
"  └─HashJoin_171","0.37","root","","left outer join, equal:[eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_events.repo_id)]"
"    ├─Projection_172(Build)","0.37","root","","Column#136, gharchive_dev.github_events.repo_id, gharchive_dev.collection_items.repo_name, gharchive_dev.collection_items.repo_id, Column#148, Column#150"
"    │ └─HashJoin_174","0.37","root","","inner join, equal:[eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_events.repo_id)]"
"    │   ├─HashJoin_189(Build)","0.37","root","","inner join, equal:[eq(gharchive_dev.collection_items.repo_id, gharchive_dev.github_events.repo_id)]"
"    │   │ ├─IndexLookUp_330(Build)","0.37","root","",""
"    │   │ │ ├─IndexRangeScan_328(Build)","0.37","cop[tikv]","table:ci, index:index_collection_items_on_collection_id(collection_id)","range:[10001,10001], keep order:false"
"    │   │ │ └─TableRowIDScan_329(Probe)","0.37","cop[tikv]","table:ci","keep order:false"
"    │   │ └─HashAgg_246(Probe)","16.76","root","","group by:gharchive_dev.github_events.repo_id, funcs:count(distinct gharchive_dev.github_events.number)->Column#136, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id"
"    │   │   └─IndexHashJoin_260","16.76","root","","inner join, inner:IndexReader_257, outer key:gharchive_dev.collection_items.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.collection_items.repo_id, gharchive_dev.github_events.repo_id)"
"    │   │     ├─StreamAgg_272(Build)","1.00","root","","group by:gharchive_dev.collection_items.repo_id, funcs:firstrow(gharchive_dev.collection_items.repo_id)->gharchive_dev.collection_items.repo_id"
"    │   │     │ └─IndexReader_244","0.46","root","","index:IndexRangeScan_243"
"    │   │     │   └─IndexRangeScan_243","0.46","cop[tikv]","table:ci, index:index_ci_on_collection_id_repo_id(collection_id, repo_id)","range:[10001,10001], keep order:true"
"    │   │     └─IndexReader_257(Probe)","16.76","root","partition:issues_event","index:IndexRangeScan_256"
"    │   │       └─IndexRangeScan_256","16.76","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.collection_items.repo_id) eq(gharchive_dev.github_events.type, IssuesEvent)], keep order:false"
"    │   └─Selection_334(Probe)","8.58","root","","not(isnull(gharchive_dev.github_events.repo_id))"
"    │     └─Window_335","10.73","root","","row_number()->Column#150 over(order by Column#148 desc rows between current row and current row)"
"    │       └─Sort_339","10.73","root","","Column#148:desc"
"    │         └─Selection_337","10.73","root","","eq(Column#146, 0)"
"    │           └─CTEFullScan_338","13.41","root","CTE:issues_group_by_period AS sgp","data:CTE_1"
"    └─Selection_340(Probe)","8.58","root","","not(isnull(gharchive_dev.github_events.repo_id))"
"      └─Window_341","10.73","root","","row_number()->Column#158 over(order by Column#156 desc rows between current row and current row)"
"        └─Sort_345","10.73","root","","Column#156:desc"
"          └─Selection_343","10.73","root","","eq(Column#154, 1)"
"            └─CTEFullScan_344","13.41","root","CTE:issues_group_by_period AS sgp","data:CTE_1"
"CTE_1","13.41","root","","Non-Recursive CTE"
"└─Projection_71(Seed Part)","13.41","root","","intdiv(datediff(2023-09-03, date(gharchive_dev.github_events.created_at)), 28)->Column#83, gharchive_dev.github_events.repo_id, Column#82"
"  └─Selection_72","13.41","root","","or(eq(intdiv(datediff(2023-09-03, date(gharchive_dev.github_events.created_at)), 28), 0), eq(intdiv(datediff(2023-09-03, date(gharchive_dev.github_events.created_at)), 28), 1))"
"    └─HashAgg_73","16.76","root","","group by:Column#200, Column#201, funcs:count(distinct Column#197)->Column#82, funcs:firstrow(Column#198)->gharchive_dev.github_events.created_at, funcs:firstrow(Column#199)->gharchive_dev.github_events.repo_id"
"      └─Projection_163","16.76","root","","gharchive_dev.github_events.number, gharchive_dev.github_events.created_at, gharchive_dev.github_events.repo_id, intdiv(datediff(2023-09-03, date(gharchive_dev.github_events.created_at)), 28)->Column#200, gharchive_dev.github_events.repo_id"
"        └─IndexHashJoin_82","16.76","root","","inner join, inner:IndexReader_79, outer key:gharchive_dev.collection_items.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.collection_items.repo_id, gharchive_dev.github_events.repo_id)"
"          ├─StreamAgg_121(Build)","1.00","root","","group by:gharchive_dev.collection_items.repo_id, funcs:firstrow(gharchive_dev.collection_items.repo_id)->gharchive_dev.collection_items.repo_id"
"          │ └─IndexReader_112","0.46","root","","index:IndexRangeScan_111"
"          │   └─IndexRangeScan_111","0.46","cop[tikv]","table:ci, index:index_ci_on_collection_id_repo_id(collection_id, repo_id)","range:[10001,10001], keep order:true"
"          └─IndexReader_79(Probe)","16.76","root","partition:issues_event","index:IndexRangeScan_78"
"            └─IndexRangeScan_78","16.76","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.collection_items.repo_id) eq(gharchive_dev.github_events.type, IssuesEvent) eq(gharchive_dev.github_events.action, opened) gt(gharchive_dev.github_events.created_at, 2023-07-09)], keep order:false"
