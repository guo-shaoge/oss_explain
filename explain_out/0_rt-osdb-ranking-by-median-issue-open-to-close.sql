"id","estRows","task","access object","operator info"
"Sort_43","616.70","root","","Column#129"
"└─Projection_45","616.70","root","","gharchive_dev.osdb_repos.group_name, Column#129"
"  └─Selection_47","616.70","root","","eq(Column#132, intdiv(Column#133, 2))"
"    └─Window_48","770.88","root","","count(1)->Column#133 over(partition by gharchive_dev.osdb_repos.group_name)"
"      └─Window_49","770.88","root","","row_number()->Column#132 over(partition by gharchive_dev.osdb_repos.group_name order by Column#129 rows between current row and current row)"
"        └─Sort_97","770.88","root","","gharchive_dev.osdb_repos.group_name, Column#129"
"          └─TableReader_96","770.88","root","partition:issues_event","MppVersion: 1, data:ExchangeSender_95"
"            └─ExchangeSender_95","770.88","mpp[tiflash]","","ExchangeType: PassThrough"
"              └─Projection_53","770.88","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, div(cast(timestampdiff(HOUR, gharchive_dev.github_events.pr_or_issue_created_at, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 24)->Column#129"
"                └─Projection_94","770.88","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.github_events.pr_or_issue_created_at, gharchive_dev.osdb_repos.group_name"
"                  └─HashJoin_90","770.88","mpp[tiflash]","","inner join, equal:[eq(Column#135, Column#134)]"
"                    ├─ExchangeReceiver_63(Build)","46.00","mpp[tiflash]","",""
"                    │ └─ExchangeSender_62","46.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                    │   └─Projection_60","46.00","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, cast(gharchive_dev.osdb_repos.id, double BINARY)->Column#135"
"                    │     └─TableFullScan_61","46.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                    └─Projection_64(Probe)","7749890.45","mpp[tiflash]","","gharchive_dev.github_events.created_at, gharchive_dev.github_events.pr_or_issue_created_at, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#134"
"                      └─Selection_66","7749890.45","mpp[tiflash]","","eq(gharchive_dev.github_events.action, ""closed""), eq(gharchive_dev.github_events.type, ""IssuesEvent""), gt(div(cast(timestampdiff(""HOUR"", gharchive_dev.github_events.pr_or_issue_created_at, gharchive_dev.github_events.created_at), decimal(20,0) BINARY), 24), 0.1), not(in(gharchive_dev.github_events.creator_user_login, ""cockroach-teamcity"", ""elasticmachine"")), not(like(gharchive_dev.github_events.creator_user_login, ""%bot%"", 92))"
"                        └─TableFullScan_65","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
