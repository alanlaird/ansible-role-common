#!/bin/bash

# login to docker
dsh() {
  id=$(docker inspect --format="{{.Id}}" $@)
  #echo id $id
  echo "starting shell in $@"
  docker exec -it $id /bin/bash || docker exec -it $id /bin/sh
  echo "ending shell in $@"
}
complete -F _docker_exec dsh
# docker ps
alias dps='docker ps'

dri() { docker rmi $(docker images -q); }
drm() { docker rm $(docker ps -q -a); }
drk() { docker kill $(docker ps -q -a); }

# https://kartar.net/2014/03/useful-docker-bash-functions-and-aliases/
