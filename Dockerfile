FROM python:3.7-alpine
MAINTAINER @resolution

ENV INSTALL_PATH /arcana
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "arcana.app:create_app()"