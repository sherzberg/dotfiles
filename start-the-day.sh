#!/bin/bash
set -e

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

sudo pip install -U pip
sudo pip2 install -U pip
sudo pip3 install -U pip

sudo pip install -U neovim
sudo pip2 install -U neovim
sudo pip3 install -U neovim

sudo docker pull alpine
sudo docker pull ubuntu:14.04
sudo docker pull ubuntu:16.04
sudo docker pull debian:jessie
sudo docker pull java:8
sudo docker pull java:9

sudo docker system prune --force
