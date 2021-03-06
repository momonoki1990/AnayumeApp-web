FROM ruby:2.6.3
RUN apt-get update -qq && \
    apt-get install -y build-essential \
    libpq-dev \
    nodejs \
    postgresql-client \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /workdir
WORKDIR /workdir
ADD Gemfile /workdir/Gemfile
ADD Gemfile.lock /workdir/Gemfile.lock
RUN bundle install
ADD . /workdir