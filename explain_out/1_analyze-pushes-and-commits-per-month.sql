"id","estRows","task","access object","operator info"
"Sort_9","181653.67","root","","Column#37"
"└─Projection_11","181653.67","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#37, Column#35, Column#36"
"  └─HashAgg_20","181653.67","root","","group by:Column#48, funcs:count(Column#49)->Column#35, funcs:sum(Column#50)->Column#36, funcs:firstrow(Column#51)->gharchive_dev.github_events.created_at"
"    └─IndexReader_21","181653.67","root","partition:push_event","index:HashAgg_13"
"      └─HashAgg_13","181653.67","cop[tikv]","","group by:date_format(gharchive_dev.github_events.created_at, ""%Y-%m-01""), funcs:count(1)->Column#49, funcs:sum(coalesce(gharchive_dev.github_events.push_distinct_size, gharchive_dev.github_events.push_size, 0))->Column#50, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#51"
"        └─IndexRangeScan_19","3889017.88","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PushEvent"",41986369 ""PushEvent""], keep order:false"
