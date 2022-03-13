#!/usr/bin/env bash

DIR=$(cd "$(dirname "$0")"; pwd)

cd $DIR

set -ex

. ./sh/build.lib.sh

cd $DIR
version=$(cat package.json|jq -r '.version')

add(){
git add -u
git commit -m v$version || true
}

add

git pull

npm set unsafe-perm true
npm version patch
add
git push
npm publish --access=public
