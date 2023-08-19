#!/bin/bash

# save this file as ~/docker.sh 
# add the alias to ~/.bashrc
# alias mydocker="~/./docker.sh"

ARG=$1
NAME=$2

if [ -z $ARG ]; then 
	echo 'ARG?'
	exit
fi

if [ -z $NAME ]; then 
	echo 'NAME?'
	exit
fi

if [ "$ARG" == "add" ]; then
	docker build -t $NAME .
	docker run -dit --name "$NAME-dev" -v .:/app $NAME
	docker start -i "$NAME-dev"
	exit
fi

if [ "$ARG" == "rm" ]; then
	docker rm "$NAME-dev"
	docker rmi $NAME
	exit
fi
