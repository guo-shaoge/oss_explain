"id","estRows","task","access object","operator info"
"HashAgg_73","111.21","root","","group by:Column#63, Column#64, Column#65, Column#66, funcs:firstrow(Column#63)->Column#63, funcs:firstrow(Column#64)->Column#64, funcs:firstrow(Column#65)->Column#65, funcs:firstrow(Column#66)->Column#66"
"└─Union_74","111.21","root","",""
"  ├─Projection_75","55.61","root","","Column#53, Column#54, Column#57, cast(Column#58, varchar(15) CHARACTER SET utf8 COLLATE utf8_bin)->Column#66"
"  │ └─Sort_76","55.61","root","","Column#53, Column#54"
"  │   └─Projection_78","55.61","root","","Column#53, Column#54, Column#57, all->Column#58"
"  │     └─HashAgg_79","55.61","root","","group by:Column#100, Column#101, funcs:sum(Column#97)->Column#57, funcs:firstrow(Column#98)->Column#53, funcs:firstrow(Column#99)->Column#54"
"  │       └─Projection_84","55.61","root","","cast(Column#55, decimal(20,0) BINARY)->Column#97, Column#53, Column#54, Column#53, Column#54"
"  │         └─CTEFullScan_80","55.61","root","CTE:contributions_group_by_type AS cgt","data:CTE_0"
"  └─Projection_82","55.61","root","","Column#59, Column#60, cast(Column#61, decimal(42,0) BINARY)->Column#65, Column#62"
"    └─CTEFullScan_83","55.61","root","CTE:contributions_group_by_type","data:CTE_0"
"CTE_0","55.61","root","","Non-Recursive CTE"
"└─Sort_26(Seed Part)","55.61","root","","Column#36, Column#37, Column#38"
"  └─Projection_28","55.61","root","","minus(dayofweek(gharchive_dev.github_events.created_at), 1)->Column#36, hour(cast(gharchive_dev.github_events.created_at, time))->Column#37, Column#35, case(eq(gharchive_dev.github_events.type, IssuesEvent), issues, eq(gharchive_dev.github_events.type, IssueCommentEvent), issue_comments, eq(gharchive_dev.github_events.type, PullRequestEvent), pull_requests, eq(gharchive_dev.github_events.type, PullRequestReviewEvent), reviews, eq(gharchive_dev.github_events.type, PullRequestReviewCommentEvent), review_comments, eq(gharchive_dev.github_events.type, PushEvent), pushes)->Column#38"
"    └─HashAgg_38","55.61","root","","group by:Column#75, Column#76, gharchive_dev.github_events.type, funcs:count(Column#77)->Column#35, funcs:firstrow(gharchive_dev.github_events.type)->gharchive_dev.github_events.type, funcs:firstrow(Column#79)->gharchive_dev.github_events.created_at"
"      └─IndexReader_39","55.61","root","partition:push_event,pull_request_event,issue_comment_event,issues_event,pull_request_review_comment_event,pull_request_review_event","index:HashAgg_30"
"        └─HashAgg_30","55.61","cop[tikv]","","group by:gharchive_dev.github_events.type, hour(cast(gharchive_dev.github_events.created_at, time)), minus(dayofweek(gharchive_dev.github_events.created_at), 1), funcs:count(1)->Column#77, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#79"
"          └─IndexRangeScan_37","952.40","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""IssueCommentEvent"" ""created"" 2022-09-03 14:38:35,5086433 ""IssueCommentEvent"" ""created"" 2023-09-03 14:38:35], [5086433 ""IssuesEvent"" ""opened"" 2022-09-03 14:38:35,5086433 ""IssuesEvent"" ""opened"" 2023-09-03 14:38:35], [5086433 ""PullRequestEvent"" ""opened"" 2022-09-03 14:38:35,5086433 ""PullRequestEvent"" ""opened"" 2023-09-03 14:38:35], [5086433 ""PullRequestReviewCommentEvent"" ""created"" 2022-09-03 14:38:35,5086433 ""PullRequestReviewCommentEvent"" ""created"" 2023-09-03 14:38:35], [5086433 ""PullRequestReviewEvent"" ""created"" 2022-09-03 14:38:35,5086433 ""PullRequestReviewEvent"" ""created"" 2023-09-03 14:38:35], [5086433 ""PushEvent"" """" 2022-09-03 14:38:35,5086433 ""PushEvent"" """" 2023-09-03 14:38:35], keep order:false"
