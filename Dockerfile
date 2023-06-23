# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:humble-ros-core-jammy

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    python3-rosdep \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO

# setup colcon mixin and metadata
RUN colcon mixin add default \
      https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml && \
    colcon mixin update && \
    colcon metadata add default \
      https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml && \
    colcon metadata update

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-ros-base=0.10.0-1* \
    && rm -rf /var/lib/apt/lists/*

# a few extra utilities
RUN apt update && apt install -y vim net-tools iputils-ping

# install create3 msgs
RUN apt update && apt install -y ros-humble-irobot-create-msgs

# setup and launch fastdds discovery server
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV ROS_DISCOVERY_SERVER=127.0.0.1:11811

# dump file superclient.xml with following content
COPY superclient.xml /superclient.xml
ENV FASTRTPS_DEFAULT_PROFILES_FILE=/superclient.xml

# start fastdds discovery server
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD /start.sh
