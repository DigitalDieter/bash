#!/bin/bash

text2print="Create test directory"
echo -e "\e[1;32m $text2print \e[0m"

mkdir test_docker_compose
cd test_docker_compose

echo "Create app.py"
echo -e "\e[1;32m $text2print \e[0m"

sudo dd of=app.py<< EOF
import time

import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)
EOF


text2print="Create requirements.txt"
echo -e "\e[1;32m $text2print \e[0m"

sudo dd of=requirements.txt<< EOF
flask
redis
EOF


# Dockerfile
text2print=0"Create Dockerfile"
echo -e "\e[1;32m $text2print \e[0m"

sudo dd of=Dockerfile<< EOF
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["flask", "run"]
EOF


# docker-compose
text2print="Create docker-compose file"
echo -e "\e[1;32m $text2print \e[0m"
sudo dd of=docker-compose.yml<< EOF
version: '3'
services:
  web:
    build: .
    ports:
      - "5000:5000"
  redis:
    image: "redis:alpine"
EOF


text2print="Checking requirements.txt"
echo -e "\e[1;32m $text2print \e[0m"
python -m pip install -r requirements.txt

text2print="Build and run app"
echo -e "\e[1;32m $text2print \e[0m"
docker-compose up