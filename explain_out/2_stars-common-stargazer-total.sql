"id","estRows","task","access object","operator info"
"HashAgg_14","1.00","root","","funcs:count(gharchive_dev.github_events.actor_login)->Column#63"
"└─Selection_18","6194.02","root","","gt(Column#62, 1)"
"  └─HashAgg_20","7742.53","root","","group by:gharchive_dev.github_events.actor_login, funcs:count(distinct gharchive_dev.github_events.repo_id)->Column#62, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"    └─IndexReader_30","944582.36","root","partition:watch_event","index:IndexRangeScan_29"
"      └─IndexRangeScan_29","944582.36","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[156018 ""WatchEvent"",156018 ""WatchEvent""], [48833910 ""WatchEvent"",48833910 ""WatchEvent""], keep order:false"
