NAME  	:= suits-auth
TAG   	?= 1.0.0
USER_ID ?= $(shell stat -c "%u:%g" .)
REPO  	:= suitsims
IMAGE 	:= ${REPO}/${NAME}:${TAG}

HEROKU_API_TOKEN := ${HEROKU_API_TOKEN}
HEROKU_APP_NAME  := ${HEROKU_APP_NAME}

DOCKER ?= docker

image:
	${DOCKER} build --rm -t ${IMAGE} -f docker/Dockerfile ./docker/

push:
	${DOCKER} login --username ${REPOSITORY_USERNAME} --password ${REPOSITORY_PASSWORD}
	${DOCKER} push ${IMAGE}

deploy:
	git push https://heroku:${HEROKU_API_TOKEN}@git.heroku.com/${HEROKU_APP_NAME}.git origin/master:master -f

.PHONY: deploy image push
