#!/usr/bin/env bash
set -e

source setup/ubuntu_graphical.sh

# Enable Fish config
enable_fish_config ubuntu.ros2

# ROS
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt update && sudo apt --assume-yes install curl gnupg2 lsb-release
curl http://repo.ros2.org/repos.key | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

export CHOOSE_ROS_DISTRO=crystal
sudo apt update
sudo apt install --assume-yes ros-$CHOOSE_ROS_DISTRO-desktop
sudo apt install --assume-yes python3-argcomplete python3-colcon-common-extensions

echo "source /opt/ros/$CHOOSE_ROS_DISTRO/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Gazebo
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install --assume-yes gazebo9 ros-crystal-gazebo-ros-pkgs

# OpenCM9.04
wget https://raw.githubusercontent.com/ROBOTIS-GIT/OpenCM9.04/master/99-opencm-cdc.rules
sudo mv ./99-opencm-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
