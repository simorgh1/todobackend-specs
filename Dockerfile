FROM node:slim
LABEL maintainer="Bahram Maravandi"

# Prevent dpkg errors
ENV TERM=xterm-256color

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha@2.4.5 && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
