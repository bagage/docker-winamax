#!/bin/sh

docker build . -t winamax
docker run -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
		   -e DISPLAY=$DISPLAY \
		   -v $PWD/winamax-data:/root \
		   -v $XDG_RUNTIME_DIR/pulse:/run/user/1000/pulse \
		   -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		   winamax
