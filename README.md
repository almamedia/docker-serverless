<!-- [![](https://images.microbadger.com/badges/version/conmio/serverless.svg)](https://microbadger.com/images/conmio/serverless "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/conmio/serverless.svg)](https://microbadger.com/images/conmio/serverless "Get your own image badge on microbadger.com")
![](https://img.shields.io/docker/automated/conmio/serverless.svg)
![](https://img.shields.io/docker/build/conmio/serverless.svg)
 -->

## AWS Example:

#### Pre-requisites
[AWS Credentials](https://serverless.com/framework/docs/providers/aws/guide/credentials/) are required for deployment.

#### 1. Get makefile
Copy [this example Makefile](https://github.com/almamedia/docker-serverless/blob/master/example/Makefile) to a project folder:

```
mkdir /tmp/sls_test
cd /tmp/sls_test
wget https://raw.githubusercontent.com/almamedia/docker-serverless/master/example/Makefile
```
---

#### 2. Create an example service
```
make create
```
---

#### 3. Deploy the service
```
make deploy
```
---

#### 4. Remove the deployed service
```
make remove
```
---

#### Open shell to run custom [serverless CLI](https://serverless.com/framework/docs/providers/aws/cli-reference/) commands
```
make shell
```
