#!/bin/sh
echo "*** Generate docker image... ***"
docker build -t stress-api:latest .
echo "*** Start stress-api... ***"
docker run -d -p 5001:5000 --name stress-api stress-api:latest