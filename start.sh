#!/bin/sh -e

xhost +local:docker
cd $(dirname $0)
docker build . -t winamax
docker run --name winamax --rm \
		   --ipc=host \
		   -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
		   -e DISPLAY=$DISPLAY \
		   -v $PWD/winamax-data:/home/user \
		   -v /etc/localtime:/etc/localtime:ro \
		   -v $XDG_RUNTIME_DIR/pulse:/run/user/1000/pulse \
		   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		   winamax

