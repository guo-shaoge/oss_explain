"id","estRows","task","access object","operator info"
"Projection_101","29867.53","root","","Column#35, Column#63, Column#61, Column#59, Column#57, Column#55, Column#53, Column#51"
"└─Selection_103","29867.53","root","","eq(Column#50, 1)"
"  └─Window_105","37334.42","root","","sum(cast(Column#62, decimal(20,0) BINARY))->Column#63 over(partition by Column#35)"
"    └─Projection_33","37334.42","root","","Column#35, Column#50, Column#51, Column#53, Column#55, Column#57, Column#59, Column#61, case(lt(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 10), 1, 0)->Column#62"
"      └─Window_37","37334.42","root","","sum(cast(Column#60, decimal(20,0) BINARY))->Column#61 over(partition by Column#35)"
"        └─Projection_38","37334.42","root","","Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions, Column#50, Column#51, Column#53, Column#55, Column#57, Column#59, case(and(ge(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 10), lt(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 30)), 1, 0)->Column#60"
"          └─Window_42","37334.42","root","","sum(cast(Column#58, decimal(20,0) BINARY))->Column#59 over(partition by Column#35)"
"            └─Projection_43","37334.42","root","","Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions, Column#50, Column#51, Column#53, Column#55, Column#57, case(and(ge(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 30), lt(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 100)), 1, 0)->Column#58"
"              └─Window_47","37334.42","root","","sum(cast(Column#56, decimal(20,0) BINARY))->Column#57 over(partition by Column#35)"
"                └─Projection_48","37334.42","root","","Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions, Column#50, Column#51, Column#53, Column#55, case(and(ge(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 100), lt(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 500)), 1, 0)->Column#56"
"                  └─Window_52","37334.42","root","","sum(cast(Column#54, decimal(20,0) BINARY))->Column#55 over(partition by Column#35)"
"                    └─Projection_53","37334.42","root","","Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions, Column#50, Column#51, Column#53, case(and(ge(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 500), lt(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 1000)), 1, 0)->Column#54"
"                      └─Window_57","37334.42","root","","sum(cast(Column#52, decimal(20,0) BINARY))->Column#53 over(partition by Column#35)"
"                        └─Projection_58","37334.42","root","","Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions, Column#50, Column#51, case(ge(plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions), 1000), 1, 0)->Column#52"
"                          └─Window_62","37334.42","root","","count(1)->Column#51 over(partition by Column#35)"
"                            └─Window_63","37334.42","root","","row_number()->Column#50 over(partition by Column#35 rows between current row and current row)"
"                              └─Sort_74","37334.42","root","","Column#35"
"                                └─Projection_66","37334.42","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#35, gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions"
"                                  └─IndexReader_73","46668.02","root","partition:pull_request_event","index:IndexRangeScan_72"
"                                    └─IndexRangeScan_72","46668.02","cop[tikv]","table:github_events, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"" ""opened"",41986369 ""PullRequestEvent"" ""opened""], keep order:false"
