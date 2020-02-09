# Image name
NAME := rails_blog
# Project namespace: wshihadeh by default
NAMESPACE ?= wshihadeh
# Docker registry
REGISTRY ?= index.docker.io
# Image candidate tag of build process: release or nightly
BRANCH ?= $$(git symbolic-ref --short HEAD)
IMAGE_TAG ?= $$(echo ${BRANCH} | tr / _)
# Fetch the latest commit hash
COMMIT_HASH := $$(git rev-parse HEAD)
# Docker image reference
IMG := ${REGISTRY}/${NAMESPACE}/${NAME}
# Get ruby version
RUBY_VERSION := $$(<.ruby-version)
# Get ruby gemset name
RUBY_GEMSET := $$(<.ruby-gemset)

# Command for starting the container
COMMAND := web

# Always use login bash shell
SHELL := /bin/bash --login

# Exposed port
PORT := -p 3000:8080

# Environment variables needed to start container
CONTAINER_ENV= -e RAILS_ENV=production  -e RAILS_LOG_TO_STDOUT=true

ERROR_COLOR = \033[0;31m
NO_COLOR    = \033[m

# Make sure recipes are always executed
.PHONY: build push run clean shell start rm stop

precomplie:
	@echo "Start precomplie"; \
    rvm --create ruby-${RUBY_VERSION}@${RUBY_GEMSET}_${BRANCH_TAG} && rvm info ruby,environment; \
	rvm use ${RUBY_VERSION}; \
	rvm gemset use ${RUBY_GEMSET}_${BRANCH_TAG}; \
	gem install bundler -v $$(tail -1 Gemfile.lock); \
	rm -rf .bundle; \
	rm -rf vendor/cache; \
	bundle install; \
	RAILS_ENV=production bundle exec rake assets:precompile; \
	rm -rf .bundle;

# Build and tag Docker image
build:
	@echo "Building Docker Image ..."; \
	echo "Branch: " ${BRANCH}; \
	echo "Commit hash: " ${COMMIT_HASH}; \
	docker build -t ${IMG}:${COMMIT_HASH} . ; \
	docker tag ${IMG}:${COMMIT_HASH} ${IMG}:${IMAGE_TAG}

# Push Docker image
push:
	@echo "Pushing Docker image ..."; \
	docker push ${IMG}:${COMMIT_HASH}; \
	docker push ${IMG}:${IMAGE_TAG}

# Clean up the created images locally and remove rvm gemset
clean:
	@echo "Start Cleanup ..."; \
	docker rmi -f ${IMG}:${IMAGE_TAG}; \
	docker rmi -f ${IMG}:${COMMIT_HASH}

# Start a shell session inside docker container
shell:
	docker run --rm --name ${NAME}-${IMAGE_TAG} ${CONTAINER_ENV} -it ${PORT} ${IMG}:${COMMIT_HASH} sh

# Start a Docker container in the foreground
run:
	docker run --rm --name ${NAME}-${IMAGE_TAG} ${CONTAINER_ENV} -it ${PORT} ${IMG}:${COMMIT_HASH} ${COMMAND}

# Start Docker container in the background
start:
	docker run -d --name ${NAME}-${IMAGE_TAG} ${CONTAINER_ENV} ${PORT} ${IMG}:${COMMIT_HASH} ${COMMAND}

# Stop running Docker container
stop:
	docker stop ${NAME}-${IMAGE_TAG}

# Remove Docker container
rm:
	docker rm ${NAME}-${IMAGE_TAG}
