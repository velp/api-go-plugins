package main

import (
	"plugin"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	plugin, err := plugin.Open("./plugin.so")
	if err != nil {
		panic(err)
	}
	handler, err := plugin.Lookup("Handler")
	if err != nil {
		panic(err)
	}
	// Load handler from plugin
	r.GET("/handler", handler.(func(c *gin.Context)))
	// Run server
	r.Run(":8080")
}