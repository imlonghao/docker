#!/bin/ash

while /bin/true; do
    rclone sync /a /b -P
    sleep $INTERVAL
done
