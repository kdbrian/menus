package models

import "gorm.io/gorm"

type Business struct {
	gorm.Model
	Location    string `json:"location"`
	Name        string `json:"name"`
	ContactInfo `json:"contact_info,omitempty"`
	Images      []string `json:"images"`
}
