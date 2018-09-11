FROM ruby:2.5.0

LABEL maintainer="jesse@relativepath.io"

ADD Gemfile /app/
ADD Gemfile.lock /app/
WORKDIR /app
RUN bundle install --without development test

ADD . /app

EXPOSE 2300

ENV LANG=C.UTF-8
ENV HANAMI_ENV=production
ENV SERVE_STATIC_ASSETS=true

CMD bundle exec hanami assets precompile && bundle exec hanami server --host 0.0.0.0 -p 2300
