FROM python:3.8

MAINTAINER Marc-Philipp Knechtle "mpknechtle@gmail.com"

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

# RUN mkdir /ftp_root
# RUN mkdir /ftp_root/nobody
# RUN mkdir /ftp_root/user

EXPOSE 1025

CMD python3 ftpds.py