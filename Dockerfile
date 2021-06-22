FROM debian:buster-slim

LABEL maintainer "Florentin Thullier <florentin.thullier1@uqac.ca>"

RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y --no-install-recommends texlive-full
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /