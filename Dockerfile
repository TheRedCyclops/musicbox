FROM debian
LABEL maintainer="***REMOVED***"

RUN mkdir -p /scripts
COPY scripts /scripts
COPY .env .env
RUN apt-get update && apt-get install -y\
       ffmpeg mp3gain mp3val pulseaudio pulseaudio-utils vlc mp3info wget sed iputils-ping cron file curl
# Latest releases available at https://github.com/aptible/supercronic/releases
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.32/supercronic-linux-amd64 \
SUPERCRONIC=supercronic-linux-amd64 \
SUPERCRONIC_SHA1SUM=7da26ce6ab48d75e97f7204554afe7c80779d4e0

RUN curl -fsSLO "$SUPERCRONIC_URL" \
&& echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - \
&& chmod +x "$SUPERCRONIC" \
&& mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
&& ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic
RUN chmod +x /scripts/setup/install && /scripts/setup/install
USER musicbox
ENTRYPOINT [ "/usr/lib/musicbox/load" ]