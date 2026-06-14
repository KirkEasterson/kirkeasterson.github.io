.PHONY: clean
clean:
	docker compose run --rm hugo rm -rf public resources .hugo_build.lock

.PHONY: build
build: clean
	docker compose run --rm hugo --gc --minify

.PHONY: dev
dev: clean
	docker compose run --rm hugo server --buildDrafts --logLevel info

.PHONY: lint
lint: valelint markdownlint tflint yamllint

styles:
	mkdir -p styles
	ln -s $(shell pwd)/config $(shell pwd)/styles/config
	docker compose run --rm vale sync

.PHONY: valelint
valelint: styles
	docker compose run --rm vale .

.PHONY: markdownlint
markdownlint:
	docker compose run --rm markdownlint mdl .

.PHONY: yamllint
yamllint:
	docker compose run --rm yamllint yamllint .

.PHONY: tflint
tflint:
	docker compose run --rm tflint

