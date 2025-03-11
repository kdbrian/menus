package routes

import (
	"github.com/gofiber/fiber/v2"
	"github.com/kdbrian/menus/internal/handler"
)

func SetUpRoutes(app *fiber.App) {
	businessHandler := handler.BusinessHandler{}

	api := app.Group("/api")
	api.Get("/business/:id", businessHandler.GetBusiness)
	api.Get("/businesses", businessHandler.GetBusinesses)
}
