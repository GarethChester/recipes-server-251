#!/usr/bin/env sh

# abort on errors
set -e

# build
quasar build

# navigate into the build output directory
cd dist/spa

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init

git add -A

git commit -m 'deploy'

git push -f git@github.com:GarethChester/recipes-server-251.git master:gh-pages

cd -
