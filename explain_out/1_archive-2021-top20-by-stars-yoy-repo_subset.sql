"id","estRows","task","access object","operator info"
"Projection_19","20.00","root","","gharchive_dev.db_repos.name, Column#38, Column#39, round(div(minus(Column#39, Column#38), Column#38), 3)->Column#44"
"└─Projection_103","20.00","root","","Column#38, Column#39, gharchive_dev.db_repos.name"
"  └─TopN_23","20.00","root","","Column#63:desc, offset:0, count:20"
"    └─Projection_104","20.00","root","","Column#38, Column#39, gharchive_dev.db_repos.name, round(div(minus(Column#39, Column#38), Column#38), 3)->Column#63"
"      └─TableReader_99","20.00","root","partition:watch_event","MppVersion: 1, data:ExchangeSender_98"
"        └─ExchangeSender_98","20.00","mpp[tiflash]","","ExchangeType: PassThrough"
"          └─Projection_101","20.00","mpp[tiflash]","","Column#38, Column#39, gharchive_dev.db_repos.name"
"            └─TopN_97","20.00","mpp[tiflash]","","Column#62:desc, offset:0, count:20"
"              └─Projection_102","58.88","mpp[tiflash]","","Column#38, Column#39, gharchive_dev.db_repos.name, round(div(minus(Column#39, Column#38), Column#38), 3)->Column#62"
"                └─Selection_96","58.88","mpp[tiflash]","","gt(Column#38, 0)"
"                  └─Projection_90","73.60","mpp[tiflash]","","Column#38, Column#39, gharchive_dev.db_repos.name"
"                    └─HashAgg_91","73.60","mpp[tiflash]","","group by:gharchive_dev.db_repos.name, funcs:sum(Column#56)->Column#38, funcs:sum(Column#57)->Column#39, funcs:firstrow(gharchive_dev.db_repos.name)->gharchive_dev.db_repos.name"
"                      └─ExchangeReceiver_93","73.60","mpp[tiflash]","",""
"                        └─ExchangeSender_92","73.60","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.db_repos.name, collate: utf8mb4_bin]"
"                          └─HashAgg_88","73.60","mpp[tiflash]","","group by:Column#61, funcs:sum(Column#59)->Column#56, funcs:sum(Column#60)->Column#57"
"                            └─Projection_100","1541.76","mpp[tiflash]","","cast(eq(gharchive_dev.github_events.event_year, 2020), decimal(20,0) BINARY)->Column#59, cast(eq(gharchive_dev.github_events.event_year, 2021), decimal(20,0) BINARY)->Column#60, gharchive_dev.db_repos.name"
"                              └─Projection_77","1541.76","mpp[tiflash]","","gharchive_dev.github_events.event_year, gharchive_dev.db_repos.name"
"                                └─HashJoin_67","1541.76","mpp[tiflash]","","inner join, equal:[eq(Column#47, Column#46)]"
"                                  ├─ExchangeReceiver_41(Build)","92.00","mpp[tiflash]","",""
"                                  │ └─ExchangeSender_40","92.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                                  │   └─Projection_38","92.00","mpp[tiflash]","","gharchive_dev.db_repos.name, cast(gharchive_dev.db_repos.id, double BINARY)->Column#47"
"                                  │     └─TableFullScan_39","92.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                                  └─Projection_42(Probe)","117909497.11","mpp[tiflash]","","gharchive_dev.github_events.event_year, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#46"
"                                    └─Selection_44","117909497.11","mpp[tiflash]","","eq(gharchive_dev.github_events.type, ""WatchEvent""), in(gharchive_dev.github_events.event_year, 2021, 2020)"
"                                      └─TableFullScan_43","6349301992.00","mpp[tiflash]","table:github_events","keep order:false, PartitionTableScan:true"
