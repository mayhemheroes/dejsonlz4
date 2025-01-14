# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

## Add source code to the build stage.
ADD . /dejsonlz4
WORKDIR /dejsonlz4

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN gcc -o dejsonlz4 src/dejsonlz4.c src/lz4.c

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /dejsonlz4/dejsonlz4 /
