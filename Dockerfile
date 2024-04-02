FROM ruby:3.2.2-alpine3.19 AS base

# Stage 1: install gems and npm packages

FROM base AS builder

RUN set -ex

ENV APP_HOME /usr/src/app
WORKDIR $APP_HOME

RUN apk --update-cache upgrade \
 && apk --no-cache add \
                   build-base \
                   gcompat \
                   git \
                   sqlite \
                   postgresql-dev \
                   python3 \
                   yarn

ENV RAILS_ENV production

COPY Gemfile Gemfile.lock $APP_HOME/

RUN gem install bundler \
&& bundle config without test development \
&& bundle install

COPY package.json yarn.lock $APP_HOME/
RUN yarn install

COPY . $APP_HOME/


RUN SECRET_KEY_BASE=a-real-secret-key-is-not-needed-here
#RAILS_ENV=production \
#bundle exec rails assets:precompile

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
                   postgresql-client \
                   runit \
                   ttf-freefont

RUN addgroup -g 1000 -S appgroup \
&& adduser -u 1000 -S appuser -G appgroup

COPY --from=builder --chown=appuser:appgroup /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder --chown=appuser:appgroup $APP_HOME $APP_HOME

USER 1000

RUN mkdir -p $APP_HOME/tmp/pids


#CMD "bundle exec rails db:migrate"
#CMD "bundle exec rails server"
