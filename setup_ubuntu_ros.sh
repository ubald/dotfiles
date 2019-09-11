#!/bin/sh
set -e

BASE_DIR=$PWD

# Shared dependencies for all Ubuntu installs
# ./setup_ubuntu_shared.sh

# Enable Fish config
ln -fs ~/.config/fish/conf.d.available/ubuntu.ros.fish ~/.config/fish/conf.d/ubuntu.ros.fish

# ROS
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt install --assume-yes ros-melodic-desktop-full

sudo rosdep init
rosdep update

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install --assume-yes python-rosinstall python-rosinstall-generator python-wstool build-essential

# OpenCM9.04
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/99-opencm-cdc.rules
sudo mv ./99-opencm-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger