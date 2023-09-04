"id","estRows","task","access object","operator info"
"Sort_22","770.88","root","","gharchive_dev.osdb_repos.group_name, Column#80:desc"
"└─TableReader_95","770.88","root","partition:pull_request_event","MppVersion: 1, data:ExchangeSender_94"
"  └─ExchangeSender_94","770.88","mpp[tiflash]","","ExchangeType: PassThrough"
"    └─Projection_25","770.88","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, gharchive_dev.github_events.actor_login, Column#80"
"      └─Projection_89","770.88","mpp[tiflash]","","Column#80, gharchive_dev.osdb_repos.group_name, gharchive_dev.github_events.actor_login"
"        └─HashAgg_87","770.88","mpp[tiflash]","","group by:gharchive_dev.github_events.actor_login, gharchive_dev.osdb_repos.group_name, funcs:count(gharchive_dev.github_events.pr_or_issue_id)->Column#80, funcs:firstrow(gharchive_dev.osdb_repos.group_name)->gharchive_dev.osdb_repos.group_name, funcs:firstrow(gharchive_dev.github_events.actor_login)->gharchive_dev.github_events.actor_login"
"          └─ExchangeReceiver_73","770.88","mpp[tiflash]","",""
"            └─ExchangeSender_72","770.88","mpp[tiflash]","","ExchangeType: HashPartition, Compression: FAST, Hash Cols: [name: gharchive_dev.osdb_repos.group_name, collate: utf8mb4_bin], [name: gharchive_dev.github_events.actor_login, collate: utf8mb4_bin]"
"              └─Projection_71","770.88","mpp[tiflash]","","gharchive_dev.github_events.actor_login, gharchive_dev.github_events.pr_or_issue_id, gharchive_dev.osdb_repos.group_name"
"                └─HashJoin_67","770.88","mpp[tiflash]","","inner join, equal:[eq(Column#82, Column#81)]"
"                  ├─ExchangeReceiver_41(Build)","46.00","mpp[tiflash]","",""
"                  │ └─ExchangeSender_40","46.00","mpp[tiflash]","","ExchangeType: Broadcast"
"                  │   └─Projection_38","46.00","mpp[tiflash]","","gharchive_dev.osdb_repos.group_name, cast(gharchive_dev.osdb_repos.id, double BINARY)->Column#82"
"                  │     └─TableFullScan_39","46.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"                  └─Projection_42(Probe)","37334412.15","mpp[tiflash]","","gharchive_dev.github_events.actor_login, gharchive_dev.github_events.pr_or_issue_id, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#81"
"                    └─Selection_44","37334412.15","mpp[tiflash]","","eq(gharchive_dev.github_events.action, ""opened""), eq(gharchive_dev.github_events.type, ""PullRequestEvent""), not(like(gharchive_dev.github_events.actor_login, ""%bot%"", 92))"
"                      └─TableFullScan_43","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"