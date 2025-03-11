package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	. "github.com/kdbrian/menus/config"
	"log"
	"os"
)

func main() {

	//connect datasource
	if err := Connect(); err != nil {
		log.Fatal("failed to connect to DB : ", err)
		return
	}

	port := os.Getenv("PORT")
	app := fiber.New()
	api := fiber.New()
	app.Mount("/api", api) //mounting the api
	log.Fatal(app.Listen(fmt.Sprintf(":%s", port)))

}
