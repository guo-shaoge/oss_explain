"id","estRows","task","access object","operator info"
"Projection_25","1.27","root","","Column#35, Column#64, Column#62, Column#60, Column#58, Column#56, Column#54, Column#52"
"└─Selection_27","1.27","root","","eq(Column#51, 1)"
"  └─Window_29","1.59","root","","sum(cast(Column#63, decimal(20,0) BINARY))->Column#64 over(partition by Column#35)"
"    └─Projection_30","1.59","root","","Column#35, Column#51, Column#52, Column#54, Column#56, Column#58, Column#60, Column#62, if(lt(Column#36, 10), 1, 0)->Column#63"
"      └─Window_34","1.59","root","","sum(cast(Column#61, decimal(20,0) BINARY))->Column#62 over(partition by Column#35)"
"        └─Projection_35","1.59","root","","Column#35, Column#36, Column#51, Column#52, Column#54, Column#56, Column#58, Column#60, if(and(ge(Column#36, 10), lt(Column#36, 30)), 1, 0)->Column#61"
"          └─Window_39","1.59","root","","sum(cast(Column#59, decimal(20,0) BINARY))->Column#60 over(partition by Column#35)"
"            └─Projection_40","1.59","root","","Column#35, Column#36, Column#51, Column#52, Column#54, Column#56, Column#58, if(and(ge(Column#36, 30), lt(Column#36, 100)), 1, 0)->Column#59"
"              └─Window_44","1.59","root","","sum(cast(Column#57, decimal(20,0) BINARY))->Column#58 over(partition by Column#35)"
"                └─Projection_45","1.59","root","","Column#35, Column#36, Column#51, Column#52, Column#54, Column#56, if(and(ge(Column#36, 100), lt(Column#36, 500)), 1, 0)->Column#57"
"                  └─Window_49","1.59","root","","sum(cast(Column#55, decimal(20,0) BINARY))->Column#56 over(partition by Column#35)"
"                    └─Projection_50","1.59","root","","Column#35, Column#36, Column#51, Column#52, Column#54, if(and(ge(Column#36, 500), lt(Column#36, 1000)), 1, 0)->Column#55"
"                      └─Window_54","1.59","root","","sum(cast(Column#53, decimal(20,0) BINARY))->Column#54 over(partition by Column#35)"
"                        └─Projection_55","1.59","root","","Column#35, Column#36, Column#51, Column#52, if(ge(Column#36, 1000), 1, 0)->Column#53"
"                          └─Window_59","1.59","root","","count(1)->Column#52 over(partition by Column#35)"
"                            └─Window_60","1.59","root","","row_number()->Column#51 over(partition by Column#35 rows between current row and current row)"
"                              └─Sort_71","1.59","root","","Column#35"
"                                └─Projection_63","1.59","root","","date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#35, plus(gharchive_dev.github_events.additions, gharchive_dev.github_events.deletions)->Column#36"
"                                  └─IndexReader_70","1.59","root","partition:pull_request_event","index:IndexRangeScan_69"
"                                    └─IndexRangeScan_69","1.59","cop[tikv]","table:ge, index:index_ge_on_creator_id_type_action_merged_created_at_add_del(creator_user_id, type, action, pr_merged, created_at, additions, deletions)","range:[5086433 ""PullRequestEvent"" ""closed"" 1 2020-09-03 14:45:59,5086433 ""PullRequestEvent"" ""closed"" 1 2023-09-03 14:45:59], keep order:false"
