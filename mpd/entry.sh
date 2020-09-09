#!/bin/sh

# make directory if necessary
mkdir -p /var/lib/mpd/playlists

# run
mpd --stdout --no-daemon