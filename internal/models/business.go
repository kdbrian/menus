package models

import "gorm.io/gorm"

type Business struct {
	gorm.Model
	Location    string `json:"location" db:"location"`
	Name        string `json:"name" db:"name"`
	ContactInfo `json:"contact_info,omitempty" db:"contact_info" gorm:"embedded"`
	Images      StringArray `json:"images" db:"images" gorm:"type:jsonb"`
}
