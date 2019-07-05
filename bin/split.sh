#!/usr/bin/env bash

set -e
set -x

function split()
{
    SHA1=`./bin/splitsh-lite --prefix=$1`
    git push $2 "$SHA1:master" -f
}

function remote()
{
    git remote add $1 $2 || true
}

git pull origin master

remote php git@github.com:kalabro/mixed-monorepo-php.git
remote js git@github.com:kalabro/mixed-monorepo-js.git

split 'php' php
split 'js' js
