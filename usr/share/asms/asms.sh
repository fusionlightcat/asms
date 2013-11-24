#/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

notify-send "Starte ASMS..."
if [ -e $DIR/server.pid ]
then
notify-send "Verbindung aktiv. Teste Server..."
if [ -e $DIR/name.pid ]
then
name=$(cat $DIR/name.pid)
notify-send "ASMS verbunden mit '$name'"
touch $DIR/run.pid
while [ -e $DIR/run.pid ]
do
host=$(cat $DIR/host.db)
date=$(date +%F)
time=$(date +%R)
wget $host/asms/message.sh
sh $DIR/message.sh
mv $DIR/message.sh $DIR/archive/message-$date-$time.sh

done
notify-send "ASMS: Client beendet"


exit





else
zenity --error \
--text="Server-Name wurde nicht übertragen!!!"
exit
fi
else
zenity --error \
--text="Bitte starten sie zuerst die ASMS-Verbindung. Dann Client neu starten!"
exit
fi

