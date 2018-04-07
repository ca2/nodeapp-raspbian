
install_matchbox()
{
sudo apt-get install libfakekey-dev
sudo rm -Rf matchbox-keyboard
mkdir matchbox-keyboard
cd matchbox-keyboard
git clone https://github.com/xlab/matchbox-keyboard .
./autogen.sh
mv ../ltmain.sh ./
./configure
make
sudo make install

}


install_matchbox
