FROM alpine:3.10

ARG BEAT=journalbeat

RUN addgroup beat && \
    adduser -S -G beat beat

RUN mkdir -p /beat/config && \
    chown -R beat:beat /beat

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["$BEAT"]
