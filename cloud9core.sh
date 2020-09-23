#!/bin/bash

# 開発環境インストール
sudo yum install -y openssl-devel bzip2-devel zlib-devel readline-devel sqlite-devel glibc-static libevent-devel ncurses-devel tmux
sudo yum groupinstall -y development

#amazonlinux2 epel
sudo amazon-linux-extras install -y epel
#centos epel
sudo yum -y install epel-release

#nodebrew
curl -L git.io/nodebrew | perl - setup
echo "export PATH=$HOME/.nodebrew/current/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

nodebrew install-binary v13.13.0
nodebrew use v13.13.0

source ~/.bashrc

#install nginx
sudo yum -y install nginx

#pyenv install
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update

cd $HOME/.pyenv
mkdir shims
mkdir versions

cd ~
sed -i -e 's/alias python/#alias python/g' ~/.bashrc

cat << 'EOF' >> ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
fi
EOF

source ~/.bashrc

pyenv install 3.6.10
pyenv global 3.6.10

pyenv rehash

pip install --upgrade pip
pip install certbot-dns-cloudflare

sudo mkdir /opt/workspace
sudo chmod 755 /opt/workspace
sudo chown -R ec2-user:ec2-user /opt/workspace

sudo mkdir /opt/c9
sudo chmod 755 /opt/c9
sudo chown -R ec2-user:ec2-user /opt/c9
sudo ln -s /opt/c9 ~/.c9

cd /usr/local/src
sudo chmod 755 /usr/local/src
sudo chown -R ec2-user:ec2-user /usr/local/src

git clone git://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh

npm install -g forever initd-forever
npm install -g log

sudo cp ~/cloud9ide/cloud9ide /etc/init.d/
sudo chkconfig cloud9ide --add
sudo chkconfig cloud9ide on

sudo /etc/init.d/cloud9ide start

sudo cp ~/cloud9ide/nginx-ssl.conf /etc/nginx/conf.d/

