"id","estRows","task","access object","operator info"
"Sort_9","9267876.40","root","","Column#37"
"└─Projection_11","9267876.40","root","","Column#35, Column#36, unix_timestamp(Column#36)->Column#37"
"  └─HashAgg_13","9267876.40","root","","group by:Column#52, funcs:count(1)->Column#35, funcs:max(Column#51)->Column#36"
"    └─Projection_45","158732549.80","root","","gharchive_dev.github_events.created_at, minus(minus(unix_timestamp(gharchive_dev.github_events.created_at), 1693751730), mod(minus(unix_timestamp(gharchive_dev.github_events.created_at), 1693751790), 5))->Column#52"
"      └─IndexReader_20","158732549.80","root","partition:all","index:IndexRangeScan_19"
"        └─IndexRangeScan_19","158732549.80","cop[tikv]","table:github_events, index:index_github_events_on_created_at(created_at)","range:[2023-09-03 14:35:30,2023-09-03 14:36:30], keep order:false"
