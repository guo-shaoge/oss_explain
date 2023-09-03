import os
import json
import shutil

out_dir = '/home/guojiangtao/mycode/go_code/oss_explain/generated_queries'
query_dir = "/home/guojiangtao/work/ossinsight/configs/queries"
# out_dir = './testgenerated_queries'
# query_dir = "./testqueries"

if os.path.exists(out_dir):
    print("remove " + out_dir)
    shutil.rmtree(out_dir)

def gen2(idx, ori_name, name, sql, params):
    if idx == len(params):
        my_out_dir = os.path.join(out_dir, ori_name)
        if not os.path.exists(my_out_dir):
            os.makedirs(my_out_dir)
        fp = open(os.path.join(my_out_dir, str(idx) + '_' + name + '.sql'), 'w')
        fp.write(sql)
        fp.close()
        return
    
    if 'enums' not in params[idx]:
        gen2(idx+1, ori_name, name, sql, params)
        return
    
    if type(params[idx]['enums']) == str:
        e = params[idx]['enums']
        t = e
        if t == 'repo_subset' or t == 'collectionIds':
            # ignore replace
            gen2(idx+1, ori_name, name+"-"+e, sql, params)
        else:
            gen2(idx+1, ori_name, name+"-"+e, sql.replace(params[idx]['replaces'], t), params)
    else:
        for i in range(len(params[idx]['enums'])):
            e = params[idx]['enums'][i]
            t = ''
            if 'template' not in params[idx]:
                t = e
            else:
                if e not in params[idx]['template']:
                    continue
                t = params[idx]['template'][e]
            if t == 'repo_subset' or t == 'collectionIds':
                # ignore replace
                gen2(idx+1, ori_name, name+"-"+e, sql, params)
            else:
                gen2(idx+1, ori_name, name+"-"+e, sql.replace(params[idx]['replaces'], t), params)

def gen(name, template_sql, params_json):
    params = json.loads(params_json)
    params = params['params']
    gen2(0, name, name, template_sql, params)

def gen_sql(path, sql_name):
    print(sql_name)
    template_sql_file = os.path.join(path, 'template.sql')
    param_file = os.path.join(path, 'params.json')
    if not os.path.exists(template_sql_file):
        print(template_sql_file + "not exists")
        os.exit(1)
    if not os.path.exists(param_file):
        print(param_file + "not exists")
        os.exit(1)
    template_sql = open(template_sql_file).read()
    param_sql = open(param_file).read()
    gen(sql_name, template_sql, param_sql)

def handle_query_dir(query_dir):
    if os.path.exists(query_dir):
        for root, dirs, files in os.walk(query_dir):
            for mydir in dirs: # mydir: queries/analyze-issue-creators-company
                new_path = os.path.join(root, mydir)
                if os.path.exists(os.path.join(new_path, 'template.sql')):
                    gen_sql(new_path, mydir)
    else:
        print(query_dir + " doesn't exists")
        os.exit(1);

handle_query_dir(query_dir)
