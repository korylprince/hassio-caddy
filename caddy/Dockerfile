ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache caddy

ENV CADDYPATH /ssl

CMD [ "caddy", "-conf", "/share/caddy/Caddyfile" ]
