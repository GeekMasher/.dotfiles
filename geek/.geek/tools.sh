#!/bin/bash


# https://docs.microsoft.com/en-us/cli/azure/run-azure-cli-docker
DOCKER_AZURE_IMAGE="mcr.microsoft.com/azure-cli:latest"
alias azure="docker run --env-file=${HOME}/.env -v ${HOME}/.azure:/root/.azure -v ${HOME}/.ssh:/root/.ssh -it ${DOCKER_AZURE_IMAGE} az $@"
alias azure-update="docker pull ${DOCKER_AZURE_IMAGE}"
alias az="azure"
