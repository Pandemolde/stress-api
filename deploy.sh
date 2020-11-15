#!/bin/sh
eval "$(aws ecr get-login --no-include-email --region eu-west-1)"
echo "*** Generate docker image... ***"
docker build -t $ECR_URL/stress-api:latest .

echo "*** Update version ***"
docker tag $ECR_URL/stress-api:latest $ECR_URL/stress-api:0.0.1

echo "*** Push image to ECR ***"
docker push $ECR_URL/stress-api:latest
docker push $ECR_URL/stress-api:0.0.1