#!/bin/sh
export VERSION=1.0.0

echo Building cf-cli:${VERSION}

docker build --no-cache -t cf-cli:${VERSION} . \
                --build-arg http_proxy=http://10.171.41.73:3128 \
		--build-arg HTTP_PROXY=http://10.171.41.73:3128 \
                --build-arg https_proxy=http://10.171.41.73:3128 \
		--build-arg HTTPS_PROXY=http://10.171.41.73:3128

echo Pushing last version on docker-hub
docker tag cf-cli:${VERSION} jraverdyorange/cf-cli:${VERSION}
docker tag jraverdyorange/cf-cli:${VERSION} jraverdyorange/cf-cli:latest
docker push jraverdyorange/cf-cli
