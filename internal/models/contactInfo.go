package models

type ContactInfo struct {
	LocationName string `json:"location_name"`
	Address      string `json:"address"`
	ZipCode      string `json:"zip_code"`
	LatLng       `json:"lat_lng"`
}
