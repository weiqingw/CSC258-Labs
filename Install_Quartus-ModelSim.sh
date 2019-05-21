#!/bin/bash

echo '=============================================================='
echo '====================== Process Started ======================='
echo '=============================================================='
echo '------------------Start downloading ModelSim------------------'
wget http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/ModelSimSetup-18.1.0.625-linux.run
chmod 777 ModelSimSetup-18.1.0.625-linux.run
echo '-------------------Start Installing ModelSim------------------'
echo "PLEASE CHOOSE /home/${USER}/intelFPGA_lite/18.1/ as installing directory."
./ModelSimSetup-18.1.0.625-linux.run
rm ModelSimSetup-18.1.0.625-linux.run
echo '----------------------Installed Modelsim----------------------'

echo '-------------------Start downloading Quartus------------------'
wget http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/cyclonev-18.1.0.625.qdz
wget http://download.altera.com/akdlm/software/acdsinst/18.1std/625/ib_installers/QuartusLiteSetup-18.1.0.625-linux.run
chmod 777 cyclonev-18.1.0.625.qdz
chmod 777 QuartusLiteSetup-18.1.0.625-linux.run

echo '-------------------Start Installing Quartus-------------------'
echo "PLEASE CHOOSE /home/${USER}/intelFPGA_lite/18.1/ as installing directory."
./QuartusLiteSetup-18.1.0.625-linux.run
sudo rm cyclonev-18.1.0.625.qdz
sudo rm QuartusLiteSetup-18.1.0.625-linux.run
echo '----------------------Installed Quartus-----------------------'



sudo dpkg --add-architecture i386 
echo '--------------sudo dpkg --add-architecture i386---------------'
sudo apt-get update
echo '--------------------- Updated APT packages--------------------'

sudo apt --fix-broken install libfreetype6 libfreetype6:i386
echo '-----------------Updated libfreetype packages-----------------'

sudo apt-get install gcc-multilib g++-multilib lib32z1 lib32stdc++6 lib32gcc1 expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 libcanberra0:i386 libpng16-16:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 libxt6:i386 libxtst6:i386

echo '-------------Installed i386 library packages------------------'

wget http://archive.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.6.1-0.1ubuntu2_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/f/freetype/libfreetype6_2.6.1-0.1ubuntu2_i386.deb
sudo dpkg -i libfreetype6_2.6.1-0.1ubuntu2_i386.deb libfreetype6_2.6.1-0.1ubuntu2_amd64.deb
rm libfreetype6_2.6.1-0.1ubuntu2_amd64.deb
rm libfreetype6_2.6.1-0.1ubuntu2_i386.deb
echo '--------Downgraded libfreetype6:amd64 V.2.6.1 V.1.2.54--------'
echo '--------Downgraded libfreetype6:i386 V.2.6.1 V.1.2.54---------'

cd /home/${USER}/
echo "Start copying the installed software to /opt... Do NOT terminate this program..."
sudo cp -a intelFPGA_lite /opt/
rm -rf intelFPGA_lite
echo '------------Copied the installed softwares to /opt------------'

sudo sed -i 's/linux_rh60/linux/g' /opt/intelFPGA_lite/18.1/modelsim_ase/vco

echo '-------------Creating snap shortcuts for Modelsim-------------'
cd /snap/bin
sudo touch vsim
sudo chmod 777 vsim
sudo echo "bash /opt/intelFPGA_lite/18.1/modelsim_ase/bin/vsim" > vsim
echo '--------Complete: Creating snap shortcuts for Modelsim--------'

echo '-------------Creating snap shortcuts for Quartus--------------'
sudo touch quartus
sudo chmod 777 quartus
sudo echo "bash /opt/intelFPGA_lite/18.1/quartus/bin/jtagconfig" >> quartus
sudo echo "bash /opt/intelFPGA_lite/18.1/quartus/bin/quartus" >> quartus
echo '--------Complete: Creating snap shortcuts for Quartus---------'

echo '=============================================================='
echo '================== Configuration Completed ==================='
echo '=============================================================='
echo 'To open Quartus, type quartus in the terminal and then press enter.'
echo 'To open Modelsim, type vsim in the terminal and then press enter.'

