#!/bin/bash

# Stop any running containers and remove them with docker-compose
#docker-compose down

# Rebuild, recreate, and start the container with docker-compose in detached mode
#docker-compose up --force-recreate --build -d

# Build the Docker image and tag it for pushing to Docker Hub
docker build -t mushudevops/automationwithjenkins ./Automation.Jenkins/.

# Push the newly built image to Docker Hub
#docker push mushudevops/automationwithjenkins

#***********************************************************
# Optional: Run a separate container from the pushed image (if needed)
# Uncomment the line below if you want to run an additional container independently
#docker run -d -p 44301:80 --name c_automationwithjenkins mushudevops/automationwithjenkins