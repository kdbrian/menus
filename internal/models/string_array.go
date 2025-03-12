package models

import "encoding/json"

type StringArray []string

func (s *StringArray) Scan(value interface{}) error {
	return json.Unmarshal(value.([]byte), s)
}

func (s StringArray) Value() (interface{}, error) {
	return json.Marshal(s)
}
