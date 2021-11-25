#!/bin/sh

#Arrêter tous les conteneurs
docker ps|sed "1 d"|awk '{print $1}'|xargs docker stop

#Supprimer tous les conteneurs
docker ps -a|sed "1 d"|awk '{print $1}'|xargs docker rm

#Supprimer toutes les images
docker images|sed "1 d"|awk '{print $3}'|sort|uniq|xargs docker rmi
