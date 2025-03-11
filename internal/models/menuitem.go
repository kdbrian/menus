package models

import "gorm.io/gorm"

type MenuItem struct {
	gorm.Model
	Name   string   `json:"name"`
	Price  float64  `json:"price"`
	Images []string `json:"images"`
}
