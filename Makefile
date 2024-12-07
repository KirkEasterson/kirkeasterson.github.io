.PHONY: dev
dev:
	@hugo server --buildDrafts --source src/ --gc --logLevel info

.PHONY: clean
clean:
	@rm -rf ./src/public/
	@rm -rf ./src/resources/
	@rm ./src/.hugo_build.lock

.PHONY: build
build:
	@hugo -s src/ --gc --minify

.PHONY: clean-and-build
clean-and-build:
	@$(MAKE) clean
	@$(MAKE) build

.PHONY: clean-lh
clean-lh:
	@rm -rf ./.lighthouseci/

.PHONY: lh-ci
lh-ci:
	@$(MAKE) clean-lh
	@lhci autorun --config ./lighthouse/ci.lighthouserc.yml

.PHONY: lh-full
lh-full:
	@$(MAKE) clean-lh
	@lhci autorun --config=./lighthouse/full.lighthouserc.yml

.PHONY: docker-dev
docker-dev:
	@docker-compose up

.PHONY: docker-start
docker-start:
	@docker-compose up -d

.PHONY: docker-stop
docker-stop:
	@docker-compose down

.PHONY: docker-interact
docker-interact:
	@docker exec -it hugo sh
