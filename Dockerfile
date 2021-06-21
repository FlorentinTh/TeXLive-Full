FROM debian:buster-slim

LABEL maintainer "Florentin Thullier <florentin.thullier1@uqac.ca>"

ARG VERSION=2018

RUN apt-get update \
  && apt-get install -y ghostscript gnupg wget make curl libgetopt-long-descriptive-perl \
  libdigest-perl-md5-perl python3-pygments fontconfig && rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN curl -sL curl -sL http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${VERSION}/install-tl-unx.tar.gz | tar zxf -

RUN mv install-tl-20* install-tl \
  && cd install-tl \
  && echo "selected_scheme scheme-full" > profile \
  && ./install-tl -repository http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${VERSION}/tlnet-final/ -profile profile

RUN cd .. && rm -rf install-tl

ENV PATH /usr/local/texlive/${VERSION}/bin/x86_64-linux:$PATH