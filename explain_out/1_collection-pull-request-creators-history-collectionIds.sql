"id","estRows","task","access object","operator info"
"Sort_51","0.37","root","","Column#95"
"└─Projection_53","0.37","root","","gharchive_dev.collection_items.repo_id, gharchive_dev.collection_items.repo_name, Column#95, Column#104"
"  └─Projection_55","0.37","root","","Column#95, Column#104, gharchive_dev.collection_items.repo_name, gharchive_dev.collection_items.repo_id"
"    └─MergeJoin_58","0.37","root","","inner join, left key:gharchive_dev.collection_items.repo_id, right key:gharchive_dev.github_events.repo_id"
"      ├─Selection_81(Build)","10.73","root","","eq(Column#103, 1)"
"      │ └─Window_83","13.41","root","","count(1)->Column#104 over(partition by gharchive_dev.github_events.repo_id order by Column#95 range between unbounded preceding and current row)"
"      │   └─Window_84","13.41","root","","row_number()->Column#103 over(partition by gharchive_dev.github_events.repo_id, Column#95 rows between current row and current row)"
"      │     └─Sort_200","13.41","root","","gharchive_dev.github_events.repo_id, Column#95"
"      │       └─Selection_89","13.41","root","","eq(Column#97, 1)"
"      │         └─Shuffle_199","16.76","root","","execution info: concurrency:5, data sources:[Projection_124]"
"      │           └─Window_92","16.76","root","","row_number()->Column#97 over(partition by gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_login order by gharchive_dev.github_events.created_at rows between current row and current row)"
"      │             └─Sort_195","16.76","root","","gharchive_dev.github_events.repo_id, gharchive_dev.github_events.actor_login, gharchive_dev.github_events.created_at"
"      │               └─Projection_124","16.76","root","","gharchive_dev.github_events.repo_id, date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#95, gharchive_dev.github_events.actor_login, gharchive_dev.github_events.created_at"
"      │                 └─IndexHashJoin_138","16.76","root","","inner join, inner:IndexReader_135, outer key:gharchive_dev.collection_items.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.collection_items.repo_id, gharchive_dev.github_events.repo_id)"
"      │                   ├─StreamAgg_158(Build)","1.00","root","","group by:gharchive_dev.collection_items.repo_id, funcs:firstrow(gharchive_dev.collection_items.repo_id)->gharchive_dev.collection_items.repo_id"
"      │                   │ └─IndexReader_149","0.46","root","","index:IndexRangeScan_148"
"      │                   │   └─IndexRangeScan_148","0.46","cop[tikv]","table:ci, index:index_ci_on_collection_id_repo_id(collection_id, repo_id)","range:[10001,10001], keep order:true"
"      │                   └─IndexReader_135(Probe)","16.76","root","partition:pull_request_event","index:IndexRangeScan_134"
"      │                     └─IndexRangeScan_134","16.76","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.collection_items.repo_id) eq(gharchive_dev.github_events.type, PullRequestEvent) eq(gharchive_dev.github_events.action, opened)], keep order:false"
"      └─Projection_80(Probe)","0.46","root","","gharchive_dev.collection_items.collection_id, gharchive_dev.collection_items.repo_name, gharchive_dev.collection_items.repo_id"
"        └─IndexLookUp_79","0.46","root","",""
"          ├─IndexRangeScan_77(Build)","0.46","cop[tikv]","table:ci, index:index_ci_on_collection_id_repo_id(collection_id, repo_id)","range:[10001,10001], keep order:true"
"          └─TableRowIDScan_78(Probe)","0.46","cop[tikv]","table:ci","keep order:false"