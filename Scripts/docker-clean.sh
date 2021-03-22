#!/bin/bash

processes=$(docker ps -q -f status=exited)
if [ -n "$processes" ]; then
  docker rm -v $processes
fi

images=$(docker images -q -f dangling=true)
if [ -n "$images" ]; then
  docker rmi $images
fi

volumes=$(docker volume ls -qf dangling=true)
if [ -n "$volumes" ]; then
  docker volume rm $volumes
fi