APP_NAME?=nicolas-grevin.github.io
APP_DIR?=/app
DOCKER_IMAGE_NAME?=node
DOCKER_IMAGE_VERSION?=8
PORT_EXPOSE?=8080
PORT_DOCKER?=8080
NODE_ENV?=development
CMD?=yarn && yarn dev

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

run: ## Run container: default dev
	$(info --> Run containers: ${NODE_ENV})
	@docker run \
			--rm \
			--detach \
			--user node \
			--name ${APP_NAME} \
			--workdir ${APP_DIR} \
			--env "NODE_ENV=${NODE_ENV}" \
			--volume "${CURDIR}:${APP_DIR}" \
			--publish ${PORT_EXPOSE}:${PORT_DOCKER} \
			${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_VERSION} \
			bash -c "${CMD}"

run-preprod: ## Run container preprod
	@NODE_ENV=preprod \
	    make run

run-prod: ## Run container prod
	@NODE_ENV=prod \
	    CMD=yarn && yarn start:production \
	    make run

stop: ## Stop containers
	$(info --> Stop container)
	@docker stop ${APP_NAME}

destroy: ## Stop and remove containers
	$(info --> Stop and remove a running container)
	@docker rm --force --volumes ${APP_NAME}

logs: ## Display logs
	$(info --> Display log)
	@docker logs --follow ${APP_NAME}

bash: ## Run bash inside container
	$(info --> Run bash inside the container app)
	@docker exec --interactive --tty ${APP_NAME} bash

bash-root: ## Run bash-root inside container
	$(info --> Run bash root inside the container app)
	@docker exec --interactive --tty --user root ${APP_NAME} bash

ifeq (npm,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

npm: ## Run npm inside container
	$(info --> Run npm inside the container app)
	@docker exec ${APP_NAME} npm $(RUN_ARGS)

ifeq (yarn,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

yarn: ## Run yarn inside container
	$(info --> Run npm inside the container app)
	@docker exec ${APP_NAME} yarn $(RUN_ARGS)

ifeq (exec,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

exec: ## Execute command inside container
	$(info --> Execute command inside container)
	@docker exec ${APP_NAME} bash -c "$(RUN_ARGS)"

ifeq (interact,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

interact: ## Execute interactive command inside container
	$(info --> Execute interactive command inside container)
	@docker exec --interactive --tty ${APP_NAME} bash -c "$(RUN_ARGS)"

test: ## Execute test inside container
	$(info --> Execute test inside container)
	@docker exec ${APP_NAME} yarn test

e2e: ## Execute test inside container
	$(info --> Execute test inside container)
	@docker exec ${APP_NAME} yarn e2e


unit: ## Execute test inside container
	$(info --> Execute test inside container)
	@docker exec ${APP_NAME} yarn e2e

lint: ## Execute lint inside container
	$(info --> Execute lint inside container)
	@docker exec ${APP_NAME} yarn lint

lint-js: ## Execute lint:js inside container
	$(info --> Execute lint:js inside container)
	@docker exec ${APP_NAME} yarn lint:js

lint-scss: ## Execute lint:scss inside container
	$(info --> Execute lint:scss inside container)
	@docker exec ${APP_NAME} yarn lint:scss
