#!/bin/bash

set -e

tmp_path=./output
deploy_to=/var/sites/docs.skroutz.gr/apiv3
deploy_user=wowbagger
deploy_server=docs.skroutz.gr

#Check for rsync
type rsync >/dev/null || echo "apt-get install rsync"

# Cleanup tmp export dir
#[ -e $tmp_path ] && rm -rf $tmp_path/*

bundle exec nanoc compile

echo -e "\n ==> Deploying to $deploy_user@$deploy_server\n"
rsync -e ssh -avz --delete $tmp_path/ $deploy_user@$deploy_server:$deploy_to
