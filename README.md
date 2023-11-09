A Docker file is made to build a Docker container which sets up an environment with the necessary dependencies for the AM_robot project: https://github.com/theacharlotte/AM-robot
The file init.md gives the commands that are used to build and run the Docker.

The Docker file includes installation of libfranka v0.9.2 and frankx v0.2.0 for communication with Franka Emika Panda robot, and the dependencies for libfranka, frankx and AM_robot.
Python 3.10 is installed as well as usefull packages such as git and GCC.

To use this container, ensure Docker is installed on your system and build the image by looking at the commands in the init.md file. Once built, you can run the container to get environment needed to run the functions in this (AM-robot) project.
