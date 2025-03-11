package services

import (
	"github.com/kdbrian/menus/internal/models"
	"github.com/kdbrian/menus/internal/repositories"
)

type MenuItemService struct {
	repositories.MenuItemRepository
}

func (reciever *MenuItemService) AddItemToMenu(menuItem models.MenuItem) error {
	return reciever.AddMenuItem(&menuItem)
}
