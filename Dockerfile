FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /emilito
WORKDIR /emilito
ADD Gemfile /emilito/Gemfile
ADD Gemfile.lock /emilito/Gemfile.lock
RUN bundle install
