FROM debian:buster-slim

LABEL maintainer "Florentin Thullier <florentin.thullier1@uqac.ca>"

RUN apt-get update \
  && apt-get install -y ghostscript gnupg wget make curl libgetopt-long-descriptive-perl \
  libdigest-perl-md5-perl python3-pygments fontconfig
RUN apt-get install -y --no-install-recommends texlive-full
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /