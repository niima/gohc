package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("Web server starting")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Running")
	})

	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
