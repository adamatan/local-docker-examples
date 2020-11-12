FROM ubuntu:focal
LABEL MAINTAINER="Adam Matan <adam@matan.name>"

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/Asia/Jerusalem /etc/localtime
RUN apt-get install --yes tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install --yes imagemagick
RUN apt-get install --yes curl
RUN apt-get install --yes wget

COPY Merienda-Regular.ttf /fonts/
RUN mkdir /img
WORKDIR /img