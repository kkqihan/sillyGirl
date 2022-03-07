#! /bin/bash
version=v$(date "+%Y%m%d")

set -ex

docker build -f Dockerfile -t kkqihan/silly-girl:latest -t kkqihan/silly-girl:"$version" .
docker push kkqihan/silly-girl:latest
docker push kkqihan/silly-girl:"$version"
