FROM alpine:latest AS main

RUN apk update && apk upgrade;
RUN apk add --no-cache mpg123 alsa-utils alsaconf;

COPY auriac_buzzer.sh /usr/local/bin/tipsbuzz
RUN chmod +x /usr/local/bin/tipsbuzz

RUN mkdir -p /home/Music/
COPY song.mp3 /home/Music/song.mp3
RUN chmod +r /home/Music/song.mp3

VOLUME /home/Music/

CMD ["tipsbuzz"]
