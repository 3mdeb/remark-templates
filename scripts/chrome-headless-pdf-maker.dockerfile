FROM node:14.20-slim
WORKDIR /tmp
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes \
        git wget ca-certificates \
        fonts-liberation \
        libasound2 \
        libatk-bridge2.0-0 \
        libatk1.0-0 \
        libc6 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgbm1 \
        libgcc1 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libstdc++6 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        lsb-release \
        xdg-utils && \
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
