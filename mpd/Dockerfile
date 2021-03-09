#
# Dockerfile for mpd
#

FROM alpine:3.12 AS build

ARG MPD_VERSION
RUN apk add --no-cache build-base boost ninja boost-dev meson sqlite-dev ffmpeg-dev icu-dev \
    libid3tag-dev pcre-dev gnu-libiconv-dev lame-dev \
    && export MPD_VERSION_MINOR=$(echo "$MPD_VERSION" | cut -d '.' -f 1,2) \
    && wget https://www.musicpd.org/download/mpd/${MPD_VERSION_MINOR}/mpd-${MPD_VERSION}.tar.xz \
    && tar xf mpd-${MPD_VERSION}.tar.xz \
    && cd mpd-${MPD_VERSION} \
    && meson . output/release \
  --prefix=/usr \
  --sysconfdir=/etc \
  --mandir=/usr/share/man \
  --localstatedir=/var \
  --buildtype=release \
  -Dcue=true \
  -Ddaemon=false \
  -Ddatabase=true \
  -Depoll=true \
  -Deventfd=true \
  -Dfifo=true \
  -Dinotify=true \
  -Dlocal_socket=true \
  -Dpipe=true \
  -Dsignalfd=true \
  -Dtcp=true \
  -Dalsa=disabled \
  -Dffmpeg=enabled \
  -Dipv6=enabled \
  -Dsqlite=enabled \
  -Dsyslog=enabled \
  -Ddocumentation=disabled \
  -Ddsd=false \
  -Dhttpd=true \
  -Dneighbor=false \
  -Drecorder=false \
  -Dtest=false \
  -Dwave_encoder=false \
  -Dadplug=disabled \
  -Dao=disabled \
  -Daudiofile=disabled \
  -Dbzip2=disabled \
  -Dcdio_paranoia=disabled \
  -Dchromaprint=disabled \
  -Dcurl=disabled \
  -Ddbus=disabled \
  -Dexpat=disabled \
  -Dfaad=disabled \
  -Dflac=disabled \
  -Dfluidsynth=disabled \
  -Dgme=disabled \
  -Diconv=enabled \
  -Dicu=enabled \
  -Did3tag=enabled \
  -Diso9660=disabled \
  -Djack=disabled \
  -Dlame=enabled \
  -Dlibmpdclient=disabled \
  -Dlibsamplerate=disabled \
  -Dmad=disabled \
  -Dmikmod=disabled \
  -Dmms=disabled \
  -Dmodplug=disabled \
  -Dmpcdec=disabled \
  -Dmpg123=disabled \
  -Dnfs=disabled \
  -Dopenal=disabled \
  -Dopus=disabled \
  -Doss=disabled \
  -Dpcre=enabled \
  -Dpulse=disabled \
  -Dqobuz=disabled \
  -Dshine=disabled \
  -Dshout=disabled \
  -Dsidplay=disabled \
  -Dsmbclient=disabled \
  -Dsndfile=disabled \
  -Dsndio=disabled \
  -Dsolaris_output=disabled \
  -Dsoundcloud=disabled \
  -Dsoxr=disabled \
  -Dsystemd=disabled \
  -Dtidal=disabled \
  -Dtremor=disabled \
  -Dtwolame=disabled \
  -Dudisks=disabled \
  -Dupnp=disabled \
  -Dvorbis=disabled \
  -Dvorbisenc=disabled \
  -Dwavpack=disabled \
  -Dwebdav=disabled \
  -Dwildmidi=disabled \
  -Dyajl=disabled \
  -Dzeroconf=disabled \
  -Dzlib=disabled \
  -Dzzip=disabled \
  && meson configure output/release \
  && ninja -C output/release

FROM alpine:3.12
RUN apk add --no-cache sqlite-libs ffmpeg pcre icu libid3tag lame
COPY --from=build /mpd-*/output/release/mpd /usr/bin/mpd
COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd
COPY entry.sh .

EXPOSE 6600
EXPOSE 8000
CMD [ "./entry.sh" ]
