#/bin/bash
notify-send "Starte ASMS..."
if [ -e ./server.pid ]
then
echo "aktiv"
notify-send "Verbindung aktiv. Teste Server..."
if [ -e ./name.pid ]
then
echo "anem da"
name=$(cat ./name.pid)
notify-send "ASMS verbunden mit '$name'"
touch ./run.pid
echo "schlaife läuft"
while [ -e ./run.pid ]
do
echo "schleife"
sleep 15
host=$(cat ./host.db)
wget $host/asms/bit
bit=$(cat ./bit)
echo $bit
diff -q ./bit ./lastbit

if [ $? -ne 0 ]
then
echo "bit und las ist untersch."
wget $host/asms/message.sh
sh ./message.sh
mv ./bit ./lastbit
rm ./message.sh
else
echo "IST  NICHT!"
fi

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
