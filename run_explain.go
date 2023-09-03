package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
)

func readSQLs(baseDir string) map[string]string {
	res := map[string]string{}
	fns, err := ioutil.ReadDir(baseDir)
	if err != nil {
		panic(err)
	}
	for _, fn := range fns {
		f, err := ioutil.ReadFile(filepath.Join(baseDir, fn.Name()))
		if err != nil {
			panic(err)
		}
		fs := "explain " + string(f)
		res[fn.Name()] = fs
	}
	return res
}

func main() {
	genSQLDir := "/home/guojiangtao/mycode/go_code/oss_explain/generated_queries"
	explainOutDir := "/home/guojiangtao/mycode/go_code/oss_explain/explain_out"
	sqls := readSQLs(genSQLDir)
	for n, s := range sqls {
		fmt.Println("handling " + n)
		out, err := exec.Command("mycli", "-u", "3EDFHZJX5iSzvfr.shadow-ro.c7", "-h", "gateway01.us-west-2.prod.aws.tidbcloud.com", "-P", "4000", "-D", "gharchive_dev",
			"--ssl-ca", "/etc/ssl/certs/ca-certificates.crt", "--ssl-verify-server-cert", "-p", "1bed8f53a6d716e6a5b5fb1ee28afbd7", "--execute", s, "--csv").CombinedOutput()
		if err != nil {
			panic(err)
		}

		err = os.WriteFile(filepath.Join(explainOutDir, n), out, 0666)
		if err != nil {
			panic(err)
		}
	}
}
