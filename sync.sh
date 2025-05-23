#!/bin/bash

source .env

WORKDIR="/tmp/repo-sync"

rm -rf $WORKDIR
mkdir -p $WORKDIR
cd $WORKDIR

git clone --mirror "$GITHUB_REPO"
cd *.git

git push --mirror "$GITLAB_REPO"
