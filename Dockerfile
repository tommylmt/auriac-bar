FROM debian:bookworm AS main

RUN apt-get update && apt-get upgrade;
RUN apt-get install mpg123 alsa-utils -y;

COPY auriac_buzzer.sh /usr/local/bin/tipsbuzz
RUN chmod +x /usr/local/bin/tipsbuzz

RUN mkdir -p /home/Music/
COPY song.mp3 /home/Music/song.mp3
RUN chmod +r /home/Music/song.mp3

VOLUME /home/Music/

CMD ["tipsbuzz"]
