#!/bin/bash

pip install selenium

sudo rpm -ivh mesa-libwayland-egl-18.0.5-3.el7.x86_64.rpm

./install-google-chrome.sh

wget https://chromedriver.storage.googleapis.com/2.44/chromedriver_linux64.zip

unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/local/bin

rm chromedriver_linux64.zip 

cd /usr/bin && sudo ln -s /opt/google/chrome/google-chrome google-chrome
