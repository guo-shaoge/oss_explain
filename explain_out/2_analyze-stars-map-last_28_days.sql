"id","estRows","task","access object","operator info"
"Sort_98","236.86","root","","Column#67:desc"
"└─Projection_100","236.86","root","","gharchive_dev.github_users.country_code, Column#67, div(cast(Column#67, decimal(20,0) BINARY), Column#71)->Column#72"
"  └─HashJoin_101","236.86","root","","CARTESIAN inner join"
"    ├─HashAgg_104(Build)","1.00","root","","funcs:sum(Column#94)->Column#71"
"    │ └─Projection_110","236.86","root","","cast(Column#70, decimal(20,0) BINARY)->Column#94"
"    │   └─CTEFullScan_106","236.86","root","CTE:group_by_area","data:CTE_0"
"    └─CTEFullScan_103(Probe)","236.86","root","CTE:group_by_area","data:CTE_0"
"CTE_0","236.86","root","","Non-Recursive CTE"
"└─Projection_19(Seed Part)","236.86","root","","gharchive_dev.github_users.country_code, Column#62"
"  └─HashAgg_23","236.86","root","","group by:gharchive_dev.github_users.country_code, funcs:count(1)->Column#62, funcs:firstrow(gharchive_dev.github_users.country_code)->gharchive_dev.github_users.country_code"
"    └─Selection_27","59957.35","root","","not(in(gharchive_dev.github_users.country_code, """", ""N/A"", ""UND""))"
"      └─IndexJoin_33","74946.68","root","","left outer join, inner:IndexReader_32, outer key:gharchive_dev.github_events.actor_login, inner key:gharchive_dev.github_users.login, equal cond:eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_users.login)"
"        ├─IndexReader_58(Build)","93683.35","root","partition:watch_event","index:IndexRangeScan_57"
"        │ └─IndexRangeScan_57","93683.35","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""WatchEvent"" ""started"" 2023-08-06 00:00:00,41986369 ""WatchEvent"" ""started"" +inf], keep order:false"
"        └─IndexReader_32(Probe)","93683.35","root","","index:IndexRangeScan_31"
"          └─IndexRangeScan_31","93683.35","cop[tikv]","table:gu, index:index_gu_on_login_is_bot_organization_country_code(login, is_bot, organization_formatted, country_code)","range: decided by [eq(gharchive_dev.github_users.login, gharchive_dev.github_events.actor_login)], keep order:false"
