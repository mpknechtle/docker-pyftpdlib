FROM python:3.8

MAINTAINER Marc-Philipp Knechtle "mpknechtle@gmail.com"

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

RUN mkdir /home/ftps

EXPOSE 1025

CMD python3 ftpds.py