FROM ubuntu:focal

ENV VERSION=1.7.0

# dependencies (https://github.com/puppeteer/puppeteer/blob/e4de5f10d01b5bfb0ce686b6c32a38b57d80e12c/docs/troubleshooting.md#chrome-headless-doesnt-launch-on-unix)
RUN apt-get update && \
    apt-get install -yq --no-install-recommends ca-certificates fonts-liberation gconf-service \
    libappindicator1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libxcb-dri3-0 \
    libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
    libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 \
    libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 \
    libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils curl unzip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install chromium
WORKDIR /opt/chromium
RUN git clone https://github.com/scheib/chromium-latest-linux
WORKDIR /opt/chromium/chromium-latest-linux
RUN ./update.sh && ln -s /opt/chromium/chromium-latest-linux/latest/chrome /usr/bin/chromium

# install aquatone binary
WORKDIR /opt/aquatone
RUN wget https://github.com/michenriksen/aquatone/releases/download/v${VERSION}/aquatone_linux_amd64_${VERSION}.zip && \
    unzip aquatone_linux_amd64_${VERSION}.zip && \
    cp aquatone /

ENTRYPOINT ["/aquatone"]
