"id","estRows","task","access object","operator info"
"Sort_6","1.00","root","","Column#10:desc"
"└─TableReader_52","1.00","root","","MppVersion: 1, data:ExchangeSender_51"
"  └─ExchangeSender_51","1.00","mpp[tiflash]","","ExchangeType: PassThrough"
"    └─Projection_9","1.00","mpp[tiflash]","","gharchive_dev.stats_index_summary.table_name, gharchive_dev.stats_index_summary.index_name, Column#9, Column#10"
"      └─Projection_46","1.00","mpp[tiflash]","","Column#9, Column#10, gharchive_dev.stats_index_summary.table_name, gharchive_dev.stats_index_summary.index_name"
"        └─HashAgg_44","1.00","mpp[tiflash]","","group by:Column#26, Column#27, funcs:count(distinct Column#22)->Column#9, funcs:sum(Column#23)->Column#10, funcs:firstrow(Column#24)->gharchive_dev.stats_index_summary.table_name, funcs:firstrow(Column#25)->gharchive_dev.stats_index_summary.index_name"
"          └─Projection_55","1.11","mpp[tiflash]","","gharchive_dev.stats_index_summary.digest, cast(gharchive_dev.stats_index_summary.exec_count, decimal(20,0) UNSIGNED BINARY)->Column#23, gharchive_dev.stats_index_summary.table_name, gharchive_dev.stats_index_summary.index_name, gharchive_dev.stats_index_summary.table_name, gharchive_dev.stats_index_summary.index_name"
"            └─ExchangeReceiver_29","1.11","mpp[tiflash]","",""
"              └─ExchangeSender_28","1.11","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.stats_index_summary.table_name, collate: utf8mb4_bin], [name: gharchive_dev.stats_index_summary.index_name, collate: utf8mb4_bin]"
"                └─Selection_27","1.11","mpp[tiflash]","","eq(gharchive_dev.stats_index_summary.table_name, ""github_events""), ge(gharchive_dev.stats_index_summary.summary_begin_time, 2023-09-03 00:00:00.000000), le(gharchive_dev.stats_index_summary.summary_end_time, 2023-09-03 23:59:59.000000)"
"                  └─TableFullScan_26","10000.00","mpp[tiflash]","table:sis","keep order:false, stats:pseudo"
