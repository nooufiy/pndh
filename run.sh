#!/bin/bash

# bash run.sh fat 123.45.67.89

svt=$1				# server type (fat or shu)
svr=$2				# server ip

bash ilamp-p72-simple.sh
bash pindah-"$svt".sh "$svr"

