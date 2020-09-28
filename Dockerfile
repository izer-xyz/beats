FROM alpine:3.10

ARG BEAT=journalbeat

RUN addgroup beat && \
    adduser -S -G beat beat

RUN mkdir -p /beat/config && \
    chown -R beat:beat /beat

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
#COPY beat/$BEAT/$BEAT /usr/bin
COPY logz.io/$BEAT.yml /beat/config/$BEAT.yml

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["$BEAT"]
