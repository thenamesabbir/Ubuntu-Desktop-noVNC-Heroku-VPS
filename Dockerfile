FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    dbus-x11 \
    sudo \
    bash \
    net-tools \
    novnc \
    x11vnc \
    xvfb \
    supervisor \
    xfce4 \
    xfce4-goodies \
    openssh-server \
    terminator \
    git \
    nano \
    curl \
    wget \
    zip \
    unzip \
    falkon \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /system

RUN chmod +x /system/supervisor.sh && \
    chmod +x /system/conf.d/websockify.sh

EXPOSE 8080

CMD ["/system/supervisor.sh"]
