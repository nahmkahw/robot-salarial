package main

import "github.com/gin-gonic/gin"

func main() {
	router := gin.Default()
	router.Static("/", "./results")
	router.Run(":9090")
}
