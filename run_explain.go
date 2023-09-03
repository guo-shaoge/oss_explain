package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"log"
)

func readSQLs(baseDir string) map[string]string {
	res := map[string]string{}
	dirs, err := ioutil.ReadDir(baseDir)
	if err != nil {
		panic(err)
	}
	for _, dir := range dirs {
		if !dir.IsDir() {
			panic(dir.Name() + " should be dir")
		}
		dirPath := filepath.Join(baseDir, dir.Name())
		fns, err := ioutil.ReadDir(dirPath)
		if err != nil {
			panic(err)
		}
		for _, fn := range fns {
			f, err := ioutil.ReadFile(filepath.Join(dirPath, fn.Name()))
			if err != nil {
				panic(err)
			}
			fs := "explain " + string(f)
			res[fn.Name()] = fs
		}
	}
	return res
}

func main() {
	genSQLDir := "/home/guojiangtao/mycode/go_code/oss_explain/generated_queries"
	explainOutDir := "/home/guojiangtao/mycode/go_code/oss_explain/explain_out"

	if _, err := os.Stat(explainOutDir); err == nil {
		fmt.Println("remove ", explainOutDir)
		if err = os.RemoveAll(explainOutDir); err != nil {
			log.Fatal(err)
		}
	}
	if err := os.Mkdir(explainOutDir, os.ModePerm); err != nil {
		log.Fatal(err)
	}

	sqls := readSQLs(genSQLDir)
	for n, s := range sqls {
		fmt.Println("handling " + n)
		out, err := exec.Command("mycli", "-u", "3EDFHZJX5iSzvfr.shadow-ro.c7", "-h", "gateway01.us-west-2.prod.aws.tidbcloud.com", "-P", "4000", "-D", "gharchive_dev",
			"--ssl-ca", "/etc/ssl/certs/ca-certificates.crt", "--ssl-verify-server-cert", "-p", "1bed8f53a6d716e6a5b5fb1ee28afbd7", "--execute", s, "--csv").CombinedOutput()
		if err != nil {
			log.Printf("err: %v. out: %v\n", err, string(out))
			// panic(err)
		}

		err = os.WriteFile(filepath.Join(explainOutDir, n), out, 0666)
		if err != nil {
			panic(err)
		}
	}
}
