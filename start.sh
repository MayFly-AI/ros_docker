#!/bin/bash
source /opt/ros/humble/setup.bash
fastdds discovery -i 0 &
echo "fastdds discovery server now running\n"

/bin/bash
