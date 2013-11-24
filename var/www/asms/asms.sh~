#/bin/bash
notify-send "Starte ASMS..."
if [ -e ./server.pid ]
then
notify-send "Verbindung aktiv. Teste Server..."
if [ -e ./name.pid ]
then
name=$(cat ./name.pid)
notify-send "ASMS verbunden mit '$name'"
touch ./run.pid
while [ -e ./run.pid ]
do
host=$(cat ./host.db)
wget $host/asms/message.sh
sh ./message.sh

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
