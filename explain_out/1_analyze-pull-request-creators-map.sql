"id","estRows","task","access object","operator info"
"Sort_87","236.86","root","","Column#68:desc"
"└─Projection_89","236.86","root","","Column#67, Column#68, div(cast(Column#68, decimal(20,0) BINARY), Column#72)->Column#73"
"  └─HashJoin_90","236.86","root","","CARTESIAN inner join"
"    ├─HashAgg_93(Build)","1.00","root","","funcs:sum(Column#100)->Column#72"
"    │ └─Projection_99","236.86","root","","cast(Column#71, decimal(20,0) BINARY)->Column#100"
"    │   └─CTEFullScan_95","236.86","root","CTE:group_by_area","data:CTE_0"
"    └─CTEFullScan_92(Probe)","236.86","root","CTE:group_by_area","data:CTE_0"
"CTE_0","236.86","root","","Non-Recursive CTE"
"└─Projection_19(Seed Part)","236.86","root","","upper(gharchive_dev.github_users.country_code)->Column#63, Column#62"
"  └─HashAgg_21","236.86","root","","group by:Column#99, funcs:count(distinct Column#97)->Column#62, funcs:firstrow(Column#98)->gharchive_dev.github_users.country_code"
"    └─Projection_85","29867.53","root","","gharchive_dev.github_events.actor_login, gharchive_dev.github_users.country_code, upper(gharchive_dev.github_users.country_code)->Column#99"
"      └─Selection_24","29867.53","root","","not(in(gharchive_dev.github_users.country_code, """", ""N/A"", ""UND""))"
"        └─IndexJoin_30","37334.42","root","","left outer join, inner:IndexReader_29, outer key:gharchive_dev.github_events.actor_login, inner key:gharchive_dev.github_users.login, equal cond:eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_users.login)"
"          ├─IndexReader_55(Build)","46668.02","root","partition:pull_request_event","index:IndexRangeScan_54"
"          │ └─IndexRangeScan_54","46668.02","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"" ""opened"",41986369 ""PullRequestEvent"" ""opened""], keep order:false"
"          └─IndexReader_29(Probe)","46668.02","root","","index:IndexRangeScan_28"
"            └─IndexRangeScan_28","46668.02","cop[tikv]","table:gu, index:index_gu_on_login_is_bot_organization_country_code(login, is_bot, organization_formatted, country_code)","range: decided by [eq(gharchive_dev.github_users.login, gharchive_dev.github_events.actor_login)], keep order:false"
