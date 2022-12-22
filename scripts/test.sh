#!/bin/sh

if [ -z "$BASEDIR" ]
then
    BASEDIR=$(pwd)
fi

case "$1" in
        up)
                echo "Up Daemon ..."
                DUID=$(id -u) DGID=$DOCKER_GROUP_ID  docker-compose -f $(pwd)/docker/docker-compose-test.yml down;
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose-test.yml up \
                --abort-on-container-exit  --exit-code-from notifications-service-test;
                ;;
        shell)
                echo "Up ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose-test.yml run notifications-service-test
                ;;
        down)
                echo "Down ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose-test.yml down -v
                ;;
        *)
                echo $"Usage: $0 {upd|shell|down}"
                RETVAL=2
esac
exit $RETVAL
