"id","estRows","task","access object","operator info"
"Sort_135","2.00","root","","Column#87"
"└─Projection_137","2.00","root","","Column#87, ifnull(Column#89, 0)->Column#92, ifnull(Column#91, 0)->Column#93"
"  └─HashJoin_138","2.00","root","","left outer join, equal:[eq(Column#87, Column#90)]"
"    ├─Selection_151(Build)","0.64","root","","not(isnull(Column#90))"
"    │ └─CTEFullScan_152","0.80","root","CTE:user_merged_prs AS mpr","data:CTE_0"
"    └─HashJoin_140(Probe)","2.00","root","","left outer join, equal:[eq(Column#87, Column#88)]"
"      ├─Selection_149(Build)","0.64","root","","not(isnull(Column#88))"
"      │ └─CTEFullScan_150","0.80","root","CTE:user_open_prs AS opr","data:CTE_1"
"      └─HashAgg_143(Probe)","2.00","root","","group by:Column#87, funcs:firstrow(Column#87)->Column#87"
"        └─Union_144","1.60","root","",""
"          ├─Projection_145","0.80","root","","Column#83"
"          │ └─CTEFullScan_146","0.80","root","CTE:user_open_prs","data:CTE_1"
"          └─Projection_147","0.80","root","","Column#85"
"            └─CTEFullScan_148","0.80","root","CTE:user_merged_prs","data:CTE_0"
"CTE_0","0.80","root","","Non-Recursive CTE"
"└─Sort_93(Seed Part)","0.80","root","","Column#36"
"  └─Projection_95","0.80","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#36, Column#35"
"    └─Selection_97","0.80","root","","or(1, not(isnull(date_format(gharchive_dev.github_events.created_at, ""%Y-%m-01""))))"
"      └─HashAgg_106","1.00","root","","group by:Column#116, funcs:count(Column#117)->Column#35, funcs:firstrow(Column#118)->gharchive_dev.github_events.created_at"
"        └─IndexReader_107","1.00","root","partition:pull_request_event","index:HashAgg_99"
"          └─HashAgg_99","1.00","cop[tikv]","","group by:date_format(gharchive_dev.github_events.created_at, ""%Y-%m-01""), funcs:count(1)->Column#117, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#118"
"            └─IndexRangeScan_105","6.35","cop[tikv]","table:ge, index:index_ge_on_creator_id_type_action_merged_created_at_add_del(creator_user_id, type, action, pr_merged, created_at, additions, deletions)","range:[5086433 ""PullRequestEvent"" ""closed"" 1,5086433 ""PullRequestEvent"" ""closed"" 1], keep order:false"
"CTE_1","0.80","root","","Non-Recursive CTE"
"└─Sort_47(Seed Part)","0.80","root","","Column#74"
"  └─Projection_49","0.80","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#74, Column#73"
"    └─Selection_51","0.80","root","","or(1, not(isnull(date_format(gharchive_dev.github_events.created_at, ""%Y-%m-01""))))"
"      └─HashAgg_60","1.00","root","","group by:Column#99, funcs:count(Column#100)->Column#73, funcs:firstrow(Column#101)->gharchive_dev.github_events.created_at"
"        └─IndexReader_61","1.00","root","partition:pull_request_event","index:HashAgg_53"
"          └─HashAgg_53","1.00","cop[tikv]","","group by:date_format(gharchive_dev.github_events.created_at, ""%Y-%m-01""), funcs:count(1)->Column#100, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#101"
"            └─IndexRangeScan_59","6.35","cop[tikv]","table:ge, index:index_ge_on_creator_id_type_action_merged_created_at_add_del(creator_user_id, type, action, pr_merged, created_at, additions, deletions)","range:[5086433 ""PullRequestEvent"" ""opened"" 0,5086433 ""PullRequestEvent"" ""opened"" 0], keep order:false"
