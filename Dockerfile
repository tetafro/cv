FROM ghcr.io/tetafro/caddy:v1.0.4

COPY Caddyfile /etc/
COPY src /app

RUN mkdir /app/logs

EXPOSE 8080

CMD ["-agree", "-conf", "/etc/Caddyfile"]
