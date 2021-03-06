FROM golang:alpine3.14

# 设置go编译环境
ENV GO111MODULE on
RUN go env
ENV REPO_URL https://github.com/cdle/sillyGirl.git

# endregion

LABEL maintainer="kk <497061632@qq.com>"

# 安装必要
RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .build-deps bash git build-base

WORKDIR /app
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 青龙默认端口
EXPOSE 8080

VOLUME /app/sillyGirl

ENTRYPOINT ["docker-entrypoint.sh"]