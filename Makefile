dev:
	@hugo server -D -s src/

build:
	@hugo -s src/ --minify

docker-dev:
	@docker-compose up

docker-start:
	@docker-compose up -d

docker-stop:
	@docker-compose down

docker-interact:
	@docker exec -it hugo sh
