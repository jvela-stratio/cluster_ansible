#!/bin/bash

for nodo in `docker ps | sed "s/  */ /g" | grep nodo | cut -d ' ' -f 14`; do
    docker stop $nodo
    docker rm $nodo
done

read -p "introcude el numero de nodos: " num
for ((i=1; i<=$num; i++)); do
    docker run -itd --net=prueba --name nodo$i --hostname nodo$i nodos
    nodo="nodo"$i
    ssh-keygen -f "/home/jvela/.ssh/known_hosts" -R "$nodo"
done
