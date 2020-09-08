#!/bin/sh

if [ -z "$LASTFM_USER" ]; then
    echo "Missing required variable LASTFM_USER"
    MISSING="true"
fi

if [ -z "$LASTFM_PASS" ]; then
    echo "Missing required variable LASTFM_PASS"
    MISSING="true"
fi

if [ "$MISSING" = "true" ]; then
    exit 1
fi

if [ -z "$MPD_HOST" ]; then 
    MPD_HOST=mpd
fi

if [ -n "$LIBREFM" ]; then
    SERVICE=librefm
fi

export LASTFM_PASS LASTFM_USER MPD_HOST SERVICE
mkdir -p /usr/local/etc
envsubst < mpdasrc.template > /usr/local/etc/mpdasrc

mpdas