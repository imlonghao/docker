FROM alpine:latest AS builder
LABEL maintainer="imlonghao"
RUN apk --no-cache add openvpn
CMD [ "/usr/sbin/openvpn" "--config" "/conf" ]