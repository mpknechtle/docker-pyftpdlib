FROM python:3.8

MAINTAINER Marc-Philipp Knechtle "mpknechtle@gmail.com"

USER ftps

COPY . /home/ftps
WORKDIR /home/ftps
RUN pip install -r requirements.txt

RUN mkdir /home/ftps/share

EXPOSE 21

CMD python3 ftpds.py