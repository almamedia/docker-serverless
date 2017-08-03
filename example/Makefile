# docker image name & tag
NAME = conmio/serverless
TAG = latest

# project's folder name inside the container
PROJECT_FOLDER = app

# name of the service
SERVICE_NAME = hello

# default stage
ENV = dev

default:
	@echo "Usage:\n\
	 'make shell' - open bash shell\n\
	 'make create' - creates a new service '$(SERVICE_NAME)'\n\
	 'make deploy' - deploy the service (dev stage)\n\
	 'make deploy-prod' - deploy the service (prod stage)\n\
	 'make remvoe' - remove the deployed service (dev stage)\n\
	"

deploy-prod: ENV=prod
deploy-prod: deploy

shell:
	docker run --rm -it \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/home/user/$(PROJECT_FOLDER) \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /home/user/$(PROJECT_FOLDER) \
		$(NAME):$(TAG) bash

create:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/home/user/$(PROJECT_FOLDER) \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /home/user/$(PROJECT_FOLDER) \
		$(NAME):$(TAG) sls create --template aws-nodejs --path $(SERVICE_NAME)

deploy:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/home/user/$(PROJECT_FOLDER) \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /home/user/$(PROJECT_FOLDER)/$(SERVICE_NAME) \
		$(NAME):$(TAG) sls deploy -s $(ENV)

remove:
	docker run --rm \
		-v $$HOME/.aws:/home/user/.aws:ro \
		-v $$(pwd):/home/user/$(PROJECT_FOLDER) \
		-e LOCAL_USER_ID=`id -u $$USER` \
		-e AWS_PROFILE=$$AWS_PROFILE \
		-w /home/user/$(PROJECT_FOLDER)/$(SERVICE_NAME) \
		$(NAME):$(TAG) sls remove -s $(ENV)

.PHONY: shell create deploy deploy-prod remove
