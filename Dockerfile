# This Dockerfile has two required ARGs to determine which base image
# to use for the JDK and which sbt version to install.

ARG OPENJDK_TAG=11-jdk-slim
FROM openjdk:${OPENJDK_TAG}

ARG SBT_VERSION=1.5.4

# Install sbt
RUN \
  apt-get update && \
  apt-get install -y curl && \
  mkdir /working/ && \
  cd /working/ && \
  curl -L -o sbt-$SBT_VERSION.deb https://repo.scala-sbt.org/scalasbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get install sbt && \
  cd && \
  rm -r /working/ && \
  sbt sbtVersion
