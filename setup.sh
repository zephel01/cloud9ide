#!/bin/bash

sudo yum -y install htop

sudo cp -p /etc/sysctl.conf /etc/sysctl.conf.org

cp ~/cloud9/sysctl.conf /tmp

sudo cp /tmp/sysctl.conf /etc/sysctl.conf

sudo bash -c "cat << 'EOF' >> /etc/security/limits.conf
* soft nofile 65536
* hard nofile 65536
* soft memlock unlimited
* hard memlock unlimited
EOF"

sudo /sbin/sysctl -p
ulimit -a
