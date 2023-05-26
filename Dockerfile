FROM ruby:3.0.0-alpine

RUN addgroup -g 1000 -S appgroup && \
    adduser -u 1000 -S appuser -G appgroup

RUN apk update \
 && apk add --no-cache  \
    build-base  \
    ruby-dev \
    postgresql-dev \
    gcompat \
    yarn \
    python3

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

# COPY package.json package-lock.json

COPY . .
RUN yarn install --ignore-platform

RUN yarn build

RUN chown -R appuser:appgroup /app

USER 1000

EXPOSE 3000/TCP
CMD "./docker-entrypoint.sh"
