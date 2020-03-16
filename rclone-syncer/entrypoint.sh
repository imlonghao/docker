#!/bin/ash

while /bin/true; do
    rclone sync /a /b
    sleep $INTERVAL
done
