FROM debian:jessie

# To avoid problems with Dialog and curses wizards
ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install ca-certificates wget wine \
                       binutils pciutils pulseaudio libcanberra-gtk-module \
                       libopenal1 libnss3 libgconf-2-4 libxss1 libnm-glib4 \
                       libnm-util2 libglu1-mesa locales libsdl2-image-2.0 \
                       xdg-utils firefox-esr \
                       mesa-utils:i386 \
                       libstdc++5 libstdc++5:i386 libbz2-1.0:i386 \
                       libavformat56 libswscale3 libavcodec56:i386 \
                       libavformat56:i386 libavresample2:i386 libavutil54:i386 \
                       libswscale3:i386 libsdl2-2.0-0 libsdl2-2.0-0:i386 \
                       libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386 \
                       libxtst6:i386 libxrandr2:i386 libglib2.0-0:i386 \
                       libgtk2.0-0:i386 libgdk-pixbuf2.0-0:i386 libsm6:i386 \
                       libice6:i386 libopenal1:i386 libdbus-glib-1-2:i386 \
                       libnm-glib4:i386 libnm-util2:i386 libusb-1.0-0:i386 \
                       libnss3:i386 libgconf-2-4:i386 libxss1:i386 libcurl3:i386 \
                       libv8-dev:i386 \
                       libcanberra-gtk-module:i386 libpulse0:i386 attr \
                       libva-x11-1:amd64 libva-x11-1:i386


# Fix bug https://github.com/arno01/steam/issues/11 where Pulseaudio crashes
# microphone is accessed via push-to-talk.
RUN echo "enable-shm = no" >> /etc/pulse/client.conf

RUN wget https://dl.vip.winamax.fr/client/wam/WinamaxInstall.exe

COPY entrypoint.sh /

RUN apt-get clean

# WORKDIR $HOME
# USER $USER

CMD [ "bash", "/entrypoint.sh" ]
