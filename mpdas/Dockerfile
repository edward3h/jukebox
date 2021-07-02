FROM alpine:3.14 AS build
RUN apk --no-cache add git build-base curl-dev libmpdclient-dev gettext \
    && git clone https://github.com/hrkfdn/mpdas.git \
    && cd mpdas \
    && make install

FROM alpine:3.14
RUN apk --no-cache add libcurl libmpdclient libintl libstdc++
COPY --from=build /usr/local/bin/mpdas /usr/bin/envsubst /usr/local/bin/
COPY ./start.sh ./mpdasrc.template ./
CMD [ "./start.sh" ]