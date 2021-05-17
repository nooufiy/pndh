#!/bin/bash

# ================== #
# Pindah Server Fath
# ================== #

srv="$1"
#rsync -avzh --progress --exclude={'pub-done-2.tar.gz','centos'} root@"$srv":/home/* /home

# mkdir /home/az
rsync -avzh --progress root@"$srv":/home/* /home
chcon -R -t httpd_sys_rw_content_t /home

rsync -avzh --progress root@"$srv":/root/.netlify /root

mv /etc/php.ini /etc/php.ini-bak
rsync -avzh --progress root@"$srv":/etc/php.ini /etc

mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf-bak
rsync -avzh --progress root@"$srv":/etc/httpd/conf/httpd.conf /etc/httpd/conf

curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
yum install -y nodejs
sudo yum install -y gcc-c++ make

curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo yum install -y yarn

#npm install netlify-cli -g
npm install --unsafe-perm=true -g netlify-cli
npm i -g vercel

