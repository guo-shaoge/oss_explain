"id","estRows","task","access object","operator info"
"Projection_17","29.44","root","","gharchive_dev.osdb_repos.group_name, Column#41"
"└─Sort_19","29.44","root","","Column#41:desc"
"  └─TableReader_107","29.44","root","partition:issues_event","MppVersion: 1, data:ExchangeSender_106"
"    └─ExchangeSender_106","29.44","mpp[tiflash]","","ExchangeType: PassThrough"
"      └─Projection_102","29.44","mpp[tiflash]","","Column#41, gharchive_dev.osdb_repos.group_name"
"        └─HashAgg_103","29.44","mpp[tiflash]","","group by:gharchive_dev.osdb_repos.group_name, funcs:count(distinct gharchive_dev.github_events.actor_login)->Column#41, funcs:firstrow(gharchive_dev.osdb_repos.group_name)->gharchive_dev.osdb_repos.group_name"
"          └─ExchangeReceiver_105","29.44","mpp[tiflash]","",""
"            └─ExchangeSender_104","29.44","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.osdb_repos.group_name, collate: utf8mb4_bin]"
"              └─HashAgg_23","29.44","mpp[tiflash]","","group by:gharchive_dev.github_events.actor_login, gharchive_dev.osdb_repos.group_name, "
"                └─HashJoin_101","616.70","mpp[tiflash]","","anti semi join, equal:[eq(gharchive_dev.github_events.actor_login, gharchive_dev.blacklist_users.login)]"
"                  ├─ExchangeReceiver_49(Build)","6.00","mpp[tiflash]","",""
"                  │ └─ExchangeSender_48","6.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                  │   └─TableFullScan_47","6.00","mpp[tiflash]","table:blacklist_users","keep order:false, stats:pseudo"
"                  └─Projection_37(Probe)","770.88","mpp[tiflash]","","gharchive_dev.github_events.actor_login, gharchive_dev.osdb_repos.group_name"
"                    └─HashJoin_38","770.88","mpp[tiflash]","","inner join, equal:[eq(Column#45, Column#44)]"
"                      ├─ExchangeReceiver_43(Build)","46.00","mpp[tiflash]","",""
"                      │ └─ExchangeSender_42","46.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                      │   └─Projection_40","46.00","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, cast(gharchive_dev.osdb_repos.id, double BINARY)->Column#45"
"                      │     └─TableFullScan_41","46.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                      └─Projection_44(Probe)","13196025.53","mpp[tiflash]","","gharchive_dev.github_events.actor_login, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#44"
"                        └─Selection_46","13196025.53","mpp[tiflash]","","eq(gharchive_dev.github_events.action, ""opened""), eq(gharchive_dev.github_events.type, ""IssuesEvent""), not(like(gharchive_dev.github_events.actor_login, ""%bot%"", 92))"
"                          └─TableFullScan_45","6349301992.00","mpp[tiflash]","table:github_events","keep order:false, PartitionTableScan:true"
