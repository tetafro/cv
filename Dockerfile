FROM ghcr.io/tetafro/caddy:1.0.4

COPY Caddyfile /etc/
COPY src /app

RUN mkdir /app/logs

CMD ["-agree", "-conf", "/etc/Caddyfile"]
