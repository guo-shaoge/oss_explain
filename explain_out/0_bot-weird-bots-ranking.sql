"id","estRows","task","access object","operator info"
"Projection_10","20.00","root","","gharchive_dev.github_events.actor_id, any_value(gharchive_dev.github_events.actor_login)->Column#38, Column#35"
"└─TopN_14","20.00","root","","Column#35:desc, offset:0, count:20"
"  └─TableReader_78","20.00","root","partition:push_event","MppVersion: 1, data:ExchangeSender_77"
"    └─ExchangeSender_77","20.00","mpp[tiflash]","","ExchangeType: PassThrough"
"      └─TopN_76","20.00","mpp[tiflash]","","Column#35:desc, offset:0, count:20"
"        └─Projection_72","2599160.92","mpp[tiflash]","","Column#35, gharchive_dev.github_events.actor_id, gharchive_dev.github_events.actor_login"
"          └─HashAgg_73","2599160.92","mpp[tiflash]","","group by:gharchive_dev.github_events.actor_id, funcs:sum(Column#61)->Column#35, funcs:firstrow(gharchive_dev.github_events.actor_id)->gharchive_dev.github_events.actor_id, funcs:firstrow(Column#63)->gharchive_dev.github_events.actor_login"
"            └─ExchangeReceiver_75","2599160.92","mpp[tiflash]","",""
"              └─ExchangeSender_74","2599160.92","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.actor_id, collate: binary]"
"                └─HashAgg_70","2599160.92","mpp[tiflash]","","group by:gharchive_dev.github_events.actor_id, funcs:count(1)->Column#61, funcs:firstrow(gharchive_dev.github_events.actor_login)->Column#63"
"                  └─Selection_57","278119833.93","mpp[tiflash]","","eq(gharchive_dev.github_events.event_year, 2022), eq(gharchive_dev.github_events.type, ""PushEvent""), not(in(gharchive_dev.github_events.actor_login, ""fqnssg3847"", ""gzwqvg3179"", ""znyt"")), not(like(gharchive_dev.github_events.actor_login, ""%[bot]"", 92)), not(like(gharchive_dev.github_events.actor_login, ""%bot"", 92))"
"                    └─TableFullScan_56","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"