FROM tetafro/caddy:1.0.3

COPY Caddyfile /etc/
COPY src /app

CMD ["-agree", "-conf", "/etc/Caddyfile"]
