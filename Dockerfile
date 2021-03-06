FROM ubuntu:20.04

RUN apt-get -y update && \
  apt-get -y upgrade && \
  apt-get install -y ca-certificates gnupg2 && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 && \
  echo "deb https://dl.bintray.com/crystal/deb all stable" | tee /etc/apt/sources.list.d/crystal.list && \
  apt-get -y update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y ruby-full libruby2.7 crystal make && \
  apt-get clean

RUN gem install gloss
