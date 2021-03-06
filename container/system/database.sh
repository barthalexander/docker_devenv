#!/bin/bash

if [ -z ${SCRIPT_PATH+x} ]; then
    echo "do not run this script directly!"
    exit 1
fi

source $SCRIPT_PATH/config/require.sh

docker_name="system.database"
image="mariadb"

if checkRunning "$docker_name"; then

    cnfPath="$DATA_PATH"'system/database/config'
    cnfFile=$cnfPath'/mysql.cnf'
    if [ ! -f "$cnfFile" ]; then
        mkdir -p "$cnfPath"
        touch "$cnfFile"
        j2 $SCRIPT_PATH/templates/mysql.cnf.j2 > $cnfFile
    fi

    controllNetwork "internal"

    docker pull $image
    docker run --detach \
      --name $docker_name \
      --restart always \
      -p 3306:3306 \
      --network $NETWORK_DATABASE \
      --network-alias='database' \
      --volume $DATA_PATH/system/database/data:/var/lib/mysql:rw \
      --volume $DATA_PATH/system/database/config:/etc/mysql/conf.d/:ro \
      --env MYSQL_ROOT_PASSWORD="Def12345" \
      --label traefik.enable=false \
      $image
fi
