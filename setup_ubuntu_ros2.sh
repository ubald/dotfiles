#!/bin/sh
set -e

BASE_DIR=$PWD

# Shared dependencies for all Ubuntu installs
./setup_ubuntu_shared.sh

# Enable Fish config
ln -fs ~/.config/fish/conf.d.available/ubuntu.ros2.fish ~/.config/fish/conf.d/ubuntu.ros2.fish

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