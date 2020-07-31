ARG BUILD_FROM=hassioaddons/base:latest
FROM ${BUILD_FROM}

# Build arguments
ARG BUILD_VERSION
ARG BUILD_ARCH=amd64

WORKDIR /usr/src

RUN apk add --no-cache \
        python3 \
	py3-pip \
	musl \
	sqlite \
    && apk add --no-cache --virtual .build-deps \
	build-base \
	python3-dev \
        git \
    # Tuya Gateway
    && git clone --depth=1 https://github.com/TradeFace/tuyagateway.git \
    && cd tuyagateway \ 
    && pip install --no-cache-dir -r requirements.txt \
    && pip install tuyagateway \
    # GismoCaster - install into /web
    && cd .. \
    && git clone --depth 1 https://github.com/TradeFace/gismocaster.git \
    && cd gismocaster \
    && pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /web \
    && find web -print | cpio -pvdm / \
    && apk del .build-deps \
    && cd .. \
    && rm -rf /usr/src/tuyagateway /usr/src/gismocaster

COPY data/run.sh /

WORKDIR /
ENTRYPOINT [ "/run.sh" ]
