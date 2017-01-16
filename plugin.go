package main

import (
	"github.com/gin-gonic/gin"
)

func Handler(c *gin.Context) {
	c.JSON(200, gin.H{"msg": "plugin.Handler() call"})
}
