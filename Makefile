.PHONY: dev
dev:
	@hugo server -D -s src/

.PHONY: build
build:
	@hugo -s src/ --minify

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
