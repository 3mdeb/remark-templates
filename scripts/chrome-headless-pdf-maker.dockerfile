FROM node:14.20-slim
WORKDIR /tmp
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes git wget && \
    wget -O google-chrome.deb https://cloud.3mdeb.com/index.php/s/dXa46zbw2NdKnW8/download && \
    dpkg -i google-chrome.deb ; \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes -f && \
    apt-get clean && \
    rm google-chrome.deb
RUN git clone https://github.com/3mdeb/chrome-headless-pdf-maker && \
    cd chrome-headless-pdf-maker && \
    git checkout cee6d4e81695771b8aa44ee484dca7e84329d1ec && \
    yarn install && \
    npm pack && \
    npm install -g chrome-headless-pdf-maker*.tgz --unsafe-perm=true --allow-root && \
    cd .. && \
    rm -rf chrome-headless-pdf-maker
ENTRYPOINT [ "/usr/local/bin/chrome-headless-pdf-maker" ]
