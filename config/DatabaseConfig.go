package config

import (
	"errors"
	"fmt"
	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"log"
	"os"
	"strconv"
)

const (
	POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB, POSTGRES_DB_PORT, POSTGRES_DB_HOST = "POSTGRES_USER", "POSTGRES_PASSWORD", "POSTGRES_DB", "POSTGRES_DB_PORT", "POSTGRES_DB_HOST"
)

var DB *gorm.DB

type DatabaseConfig struct {
	Host, User, Password, DbName string
	Port                         int
}

func (receiver DatabaseConfig) parse() (bool, error) {

	if str := strconv.Itoa(receiver.Port); len(str) <= 0 {
		return false, errors.New("invalid Db Port")
	}

	if len(receiver.DbName) <= 0 {
		return false, errors.New("invalid Db Name")
	}

	return true, nil
}

func (receiver DatabaseConfig) Dsn() string {
	return fmt.Sprintf("user=%s password=%s dbname=%s host=%s port=%d sslmode=disable", receiver.User, receiver.Password, receiver.DbName, receiver.Host, receiver.Port)
}

func Connect() error {

	godotenv.Load(".env.local")

	var dbHost, dbPort, dbName, dbUser, dbPassword = os.Getenv(POSTGRES_DB_HOST),
		os.Getenv(POSTGRES_DB_PORT),
		os.Getenv(POSTGRES_DB),
		os.Getenv(POSTGRES_USER),
		os.Getenv(POSTGRES_PASSWORD)

	dbport, _ := strconv.Atoi(dbPort)
	dbConfig := DatabaseConfig{
		Host:     dbHost,
		User:     dbUser,
		Password: dbPassword,
		DbName:   dbName,
		Port:     dbport,
	}

	if ok, err := dbConfig.parse(); !ok {
		log.Fatal(err)
		return nil
	}

	dsn := dbConfig.Dsn()
	log.Println("dsn = ", dsn)

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		return err
	}

	DB = db

	return nil
}
