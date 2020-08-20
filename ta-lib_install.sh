#!/bin/bash

wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar xvzf ta-lib-0.4.0-src.tar.gz 
cd ta-lib
./configure --prefix=/usr
make
sudo make install

sudo bash -c "echo "/usr/local/lib64" >> /etc/ld.so.conf"
sudo /sbin/ldconfig

pip install numpy
pip install ta-lib
