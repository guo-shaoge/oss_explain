"id","estRows","task","access object","operator info"
"Projection_9","1.00","root","","gharchive_dev.collections.id, any_value(gharchive_dev.collections.name)->Column#10"
"└─StreamAgg_17","1.00","root","","group by:gharchive_dev.collections.id, funcs:firstrow(gharchive_dev.collections.id)->gharchive_dev.collections.id, funcs:firstrow(gharchive_dev.collections.name)->gharchive_dev.collections.name"
"  └─MergeJoin_89","0.14","root","","inner join, left key:gharchive_dev.collection_items.collection_id, right key:gharchive_dev.collections.id"
"    ├─TableReader_56(Build)","83.00","root","","data:TableFullScan_55"
"    │ └─TableFullScan_55","83.00","cop[tikv]","table:c","keep order:true"
"    └─IndexReader_54(Probe)","0.14","root","","index:Selection_53"
"      └─Selection_53","0.14","cop[tikv]","","eq(gharchive_dev.collection_items.repo_id, 41986369)"
"        └─IndexFullScan_52","78.92","cop[tikv]","table:ci, index:index_ci_on_collection_id_repo_id(collection_id, repo_id)","keep order:true"
