"id","estRows","task","access object","operator info"
"StreamAgg_126","17648.35","root","","group by:Column#174, funcs:firstrow(Column#174)->Column#174, funcs:firstrow(Column#176)->Column#176"
"└─Window_120","17648.35","root","","sum(cast(Column#173, decimal(20,0) BINARY))->Column#176 over(order by Column#174 range between unbounded preceding and current row)"
"  └─Sort_111","17648.35","root","","Column#174"
"    └─Projection_70","17648.35","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#174, Column#173"
"      └─HashAgg_74","17648.35","root","","group by:Column#199, funcs:count(1)->Column#173, funcs:firstrow(Column#198)->gharchive_dev.github_events.created_at"
"        └─Projection_127","302266.36","root","","gharchive_dev.github_events.created_at, date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#199"
"          └─Selection_77","302266.36","root","","eq(Column#170, 1)"
"            └─Shuffle_97","377832.95","root","","execution info: concurrency:5, data sources:[IndexReader_95]"
"              └─Window_80","377832.95","root","","row_number()->Column#170 over(partition by gharchive_dev.github_events.actor_login rows between current row and current row)"
"                └─Sort_96","472291.18","root","","gharchive_dev.github_events.actor_login"
"                  └─IndexReader_95","472291.18","root","partition:watch_event","index:IndexRangeScan_94"
"                    └─IndexRangeScan_94","472291.18","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""WatchEvent"",41986369 ""WatchEvent""], keep order:false"
