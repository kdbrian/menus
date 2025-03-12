package dto

import "github.com/kdbrian/menus/internal/models"

type BusinessDto struct {
	Location           string `json:"location", db:"location" :"location"`
	Name               string `json:"name", db:"name" :"name"`
	models.ContactInfo `json:"contact_info,omitempty", db:"contact_info"`
	Images             []string `json:"images", db:"images"`
}
