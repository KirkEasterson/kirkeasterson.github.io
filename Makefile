.PHONY: clean
clean:
	docker compose run --rm hugo rm -rf public resources .hugo_build.lock

.PHONY: build
build: clean
	docker compose run --rm hugo --gc --minify

.PHONY: dev
dev: clean
	docker compose run --rm hugo server --buildDrafts --logLevel info

.PHONY: markdownlint
markdownlint:
	docker compose run --rm markdownlint mdl .

.PHONY: tflint
tflint:
	docker compose run --rm tflint

.PHONY: yamllint
yamllint:
	docker compose run --rm yamllint yamllint .
