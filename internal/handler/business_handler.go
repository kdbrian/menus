package handler

import (
	"fmt"
	"github.com/gofiber/fiber/v2"
	"github.com/kdbrian/menus/config"
	. "github.com/kdbrian/menus/internal/dto"
	"github.com/kdbrian/menus/internal/models"
	"github.com/kdbrian/menus/internal/services"
	"log"
	"strconv"
)

type BusinessHandler struct {
	businessService services.BusinessService
}

func (receiver BusinessHandler) AddBusiness(c *fiber.Ctx) error {
	var (
		businessDto BusinessDto
		business    models.Business
		resp        models.ResponseBody
	)

	if c.BodyParser(&businessDto) != nil {
		resp = models.ResponseBody{
			Success: false,
			Meta: map[string]interface{}{
				"code":    fiber.StatusBadRequest,
				"message": "Invalid request body",
			},
		}
	}

	business = models.Business{
		Location:    businessDto.Location,
		Name:        businessDto.Name,
		ContactInfo: businessDto.ContactInfo,
		Images:      businessDto.Images,
	}

	addBusiness, err := receiver.businessService.AddBusiness(business)

	if err != nil {
		resp = models.ResponseBody{
			Success: false,
			Meta: map[string]interface{}{
				"error": err.Error(),
				"code":  fiber.StatusBadRequest,
			},
		}
	} else {
		resp = models.ResponseBody{
			Success: true,
			Data:    addBusiness,
		}
	}

	return c.Status(200).JSON(&resp)
}

func (receiver BusinessHandler) GetBusinesses(c *fiber.Ctx) error {
	var businesses []models.Business
	config.DB.Find(&businesses)
	resp := models.ResponseBody{
		Success: true,
		Data:    businesses,
		Meta: map[string]interface{}{
			"count": len(businesses),
		},
	}

	return c.Status(200).JSON(&resp)
}

func (receiver BusinessHandler) GetBusiness(c *fiber.Ctx) error {
	id := c.Params("id")
	idInt, _ := strconv.Atoi(id)
	var business models.Business
	config.DB.Where("ID = ?", idInt).First(business, id)
	var resp models.ResponseBody

	if &business != nil {
		resp = models.ResponseBody{
			Success: true,
			Data:    business,
		}
	} else {
		resp = models.ResponseBody{
			Success: false,
			Meta: map[string]interface{}{
				"code":    404,
				"message": fmt.Sprintf("Business with ID : (%s) not found", id),
			},
		}
	}
	return c.Status(200).JSON(&resp)
}
