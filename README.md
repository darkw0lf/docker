# docker

Supports de formation **Docker** : installation, Dockerfiles d'exemple, piles Docker Compose (WordPress, Drupal, Laravel, GLPI/OCS) et scripts utilitaires.

## Installation

| Fichier | Rôle |
|---|---|
| `install_docker.sh` | Installe Docker Engine, Buildx et Compose depuis le dépôt officiel (Debian) puis lance `hello-world` |

## Dockerfiles

| Fichier | Rôle |
|---|---|
| `Dockerfile` | Image Ubuntu 20.04 minimale qui affiche « Hello ! » |
| `Dockerfile2` | Image Ubuntu 20.04 qui affiche ses processus toutes les 2 s (illustre un conteneur qui reste actif) |
| `Dockerfile_full` | Image Oracle Linux avec Java 8 et WebLogic 12.1.3 |

```bash
docker build -t hello -f Dockerfile . && docker run --rm hello
```

## Docker Compose

| Fichier | Pile |
|---|---|
| `docker-compose.yml` | WordPress + MySQL 5.7 |
| `docker-compose-drupal.yml` | Drupal 10 (Apache) + PostgreSQL 16, sur le port 8080 |
| `compose_laravel.txt` + `nginx.conf` | Pas-à-pas en commandes `docker run` pour une application Laravel (PHP-FPM, MySQL, file d'attente, nginx, npm) |
| `docker-glpi-ocsinventory-master.zip` | Pile GLPI + OCS Inventory + MySQL (voir aussi le dépôt [glpi](https://github.com/darkw0lf/glpi)) |
| `test` | Variante du compose WordPress |

```bash
docker compose -f docker-compose-drupal.yml up -d
```

## Scripts utilitaires

| Fichier | Rôle |
|---|---|
| `dockertags` | Liste les tags d'une image sur Docker Hub : `./dockertags nginx` (nécessite `curl` et `jq`) |
| `docker.sh` | Arrête et supprime **tous** les conteneurs et images, puis `docker system prune -a` (Linux) |
| `docker.ps1` | Même nettoyage en PowerShell (Windows) |
| `vsftpd.sh` | Lance un conteneur **vsftpd 2.3.4** |

## CI

`.github/workflows/docker-publish.yml` construit l'image à chaque push sur `master` et la publie sur GitHub Container Registry (`ghcr.io`).

## ⚠️ Sécurité

- `vsftpd.sh` démarre volontairement **vsftpd 2.3.4, une version piégée par une porte dérobée** (CVE-2011-2523). C'est une cible de TP de pentest : à n'utiliser que dans un réseau de labo isolé.
- `docker.sh` et `docker.ps1` sont destructifs : ils effacent tous les conteneurs et toutes les images de la machine.
- Les mots de passe présents dans les fichiers Compose et le Dockerfile WebLogic sont des valeurs de démonstration à changer.
