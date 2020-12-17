#!/bin/bash

AK=$1
SK=$2
password=`printf "$AK" | openssl dgst -binary -sha256 -hmac "$SK" | od -An -vtx1 | sed 's/[ \n]//g' | sed 'N;s/\n//'`
echo "Password:" $password

kubectl create secret docker-registry --dry-run=client docker-regcred --docker-server=swr.cn-north-4.myhuaweicloud.com --docker-username=cn-north-4@$AK --docker-password=$password -oyaml
