#/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

notify-send "Stoppe Client..."
rm $DIR/run.pid
rm $DIR/server.pid
rm $DIR/name.pid
