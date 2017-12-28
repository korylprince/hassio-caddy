ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache caddy

CMD [ "caddy", "-conf", "/share/caddy/Caddyfile" ]
