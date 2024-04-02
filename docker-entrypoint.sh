#!/bin/sh
# last modified 17-05-2019
set +ex

bundle exec rails db:migrate
bundle exec rails server