#!/bin/bash

if [ -f .env ]; then
  source .env
else
  echo ".env file not found. Exiting."
  exit 1 
fi

aws ecr create-repository --repository-name $REPO_NAME --region $REGION 2>/dev/null || echo "Repo exists, skipping creation."

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

docker tag $IMAGE_NAME:$IMAGE_TAG $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

echo "Image pushed successfully!"

