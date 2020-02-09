# Get ruby version
RUBY_VERSION := $$(<rails_blog/.ruby-version)
# Get ruby gemset name
RUBY_GEMSET := $$(<rails_blog/.ruby-gemset)

BRANCH ?= $$(git symbolic-ref --short HEAD)
BRANCH_TAG := $$(echo ${BRANCH} | tr / _)

config:
	@echo "Precomplie assets locally";
	cd rails_blog; \
	make precomplie

deploy:
	@echo "Deploy using Compose";
	@docker-compose up -d

stop:
	@echo "Stop Services";
	@docker-compose down


.PHONY: config deploy stop
