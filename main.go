package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	. "github.com/kdbrian/menus/config"
	"github.com/kdbrian/menus/internal/routes"
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
	routes.SetUpRoutes(app)
	log.Fatal(app.Listen(fmt.Sprintf(":%s", port)))

}
