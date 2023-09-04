# 生成 query
python gen.py
会读取 /home/guojiangtao/work/ossinsight/configs/queries (git clone git@github.com:pingcap/ossinsight.git) 目录中所有 template, 并根据 param.json 生成具体的 query
输出文件放在 ./generated_queries

# 拿到所有 query 的 explain 结果
go run run_explain.go &> explain_cmd_out

会向 TiDB 集群发送 explain + sql , 结果放在 ./explain_out

# 检查哪些 query 的计划包含 tiflash
go run check_tiflash.go &> ap_sql

将包含 tiflash 的计划的 sql 打印到 stdout

# tiflash query 频率分类
1. bot*: once
2. events
    1. events-dailiy: daily
    2. events-history: monthly
    3. events-hourly: hourly
    4. events_total: 0 * * * * * (per min)
    5. events-per-year: 0 0 1 1 * (per year)
3. live:
    1. live-time-base-information-hourly: 30 */2 * * * * (every 2 minute, exec at 30 sec)
    2. live-time-top-developers-by-prs-daily: hourly
    3. live-time-top-repos-by-prs-daily: hourly
4. archive:
    1. archive-2021-bottom10-by-yoy: once
    2. archive-2021-top10-by_prs: once
    3. archive-2021-top10-by-regions: once
    4. archive-2021-top10-by-stars: once
    5. archive-2021-top20-by-companies: once
    6. archive-2021-top20-by-developers: once
    7. archive-2021-top20-by-stars-yoy: once
    8. archive-2021-top10-star-racing: once
    9. archive-2021-top5-by-languages: once
5. trending-repos: daily
