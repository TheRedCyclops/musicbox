FROM debian
LABEL maintainer="***REMOVED***"
# Declare arguments
ARG ARCH
ENV ARCH=${ARCH}
ARG MUSICBOX_BIN_DIR
ENV MUSICBOX_BIN_DIR=${MUSICBOX_BIN_DIR}
ARG MUSICBOX_TMP_DIR
ENV MUSICBOX_TMP_DIR=${MUSICBOX_TMP_DIR}
ARG MUSICBOX_LOG_DIR
ENV MUSICBOX_LOG_DIR=${MUSICBOX_LOG_DIR}
ARG MUSICBOX_CFG_DIR
ENV MUSICBOX_CFG_DIR=${MUSICBOX_CFG_DIR}
ARG MUSICBOX_CACHE_DIR
ENV MUSICBOX_CACHE_DIR=${MUSICBOX_CACHE_DIR}
ARG MUSICBOX_USER_DIR
ENV MUSICBOX_USER_DIR=${MUSICBOX_USER_DIR}
ARG MUSICBOX_USER
ENV MUSICBOX_USER=${MUSICBOX_USER}
ARG MUSICBOX_USER_GID
ENV MUSICBOX_USER_GID=${MUSICBOX_USER_GID}
ARG MUSICBOX_USER_UID
ENV MUSICBOX_USER_UID=${MUSICBOX_USER_UID}
# Install packages
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
RUN mkdir -p /scripts
COPY scripts /scripts
COPY .env .env
RUN mkdir -p "$MUSICBOX_BIN_DIR" "$MUSICBOX_LOG_DIR" "$MUSICBOX_TMP_DIR" "$MUSICBOX_CFG_DIR" "$MUSICBOX_CACHE_DIR"
RUN addgroup --gid ${MUSICBOX_USER_GID} ${MUSICBOX_USER} && \
    adduser --uid ${MUSICBOX_USER_UID} --gid ${MUSICBOX_USER_GID} --disabled-password ${MUSICBOX_USER}
RUN chown -R ${MUSICBOX_USER}:${MUSICBOX_USER} "$MUSICBOX_BIN_DIR" "$MUSICBOX_LOG_DIR" "$MUSICBOX_TMP_DIR" "$MUSICBOX_CFG_DIR" "$MUSICBOX_CACHE_DIR"
RUN chmod +x /scripts/setup/install && /scripts/setup/install
#USER ${MUSICBOX_USER}
ENTRYPOINT [ "/usr/lib/musicbox/init.sh" ]
#ENTRYPOINT [ "/usr/lib/musicbox/load" ]