#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

. ./sh/build.lib.sh
npx vite build
