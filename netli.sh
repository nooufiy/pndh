#!/bin/bash

curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
yum install -y nodejs
#npm install netlify-cli -g

# You may also need development tools to build native addons:
sudo yum install -y gcc-c++ make
## To install the Yarn package manager, run:
curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn

npm install --unsafe-perm=true -g netlify-cli
npm i -g vercel



# GAWE CLEAN
# ===========
# sudo rm -rf /var/cache/yum
# sudo yum remove -y nodejs
# sudo rm /etc/yum.repos.d/nodesource*
# sudo yum clean all