FROM arm32v7/ros:noetic-ros-core-focal
COPY sources.list /etc/apt/sources.list
#RUN dpkg --add-architecture amd64
#RUN apt-get update -yq && apt-get install -yq ros-noetic-desktop-full:armhf
#RUN apt-get upgrade -yq
# Now we have all up to date arm packages.
# Next, stuff is broken but lets use native apt
#RUN apt-get -f install -yq  --allow-remove-essential apt:amd64
# manually install dash. WE just need the binary and the pre/post installs scripts always fail
#RUN apt-get download dash && dpkg-deb -x dash_* dash && cp /dash/bin/dash /bin/dash && rm -rf dash*

# Manually download and install all the x86 packages we need while ignoring dependencies.
# The binaries will overwrite the arm binaries but the
# amd64 and armhf libraries will remain installed side by side
# Ideally, all uses of the docker container after this point
# including during the build process, will not require qemu-arm-static

# A list of all recursive dependencies generated running the command on a working Ubuntu system
# apt-rdepends coreutils findutils gawk grep sed make \
#              gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf\
#              bash cmake python python3 lsb-release perm passwd | grep -v "^ "\
#              | grep -v "^awk$" | grep -v "debconf-2.0" > dependencies.txt
#COPY dependencies.txt /dependencies.txt
#RUN apt-get download $(xargs -a dependencies.txt)
#RUN dpkg -i --force-all *.deb && rm *.deb

# We now have most of our build tools running native
# Bring in the cmake toolchain file
#COPY raspi-toolchain.cmake /toolchain.cmake
#RUN mkdir /ros_ws
#VOLUME /ros_ws

#COPY catkin_arm /usr/bin/catkin_arm
#COPY catkin_arm_isolated /usr/bin/catkin_arm_isolated
#COPY arm /arm
#RUN chmod 666 /etc/group /etc/passwd
#WORKDIR /ros_ws
#CMD ["cat", "/arm"]
