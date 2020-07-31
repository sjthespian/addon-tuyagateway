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
    && apk add --no-cache --virtual .build-deps \
	build-base \
	python3-dev \
        git \
    && git clone --depth=1 https://github.com/TradeFace/tuyagateway.git \
    && cd tuyagateway \ 
    && pip install -r requirements.txt \
    && pip install tuyagateway \
    && apk del .build-deps \
    && rm -rf /usr/src/tuyagateway

COPY data/run.sh /

ENTRYPOINT [ "/run.sh" ]
