FROM ubuntu:16.04

MAINTAINER Trung Tran "trung.tranngoc@asnet.com.vn"

# Install some dependencies for Ruby.
RUN apt-get update
RUN apt-get install -y \
    git-core \
    curl \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    python-software-properties \
    libffi-dev \
    nodejs

# Install ruby:2.4.0
RUN apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN ["/bin/bash", "-c", "\curl -sSL https://get.rvm.io | bash -s stable"]
RUN ["/bin/bash", "-c", "source ~/.rvm/scripts/rvm"]
RUN rvm install 2.4.0
RUN rvm use 2.4.0 --default
RUN ruby -v

# Install Bundler
RUN gem install bundler

CMD ['irb']
