FROM node:22-bookworm-slim
WORKDIR /tmp
# puppeteer downloads its own Chromium build during installation. These
# packages provide the shared libraries and fonts that build needs at runtime.
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        ca-certificates \
        fonts-liberation \
        git \
        libasound2 \
        libatk-bridge2.0-0 \
        libatk1.0-0 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libdrm2 \
        libexpat1 \
        libfontconfig1 \
        libgbm1 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxkbcommon0 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# install the dependency versions locked in the tool's yarn.lock
RUN git clone https://github.com/3mdeb/chrome-headless-pdf-maker /opt/chrome-headless-pdf-maker && \
    cd /opt/chrome-headless-pdf-maker && \
    git checkout cee6d4e81695771b8aa44ee484dca7e84329d1ec && \
    rm -rf .git && \
    yarn install --frozen-lockfile --production && \
    yarn cache clean
# the update check has nowhere to keep state in a throwaway container
ENV NO_UPDATE_NOTIFIER=1
ENTRYPOINT [ "node", "/opt/chrome-headless-pdf-maker/index.js" ]
