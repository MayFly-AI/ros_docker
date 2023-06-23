## Docker image with ROS2 humble jammy (ubuntu 22.04 based) and create3 msgs

Docker image automatically configures and launches fastdds discovery server on 192.168.186.3

Communicates with create3 on 192.168.186.2 over ethernet

### Build docker
Inside folder with Dockerfile, do 

`sudo docker build -t ros_mayfly .`

start.sh and superclient.xml gets copied into docker.

start.sh gets called when running docker image. It launches fastdds discovery server.
(it probably only works in docker interactive mode, hence -it below)

### Run docker
`sudo docker run -it --net host ros_mayfly`

