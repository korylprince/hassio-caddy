ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache caddy=0.11.1-r0 jq coreutils

ENV CADDYPATH /ssl

COPY run.sh /

CMD [ "/run.sh" ]
