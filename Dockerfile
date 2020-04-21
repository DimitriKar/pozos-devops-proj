FROM python:2.7-stretch

RUN mkdir /data \
    && apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y \
    && pip install flask flask_httpauth flask_simpleldap python-dotenv \
    && apt-get install git \
    && git clone "http://192.168.10.135/root/pozos.git" \
    && cd pozos/simple_api && cp -a ./ ../../

COPY ./ /data

VOLUME /data

EXPOSE 5000

CMD [ "python", "./student_age.py" ]
