"id","estRows","task","access object","operator info"
"Sort_100","158.73","root","","Column#62:desc"
"└─Projection_102","158.73","root","","gharchive_dev.github_repos.primary_language, Column#62, div(cast(Column#62, decimal(20,0) BINARY), Column#66)->Column#67"
"  └─HashJoin_103","158.73","root","","CARTESIAN inner join"
"    ├─HashAgg_106(Build)","1.00","root","","funcs:sum(Column#93)->Column#66"
"    │ └─Projection_112","158.73","root","","cast(Column#65, decimal(20,0) BINARY)->Column#93"
"    │   └─CTEFullScan_108","158.73","root","CTE:prs_with_language","data:CTE_0"
"    └─CTEFullScan_105(Probe)","158.73","root","CTE:prs_with_language","data:CTE_0"
"CTE_0","158.73","root","","Non-Recursive CTE"
"└─Projection_20(Seed Part)","158.73","root","","gharchive_dev.github_repos.primary_language, Column#57"
"  └─HashAgg_24","158.73","root","","group by:gharchive_dev.github_repos.primary_language, funcs:count(1)->Column#57, funcs:firstrow(gharchive_dev.github_repos.primary_language)->gharchive_dev.github_repos.primary_language"
"    └─IndexJoin_37","158.73","root","","inner join, inner:TableReader_33, outer key:gharchive_dev.github_events.repo_id, inner key:gharchive_dev.github_repos.repo_id, equal cond:eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id)"
"      ├─IndexReader_66(Build)","158.73","root","partition:pull_request_event","index:IndexRangeScan_65"
"      │ └─IndexRangeScan_65","158.73","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""PullRequestEvent"" ""opened"" 2022-01-01 00:00:00,5086433 ""PullRequestEvent"" ""opened"" 2022-12-31 00:00:00], keep order:false"
"      └─TableReader_33(Probe)","142.18","root","","data:Selection_32"
"        └─Selection_32","142.18","cop[tikv]","","ne(gharchive_dev.github_repos.primary_language, """"), not(isnull(gharchive_dev.github_repos.primary_language))"
"          └─TableRangeScan_31","158.73","cop[tikv]","table:gr","range: decided by [gharchive_dev.github_events.repo_id], keep order:false"
