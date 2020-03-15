FROM python:alpine as base
RUN apk update && apk add --no-cache ffmpeg curl

FROM base as builder
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN pip wheel --wheel-dir=/root/wheels streamlink
RUN apk del .build-deps gcc musl-dev

FROM base
COPY --from=builder /root/wheels /root/wheels
RUN pip install --no-index --find-links=/root/wheels streamlink
ADD entrypoint.sh /entrypoint.sh
WORKDIR /data
ENTRYPOINT ["/entrypoint.sh"]