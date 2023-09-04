"id","estRows","task","access object","operator info"
"Projection_44","1.00","root","","41986369->Column#298, Column#182, Column#220, Column#258, Column#296"
"└─HashJoin_45","1.00","root","","left outer join, equal:[eq(Column#145, Column#297)]"
"  ├─Projection_164(Build)","1.00","root","","41986369->Column#297, Column#296"
"  │ └─HashAgg_166","1.00","root","","funcs:count(distinct gharchive_dev.github_events.actor_login)->Column#296"
"  │   └─IndexReader_174","10842.78","root","partition:pull_request_review_event","index:IndexRangeScan_173"
"  │     └─IndexRangeScan_173","10842.78","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewEvent"" ""created"",41986369 ""PullRequestReviewEvent"" ""created""], keep order:false"
"  └─HashJoin_47(Probe)","1.00","root","","left outer join, equal:[eq(Column#145, Column#259)]"
"    ├─Projection_127(Build)","1.00","root","","41986369->Column#259, Column#258"
"    │ └─HashAgg_137","1.00","root","","funcs:count(Column#361)->Column#258"
"    │   └─IndexReader_138","1.00","root","partition:pull_request_review_event","index:HashAgg_129"
"    │     └─HashAgg_129","1.00","cop[tikv]","","funcs:count(1)->Column#361"
"    │       └─IndexRangeScan_136","10842.78","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestReviewEvent"" ""created"",41986369 ""PullRequestReviewEvent"" ""created""], keep order:false"
"    └─HashJoin_49(Probe)","1.00","root","","left outer join, equal:[eq(Column#145, Column#221)]"
"      ├─Projection_91(Build)","1.00","root","","41986369->Column#221, Column#220"
"      │ └─HashAgg_93","1.00","root","","funcs:count(distinct gharchive_dev.github_events.actor_login)->Column#220"
"      │   └─IndexReader_101","46668.02","root","partition:pull_request_event","index:IndexRangeScan_100"
"      │     └─IndexRangeScan_100","46668.02","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"" ""opened"",41986369 ""PullRequestEvent"" ""opened""], keep order:false"
"      └─HashJoin_52(Probe)","1.00","root","","left outer join, equal:[eq(Column#145, Column#183)]"
"        ├─Projection_53(Build)","1.00","root","","41986369->Column#145"
"        │ └─TableDual_54","1.00","root","","rows:1"
"        └─Projection_55(Probe)","1.00","root","","41986369->Column#183, Column#182"
"          └─HashAgg_57","1.00","root","","funcs:count(distinct gharchive_dev.github_events.number)->Column#182"
"            └─IndexReader_65","692073.10","root","partition:pull_request_event","index:IndexRangeScan_64"
"              └─IndexRangeScan_64","692073.10","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"",41986369 ""PullRequestEvent""], keep order:false"
