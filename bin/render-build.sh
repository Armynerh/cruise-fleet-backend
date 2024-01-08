#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
./bin/rails assets:precompile --trace
./bin/rails assets:clean
