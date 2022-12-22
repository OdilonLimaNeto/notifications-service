#!/bin/sh

if [ -z "$BASEDIR" ]
then
    BASEDIR=$(pwd)
fi

case "$1" in
        upd)
                echo "Up Daemon ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml up -d
                ;;
        up)
                echo "Up ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml up
                ;;
        startd)
                echo "Start Daemon ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml start -d
                ;;
        start)
                echo "Start ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml start
                ;;
        down)
                echo "Down ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml down
                ;;
        down-volume)
                echo "Down ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml down -v
                ;;
        restart)
                echo "Restart ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml restart
                ;;
        logs)
                echo "Logs ..."
                DUID=$(id -u) DGID=$(id -g) docker-compose -f $BASEDIR/docker/docker-compose.yml logs -f
                ;;
        db)
                echo "Opening psql CLI ..."
                docker exec -it notifications-service-db psql -p notifications -U notifications -d notifications-service-db
                ;;
        *)
                echo $"Usage: $0 {upd|up|startd|start|down|restart|logs|db}"
                RETVAL=2
esac
exit $RETVAL