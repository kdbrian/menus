package handler

import (
	"github.com/gofiber/fiber/v2"
	"github.com/kdbrian/menus/internal/models"
	"github.com/kdbrian/menus/internal/services"
)

type MenuItemHandler struct {
	services.MenuItemService
}

func (receiver MenuItemHandler) AddItemToMenu(c *fiber.Ctx) error {
	var item models.MenuItem
	var response models.ResponseBody
	if err := c.BodyParser(&item); err != nil {
		response = models.ResponseBody{
			Success: false,
			Meta: map[string]interface{}{
				"code":  fiber.StatusInternalServerError,
				"error": err,
			},
		}
	} else if err := receiver.MenuItemService.AddItemToMenu(item); err != nil {
		response = models.ResponseBody{
			Success: false,
			Meta: map[string]interface{}{
				"code":  fiber.StatusInternalServerError,
				"error": err,
			},
		}
	}

	return c.Status(fiber.StatusCreated).JSON(&response)
}
