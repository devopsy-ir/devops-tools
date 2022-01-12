
FROM python:3

MAINTAINER Mohsen-Abbasi

RUN pip install bcrypt --disable-pip-version-check

COPY ./gen-pass.py /usr/src/myapp/gen-pass.py

WORKDIR /usr/src/myapp

ENTRYPOINT python gen-pass.py $PASSWORD
