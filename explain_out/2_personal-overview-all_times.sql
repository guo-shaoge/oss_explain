"id","estRows","task","access object","operator info"
"Projection_115","1.00","root","","Column#281, ifnull(Column#285, 0)->Column#557, ifnull(Column#323, 0)->Column#558, ifnull(Column#362, 0)->Column#559, ifnull(Column#401, 0)->Column#560, ifnull(Column#439, 0)->Column#561, ifnull(Column#477, 0)->Column#562, ifnull(Column#515, 0)->Column#563, ifnull(Column#554, 0)->Column#564, ifnull(Column#555, 0)->Column#565"
"└─HashJoin_117","1.00","root","","left outer join, equal:[eq(Column#281, Column#556)]"
"  ├─HashJoin_118(Build)","1.00","root","","left outer join, equal:[eq(Column#281, Column#516)]"
"  │ ├─Projection_295(Build)","1.00","root","","5086433->Column#516, Column#515"
"  │ │ └─StreamAgg_320","1.00","root","","funcs:count(Column#712)->Column#515"
"  │ │   └─IndexReader_321","1.00","root","partition:pull_request_review_event","index:StreamAgg_301"
"  │ │     └─StreamAgg_301","1.00","cop[tikv]","","funcs:count(1)->Column#712"
"  │ │       └─IndexRangeScan_319","634.93","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""PullRequestReviewEvent"" ""created"",5086433 ""PullRequestReviewEvent"" ""created""], keep order:false"
"  │ └─HashJoin_120(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#478)]"
"  │   ├─Projection_258(Build)","1.00","root","","5086433->Column#478, Column#477"
"  │   │ └─StreamAgg_283","1.00","root","","funcs:count(Column#696)->Column#477"
"  │   │   └─IndexReader_284","1.00","root","partition:pull_request_event","index:StreamAgg_264"
"  │   │     └─StreamAgg_264","1.00","cop[tikv]","","funcs:count(1)->Column#696"
"  │   │       └─IndexRangeScan_282","634.93","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""PullRequestEvent"" ""opened"",5086433 ""PullRequestEvent"" ""opened""], keep order:false"
"  │   └─HashJoin_122(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#440)]"
"  │     ├─Projection_221(Build)","1.00","root","","5086433->Column#440, Column#439"
"  │     │ └─StreamAgg_246","1.00","root","","funcs:count(Column#680)->Column#439"
"  │     │   └─IndexReader_247","1.00","root","partition:issues_event","index:StreamAgg_227"
"  │     │     └─StreamAgg_227","1.00","cop[tikv]","","funcs:count(1)->Column#680"
"  │     │       └─IndexRangeScan_245","634.93","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""IssuesEvent"" ""opened"",5086433 ""IssuesEvent"" ""opened""], keep order:false"
"  │     └─HashJoin_124(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#402)]"
"  │       ├─Projection_208(Build)","1.00","root","","5086433->Column#402, Column#401"
"  │       │ └─HashAgg_209","1.00","root","","funcs:count(distinct gharchive_dev.github_events.repo_id)->Column#401"
"  │       │   └─HashJoin_211","2031.78","root","","CARTESIAN anti semi join, other cond:eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id)"
"  │       │     ├─CTEFullScan_218(Build)","6.02","root","CTE:repo_ids","data:CTE_0"
"  │       │     └─IndexReader_217(Probe)","2539.72","root","partition:push_event,pull_request_event,issues_event,pull_request_review_event","index:IndexRangeScan_216"
"  │       │       └─IndexRangeScan_216","2539.72","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""IssuesEvent"" ""opened"",5086433 ""IssuesEvent"" ""opened""], [5086433 ""PullRequestEvent"" ""opened"",5086433 ""PullRequestEvent"" ""opened""], [5086433 ""PullRequestReviewEvent"" ""created"",5086433 ""PullRequestReviewEvent"" ""created""], [5086433 ""PushEvent"" """",5086433 ""PushEvent"" """"], keep order:false"
"  │       └─HashJoin_126(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#363)]"
"  │         ├─Projection_175(Build)","1.00","root","","5086433->Column#363, Column#362"
"  │         │ └─HashAgg_176","1.00","root","","funcs:count(1)->Column#362"
"  │         │   └─IndexHashJoin_182","80.68","root","","inner join, inner:IndexReader_179, outer key:gharchive_dev.github_repos.repo_id, inner key:gharchive_dev.github_events.repo_id, equal cond:eq(gharchive_dev.github_repos.repo_id, gharchive_dev.github_events.repo_id)"
"  │         │     ├─HashAgg_185(Build)","4.81","root","","group by:gharchive_dev.github_repos.repo_id, funcs:firstrow(gharchive_dev.github_repos.repo_id)->gharchive_dev.github_repos.repo_id"
"  │         │     │ └─Selection_186","4.81","root","","not(isnull(gharchive_dev.github_repos.repo_id))"
"  │         │     │   └─CTEFullScan_187","6.02","root","CTE:repo_ids","data:CTE_0"
"  │         │     └─IndexReader_179(Probe)","80.68","root","partition:watch_event","index:IndexRangeScan_178"
"  │         │       └─IndexRangeScan_178","80.68","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range: decided by [eq(gharchive_dev.github_events.repo_id, gharchive_dev.github_repos.repo_id) eq(gharchive_dev.github_events.type, WatchEvent)], keep order:false"
"  │         └─HashJoin_128(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#324)]"
"  │           ├─Projection_139(Build)","1.00","root","","5086433->Column#324, Column#323"
"  │           │ └─HashAgg_141","1.00","root","","funcs:count(distinct gharchive_dev.github_events.repo_id)->Column#323"
"  │           │   └─IndexReader_149","63493.02","root","partition:watch_event","index:IndexRangeScan_148"
"  │           │     └─IndexRangeScan_148","63493.02","cop[tikv]","table:ge, index:index_ge_on_actor_id_type_action_created_at_repo_id_commits(actor_id, type, action, created_at, repo_id, push_distinct_size)","range:[5086433 ""WatchEvent"",5086433 ""WatchEvent""], keep order:false"
"  │           └─HashJoin_131(Probe)","1.00","root","","left outer join, equal:[eq(Column#281, Column#286)]"
"  │             ├─Projection_132(Build)","1.00","root","","5086433->Column#281"
"  │             │ └─TableDual_133","1.00","root","","rows:1"
"  │             └─Projection_134(Probe)","1.00","root","","5086433->Column#286, Column#285"
"  │               └─StreamAgg_136","1.00","root","","funcs:count(gharchive_dev.github_repos.repo_id)->Column#285"
"  │                 └─CTEFullScan_138","6.02","root","CTE:repo_ids","data:CTE_0"
"  └─Projection_332(Probe)","1.00","root","","5086433->Column#556, Column#554, Column#555"
"    └─StreamAgg_357","1.00","root","","funcs:sum(Column#724)->Column#554, funcs:sum(Column#725)->Column#555"
"      └─IndexReader_358","1.00","root","partition:pull_request_event","index:StreamAgg_338"
"        └─StreamAgg_338","1.00","cop[tikv]","","funcs:sum(gharchive_dev.github_events.additions)->Column#724, funcs:sum(gharchive_dev.github_events.deletions)->Column#725"
"          └─IndexRangeScan_356","6.35","cop[tikv]","table:ge, index:index_ge_on_creator_id_type_action_merged_created_at_add_del(creator_user_id, type, action, pr_merged, created_at, additions, deletions)","range:[5086433 ""PullRequestEvent"" ""closed"" 1,5086433 ""PullRequestEvent"" ""closed"" 1], keep order:false"
"CTE_0","6.02","root","","Non-Recursive CTE"
"└─Projection_101(Seed Part)","6.02","root","","gharchive_dev.github_repos.repo_id"
"  └─IndexReader_108","6.02","root","","index:IndexRangeScan_107"
"    └─IndexRangeScan_107","6.02","cop[tikv]","table:gr, index:index_gr_on_owner_id(owner_id)","range:[5086433,5086433], keep order:false"
