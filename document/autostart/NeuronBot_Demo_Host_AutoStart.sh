#!/bin/bash
echo "===== ADLINK Neuronbot AutoStart (Host) ====="
echo "Pausing for booting stabilization"
sleep 20
echo "Loading env parameters ..."
# ROS 2.0 (ardent)
#RMW_IMPLEMENTATION=rmw_opensplice_cpp
#source /opt/ros/ardent/setup.bash

# ROS 1.0 (Kinetic)
source /opt/ros/kinetic/setup.bash
source /home/ros/catkin_ws/devel/setup.bash

# ROS 1 multi-machine
export ROS_MASTER_URI=http://192.168.50.190:11311
export ROS_IP=192.168.50.190

export HOSTNAME
#source /home/ros/.bashrc

echo "Launch AIO for host robot (person following) ..."
xterm -title "ROS 1 Nodes" -hold -e "source /home/ros/.bashrc && roslaunch adlink_neuronbot NeuronBot_Demo_Host_AIO.launch" &

#echo "Waiting 5 sec before executing ros2 nodes (for swarm) ..."
#sleep 5
#xterm -title "ROS 2 Nodes" -hold -e "ros2 run ros1_bridge parameter_bridge"
#roslaunch adlink_neuronbot ADLink_NeuronBot_Demo_AIO.launch --pid ros.pid
