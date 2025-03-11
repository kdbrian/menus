package repositories

import (
	"github.com/kdbrian/menus/config"
	"github.com/kdbrian/menus/internal/models"
)

type MenuItemRepository struct{}

func (reciever *MenuItemRepository) AddMenuItem(menuItem *models.MenuItem) error {
	return config.DB.Create(menuItem).Error
}

func (reciever MenuItemRepository) GetMenuItems() ([]models.MenuItem, error) {
	var menuItems []models.MenuItem
	err := config.DB.Find(&menuItems).Error
	return menuItems, err
}

func (reciever *MenuItemRepository) UpdateMenuItem(menuItem *models.MenuItem) error {
	return config.DB.Save(menuItem).Error
}

func (reciever *MenuItemRepository) DeleteMenuItem(menuItem *models.MenuItem) error {
	return config.DB.Delete(menuItem).Error
}

func (reciever *MenuItemRepository) GetMenuItemById(id string) (models.MenuItem, error) {
	var menuItem models.MenuItem
	err := config.DB.Where("id = ?", id).First(&menuItem).Error
	return menuItem, err
}

func (reciever *MenuItemRepository) GetMenuItemByName(name string) (models.MenuItem, error) {
	var menuItem models.MenuItem
	err := config.DB.Where("name = ?", name).First(&menuItem).Error
	return menuItem, err
}

func (reciever MenuItemRepository) GetByMenuNameLike(name string) ([]models.MenuItem, error) {
	var menuItems []models.MenuItem
	err := config.DB.Where("name <> ?", name).Find(&menuItems).Error
	return menuItems, err
}
