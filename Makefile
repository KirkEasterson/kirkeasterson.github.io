.PHONY: clean
clean:
	docker-compose run --rm hugo rm -rf public resources .hugo_build.lock

.PHONY: build
build: clean
	docker-compose run --rm hugo --gc --minify

.PHONY: dev
dev: clean
	docker-compose run --rm hugo server --buildDrafts --logLevel info
