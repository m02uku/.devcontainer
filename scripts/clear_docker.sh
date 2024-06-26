docker system prune
docker container prune
docker image prune
docker volume prune
docker network prune
docker rmi $(docker images -q)