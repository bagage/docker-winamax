# Winamax container

Run this image with:

```
# you may need to enable xhost
xhost +local:docker 
# then
docker run bagage/winamax \
           --ipc=host \
            -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
            -e DISPLAY=$DISPLAY \
            -v $PWD/winamax-data:/home/user \
            -v /etc/localtime:/etc/localtime:ro \
            -v $XDG_RUNTIME_DIR/pulse:/run/user/1000/pulse \
            -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
            winamax
```

Where:

- DISPLAY and X11-unix are needed for displaying Winamax GUI.
- PULSE_SERVER and XDG_RUNTIME_DIR are needed for audio in Winamax.
- `$PWD/winamax-data` is the path on the host machine to folder where Winamax configuration / data will be persisted.
- `--ipc=host` is necessary to avoid [MIT-SHG related crashes](https://github.com/jessfraz/dockerfiles/issues/359) when resizing windows.
- mounting `/etc/localtime` so that proper timezone is used.

:warning: Winamax will be installed twice at first run. **Do not start Winamax immediately after first install because it will fail**