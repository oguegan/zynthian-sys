#!/bin/bash

# Uninstall official wiringpi deb package
apt-get -y remove wiringpi

cd $ZYNTHIAN_SW_DIR

# Remove previous sources
if [ -d "./WiringPi" ]; then
	rm -rf "./WiringPi"
fi

# Download, build and install WiringPi library
#git clone https://github.com/WiringPi/WiringPi.git
#git clone https://github.com/zynthian/WiringPi.git
git clone https://github.com/oguegan/wiringOP.git
git checkout next 
cd wiringOP
./build
cd..
git clone --recursive https://github.com/orangepi-xunlong/wiringOP-Python.git
cd wiringOP-Python
git checkout next --recurse-submodules
make clean
make all
python3 setup.py install
cd ..
