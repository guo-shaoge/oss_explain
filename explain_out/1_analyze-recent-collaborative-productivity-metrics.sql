"id","estRows","task","access object","operator info"
"Projection_56","1.00","root","","mul(div(cast(Column#247, decimal(20,0) BINARY), cast(Column#211, decimal(20,0) BINARY)), 100)->Column#356, mul(div(cast(Column#283, decimal(20,0) BINARY), cast(Column#211, decimal(20,0) BINARY)), 100)->Column#357, mul(div(cast(Column#355, decimal(20,0) BINARY), cast(Column#319, decimal(20,0) BINARY)), 100)->Column#358"
"└─Projection_58","1.00","root","","Column#211, Column#247, Column#283, Column#319, Column#355"
"  └─HashJoin_61","1.00","root","","CARTESIAN inner join"
"    ├─HashAgg_255(Build)","1.00","root","","funcs:count(Column#470)->Column#211"
"    │ └─IndexReader_256","1.00","root","partition:pull_request_event","index:HashAgg_247"
"    │   └─HashAgg_247","1.00","cop[tikv]","","funcs:count(1)->Column#470"
"    │     └─IndexRangeScan_254","155560.07","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""PullRequestEvent"" ""opened"" 2023-08-06 00:00:00,41986369 ""PullRequestEvent"" ""opened"" +inf], keep order:false"
"    └─HashJoin_72(Probe)","1.00","root","","CARTESIAN inner join"
"      ├─HashJoin_162(Build)","1.00","root","","CARTESIAN inner join"
"      │ ├─HashAgg_224(Build)","1.00","root","","funcs:count(Column#439)->Column#319"
"      │ │ └─IndexReader_225","1.00","root","partition:issues_event","index:HashAgg_216"
"      │ │   └─HashAgg_216","1.00","cop[tikv]","","funcs:count(1)->Column#439"
"      │ │     └─IndexRangeScan_223","54983.45","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""IssuesEvent"" ""opened"" 2023-08-06 00:00:00,41986369 ""IssuesEvent"" ""opened"" +inf], keep order:false"
"      │ └─HashAgg_184(Probe)","1.00","root","","funcs:count(Column#413)->Column#355"
"      │   └─IndexLookUp_185","1.00","root","partition:issues_event",""
"      │     ├─IndexRangeScan_181(Build)","10681.75","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""IssuesEvent"" ""closed"" 2023-08-06 00:00:00,41986369 ""IssuesEvent"" ""closed"" +inf], keep order:false"
"      │     └─HashAgg_171(Probe)","1.00","cop[tikv]","","funcs:count(1)->Column#413"
"      │       └─Selection_183","8545.40","cop[tikv]","","gt(gharchive_dev.github_events.pr_or_issue_created_at, 2023-08-06)"
"      │         └─TableRowIDScan_182","10681.75","cop[tikv]","table:ge","keep order:false"
"      └─HashJoin_75(Probe)","1.00","root","","CARTESIAN inner join"
"        ├─HashAgg_126(Build)","1.00","root","","funcs:count(distinct gharchive_dev.github_events.number)->Column#283"
"        │ └─IndexLookUp_139","7651.69","root","partition:pull_request_review_event",""
"        │   ├─IndexRangeScan_136(Build)","9564.61","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""PullRequestReviewEvent"" ""created"" 2023-08-06 00:00:00,41986369 ""PullRequestReviewEvent"" ""created"" +inf], keep order:false"
"        │   └─Selection_138(Probe)","7651.69","cop[tikv]","","gt(gharchive_dev.github_events.pr_or_issue_created_at, 2023-08-06)"
"        │     └─TableRowIDScan_137","9564.61","cop[tikv]","table:ge","keep order:false"
"        └─HashAgg_92(Probe)","1.00","root","","funcs:count(Column#371)->Column#247"
"          └─IndexLookUp_93","1.00","root","partition:pull_request_event",""
"            ├─Selection_90(Build)","653.16","cop[tikv]","","eq(gharchive_dev.github_events.pr_merged, 1)"
"            │ └─IndexRangeScan_88","2116.43","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:(41986369 ""PullRequestEvent"" ""closed"" 2023-08-06 00:00:00,41986369 ""PullRequestEvent"" ""closed"" +inf], keep order:false"
"            └─HashAgg_78(Probe)","1.00","cop[tikv]","","funcs:count(1)->Column#371"
"              └─Selection_91","653.16","cop[tikv]","","gt(gharchive_dev.github_events.pr_or_issue_created_at, 2023-08-06)"
"                └─TableRowIDScan_89","653.16","cop[tikv]","table:ge","keep order:false"