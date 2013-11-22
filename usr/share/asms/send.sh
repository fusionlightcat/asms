#/bin/bash
bit=$(cat /var/www/asms/bit)
ok=$(zenity --entry --text "Nachricht" --title "ASMS-Nachricht")
echo "notify-send $ok" > /var/www/asms/message.sh
echo $((RANDOM % 100)) > /var/www/asms/bit
