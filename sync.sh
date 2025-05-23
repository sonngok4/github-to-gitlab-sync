#!/bin/bash

source .env

# Đường dẫn làm việc tạm thời
WORKDIR="/tmp/repo-sync"

# Dọn dẹp
rm -rf $WORKDIR
mkdir -p $WORKDIR
cd $WORKDIR

# Clone từ GitHub
git clone --mirror "$GITHUB_REPO"
cd *.git

# Push sang GitLab
git push --mirror "$GITLAB_REPO"
