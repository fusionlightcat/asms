#/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

notify-send "ASMessageSystem wird gestartet."
host=$(cat $DIR/host.db)

(

ping -w 2s $host
echo "50" ; sleep 1
echo "# Verbindungsaufbau mit Server..." ; sleep 1
wget $host/asms/server.pid
echo "75" ; sleep 1
echo "# Download Informations-Dateien" ; sleep 1
wget $host/asms/name.pid
echo "100" ; sleep 1
echo "# Abgeschlossen."
) |
zenity --progress \
  --title="ASMS Verbindungen" \
  --text="Verbinde mit $host" \
  --percentage=0 \
  --auto-close

name=$(cat $DIR/name.pid)
notify-send "ASMS: Verbunden über $host auf '$name'!"
sleep 2
notify-send "ASMS: Client kann nun gestartet werden."

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Verbindung abgebrochen."
exit
fi
