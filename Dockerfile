FROM tetafro/caddy:0.11.4

WORKDIR /app

COPY Caddyfile /etc/
COPY images images
COPY index.html .

CMD ["-agree", "-conf", "/etc/Caddyfile"]
