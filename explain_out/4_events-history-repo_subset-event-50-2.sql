"id","estRows","task","access object","operator info"
"Projection_17","50.00","root","","any_value(gharchive_dev.db_repos.name)->Column#40, Column#38"
"└─TopN_21","50.00","root","","Column#38:desc, offset:0, count:50"
"  └─TableReader_101","50.00","root","partition:dual","MppVersion: 1, data:ExchangeSender_100"
"    └─ExchangeSender_100","50.00","mpp[tiflash]","","ExchangeType: PassThrough"
"      └─TopN_99","50.00","mpp[tiflash]","","Column#38:desc, offset:0, count:50"
"        └─Projection_94","1541.76","mpp[tiflash]","","Column#38, gharchive_dev.db_repos.name"
"          └─HashAgg_92","1541.76","mpp[tiflash]","","group by:gharchive_dev.github_events.repo_id, funcs:count(1)->Column#38, funcs:firstrow(gharchive_dev.db_repos.name)->gharchive_dev.db_repos.name"
"            └─ExchangeReceiver_76","1541.76","mpp[tiflash]","",""
"              └─ExchangeSender_75","1541.76","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.repo_id, collate: binary]"
"                └─Projection_74","1541.76","mpp[tiflash]","","gharchive_dev.github_events.repo_id, gharchive_dev.db_repos.name"
"                  └─HashJoin_70","1541.76","mpp[tiflash]","","inner join, equal:[eq(Column#44, Column#43)]"
"                    ├─ExchangeReceiver_44(Build)","92.00","mpp[tiflash]","",""
"                    │ └─ExchangeSender_43","92.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                    │   └─Projection_41","92.00","mpp[tiflash]","","gharchive_dev.db_repos.name, cast(gharchive_dev.db_repos.id, double BINARY)->Column#44"
"                    │     └─TableFullScan_42","92.00","mpp[tiflash]","table:repo_subset","keep order:false, stats:pseudo"
"                    └─Projection_45(Probe)","44771770.58","mpp[tiflash]","","gharchive_dev.github_events.repo_id, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#43"
"                      └─Selection_47","44771770.58","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""event""), ge(gharchive_dev.github_events.event_year, 2021)"
"                        └─TableFullScan_46","6349301992.00","mpp[tiflash]","table:github_events","keep order:false, PartitionTableScan:true"
