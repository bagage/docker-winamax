# Winamax container

Run this image with:

```
docker run bagage/winamax \
            -e PULSE_SERVER=unix:$XDG_RUNTIME_DIR/pulse/native \
            -e DISPLAY=$DISPLAY \
            -v $PWD/winamax-data:/root \
            -v $XDG_RUNTIME_DIR/pulse:/run/user/1000/pulse \
            -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
            winamax
```

Where:

- PULSE_SERVER and XDG_RUNTIME_DIR are needed for audio in Winamax
- DISPLAY and X11-unix are needed for displaying Winamax window
- `$PWD/winamax-data` is the path on the host machine to folder where Winamax configuration / data will be persisted.