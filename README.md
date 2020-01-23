This is a dockerfile for compiling ROS melodic armhf binaries  on an x86-64 computer.
It is based off of arm32v7/ros:melodic-ros-core-bionic but it
1. Replaces some arm native binaries with x86-64 binaries, thus they do not need to be run with qemu-arm and
   run a lot faster
2. In particular, cmake is x86 and the compiler is set to be gcc-arm-linux-gnueabi, which is the x86-64 cross compiler for arm
3. There is some hacking involved because apt does not like to install the x86 packages so i
   determined all dependencies with apt-rdepends, download the packages with apt and install them with dpkg -i --force-all
4. To compile your ros workspace cd into it and run catkin_arm. This will create armhf_build armhf_devel and armhf_install
