FROM i386/debian:buster-slim
LABEL maintainer="gautier_win@damsy.net"

RUN apt update && apt install -y --no-install-recommends chromium wget ca-certificates gnupg2 && \
	wget -nc https://dl.winehq.org/wine-builds/winehq.key && \
	apt-key add winehq.key && \
	echo 'deb https://dl.winehq.org/wine-builds/debian/ buster main' >> /etc/apt/sources.list && \
	apt update && \
    apt install -y winehq-staging winbind libgnutls30 libldap-2.4-2 libgpg-error0 libxml2 libasound2-plugins libsdl2-2.0-0 libfreetype6 libdbus-1-3 libsqlite3-0 && \
    apt clean && \
    wget https://dl.winamax.fr/client/windows/installer/wamInstall.exe
COPY entrypoint.sh /

# Create a user
ENV USER user
ENV UID 1000
ENV GROUPS audio,video
ENV HOME /home/$USER
RUN mkdir -p /run/user/1000 && useradd -m -d $HOME -u $UID -G $GROUPS $USER && chown user /home/$USER /run/user/1000 -R
USER user

CMD [ "bash", "/entrypoint.sh" ]
