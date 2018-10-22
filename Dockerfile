FROM python:2.7.15-alpine3.8

RUN set -ex && \
    apk add --no-cache \
    make texlive && \
    mkdir -p /workspace && \
    mkdir -p /tmp/install-tl-unx
COPY bin/install-tl-unx.tar.gz /tmp/install-tl-unx
RUN set -ex && \
    apk add --no-cache --virtual build-dependencies wget curl && \
    tar -C /tmp/install-tl-unx -xzf /tmp/install-tl-unx/install-tl-unx.tar.gz --strip-components=1 && \
    printf "%s\n" \
    "selected_scheme scheme-basic" \
    "option_doc 0" \
    "option_src 0" \
    > /tmp/install-tl-unx/texlive.profile && \
    /tmp/install-tl-unx/install-tl \
    --profile=/tmp/install-tl-unx/texlive.profile && \
    export PATH=/usr/local/texlive/2018/bin/x86_64-linuxmusl:$PATH && \
    tlmgr install \
    collection-basic collection-latex \
    collection-latexrecommended collection-latexextra \
    collection-fontsrecommended collection-langjapanese cmap && \
    rm -rf /tmp/install-tl-unx && \
    apk del build-dependencies
ENV PATH /usr/local/texlive/2018/bin/x86_64-linuxmusl:$PATH
WORKDIR /workspace
COPY requirements.txt ./
RUN set -ex && \
    pip install -r requirements.txt
ENTRYPOINT ["make"]
