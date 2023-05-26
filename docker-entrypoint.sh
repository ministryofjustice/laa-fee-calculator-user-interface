#!/bin/sh

printf '\e[33mINFO: Launching Rails\e[0m\n'
bundle exec rails s -b 0.0.0.0
