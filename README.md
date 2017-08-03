[![](https://images.microbadger.com/badges/version/conmio/serverless.svg)](https://microbadger.com/images/conmio/serverless "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/conmio/serverless.svg)](https://microbadger.com/images/conmio/serverless "Get your own image badge on microbadger.com")
![](https://img.shields.io/docker/automated/conmio/serverless.svg)
![](https://img.shields.io/docker/build/conmio/serverless.svg)


#### Example settings:

	SERVERLESS_PROJECT=~/my_project_folder
	SERVICE_NAME=example
---

#### Create a new service:
```
docker run --rm \
 -v $HOME/.aws:/home/user/.aws:ro \
 -v $SERVERLESS_PROJECT:/home/user/project \
 -e LOCAL_USER_ID=`id -u $USER`\
 -w /home/user/project \
  conmio/serverless sls create --template aws-nodejs --path $SERVICE_NAME
```
---

#### Deploy:
```
docker run --rm \
 -v $HOME/.aws:/home/user/.aws:ro \
 -v $SERVERLESS_PROJECT:/home/user/project \
 -e LOCAL_USER_ID=`id -u $USER`\
 -w /home/user/project/$SERVICE_NAME \
  conmio/serverless bash -c "npm install;sls deploy"
  ```
  ---

#### Shell:
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
