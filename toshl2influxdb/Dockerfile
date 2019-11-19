FROM python:alpine
LABEL maintainer="imlonghao"

ADD main.py /
RUN pip install requests influxdb

CMD ["/main.py"]