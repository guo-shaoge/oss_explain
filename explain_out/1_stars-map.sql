"id","estRows","task","access object","operator info"
"Sort_90","20.22","root","","Column#68:desc"
"└─Projection_92","20.22","root","","Column#67, Column#68, div(cast(Column#68, decimal(20,0) BINARY), Column#72)->Column#73"
"  └─HashJoin_93","20.22","root","","CARTESIAN inner join"
"    ├─StreamAgg_97(Build)","1.00","root","","funcs:sum(Column#102)->Column#72"
"    │ └─Projection_102","20.22","root","","cast(Column#71, decimal(20,0) BINARY)->Column#102"
"    │   └─CTEFullScan_99","20.22","root","CTE:group_by_area","data:CTE_0"
"    └─CTEFullScan_95(Probe)","20.22","root","CTE:group_by_area","data:CTE_0"
"CTE_0","20.22","root","","Non-Recursive CTE"
"└─Projection_20(Seed Part)","20.22","root","","upper(gharchive_dev.github_users.country_code)->Column#63, Column#62"
"  └─HashAgg_24","20.22","root","","group by:Column#101, funcs:count(1)->Column#62, funcs:firstrow(Column#100)->gharchive_dev.github_users.country_code"
"    └─Projection_88","377832.94","root","","gharchive_dev.github_users.country_code, upper(gharchive_dev.github_users.country_code)->Column#101"
"      └─IndexJoin_32","377832.94","root","","inner join, inner:IndexReader_31, outer key:gharchive_dev.github_events.actor_login, inner key:gharchive_dev.github_users.login, equal cond:eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_users.login)"
"        ├─IndexReader_64(Build)","472291.18","root","partition:watch_event","index:IndexRangeScan_63"
"        │ └─IndexRangeScan_63","472291.18","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""WatchEvent"",41986369 ""WatchEvent""], keep order:false"
"        └─IndexReader_31(Probe)","472291.18","root","","index:Selection_30"
"          └─Selection_30","472291.18","cop[tikv]","","ne(gharchive_dev.github_users.country_code, """"), ne(gharchive_dev.github_users.country_code, ""N/A""), ne(gharchive_dev.github_users.country_code, ""UND""), not(isnull(gharchive_dev.github_users.country_code))"
"            └─IndexRangeScan_29","6916748.64","cop[tikv]","table:gu, index:index_gu_on_login_is_bot_organization_country_code(login, is_bot, organization_formatted, country_code)","range: decided by [eq(gharchive_dev.github_users.login, gharchive_dev.github_events.actor_login)], keep order:false"
