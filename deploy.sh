#!/usr/bin/env sh

# abort on errors
set -env

# build

quasar build

# navigate into the build output directory

cd dist/spa

git init

git add -A

git commit -m 'deploy'

git push -f git@github.com:GarethChester/recipes-server-251.git master:gh-pages

cd -