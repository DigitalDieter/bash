#!/bin/bash

# Install docker & docker-compose
# create test flask app

EI="\e[1;32m"
EO="\e[0m"


desc="Install dependencies"
echo -e $EI $desc $EO
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common


desc="Adding docker gpg key"
echo -e $EI $desc $EO
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


desc="Adding repository"
echo -e $EI $desc $EO
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"


desc="Install docker"
echo -e $EI $desc $EO
sudo apt install -y docker-ce


desc="Adding user to docker group"
echo -e $EI $desc $EO
sudo usermod -aG docker $(whoami)


desc="Install docker compose"
echo -e $EI $desc $EO
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose


desc="Creating test directory"
echo -e $EI $desc $EO
mkdir test_docker_compose


desc="Chaning directory"
echo -e $EI $desc $EO
cd test_docker_compose


desc="Creating app.py"
echo -e $EI $desc $EO
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


desc="Creating requirements.txt"
echo -e $EI $desc $EO
sudo dd of=requirements.txt<< EOF
flask
redis
EOF


# Dockerfile
desc="Creating dockerfile"
echo -e $EI $desc $EO
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


desc="Creating docker-compose file"
echo -e $EI $desc $EO
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


desc="Installing required packages from requirements.txt"
echo -e $EI $desc $EO
python -m pip install -r requirements.txt


desc="Building and running app.py"
echo -e $EI $desc $EO
docker-compose up