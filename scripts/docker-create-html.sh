#!/usr/bin/env bash

if [ $# -lt 3 ]; then
    echo ""
    echo "Usage: ./docker-create-html.sh <template> <title> <file>"
    exit
fi

DOCKER_PREFIX="docker run -t"
ENTRYPOINT="${PWD}/remark-templates/scripts/create-html.sh"

TEMPLATE=$1
TITLE=$2
FILE=$3

$DOCKER_PREFIX -v ${PWD}:${PWD} -w ${PWD} debian:latest $ENTRYPOINT $TEMPLATE $TITLE $FILE
