#!/bin/bash

if [ -z $ROOM ]; then
    echo "Usage: $0 room_id"
    exit 1
fi

while /bin/true; do
    INFO=$(curl -s "https://api.live.bilibili.com/xlive/web-room/v1/index/getInfoByRoom?room_id=$ROOM")
    LIVESTATUS=$(echo $INFO|jq .data.room_info.live_status)
    if [ $LIVESTATUS -eq 1 ]; then
        TITLE=$(echo $INFO|jq .data.room_info.title|sed 's/^"//'|sed 's/"$//')
        AUTHOR=$(echo $INFO|jq .data.anchor_info.base_info.uname|sed 's/^"//'|sed 's/"$//')
        DATE=$(date +'%Y%m%d')
        FULLDATE=$(date +'%Y-%m-%d-%H-%M-%S')
        mkdir -p $DATE
        streamlink https://live.bilibili.com/$ROOM best -O | ffmpeg -i - -metadata title="$TITLE - $AUTHOR" -c:v copy -c:a copy $DATE/$FULLDATE.mkv
    fi
    sleep 5
done
