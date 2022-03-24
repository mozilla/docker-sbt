APP_TAG=sbt
SBT_VERSION=1.5.7
OPENJDK_TAG=11

tag:

	@echo "${APP_TAG}:${OPENJDK_TAG}_${SBT_VERSION}"

build:

	@echo "Building image '${APP_TAG}:${OPENJDK_TAG}_${SBT_VERSION}'..."

	docker build \
		--build-arg OPENJDK_TAG=${OPENJDK_TAG} \
		--build-arg SBT_VERSION=${SBT_VERSION} \
		--tag ${APP_TAG}:${OPENJDK_TAG}_${SBT_VERSION} \
		--tag ${APP_TAG}:latest \
		.

shell:

	@echo "Running image '${APP_TAG}:${OPENJDK_TAG}_${SBT_VERSION}'..."

	docker run -it --rm ${APP_TAG}:latest sbt shell
