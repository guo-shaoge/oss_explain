"id","estRows","task","access object","operator info"
"Projection_84","25.17","root","","gharchive_dev.github_events.actor_id, Column#74, Column#159, Column#75, Column#119, Column#120, Column#158"
"└─Limit_91","25.17","root","","offset:0, count:50"
"  └─Window_152","25.17","root","","row_number()->Column#159 over(order by Column#75 desc rows between current row and current row)"
"    └─Sort_151","25.17","root","","Column#75:desc"
"      └─Projection_94","25.17","root","","gharchive_dev.github_events.actor_id, Column#74, Column#75, coalesce(Column#113, 0)->Column#119, coalesce(minus(Column#75, Column#113), 0)->Column#120, div(cast(Column#75, decimal(20,0) BINARY), 787)->Column#158"
"        └─HashJoin_95","25.17","root","","left outer join, equal:[eq(gharchive_dev.github_events.actor_id, gharchive_dev.github_events.actor_id)]"
"          ├─HashAgg_115(Build)","25.17","root","","group by:gharchive_dev.github_events.actor_id, funcs:count(Column#174)->Column#113, funcs:firstrow(gharchive_dev.github_events.actor_id)->gharchive_dev.github_events.actor_id"
"          │ └─IndexLookUp_116","25.17","root","partition:pull_request_review_comment_event",""
"          │   ├─IndexRangeScan_113(Build)","3366.63","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-07-01 00:00:00,41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-08-01 00:00:00), keep order:false"
"          │   └─HashAgg_99(Probe)","25.17","cop[tikv]","","group by:gharchive_dev.github_events.actor_id, funcs:count(1)->Column#174"
"          │     └─TableRowIDScan_114","3366.63","cop[tikv]","table:ge","keep order:false"
"          └─CTEFullScan_97(Probe)","25.17","root","CTE:review_contribution_last_month AS lm","data:CTE_0"
"CTE_0","25.17","root","","Non-Recursive CTE"
"└─Projection_23(Seed Part)","25.17","root","","gharchive_dev.github_events.actor_id, any_value(gharchive_dev.github_events.actor_login)->Column#36, Column#35"
"  └─HashAgg_39","25.17","root","","group by:gharchive_dev.github_events.actor_id, funcs:count(Column#138)->Column#35, funcs:firstrow(gharchive_dev.github_events.actor_id)->gharchive_dev.github_events.actor_id, funcs:firstrow(Column#140)->gharchive_dev.github_events.actor_login"
"    └─IndexLookUp_40","25.17","root","partition:pull_request_review_comment_event",""
"      ├─IndexRangeScan_37(Build)","3366.63","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-08-01 00:00:00,41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-09-01 00:00:00), keep order:false"
"      └─HashAgg_25(Probe)","25.17","cop[tikv]","","group by:gharchive_dev.github_events.actor_id, funcs:count(1)->Column#138, funcs:firstrow(gharchive_dev.github_events.actor_login)->Column#140"
"        └─TableRowIDScan_38","3366.63","cop[tikv]","table:ge","keep order:false"