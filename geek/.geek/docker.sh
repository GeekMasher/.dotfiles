#!/bin/bash

alias docker.shell="docker exec -it $1 bash"

docker.nuke() {
    sudo docker stop 
    sudo docker image prune -f
    sudo docker container prune -f
    sudo docker volume prune -f    
}

function docker-compose-start-all() {
    for f in ./*; do
        if [ -f "$f/docker-compose.yml" ]; then
            pushd $f

            docker-compose stop
            docker-compose up -d

            popd
        fi
    done
}
