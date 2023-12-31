"id","estRows","task","access object","operator info"
"Projection_21","20.00","root","","trim(lower(replace(gharchive_dev.github_users.organization, @, )))->Column#67, Column#65"
"└─TopN_24","20.00","root","","Column#65:desc, offset:0, count:20"
"  └─HashAgg_29","1541.76","root","","group by:Column#94, funcs:count(distinct Column#92)->Column#65, funcs:firstrow(Column#93)->gharchive_dev.github_users.organization"
"    └─Projection_125","1541.76","root","","gharchive_dev.github_events.actor_id, gharchive_dev.github_users.organization, trim(lower(replace(gharchive_dev.github_users.organization, @, )))->Column#94"
"      └─IndexJoin_40","1541.76","root","","inner join, inner:IndexLookUp_39, outer key:gharchive_dev.github_events.actor_login, inner key:gharchive_dev.github_users.login, equal cond:eq(gharchive_dev.github_events.actor_login, gharchive_dev.github_users.login)"
"        ├─TableReader_71(Build)","1541.76","root","partition:pull_request_event,issue_comment_event,issues_event,pull_request_review_comment_event,pull_request_review_event,commit_comment_event","MppVersion: 1, data:ExchangeSender_70"
"        │ └─ExchangeSender_70","1541.76","mpp[tiflash]","","ExchangeType: PassThrough"
"        │   └─HashJoin_67","1541.76","mpp[tiflash]","","inner join, equal:[eq(Column#71, Column#70)]"
"        │     ├─ExchangeReceiver_57(Build)","92.00","mpp[tiflash]","",""
"        │     │ └─ExchangeSender_56","92.00","mpp[tiflash]","","ExchangeType: Broadcast"
"        │     │   └─Projection_54","92.00","mpp[tiflash]","","cast(gharchive_dev.db_repos.id, double BINARY)->Column#71"
"        │     │     └─TableFullScan_55","92.00","mpp[tiflash]","table:db","keep order:false, stats:pseudo"
"        │     └─Projection_58(Probe)","231124175.98","mpp[tiflash]","","gharchive_dev.github_events.actor_id, gharchive_dev.github_events.actor_login, cast(gharchive_dev.github_events.repo_id, double BINARY)->Column#70"
"        │       └─Selection_60","231124175.98","mpp[tiflash]","","eq(gharchive_dev.github_events.event_year, 2021), in(gharchive_dev.github_events.type, ""IssuesEvent"", ""PullRequestEvent"", ""IssueCommentEvent"", ""PullRequestReviewCommentEvent"", ""CommitCommentEvent"", ""PullRequestReviewEvent"")"
"        │         └─TableFullScan_59","6349301992.00","mpp[tiflash]","table:ge","keep order:false, PartitionTableScan:true"
"        └─IndexLookUp_39(Probe)","1541.76","root","",""
"          ├─IndexRangeScan_36(Build)","38979.59","cop[tikv]","table:gu, index:index_gu_on_login_is_bot_organization_country_code(login, is_bot, organization_formatted, country_code)","range: decided by [eq(gharchive_dev.github_users.login, gharchive_dev.github_events.actor_login)], keep order:false"
"          └─Selection_38(Probe)","1541.76","cop[tikv]","","ne(gharchive_dev.github_users.organization, """"), ne(gharchive_dev.github_users.organization, ""none""), not(isnull(gharchive_dev.github_users.organization))"
"            └─TableRowIDScan_37","38979.59","cop[tikv]","table:gu","keep order:false"
