#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
 
reset=`tput sgr0`

IPADDRESS=$(hostname -I | awk '{print $1}' | cut -d/ -f1)

sed -i 's/HOST_NAME=.*/HOST_NAME='"$IPADDRESS"'/g' .env

set -o allexport
source .env set
set +o allexport

docker compose stop

docker compose up -d --remove-orphans

