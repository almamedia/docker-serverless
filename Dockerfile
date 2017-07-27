FROM node:6.10-alpine
MAINTAINER Conmio developers
RUN apk --no-cache update && \
    apk --no-cache add less bash make curl su-exec

COPY script/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
WORKDIR /home/user

ENV SERVERLESS serverless@1.18.0
RUN yarn global add $SERVERLESS

