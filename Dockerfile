FROM debian
LABEL maintainer="***REMOVED***"

RUN mkdir -p /cron && mkdir -p /scripts && mkdir -p /creds


COPY cron /cron
COPY scripts /scripts
COPY creds /creds
RUN apt-get update && apt-get install -y\
       ffmpeg mp3gain mp3val pulseaudio pulseaudio-utils vlc mp3info wget sed iputils-ping cron file
RUN chmod +x /scripts/setup/install && /scripts/setup/install
USER musicbox
ENTRYPOINT [ "/usr/lib/musicbox/load" ]