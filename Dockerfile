FROM debian
LABEL maintainer="***REMOVED***"

RUN mkdir -p /cron && mkdir -p /scripts && mkdir -p /creds


COPY cron /cron
COPY scripts /scripts
COPY creds /creds

RUN chmod +x /scripts/setup/install && /scripts/setup/install

ENTRYPOINT [ "/usr/lib/musicbox/load" ]