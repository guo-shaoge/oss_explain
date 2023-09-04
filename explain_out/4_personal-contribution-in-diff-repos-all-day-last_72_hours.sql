"id","estRows","task","access object","operator info"
"Sort_9","1.00","root","","gharchive_dev.github_events.repo_id, Column#37:desc"
"└─Projection_11","1.00","root","","gharchive_dev.github_events.repo_id, any_value(gharchive_dev.github_events.repo_name)->Column#36, Column#35, date_format(gharchive_dev.github_events.created_at, %Y-%m-%d 00:00:00)->Column#37"
"  └─HashAgg_25","1.00","root","","group by:Column#51, gharchive_dev.github_events.repo_id, funcs:count(Column#52)->Column#35, funcs:firstrow(Column#53)->gharchive_dev.github_events.created_at, funcs:firstrow(gharchive_dev.github_events.repo_id)->gharchive_dev.github_events.repo_id, funcs:firstrow(Column#55)->gharchive_dev.github_events.repo_name"
"    └─IndexLookUp_26","1.00","root","partition:push_event,pull_request_event,issue_comment_event,issues_event,pull_request_review_comment_event,pull_request_review_event",""
"      ├─IndexRangeScan_23(Build)","952.40","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""IssueCommentEvent"" ""created"" 2023-08-31 14:37:55,5086433 ""IssueCommentEvent"" ""created"" 2023-09-03 14:37:55], [5086433 ""IssuesEvent"" ""opened"" 2023-08-31 14:37:55,5086433 ""IssuesEvent"" ""opened"" 2023-09-03 14:37:55], [5086433 ""PullRequestEvent"" ""opened"" 2023-08-31 14:37:55,5086433 ""PullRequestEvent"" ""opened"" 2023-09-03 14:37:55], [5086433 ""PullRequestReviewCommentEvent"" ""created"" 2023-08-31 14:37:55,5086433 ""PullRequestReviewCommentEvent"" ""created"" 2023-09-03 14:37:55], [5086433 ""PullRequestReviewEvent"" ""created"" 2023-08-31 14:37:55,5086433 ""PullRequestReviewEvent"" ""created"" 2023-09-03 14:37:55], [5086433 ""PushEvent"" """" 2023-08-31 14:37:55,5086433 ""PushEvent"" """" 2023-09-03 14:37:55], keep order:false"
"      └─HashAgg_13(Probe)","1.00","cop[tikv]","","group by:date_format(gharchive_dev.github_events.created_at, ""%Y-%m-%d 00:00:00""), gharchive_dev.github_events.repo_id, funcs:count(gharchive_dev.github_events.id)->Column#52, funcs:firstrow(gharchive_dev.github_events.created_at)->Column#53, funcs:firstrow(gharchive_dev.github_events.repo_name)->Column#55"
"        └─TableRowIDScan_24","952.40","cop[tikv]","table:ge","keep order:false"
