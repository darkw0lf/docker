# Se base sur l'image ubuntu version 20.04
FROM ubuntu:20.04

Remplacer la dernière ligne du Dockerfile par :
CMD while true; do ps -aux; sleep 2; done

Supprimer la ligne qui effectue la mise à jour des packages Linux :
#RUN apt-get update
