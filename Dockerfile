FROM i386/debian:buster-slim
LABEL maintainer="gautier_win@damsy.net"

RUN apt update && \
    apt install -y --no-install-recommends wget wine winbind ca-certificates && \
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
