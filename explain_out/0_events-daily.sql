"id","estRows","task","access object","operator info"
"Projection_7","29.54","root","","gharchive_dev.github_events.event_day, Column#35"
"└─Sort_9","29.54","root","","gharchive_dev.github_events.event_day"
"  └─TableReader_43","29.54","root","partition:pull_request_event","MppVersion: 1, data:ExchangeSender_42"
"    └─ExchangeSender_42","29.54","mpp[tiflash]","","ExchangeType: PassThrough"
"      └─Projection_38","29.54","mpp[tiflash]","","Column#35, gharchive_dev.github_events.event_day"
"        └─HashAgg_39","29.54","mpp[tiflash]","","group by:gharchive_dev.github_events.event_day, funcs:sum(Column#40)->Column#35, funcs:firstrow(gharchive_dev.github_events.event_day)->gharchive_dev.github_events.event_day"
"          └─ExchangeReceiver_41","29.54","mpp[tiflash]","",""
"            └─ExchangeSender_40","29.54","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.github_events.event_day, collate: binary]"
"              └─HashAgg_15","29.54","mpp[tiflash]","","group by:gharchive_dev.github_events.event_day, funcs:count(1)->Column#40"
"                └─Selection_37","42539762.57","mpp[tiflash]","","eq(gharchive_dev.github_events.event_year, 2023), eq(gharchive_dev.github_events.type, ""PullRequestEvent"")"
"                  └─TableFullScan_36","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"