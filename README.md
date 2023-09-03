# 生成 query
python gen.py
会读取 /home/guojiangtao/work/ossinsight/configs/queries 目录中所有 template, 并根据 param.json 生成具体的 query
输出文件放在 ./generated_queries

# 拿到所有包含 tiflash 的 query
go run run_explain.go

会向 TiDB 集群发送 explain + sql , 结果放在 ./explain_out

# 检查哪些 sql 包含 tiflash 的计划
go run check_tiflash.go

将包含 tiflash 的计划的 sql 打印到 stdout
