
# Docker image with ROS2 humble jammy (ubuntu 22.04 based) and create3 msgs
# Docker image automatically configures and launches fastdds discovery server on 192.168.186.3
# Communicates with create3 on 192.168.186.2 over ethernet

# Build docker
# in ros_docker folder, do 
sudo docker build -t ros_mayfly .

# OBS start.sh and superclient.xml gets copied into docker. 
# start.sh gets called when running docker image which launches fastdds discovery server
# (probably ony works in docker interactive mode, hence -it below)

# Run docker (from anywhere)
sudo docker run -it --net host ros_mayfly
