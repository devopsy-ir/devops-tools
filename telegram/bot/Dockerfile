FROM python:3-alpine

RUN apk upgrade --update && apk add --no-cache python3 python3-dev

# Step 1.1 of README.md
# RUN pip3 install python-telegram-bot --upgrade

# Step 1.2 of README.md
RUN pip3 install --upgrade requests

COPY python-telegram-bot /src/python-telegram-bot

RUN set -ex \
    && cd /src/python-telegram-bot \
    && python3 setup.py install

# Step 2 of README.md
VOLUME [ "/build" ]

ADD sendbot.py /

CMD [ "python3", "./sendbot.py" ]
