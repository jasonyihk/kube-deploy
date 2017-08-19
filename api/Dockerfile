FROM node:4.8.3-alpine
LABEL maintainer <jasonyihk@gmail.com>

RUN set -x \
	&& apk update \
    && apk add git openssh-client
    
ENV WORK_DIR /opt/api
ENV SERVICE_PORT 3000

WORKDIR ${WORK_DIR}

COPY src ${WORK_DIR}/src
COPY package.json entrypoint.sh ${WORK_DIR}/

# setup ssh key for bitbucket
RUN touch /root/.ssh/known_hosts && \
    ssh-keyscan -t rsa bitbucket.org >> ~/.ssh/known_hosts

# install node module
RUN npm install --only=production --silent

EXPOSE ${SERVICE_PORT}

CMD ["node", "src/server.js"]
