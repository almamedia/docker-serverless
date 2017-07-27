Example settings:

	SERVERLESS_PROJECT=~/my_project_folder
	SERVICE_NAME=example
---
Create a new service:
```
docker run --rm \
 -v $HOME/.aws:/home/user/.aws:ro \
 -v $SERVERLESS_PROJECT:/home/user/project \
 -e LOCAL_USER_ID=`id -u $USER`\
 -w /home/user/project \
  conmio/serverless sls create --template aws-nodejs --path $SERVICE_NAME
```
---
Deploy:
```
docker run --rm \
 -v $HOME/.aws:/home/user/.aws:ro \
 -v $SERVERLESS_PROJECT:/home/user/project \
 -e LOCAL_USER_ID=`id -u $USER`\
 -w /home/user/project/$SERVICE_NAME \
  conmio/serverless bash -c "npm install;sls deploy"
  ```
  ---
Shell:
```
docker run --rm -it \
 -v $HOME/.aws:/home/user/.aws:ro \
 -v $SERVERLESS_PROJECT:/home/user/project \
 -e LOCAL_USER_ID=`id -u $USER`\
 -w /home/user/project \
  conmio/serverless
 ```
---
Files written to volume from within the container will be owned by the user running the container.
