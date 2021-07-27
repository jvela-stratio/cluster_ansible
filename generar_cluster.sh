#!/bin/bash

docker ps -a | grep nodo1 > /dev/null
content1=`echo $?`
docker ps -a | grep nodo2 > /dev/null
content2=`echo $?`

if [ $content1 -eq 0 ]; then
docker stop nodo1
docker rm nodo1
fi

if [ $content2 -eq 0 ]; then
docker stop nodo2
docker rm nodo2
fi

docker run -itd --net=prueba --name nodo1 --hostname nodo1 nodos
docker run -itd --net=prueba --name nodo2 --hostname nodo2 nodos

ssh-keygen -f "/home/jvela/.ssh/known_hosts" -R "nodo2"
ssh-keygen -f "/home/jvela/.ssh/known_hosts" -R "nodo1"