FROM ruby:2.5.1
WORKDIR /app
ADD Gemfile ./app
RUN bundle install
COPY . /app
