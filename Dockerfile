FROM ruby:3.2.2-alpine3.18 AS base

# Stage 1: install gems and npm packages

FROM base AS builder

RUN set -ex

ENV APP_HOME /usr/src/app

WORKDIR $APP_HOME

RUN apk --update-cache upgrade \
 && apk --no-cache add \
                   build-base \
                   ruby-dev \
                   gcompat \
                   python3 \
                   yarn

ENV RAILS_ENV production
ENV SECRET_KEY_BASE not-a-real-key

COPY Gemfile Gemfile.lock $APP_HOME/

RUN gem install bundler \
&& bundle config without test development \
&& bundle config force_ruby_platform true \
&& bundle install

COPY package.json yarn.lock $APP_HOME/
RUN yarn install

COPY . $APP_HOME/

#ToDo: Something is broken with asset precompiling in this repo. When it is fixed, this needs uncommenting
#RUN bundle exec rails assets:precompile

# Stage 2

FROM base
LABEL Organisation="Ministry of Justice"
LABEL Service="Fee Calculator User Interface"
LABEL Contact="crowncourtdefence@digital.justice.gov.uk"

RUN set -ex

ENV RAILS_ENV production
ENV APP_HOME /usr/src/app
WORKDIR $APP_HOME

RUN apk --update-cache upgrade \
 && apk --no-cache add \
                   file \
                   gcompat \
                   linux-headers \
                   nodejs \
                   sqlite \
                   sqlite-libs \
                   runit \
                   ttf-freefont

RUN addgroup -g 1000 -S appgroup \
&& adduser -u 1000 -S appuser -G appgroup

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder --chown=appuser:appgroup $APP_HOME $APP_HOME

USER 1000

RUN mkdir -p $APP_HOME/tmp/pids

CMD "./docker-entrypoint.sh"
