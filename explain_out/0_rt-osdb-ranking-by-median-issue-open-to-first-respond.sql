"id","estRows","task","access object","operator info"
"Sort_75","616.70","root","","Column#261"
"└─Projection_77","616.70","root","","gharchive_dev.osdb_repos.group_name, Column#261"
"  └─Selection_79","616.70","root","","eq(Column#265, intdiv(Column#266, 2))"
"    └─Window_80","770.88","root","","count(1)->Column#266 over(partition by gharchive_dev.osdb_repos.group_name)"
"      └─Window_81","770.88","root","","row_number()->Column#265 over(partition by gharchive_dev.osdb_repos.group_name order by Column#264 rows between current row and current row)"
"        └─Sort_211","770.88","root","","gharchive_dev.osdb_repos.group_name, Column#264"
"          └─TableReader_210","770.88","root","partition:issues_event of ge, partition:issue_comment_event,issues_event of ge","MppVersion: 1, data:ExchangeSender_209"
"            └─ExchangeSender_209","770.88","mpp[tiflash]","","ExchangeType: PassThrough"
"              └─Projection_85","770.88","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, div(div(div(cast(minus(unix_timestamp(Column#259), unix_timestamp(gharchive_dev.github_events.created_at)), decimal(20,0) BINARY), 60), 60), 24)->Column#261, minus(unix_timestamp(Column#259), unix_timestamp(gharchive_dev.github_events.created_at))->Column#264"
"                └─Projection_208","770.88","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.osdb_repos.group_name, Column#259"
"                  └─HashJoin_204","770.88","mpp[tiflash]","","inner join, equal:[eq(gharchive_dev.github_events.pr_or_issue_id, gharchive_dev.github_events.pr_or_issue_id)]"
"                    ├─ExchangeReceiver_101(Build)","770.88","mpp[tiflash]","",""
"                    │ └─ExchangeSender_100","770.88","mpp[tiflash]","","ExchangeType: Broadcast"
"                    │   └─HashJoin_91","770.88","mpp[tiflash]","","inner join, equal:[eq(Column#274, Column#273)]"
"                    │     ├─ExchangeReceiver_96(Build)","46.00","mpp[tiflash]","",""
"                    │     │ └─ExchangeSender_95","46.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                    │     │   └─Projection_93","46.00","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, cast(gharchive_dev.osdb_repos.id, double BINARY)->Column#274"
"                    │     │     └─TableFullScan_94","46.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                    │     └─Projection_97(Probe)","13196026.85","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.github_events.pr_or_issue_id, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#273"
"                    │       └─Selection_99","13196026.85","mpp[tiflash]","","eq(gharchive_dev.github_events.action, ""opened""), eq(gharchive_dev.github_events.type, ""IssuesEvent"")"
"                    │         └─TableFullScan_98","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
"                    └─Projection_117(Probe)","770.88","mpp[tiflash]","","Column#259, gharchive_dev.github_events.pr_or_issue_id"
"                      └─HashAgg_102","770.88","mpp[tiflash]","","group by:gharchive_dev.github_events.pr_or_issue_id, funcs:min(gharchive_dev.github_events.created_at)->Column#259, funcs:firstrow(gharchive_dev.github_events.pr_or_issue_id)->gharchive_dev.github_events.pr_or_issue_id"
"                        └─ExchangeReceiver_116","770.88","mpp[tiflash]","",""
"                          └─ExchangeSender_115","770.88","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.pr_or_issue_id, collate: binary]"
"                            └─Projection_105","770.88","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.github_events.pr_or_issue_id"
"                              └─HashJoin_106","770.88","mpp[tiflash]","","inner join, equal:[eq(Column#278, Column#277)]"
"                                ├─ExchangeReceiver_111(Build)","46.00","mpp[tiflash]","",""
"                                │ └─ExchangeSender_110","46.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                                │   └─Projection_108","46.00","mpp[tiflash]","","cast(gharchive_dev.osdb_repos.id, double BINARY)->Column#278"
"                                │     └─TableFullScan_109","46.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                                └─Projection_112(Probe)","32737403.84","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.github_events.pr_or_issue_id, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#277"
"                                  └─Selection_114","32737403.84","mpp[tiflash]","","ne(gharchive_dev.github_events.actor_login, ""elasticmachine""), not(like(gharchive_dev.github_events.actor_login, ""%bot%"", 92)), or(and(eq(gharchive_dev.github_events.type, ""IssueCommentEvent""), eq(gharchive_dev.github_events.action, ""created"")), and(eq(gharchive_dev.github_events.type, ""IssuesEvent""), eq(gharchive_dev.github_events.action, ""closed"")))"
"                                    └─TableFullScan_113","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
