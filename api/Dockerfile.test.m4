FROM omapi:_IMAGE_TAG_
LABEL MAINTAINER <jasonyihk@gmail.com>

COPY test ${WORK_DIR}/test
RUN npm install --prefix ${WORK_DIR} --development --silent \
    && npm install istanbul mocha -g --silent

CMD ["npm", "run", "test"]
