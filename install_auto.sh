#!/bin/bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update

sudo apt-get install -y python-catkin-pkg python-rosdep python-wstool ros-$ROS_DISTRO-catkin libmosquitto-dev gksu

cd $HOME

git clone https://github.com/sonnet-ai/autoware.git && cd autoware && git checkout tags/1.10.0

sudo apt-get install -y python3-pip python3-setuptools

sudo pip3 install -U setuptools

sudo apt-get install -y python3-colcon-common-extensions

cd ~/autoware/ros/src 

catkin_init_workspace

cd ~/autoware/ros

rosdep update

rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

./catkin_make_release
