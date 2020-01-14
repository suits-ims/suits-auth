NAME  	:= suits-auth
TAG   	?= 1.0.0
USER_ID ?= $(shell stat -c "%u:%g" .)
REPO  	:= suits-ims
IMAGE 	:= ${REPO}/${NAME}:${TAG}

DOCKER_REGISTRY     := registry.heroku.com

HEROKU_API_TOKEN    := ${HEROKU_API_TOKEN}
HEROKU_APP_NAME     := ${HEROKU_APP_NAME}
HEROKU_PROCESS_TYPE := web
HEROKU_APP_TAG      := ${DOCKER_REGISTRY}/${HEROKU_APP_NAME}/${HEROKU_PROCESS_TYPE}

BRANCH_NAME ?= $(shell git rev-parse --abbrev-ref HEAD 2>/dev/null)

DOCKER ?= docker
HEROKU ?= heroku

image:
	${DOCKER} build -t ${IMAGE} -f docker/Dockerfile ./docker/

deploy:
	${DOCKER} login --username=_ --password=${HEROKU_API_TOKEN} ${DOCKER_REGISTRY}
	${DOCKER} tag ${IMAGE} ${HEROKU_APP_TAG}
	${DOCKER} push ${HEROKU_APP_TAG}
	${HEROKU} container:release ${HEROKU_PROCESS_TYPE} -a ${HEROKU_APP_NAME}

.PHONY: image deploy
