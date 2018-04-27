# https://github.com/francescou/docker-compose-ui
# DOCKER-VERSION 1.12.3
FROM arm32v7/python:2

RUN pip install virtualenv && apt-get update && apt-get install git

COPY ./requirements.txt /app/requirements.txt
RUN virtualenv /env && /env/bin/pip install --no-cache-dir -r /app/requirements.txt

COPY . /app

VOLUME ["/opt/docker-compose-projects"]

COPY demo-projects /opt/docker-compose-projects

EXPOSE 5000

CMD []
ENTRYPOINT ["/env/bin/python", "/app/main.py"]

WORKDIR /opt/docker-compose-projects/
