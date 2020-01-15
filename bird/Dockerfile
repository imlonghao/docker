FROM alpine:latest AS builder
ARG VERSION="2.0.7"
LABEL maintainer="imlonghao"
WORKDIR /builder
RUN apk add g++ flex-dev bison linux-headers ncurses-dev readline-dev make wget
RUN wget ftp://bird.network.cz/pub/bird/bird-${VERSION}.tar.gz && \
    tar zxf bird-${VERSION}.tar.gz && \
    mv bird-${VERSION}/* . && \
    ./configure --sysconfdir=/etc --localstatedir=/var && \
    make

FROM alpine:latest
COPY --from=builder /builder/bird /bird
COPY --from=builder /builder/birdc /birdc
COPY --from=builder /builder/birdcl /birdcl
COPY --from=builder /builder/doc/bird.conf.example2 /etc/bird.conf
RUN apk --no-cache add ncurses-dev readline-dev
ENTRYPOINT [ "/bird" ]
CMD ["-f"]
