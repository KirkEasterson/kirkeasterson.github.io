.PHONY: clean
clean:
	rm -rf src/public src/resources src/.hugo_build.lock

.PHONY: build
build: clean
	docker compose run --rm -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(shell id -u) hugo --gc --minify

.PHONY: dev
dev:
	docker compose run --rm -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(shell id -u) hugo server --buildDrafts --logLevel info

.PHONY: lint
lint: valelint markdownlint tflint yamllint

styles:
	mkdir -p styles
	ln -s $(shell pwd)/config $(shell pwd)/styles/config
	docker compose run --rm -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -u $(shell id -u) vale sync

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
