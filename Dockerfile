FROM python:3.8

MAINTAINER Marc-Philipp Knechtle "mpknechtle@gmail.com"

RUN useradd -ms /bin/bash ftps
USER ftps
WORKDIR /home/ftps

COPY . /home/ftps
RUN pip install -r requirements.txt

RUN mkdir /home/ftps/share

EXPOSE 21

CMD python3 ftpds.py