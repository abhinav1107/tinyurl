FROM ruby:3-alpine

RUN mkdir /usr/src/redirector
COPY app.rb Gemfile /usr/src/redirector/
WORKDIR /usr/src/redirector/
RUN bundle install
