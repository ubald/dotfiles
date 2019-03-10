#!/bin/sh
set -e

BASE_DIR=$PWD

# Shared dependencies for all Ubuntu installs
./setup_ubuntu_shared.sh

# ROS
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt update && sudo apt --assume-yes install curl gnupg2 lsb-release
curl http://repo.ros2.org/repos.key | sudo apt-key add -

sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

export CHOOSE_ROS_DISTRO=crystal  # or bouncy or ardent
sudo apt update
sudo apt install --assume-yes ros-$CHOOSE_ROS_DISTRO-desktop ros-$CHOOSE_ROS_DISTRO-ros1-bridge
sudo apt install --assume-yes python3-argcomplete python3-colcon-common-extensions

echo "source /opt/ros/$CHOOSE_ROS_DISTRO/setup.bash" >> ~/.bashrc
source ~/.bashrc