# Jukebox

This is my somewhat opinionated [MPD](https://www.musicpd.org/) setup.

## Dependencies

[docker-compose](https://docs.docker.com/compose/)

## Setup

Clone this repository and change into the 'jukebox' directory.

Copy `example.env` to `.env`, and edit the variable values.

* `MUSIC_DIR` The root directory of where you keep your music files.
* `LASTFM_USER`, `LASTFM_PASS` Username and password to log in to [last.fm](https://www.last.fm/) for scrobbling.
* `LIBREFM` If this is set to a non-empty value, scrobbling will go to [libre.fm](https://libre.fm/) instead of last.fm. (Libre.fm can be configured to also scrobble to last.fm, so this can do both.)

Run `docker-compose up` (or `docker-compose up --build` to rebuild with any changes).

Open your browser to <http://localhost:4080/> (or whatever hostname) to use the
[myMPD](https://jcorporation.github.io/myMPD/) web interface. Local playback is
supported.

You can also connect any audio client that supports mp3 streams to <http://localhost:8000/>

## Related

I'm using [Beets](http://beets.io/) for organizing my music collection (but it's not in this image).
