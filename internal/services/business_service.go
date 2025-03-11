package services

import (
	"github.com/kdbrian/menus/internal/models"
	"github.com/kdbrian/menus/internal/repositories"
)

type BusinessService struct {
	repo repositories.BusinessRepository
}

func (service *BusinessService) GetBusinesses() ([]models.Business, error) {
	return service.repo.GetBusinesses()
}

func (service *BusinessService) AddBusiness() (models.Business, error) {
	return service.repo.GetBusinesses()
}
