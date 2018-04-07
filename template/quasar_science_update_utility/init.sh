#!/bin/bash
dir=$(dirname "$(readlink -f "$0")")
file=~/.config/lxsession/LXDE-pi/autostart.original
if [ ! -e "$file" ]; then
    cp ~/.config/lxsession/LXDE-pi/autostart ~/.config/lxsession/LXDE-pi/autostart.original
fi 


mkdir -p /home/pi/.config/quasar_science/
cmd='@/home/pi/.config/quasar_science/update_utility.sh'
echo $cmd > ~/.config/lxsession/LXDE-pi/autostart
prefix='"' 
suffix='/run.sh"' 
echo $prefix$dir$suffix > /home/pi/.config/quasar_science/update_utility.sh
chmod 755 /home/pi/.config/quasar_science/update_utility.sh

mkdir -p /home/pi/.matchbox
file='/keyboard.xml'
cp $dir$file ~/.matchbox/keyboard.xml






