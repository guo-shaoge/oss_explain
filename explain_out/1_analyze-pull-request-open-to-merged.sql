"id","estRows","task","access object","operator info"
"Sort_129","19480091163893172273152.00","root","","Column#259"
"└─Projection_131","19480091163893172273152.00","root","","Column#259, Column#263, Column#268, Column#276, Column#284, Column#264"
"  └─HashJoin_132","19480091163893172273152.00","root","","left outer join, equal:[eq(Column#259, Column#283)]"
"    ├─Selection_144(Build)","67635112.59","root","","eq(cast(Column#285, decimal(20,0) BINARY), round(mul(cast(Column#286, decimal(20,0) BINARY), 0.75))), not(isnull(Column#283))"
"    │ └─CTEFullScan_145","84543890.74","root","CTE:tdiff_with_rank AS tr","data:CTE_3"
"    └─HashJoin_134(Probe)","294974673499097088.00","root","","left outer join, equal:[eq(Column#259, Column#275)]"
"      ├─Selection_142(Build)","67635112.59","root","","eq(cast(Column#277, decimal(20,0) BINARY), round(mul(cast(Column#278, decimal(20,0) BINARY), 0.5))), not(isnull(Column#275))"
"      │ └─CTEFullScan_143","84543890.74","root","CTE:tdiff_with_rank AS tr","data:CTE_3"
"      └─HashJoin_136(Probe)","4466614518066.23","root","","left outer join, equal:[eq(Column#259, Column#267)]"
"        ├─Selection_140(Build)","67635112.59","root","","eq(cast(Column#269, decimal(20,0) BINARY), round(mul(cast(Column#270, decimal(20,0) BINARY), 0.25))), not(isnull(Column#267))"
"        │ └─CTEFullScan_141","84543890.74","root","CTE:tdiff_with_rank AS tr","data:CTE_3"
"        └─Selection_138(Probe)","67635112.59","root","","eq(Column#261, 1)"
"          └─CTEFullScan_139","84543890.74","root","CTE:tdiff_with_rank AS tr","data:CTE_3"
"CTE_3","84543890.74","root","","Non-Recursive CTE"
"└─Projection_73(Seed Part)","84543890.74","root","","Column#220, Column#222, Column#233, Column#234, Column#232, Column#230"
"  └─Selection_75","84543890.74","root","","or(or(eq(Column#233, 1), and(eq(cast(Column#233, decimal(20,0) BINARY), round(mul(cast(Column#234, decimal(20,0) BINARY), 0.25))), not(isnull(Column#220)))), or(and(eq(cast(Column#233, decimal(20,0) BINARY), round(mul(cast(Column#234, decimal(20,0) BINARY), 0.5))), not(isnull(Column#220))), and(eq(cast(Column#233, decimal(20,0) BINARY), round(mul(cast(Column#234, decimal(20,0) BINARY), 0.75))), not(isnull(Column#220)))))"
"    └─Window_77","105679863.42","root","","count(1)->Column#234 over(partition by Column#220)"
"      └─Window_78","105679863.42","root","","row_number()->Column#233 over(partition by Column#220 order by Column#221 rows between current row and current row)"
"        └─Window_81","105679863.42","root","","first_value(Column#231)->Column#232 over(partition by Column#220 order by Column#221 range between unbounded preceding and current row)"
"          └─Sort_125","105679863.42","root","","Column#220, Column#221"
"            └─Projection_85","105679863.42","root","","Column#220, Column#222, Column#221, Column#230, div(div(cast(Column#221, decimal(20,0) BINARY), 60), 60)->Column#231"
"              └─Shuffle_124","105679863.42","root","","execution info: concurrency:5, data sources:[Projection_88]"
"                └─Window_87","105679863.42","root","","first_value(Column#229)->Column#230 over(partition by Column#220 order by Column#221 desc range between unbounded preceding and current row)"
"                  └─Sort_119","105679863.42","root","","Column#220, Column#221:desc"
"                    └─Projection_88","105679863.42","root","","Column#220, div(div(cast(minus(unix_timestamp(gharchive_dev.github_events.created_at), unix_timestamp(gharchive_dev.github_events.created_at)), decimal(20,0) BINARY), 60), 60)->Column#222, minus(unix_timestamp(gharchive_dev.github_events.created_at), unix_timestamp(gharchive_dev.github_events.created_at))->Column#221, div(div(cast(minus(unix_timestamp(gharchive_dev.github_events.created_at), unix_timestamp(gharchive_dev.github_events.created_at)), decimal(20,0) BINARY), 60), 60)->Column#229"
"                      └─HashJoin_91","105679863.42","root","","inner join, equal:[eq(gharchive_dev.github_events.number, gharchive_dev.github_events.number)], other cond:gt(gharchive_dev.github_events.created_at, gharchive_dev.github_events.created_at)"
"                        ├─Projection_109(Build)","27407.65","root","","gharchive_dev.github_events.number, date_format(gharchive_dev.github_events.created_at, %Y-%m-01)->Column#220, gharchive_dev.github_events.created_at"
"                        │ └─IndexReader_116","34259.56","root","partition:pull_request_event","index:IndexRangeScan_115"
"                        │   └─IndexRangeScan_115","34259.56","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"" ""closed"",41986369 ""PullRequestEvent"" ""closed""], keep order:false"
"                        └─IndexReader_108(Probe)","46668.02","root","partition:pull_request_event","index:IndexRangeScan_107"
"                          └─IndexRangeScan_107","46668.02","cop[tikv]","table:ge, index:index_ge_on_repo_id_type_action_created_at(repo_id, type, action, created_at, pr_merged, actor_login, number, push_distinct_size, push_size, additions, deletions)","range:[41986369 ""PullRequestEvent"" ""opened"",41986369 ""PullRequestEvent"" ""opened""], keep order:false"
