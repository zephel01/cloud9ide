#!/bin/bash


sudo sed -i -e 's/ZONE="UTC"/ZONE="Japan"/g' /etc/sysconfig/clock

sudo ln -sf /usr/share/zoneinfo/Japan /etc/localtime

date
