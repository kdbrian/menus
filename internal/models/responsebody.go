package models

type ResponseBody struct {
	Success bool                   `json:"success"`
	Data    interface{}            `json:"data,omitempty"`
	Meta    map[string]interface{} `json:"meta,omitempty"`
}
