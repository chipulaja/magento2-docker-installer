SHELL := /bin/bash
.DEFAULT_GOAL := help

help:
	@echo "help"
	@echo ""
	@echo "Commands available:"
	@echo "==================="
	@echo ""
	@echo "build"
	@echo "up"
	@echo "install"

install-docker:
	-sudo ./docker-installer.sh

build:
	-docker-compose build

up:
	-@docker-compose up -d

install-magento:
	-@docker-compose exec web bash -c "magento2-installer.sh"

uninstall:
	-sudo docker-compose stop web dbmysql
	-sudo docker-compose rm -f web dbmysql
	-sudo rm -rf magento2

install: build up install-magento

reinstall: uninstall install

build-image:
	@docker build -t chipulaja/php-apache-untuk-magento2:v0.0.1 .

push-image:
	@docker push chipulaja/php-apache-untuk-magento2:v0.0.1
