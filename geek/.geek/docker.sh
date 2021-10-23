#!/bin/bash

alias docker.shell="docker exec -it $1 bash"

docker.nuke() {
    sudo docker stop 
    sudo docker image prune -f
    sudo docker container prune -f
    sudo docker volumn prune -f    
}
