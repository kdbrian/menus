package repositories

import (
	"github.com/kdbrian/menus/config"
	"github.com/kdbrian/menus/internal/models"
)

type BusinessRepository struct{}

func (r *BusinessRepository) GetBusinesses() ([]models.Business, error) {
	var businesses []models.Business
	err := config.DB.Find(&businesses).Error
	return businesses, err
}

func (r BusinessRepository) AddBusiness(b models.Business) (models.Business, error) {
	err := config.DB.Create(&b).Error
	return b, err
}
