"id","estRows","task","access object","operator info"
"Projection_6","40.00","root","","gharchive_dev.stats_query_summary.id, gharchive_dev.stats_query_summary.query_name, gharchive_dev.stats_query_summary.digest_text, gharchive_dev.stats_query_summary.executed_at, unix_timestamp(gharchive_dev.stats_query_summary.executed_at)->Column#5"
"└─IndexLookUp_23","40.00","root","","limit embedded(offset:0, count:40)"
"  ├─Limit_22(Build)","40.00","cop[tikv]","","offset:0, count:40"
"  │ └─IndexFullScan_20","40.00","cop[tikv]","table:stats_query_summary, index:index_sqs_on_executed_at(executed_at)","keep order:true, desc"
"  └─TableRowIDScan_21(Probe)","40.00","cop[tikv]","table:stats_query_summary","keep order:false"