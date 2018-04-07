#!/bin/bash
dir=$(dirname "$(readlink -f "$0")")
sudo apt-get -y install network-manager
sudo apt-get -y install wmctrl
sudo apt-get -y install network-manager-gnome
sudo apt -y purge openresolv dhcpcd5
sudo ln -sf /lib/systemd/resolv.conf /etc/resolv.conf
sudo systemctl enable network-manager
sudo systemctl start network-manager
sleep 20
nm-applet &
file=/usr/share/plymouth/themes/pix/splash.png.original
if [ ! -e "$file" ]; then
    sudo cp /usr/share/plymouth/themes/pix/splash.png /usr/share/plymouth/themes/pix/splash.png.original
    splash='/qsboot.png'
    sudo cp $dir$splash /usr/share/plymouth/themes/pix/splash.png
fi

safe='/safetopoweroff.service'
sudo cp $dir$safe /lib/systemd/system/safetopoweroff.service
sudo systemctl enable safetopoweroff.service
sudo systemctl start safetopoweroff.service

sudo sed -e "s/Exec=nm-applet --no-agent/Exec=nm-applet/" /etc/xdg/autostart/nm-applet.desktop | sudo tee /home/pi/nm-applet.desktop > /dev/null
sudo sed -e "s/Exec=nm-applet/Exec=nm-applet --no-agent/" /home/pi/nm-applet.desktop  | sudo tee /home/pi/nm-applet.desktop2 > /dev/null
sudo cat /home/pi/nm-applet.desktop2  | sudo tee /etc/xdg/autostart/nm-applet.desktop > /dev/null

sudo apt-get -y install libfreeimage-dev
sudo apt-get -y install matchbox-keyboard

