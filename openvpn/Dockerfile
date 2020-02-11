FROM alpine:latest AS builder
LABEL maintainer="imlonghao"
RUN apk --no-cache add openvpn
ENTRYPOINT [ "/usr/sbin/openvpn" "-c" "/conf" ]