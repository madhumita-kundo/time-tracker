#!/bin/bash
docker container rm --force time-tracker
docker build -t timetracker-test:${BUILD_NUMBER} .
docker container run --name time-tracker -d -p 8888:8080 timetracker-test:${BUILD_NUMBER}
