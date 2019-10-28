FROM alpine
LABEL maintainer="imlonghao"

ADD entrypoint.sh /
RUN apk add --no-cache tinc

CMD ["/entrypoint.sh"]