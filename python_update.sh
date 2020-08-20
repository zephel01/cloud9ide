#!/bin/bash

# pyenv update

cd $HOME/.pyenv
git fetch --all
git pull

pyenv install 3.6.10
pyenv global 3.6.10

pip install --upgrade pip

## pip install
pip install -r ~/cloud9/requirements.txt
