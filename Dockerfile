FROM ubuntu:16.04

ARG PROJECT_NAME=<project_name>
ARG PROJECT_LOCAL_PATH=<local path to project root folder, e.g. "." or "../..">


RUN apt-get update
RUN apt-get install -y python3-pip

ENV PYTHONBUFFERED=1
ENV PROJECT_PATH="/usr/local/$PROJECT_NAME"

RUN mkdir $PROJECT_PATH
WORKDIR $PROJECT_PATH
COPY "$PROJECT_LOCAL_PATH/requirements.txt" "$PROJECT_PATH/"
RUN pip3 install -r requirements.txt
COPY $PROJECT_LOCAL_PATH $PROJECT_PATH

CMD <project run command, e.g.: ["celery.py", "-A", "my_cool_app", "worker"]>
