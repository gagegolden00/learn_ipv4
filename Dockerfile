FROM ruby:3.2.2-alpine

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    nodejs \
    yarn \
    libxml2-dev \
    libxslt-dev \
    && gem install bundler \
    && bundle install --without development test \
    && rm -rf /usr/local/bundle/cache/* /var/cache/apk/*

COPY . ./

EXPOSE 3000

ENV NAME World

CMD ["rails", "server", "-b", "0.0.0.0"]
