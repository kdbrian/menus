package main

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"github.com/joho/godotenv"
	. "github.com/kdbrian/menus/config"
	"log"
	"os"
)

func main() {

	//load env
	godotenv.Load(".env.local")

	//connect datasource
	if err := Connect(); err != nil {
		log.Fatal("failed to connect to DB : ", err)
		return
	}

	//setup app
	port := os.Getenv("PORT")
	app := fiber.New()

	//listen
	log.Fatal(app.Listen(fmt.Sprintf(":%s", port)))

}
