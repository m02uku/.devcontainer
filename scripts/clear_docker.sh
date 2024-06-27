yes | docker stop $(docker ps -q)
yes | docker system prune
yes | docker container prune
yes | docker image prune
yes | docker volume prune
yes | docker network prune
yes | docker rmi $(docker images -q)
docker ps -a
docker images