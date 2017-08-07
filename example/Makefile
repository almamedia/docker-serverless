# docker image name & tag
NAME = conmio/serverless
TAG = latest

# name of the service
SERVICE_NAME = exampleService

# default stage
ENV = dev

default:
	@echo "Usage:\n\
	 'make shell' - open bash shell\n\
	 'make create' - creates a new service '$(SERVICE_NAME)'\n\
	 'make deploy' - deploy the service (dev stage)\n\
	 'make deploy-prod' - deploy the service (prod stage)\n\
	 'make remove' - remove the deployed service (dev stage)\n\
	"

deploy-prod: ENV=prod
deploy-prod: deploy

shell:
	docker run --rm -it \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/app \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		$(NAME):$(TAG) bash

create:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/app \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		$(NAME):$(TAG) sls create --template aws-nodejs --path $(SERVICE_NAME)

deploy:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/app \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /app/$(SERVICE_NAME) \
		$(NAME):$(TAG) sls deploy -s $(ENV)

remove:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/app \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /app/$(SERVICE_NAME) \
		$(NAME):$(TAG) sls remove -s $(ENV)

.PHONY: shell create deploy deploy-prod remove
