package main

import (
	"log"
	"net/http"

	"github.com/osisupermoses/log-service/data"
)

type JsonPayload struct {
	Name string `json:"name"`
	Data string `json:"data"`
}

func (app *Config) WriteLog(w http.ResponseWriter, r *http.Request) {
	// read json into var
	var requestPayload JsonPayload
	_ = app.readJSON(w, r, &requestPayload)

	// insert data
	event := data.LogEntry{
		Name: requestPayload.Name,
		Data: requestPayload.Data,
	}

	err := app.Models.LogEntry.Insert(event)
	if err != nil {
		log.Println(err)
		app.errorJSON(w, err)
		return
	}

	resp := jsonResponse{
		Error: false,
		Message: "logged",
	}

	app.writeJSON(w, http.StatusAccepted, resp)
}