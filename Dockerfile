FROM python:3.7-alpine
LABEL maintainer="imlonghao"

ADD https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py /speedtest_cli.py

CMD ["python", "/speedtest_cli.py"]