"id","estRows","task","access object","operator info"
"Sort_9","32655.86","root","","Column#36, Column#37"
"└─Projection_11","32655.86","root","","minus(dayofweek(gharchive_dev.github_events.created_at), 1)->Column#36, hour(cast(gharchive_dev.github_events.created_at, time))->Column#37, Column#35"
"  └─HashAgg_20","32655.86","root","","group by:Column#50, Column#51, funcs:count(Column#52)->Column#35, funcs:firstrow(Column#53)->gharchive_dev.github_events.created_at"
"    └─IndexReader_21","32655.86","root","partition:push_event","index:HashAgg_13"
"      └─HashAgg_13","32655.86","cop[tikv]","","group by:hour(cast(gharchive_dev.github_events.created_at, time)), minus(dayofweek(gharchive_dev.github_events.created_at), 1), funcs:count(1)->Column#52, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#53"
"        └─IndexRangeScan_19","699128.28","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PushEvent"" """" 2022-09-03 00:00:00,41986369 ""PushEvent"" """" 2023-09-03 00:00:00], keep order:false"
