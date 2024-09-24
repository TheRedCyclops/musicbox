#!/bin/bash
chown -R "${MUSICBOX_USER}:${MUSICBOX_USER}" "$MUSICBOX_BIN_DIR" "$MUSICBOX_LOG_DIR" "$MUSICBOX_TMP_DIR" "$MUSICBOX_CFG_DIR" "$MUSICBOX_CACHE_DIR"
case $MUSICBOX_AUDIO_SERVER in  \
    wireplumber) apt-get update && apt-get install -y wireplumber;;
    pulseaudio)  apt-get update && apt-get install -y pulseaudio;
cat << EOF > /etc/pulse/client.conf
default-server = unix:$MUSICBOX_PULSEAUDIO_SOCKET
autospawn = no
daemon-binary = /bin/true
enable-shm = false

EOF
;;
    alsa) apt-get update && apt-get install -y alsa; addgroup audio; usermod -aG audio "${MUSICBOX_USER}";;
esac
su musicbox -c "$MUSICBOX_BIN_DIR"/load
