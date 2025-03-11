package models

import "gorm.io/gorm"

type Menu struct {
	gorm.Model
	BusinessID int64                  `json:"business_id"`
	Items      []MenuItem             `json:"items"`
	Meta       map[string]interface{} `json:"meta"`
}
