"id","estRows","task","access object","operator info"
"Projection_7","1.00","root","","gharchive_dev.github_events.actor_id, Mini256->Column#35"
"└─Limit_9","1.00","root","","offset:0, count:1"
"  └─IndexLookUp_23","1.00","root","partition:all",""
"    ├─IndexRangeScan_19(Build)","1.50","cop[tikv]","table:github_events, index:index_ge_on_actor_login_type(actor_login, type)","range:[""Mini256"",""Mini256""], keep order:false"
"    └─Limit_22(Probe)","1.00","cop[tikv]","","offset:0, count:1"
"      └─Selection_21","1.00","cop[tikv]","","ne(gharchive_dev.github_events.actor_id, 0)"
"        └─TableRowIDScan_20","1.50","cop[tikv]","table:github_events","keep order:false"