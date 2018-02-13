FROM ruby:alpine
MAINTAINER Eirik Dentz Sinclair <eirikdentz@gmail.com>

RUN mkdir -p /usr/src/sidekiq
WORKDIR /usr/src/sidekiq

COPY Gemfile /usr/src/sidekiq/
COPY Gemfile.lock /usr/src/sidekiq/

RUN bundle install

COPY config.ru /usr/src/sidekiq/
COPY docker-entrypoint.sh /

EXPOSE 9292

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "config.ru"]
