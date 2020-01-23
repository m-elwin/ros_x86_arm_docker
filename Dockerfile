FROM arm32v7/ros:melodic-ros-core-bionic
COPY sources.list /etc/apt/sources.list
RUN dpkg --add-architecture amd64
RUN apt-get update -yq && apt-get install -yq ros-melodic-desktop
RUN apt-get upgrade -yq
# Now we have all up to date arm packages.
# Next, stuff is broken but lets use native apt
RUN apt-get -f install -yq  --allow-remove-essential apt:amd64
# manually download all packages and dependencies we needed
# (generated with apt-rdepends cmake gcc-arm-linux-gnueabi g++-arm-linux-gnueabi, then edited to take out predepends multiarch and version numbers)
# The idea is to replace arm binaries used in the build process with amd64 binaries, including a crosscompiler
# We still link against armhf libraries, but by using the native crosscompiler everything runs significantly faster
COPY dependencies.txt /dependencies.txt
RUN apt-get download $(xargs -a dependencies.txt)
RUN dpkg -i --force-all *.deb && rm *.deb
# We now have most of our build tools running native
# Bring in the cmake toolchain file
COPY raspi-toolchain.cmake /toolchain.cmake
RUN mkdir /ros_ws
VOLUME /ros_ws

