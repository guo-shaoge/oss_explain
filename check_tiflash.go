package main

import (
	"regexp"
	"fmt"
	"io/ioutil"
	"path/filepath"
)

func checkFile(baseDir string, fn string) bool {
	f, err := ioutil.ReadFile(filepath.Join(baseDir, fn))
	if err != nil {
		panic(err)
	}
	matched, err := regexp.MatchString("tiflash", string(f))
	if err != nil {
		panic(err)
	}
	return matched
}

func main() {
	dir := "/home/guojiangtao/mycode/go_code/oss_explain/explain_out"
	fns, err := ioutil.ReadDir(dir)
	if err != nil {
		panic(err)
	}
	for _, fn := range fns {
		if checkFile(dir, fn.Name()) {
			fmt.Println(fn.Name())
		}
	}
}
