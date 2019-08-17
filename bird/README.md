# imlonghao/bird

![Docker Pulls](https://img.shields.io/docker/pulls/imlonghao/bird.svg)![MicroBadger Layers](https://img.shields.io/microbadger/layers/imlonghao/bird.svg)![MicroBadger Size](https://img.shields.io/microbadger/image-size/imlonghao/bird.svg)

## Usage

```
docker run -d --restart=on-failure -v /path/to/bird.conf:/etc/bird.conf --net=host --cap-add=NET_ADMIN imlonghao/bird
```
