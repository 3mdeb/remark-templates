FROM node:14.20-slim
WORKDIR /tmp
ADD --checksum=sha256:dae70d722430fe27421a945ee1844dc2b0b7ca90856d19820cbedf8e7d0b4c01 https://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_91.0.4472.114-1_amd64.deb /
RUN sed -i 's@deb.debian.org@archive.debian.org@g' /etc/apt/sources.list && \
    apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes git wget && \
    dpkg -i /google-chrome-stable_91.0.4472.114-1_amd64.deb ; \
    env DEBIAN_FRONTEND=noninteractive apt-get install --yes -f && \
    apt-get clean && \
RUN git clone https://github.com/3mdeb/chrome-headless-pdf-maker && \
    cd chrome-headless-pdf-maker && \
    git checkout cee6d4e81695771b8aa44ee484dca7e84329d1ec && \
    yarn install && \
    npm pack && \
    npm install -g chrome-headless-pdf-maker*.tgz --unsafe-perm=true --allow-root && \
    cd .. && \
    rm -rf chrome-headless-pdf-maker
ENTRYPOINT [ "/usr/local/bin/chrome-headless-pdf-maker" ]
