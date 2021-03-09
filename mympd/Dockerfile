FROM alpine:3.13 AS build
RUN apk --no-cache add git build-base curl-dev libmpdclient-dev perl cmake flac-dev openssl-dev libid3tag-dev lua5.3-dev \
    	openjdk11-jre-headless linux-headers pcre-dev \
    && git clone https://github.com/jcorporation/myMPD.git \
    && cd myMPD \
    && ./build.sh release && ./build.sh install

FROM alpine:3.13
RUN apk --no-cache add libmpdclient flac libid3tag lua5.3 openssl pcre
COPY --from=build /usr/bin/mympd* /usr/bin/
COPY ./mympd.conf /etc/mympd.conf
EXPOSE 80
CMD [ "mympd" ]