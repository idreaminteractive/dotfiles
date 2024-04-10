package main

import (
	"fmt"
	"net/http"

	"github.com/a-h/templ"
)

func main() {
	component := hello("John")
	fmt.Print("jdasd")
	fmt.Print("hey")
	http.Handle("/", templ.Handler(component))

	fmt.Println("Listening on :3000")
	http.ListenAndServe(":3000", nil)
}


func IamAfunc(){

	fmt.Print("hey now")
}
