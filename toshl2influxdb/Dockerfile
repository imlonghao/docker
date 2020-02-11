FROM python:alpine
LABEL maintainer="imlonghao"

ADD main.py /
RUN pip install --no-cache-dir requests influxdb

CMD ["/main.py"]
