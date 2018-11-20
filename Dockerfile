FROM python:3.6-alpine

RUN set -ex \
    && apk add --no-cache make \
    && apk add --no-cache wkhtmltopdf \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted && \
    mkdir -p /workspace
WORKDIR /workspace
COPY requirements.txt ./
COPY bin ./
RUN set -ex \
    && apk add --no-cache --virtual build-dependencies wget \
    && pip install -r requirements.txt \
    && wget https://oscdl.ipa.go.jp/IPAexfont/IPAexfont00301.zip \
    && unzip IPAexfont00301.zip && rm IPAexfont00301.zip \
    && mkdir ~/.fonts \
    && mv IPAexfont00301 ~/.fonts \
    && fc-cache -fv \
    && apk del build-dependencies
ENTRYPOINT ["./docker-entrypoint.sh"]
