"id","estRows","task","access object","operator info"
"Projection_94","50.00","root","","Column#214, gharchive_dev.github_events.actor_login, Column#108, Column#184, Column#185, Column#212, Column#213"
"└─Limit_101","50.00","root","","offset:0, count:50"
"  └─Window_154","50.00","root","","row_number()->Column#214 over(order by Column#108 desc rows between current row and current row)"
"    └─Sort_153","5730.59","root","","Column#108:desc"
"      └─Projection_104","5730.59","root","","gharchive_dev.github_events.actor_login, Column#108, coalesce(Column#145, 0)->Column#184, coalesce(minus(Column#108, Column#145), 0)->Column#185, div(cast(Column#108, decimal(20,0) BINARY), 452)->Column#212, case(isnull(gharchive_dev.github_events.actor_login), 1, 0)->Column#213"
"        └─HashJoin_106","5730.59","root","","left outer join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_events.actor_login)]"
"          ├─HashJoin_107(Build)","5730.59","root","","left outer join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_events.actor_login)]"
"          │ ├─Sort_110(Build)","1.00","root","","Column#145:desc"
"          │ │ └─HashAgg_112","1.00","root","","group by:gharchive_dev.github_events.actor_login, funcs:count(1)->Column#145, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"          │ │   └─TableDual_113","0.00","root","","rows:0"
"          │ └─CTEFullScan_109(Probe)","5730.59","root","CTE:code_contribution_last_month AS lm","data:CTE_1"
"          └─HashAgg_125(Probe)","76178.70","root","","group by:gharchive_dev.github_events.actor_login, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"            └─IndexReader_126","76178.70","root","partition:push_event","index:HashAgg_115"
"              └─HashAgg_115","76178.70","cop[tikv]","","group by:gharchive_dev.github_events.actor_login, "
"                └─IndexRangeScan_124","9293745.23","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PushEvent"" """" -inf,41986369 ""PushEvent"" """" 2023-08-01 00:00:00), keep order:false"
"CTE_1","5730.59","root","","Non-Recursive CTE"
"└─Projection_39(Seed Part)","5730.59","root","","gharchive_dev.github_events.actor_login, Column#69"
"  └─Sort_41","5730.59","root","","Column#69:desc"
"    └─HashAgg_53","5730.59","root","","group by:gharchive_dev.github_events.actor_login, funcs:count(Column#197)->Column#69, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"      └─IndexReader_54","5730.59","root","partition:push_event","index:HashAgg_43"
"        └─HashAgg_43","5730.59","cop[tikv]","","group by:gharchive_dev.github_events.actor_login, funcs:count(1)->Column#197"
"          └─IndexRangeScan_52","699128.28","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PushEvent"" """" 2023-08-01 00:00:00,41986369 ""PushEvent"" """" 2023-09-01 00:00:00), keep order:false"
