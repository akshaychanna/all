From ruby:2.5.1
RUN apt-get update && apt-get install -y \
git \
vim
RUN mkdir abc
ADD . /abc/
WORKDIR /abc/
RUN bundle install
