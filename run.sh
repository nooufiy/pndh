#!/bin/bash

# bash run.sh fat 123.45.67.89

svt=$1				# server type (ilm ,fat or shu)
svr=$2				# server ip

[ -z "$svt" ] && echo "set server type" && exit 0 

yum install git -y
yum install dos2unix -y
git clone https://github.com/nooufiy/ilamp72.git

if [ "$svt" == "ilm" ]; then 
  cd ilamp72
  chmod +x *.sh
  dos2unix *.sh
  
  sh ins.sh

else
  [ -z "$svr" ] && echo "set server ip" && exit 0 
  git clone https://github.com/nooufiy/pndh.git
  
  cd ilamp72
  chmod +x *.sh
  dos2unix *.sh
  
  sh ins.sh
  
  cd ../pndh
  chmod +x *.sh
  dos2unix *.sh
  
  sh pindah-"$svt".sh "$svr"

fi
