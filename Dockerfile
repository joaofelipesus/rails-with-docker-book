FROM ruby:3.2.2

RUN apt-get update -yqq && \
  apt-get install -yqq --no-install-recommends \
  nodejs \
  vim

COPY Gemfile* /usr/src/app/
ENV BUNDLE_PATH /gems
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
