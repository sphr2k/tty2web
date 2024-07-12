FROM ubuntu:24.04

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-transport-https ca-certificates gnupg curl \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       bash-completion wget software-properties-common nano git\
       net-tools iputils-ping gpg build-essential automake autoconf \
       netcat-openbsd lsb-release sudo iproute2 dnsutils yq jq \
       google-cloud-cli \
    && apt-get upgrade \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/kost/tty2web/releases/download/v3.0.3/tty2web_linux_amd64 -O /usr/local/bin/tty2web && \
    chmod +x /usr/local/bin/tty2web

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
