#-----------------------------------------------------------
# docker
init: docker-pull docker-build docker-up
up: docker-up
down: docker-down
restart: down up

docker-pull:
	docker-compose pull
docker-build:
	docker-compose build
docker-up:
	docker-compose up -d
docker-down:
	docker-compose down --remove-orphans

bash:
	docker-compose run --rm php-cli bash
test:
	docker-compose run --rm php-cli bin/phpunit
router:
	docker-compose run --rm php-cli bin/console debug:router --show-controllers

#-----------------------------------------------------------
# Setup
setup: composer-install

#-----------------------------------------------------------
# composer
composer-install:
	docker-compose run --rm php-cli composer install
composer-update:
	docker-compose run --rm php-cli composer update
