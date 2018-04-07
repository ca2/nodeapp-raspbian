#!/bin/bash


function defer_add()
{

   FIND=$1
   REPLACE=$2
   FILE=$3
   ADD=$4

   grep -qiP "\s*$FIND\s*" "$FILE"
   if [[ $? -ne 0 ]]; then
      ADD="$ADD $REPLACE"
   else
      sudo perl -pe "s/\s*($FIND)\s*/ $REPLACE /i" -i "$FILE"      
   fi

   echo $ADD

}


dir=$(dirname "$(readlink -f "$0")")
sudo apt-get -y install fbi
sudo apt-get -y install network-manager
sudo apt-get -y install wmctrl
sudo apt-get -y install network-manager-gnome
sudo apt -y purge openresolv dhcpcd5
sudo ln -sf /lib/systemd/resolv.conf /etc/resolv.conf
sudo systemctl enable network-manager
sudo systemctl start network-manager
sleep 20
nm-applet &
#file=/usr/share/plymouth/themes/pix/splash.png.original
#if [ ! -e "$file" ]; then
#    sudo cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash.png.original
#    splash='/qsboot.png'
#    sudo cp $dir$splash /usr/share/plymouth/themes/pix/splash.png
#fi

splash='/qsboot.png'
sudo cp $dir$splash /opt$splash

ITEM='disable_splash'
VALUE='1'
LINE="^\s*$ITEM\s*=\s*.*$"
FILE="/boot/config.txt"

if grep -qP -- "$LINE" "$FILE"; then
sudo perl -pe "s/^\s*$ITEM\s*=\s*.*$/$ITEM=$VALUE/mi" -i "$FILE"
else
echo "$ITEM=$VALUE" | sudo tee --append "$FILE" > /dev/null
fi


ITEM='console=tt[a-zA-Z0-9]+'
FILE="/boot/cmdline.txt"
ADD=''

ADD=$(defer_add "quiet" "quiet" "$FILE" "$ADD")
ADD=$(defer_add "logo.nologo" "logo.nologo" "$FILE" "$ADD")
ADD=$(defer_add "consoleblank=[0-9]" "consoleblank=0" "$FILE" "$ADD")
ADD=$(defer_add "loglevel=[0-9]" "loglevel=1" "$FILE" "$ADD")

sudo perl -pe "s/\s*($ITEM)\s*/ \1$ADD /i" -i "$FILE"


if ! grep -qP -- "$TOKEN" "$FILE"; then
sudo perl -pe "s/^\s*$ITEM\s*=\s*.*$/$ITEM=$VALUE/mi" -i "$FILE"
else
echo "$ITEM=$VALUE" | sudo tee --append "$FILE"> /dev/null
fi

safe='/safetopoweroff.service'
sudo cp $dir$safe /lib/systemd/system$safe
sudo systemctl enable safetopoweroff.service
sudo systemctl start safetopoweroff.service

safe='/splashscreen.service'
sudo cp $dir$safe /lib/systemd/system$safe
sudo systemctl enable safetopoweroff.service


sudo sed -e "s/Exec=nm-applet --no-agent/Exec=nm-applet/" /etc/xdg/autostart/nm-applet.desktop | sudo tee /home/pi/nm-applet.desktop > /dev/null
sudo sed -e "s/Exec=nm-applet/Exec=nm-applet --no-agent/" /home/pi/nm-applet.desktop  | sudo tee /home/pi/nm-applet.desktop2 > /dev/null
sudo cat /home/pi/nm-applet.desktop2  | sudo tee /etc/xdg/autostart/nm-applet.desktop > /dev/null

sudo apt-get -y install libfreeimage-dev
sudo apt-get -y install matchbox-keyboard

