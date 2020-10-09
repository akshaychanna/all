FROM ruby:2.5.1
RUN apt-get update && apt-get install -y \
git \
vim
RUN bundle install
COPY  crawler/ projects/
