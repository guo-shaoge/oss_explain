"id","estRows","task","access object","operator info"
"Projection_119","36.32","root","","gharchive_dev.github_events.actor_id, Column#78, Column#152, Column#79, Column#125, Column#126, Column#151"
"└─Limit_126","36.32","root","","offset:0, count:50"
"  └─Window_208","36.32","root","","row_number()->Column#152 over(order by Column#79 desc rows between current row and current row)"
"    └─Sort_207","36.32","root","","Column#79:desc"
"      └─Projection_129","36.32","root","","gharchive_dev.github_events.actor_id, Column#78, Column#79, coalesce(Column#119, 0)->Column#125, coalesce(minus(Column#79, Column#119), 0)->Column#126, div(cast(Column#79, decimal(20,0) BINARY), 1093)->Column#151"
"        └─HashJoin_130","36.32","root","","left outer join, equal:[eq(gharchive_dev.github_events.actor_id, gharchive_dev.github_events.actor_id)]"
"          ├─HashAgg_133(Build)","36.32","root","","group by:gharchive_dev.github_events.actor_id, funcs:count(distinct gharchive_dev.github_events.pr_or_issue_id)->Column#119, funcs:firstrow(gharchive_dev.github_events.actor_id)->gharchive_dev.github_events.actor_id"
"          │ └─HashJoin_149","3886.54","root","","anti semi join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.blacklist_users.login)]"
"          │   ├─IndexReader_176(Build)","6.00","root","","index:IndexFullScan_175"
"          │   │ └─IndexFullScan_175","6.00","cop[tikv]","table:bu, index:blacklist_users_login_uindex(login)","keep order:false, stats:pseudo"
"          │   └─IndexLookUp_169(Probe)","6072.72","root","partition:pull_request_review_comment_event,pull_request_review_event",""
"          │     ├─Selection_168(Build)","6072.72","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92)), not(like(gharchive_dev.github_events.actor_login, ""%bot"", 92))"
"          │     │ └─IndexRangeScan_166","6072.72","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-07-01 00:00:00,41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-08-01 00:00:00), [41986369 ""PullRequestReviewEvent"" ""created"" 2023-07-01 00:00:00,41986369 ""PullRequestReviewEvent"" ""created"" 2023-08-01 00:00:00), keep order:false"
"          │     └─TableRowIDScan_167(Probe)","6072.72","cop[tikv]","table:ge","keep order:false"
"          └─CTEFullScan_132(Probe)","36.32","root","CTE:review_contribution_last_month AS lm","data:CTE_0"
"CTE_0","36.32","root","","Non-Recursive CTE"
"└─Projection_32(Seed Part)","36.32","root","","gharchive_dev.github_events.actor_id, any_value(gharchive_dev.github_events.actor_login)->Column#38, Column#37"
"  └─HashAgg_33","36.32","root","","group by:gharchive_dev.github_events.actor_id, funcs:count(distinct gharchive_dev.github_events.pr_or_issue_id)->Column#37, funcs:firstrow(gharchive_dev.github_events.actor_id)->gharchive_dev.github_events.actor_id, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"    └─HashJoin_49","3886.54","root","","anti semi join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.blacklist_users.login)]"
"      ├─IndexReader_76(Build)","6.00","root","","index:IndexFullScan_75"
"      │ └─IndexFullScan_75","6.00","cop[tikv]","table:bu, index:blacklist_users_login_uindex(login)","keep order:false, stats:pseudo"
"      └─IndexLookUp_69(Probe)","6072.72","root","partition:pull_request_review_comment_event,pull_request_review_event",""
"        ├─Selection_68(Build)","6072.72","cop[tikv]","","not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92)), not(like(gharchive_dev.github_events.actor_login, ""%bot"", 92))"
"        │ └─IndexRangeScan_66","6072.72","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-08-01 00:00:00,41986369 ""PullRequestReviewCommentEvent"" ""created"" 2023-09-01 00:00:00), [41986369 ""PullRequestReviewEvent"" ""created"" 2023-08-01 00:00:00,41986369 ""PullRequestReviewEvent"" ""created"" 2023-09-01 00:00:00), keep order:false"
"        └─TableRowIDScan_67(Probe)","6072.72","cop[tikv]","table:ge","keep order:false"