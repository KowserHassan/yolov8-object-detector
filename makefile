ECR_REPO=yolov8ai-app
IMAGE_NAME=yolov8ai-app
TAG=latest
AWS_REGION=eu-west-2

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

tag:
	docker tag $(IMAGE_NAME):$(TAG) $(ECR_REPO):$(TAG)

push:
	docker push $(ECR_REPO):$(TAG)

deploy:
	aws ecs update-service \
		--cluster your-cluster-name \
		--service your-service-name \
		--force-new-deployment \
		--region $(AWS_REGION)

all: build tag push deploy
