FROM alpine:latest AS builder
LABEL maintainer="imlonghao"
WORKDIR /builder
RUN apk add g++ flex-dev bison linux-headers ncurses-dev readline-dev make wget
RUN wget ftp://bird.network.cz/pub/bird/bird-2.0.5.tar.gz && \
    tar zxf bird-2.0.5.tar.gz && \
    mv bird-2.0.5/* . && \
    ./configure --sysconfdir=/etc --localstatedir=/var && \
    make

FROM alpine:latest
COPY --from=builder /builder/bird /bird
COPY --from=builder /builder/birdc /birdc
COPY --from=builder /builder/birdcl /birdcl
RUN apk --no-cache add ncurses-dev readline-dev
ENTRYPOINT [ "/bird" ]
CMD ["-f"]