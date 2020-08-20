#!/bin/bash

## aws ec2 & cloud9 rbenv install
sudo yum -y install gcc-c++ openssl-devel git readline-devel

mkdir ~/.rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

mkdir ~/.rbenv/plugins ~/.rbenv/plugins/ruby-build
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

cd ~/.rbenv/plugins/ruby-build
sudo ./install.sh

cat << 'EOF' >> ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
EOF

source ~/.bash_profile
rbenv install 2.5.1

rbenv rehash
rbenv global 2.5.1

rbenv exec gem install bundler
rbenv rehash

