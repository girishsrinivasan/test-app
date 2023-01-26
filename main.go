package main

import (
	"fmt"

	"github.com/girishsrinivasan/test-app/buildinfo"
)

func main() {

	fmt.Printf("Version %v \n", buildinfo.Version)

}
