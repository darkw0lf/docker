# Se base sur l'image ubuntu version 18.04
FROM ubuntu:18.04

# Mettre a jour les packages linux
RUN apt-get update

# Lance le shell Bash au lancement du conteneur
CMD echo "Hello !"
