FROM ubuntu:trusty
LABEL maintainer="Bahram Maravandi"

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to DE
# RUN sed -i "s/http:\/\/archive./http:\/\/de.archive./g" /etc/apt/sources.list 

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash - && \
    apt-get install -y nodejs 

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
