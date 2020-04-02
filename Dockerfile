FROM node:12

# 作成者情報
MAINTAINER adachi <adakouchisuke@gmail.com>

# Debian set Locale
RUN apt-get update && \
    apt-get -y install locales task-japanese && \
    locale-gen ja_JP.UTF-8 && \
    rm -rf /var/lib/apt/lists/*
ENV LC_ALL=ja_JP.UTF-8 \
    LC_CTYPE=ja_JP.UTF-8 \
    LANGUAGE=ja_JP:jp
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

# Debian set TimeZone
ENV TZ=Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN npm install node-gyp@6.1.0 -g && \
    npm install node-pre-gyp@0.14.0 -g && \
    npm install webpack@4.42.1 -g && \
    npm install webpack-cli@3.3.11 -g
