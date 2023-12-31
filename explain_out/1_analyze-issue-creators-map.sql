"id","estRows","task","access object","operator info"
"Sort_96","236.86","root","","Column#67:desc"
"└─Projection_98","236.86","root","","gharchive_dev.github_users.country_code, Column#67, div(cast(Column#67, decimal(20,0) BINARY), Column#71)->Column#72"
"  └─HashJoin_99","236.86","root","","CARTESIAN inner join"
"    ├─HashAgg_102(Build)","1.00","root","","funcs:sum(Column#92)->Column#71"
"    │ └─Projection_108","236.86","root","","cast(Column#70, decimal(20,0) BINARY)->Column#92"
"    │   └─CTEFullScan_104","236.86","root","CTE:group_by_area","data:CTE_0"
"    └─CTEFullScan_101(Probe)","236.86","root","CTE:group_by_area","data:CTE_0"
"CTE_0","236.86","root","","Non-Recursive CTE"
"└─Projection_19(Seed Part)","236.86","root","","gharchive_dev.github_users.country_code, Column#62"
"  └─HashAgg_21","236.86","root","","group by:gharchive_dev.github_users.country_code, funcs:count(distinct gharchive_dev.github_events.actor_login)->Column#62, funcs:firstrow(gharchive_dev.github_users.country_code)->gharchive_dev.github_users.country_code"
"    └─Selection_25","10556.82","root","","not(in(gharchive_dev.github_users.country_code, """", ""N/A"", ""UND""))"
"      └─IndexJoin_31","13196.03","root","","left outer join, inner:IndexReader_30, outer key:gharchive_dev.github_events.actor_login, inner key:gharchive_dev.github_users.login, equal cond:eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_users.login)"
"        ├─IndexReader_56(Build)","16495.03","root","partition:issues_event","index:IndexRangeScan_55"
"        │ └─IndexRangeScan_55","16495.03","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""IssuesEvent"" ""opened"",41986369 ""IssuesEvent"" ""opened""], keep order:false"
"        └─IndexReader_30(Probe)","16495.03","root","","index:IndexRangeScan_29"
"          └─IndexRangeScan_29","16495.03","cop[tikv]","table:gu, index:index_gu_on_login_is_bot_organization_country_code(login, is_bot, organization_formatted, country_code)","range: decided by [eq(gharchive_dev.github_users.login, gharchive_dev.github_events.actor_login)], keep order:false"
