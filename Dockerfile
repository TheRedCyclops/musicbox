FROM debian
LABEL maintainer="***REMOVED***"

RUN mkdir -p /cron && mkdir -p /scripts && mkdir -p /creds


COPY cron /cron
COPY scripts /scripts
COPY creds /creds
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update \
    && apt-get -qq -o=Dpkg::Use-Pty=0 -y install \
       ffmpeg mp3gain mp3val pulseaudio pulseaudio-utils vlc mp3info wget sed iputils-ping cron file
RUN chmod +x /scripts/setup/install && /scripts/setup/install
USER musicbox
ENTRYPOINT [ "/usr/lib/musicbox/load" ]