"id","estRows","task","access object","operator info"
"Sort_100","517.60","root","","Column#62:desc"
"└─Projection_102","517.60","root","","gharchive_dev.github_repos.primary_language, Column#62, div(cast(Column#62, decimal(20,0) BINARY), Column#66)->Column#67"
"  └─HashJoin_103","517.60","root","","CARTESIAN inner join"
"    ├─HashAgg_106(Build)","1.00","root","","funcs:sum(Column#96)->Column#66"
"    │ └─Projection_112","517.60","root","","cast(Column#65, decimal(20,0) BINARY)->Column#96"
"    │   └─CTEFullScan_108","517.60","root","CTE:prs_with_language","data:CTE_0"
"    └─CTEFullScan_105(Probe)","517.60","root","CTE:prs_with_language","data:CTE_0"
"CTE_0","517.60","root","","Non-Recursive CTE"
"└─Projection_20(Seed Part)","517.60","root","","gharchive_dev.github_repos.primary_language, Column#57"
"  └─HashAgg_24","517.60","root","","group by:gharchive_dev.github_repos.primary_language, funcs:count(1)->Column#57, funcs:firstrow(gharchive_dev.github_repos.primary_language)->gharchive_dev.github_repos.primary_language"
"    └─IndexJoin_37","634.93","root","","inner join, inner:TableReader_33, outer key:gharchive_dev.github_events.repo_id, inner key:gharchive_dev.github_repos.repo_id, equal cond:eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id)"
"      ├─IndexReader_66(Build)","634.93","root","partition:pull_request_event","index:IndexRangeScan_65"
"      │ └─IndexRangeScan_65","634.93","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""PullRequestEvent"" ""opened"",5086433 ""PullRequestEvent"" ""opened""], keep order:false"
"      └─TableReader_33(Probe)","568.85","root","","data:Selection_32"
"        └─Selection_32","568.85","cop[tikv]","","ne(gharchive_dev.github_repos.primary_language, """"), not(isnull(gharchive_dev.github_repos.primary_language))"
"          └─TableRangeScan_31","634.93","cop[tikv]","table:gr","range: decided by [gharchive_dev.github_events.repo_id], keep order:false"
