FROM alpine:3.8 AS build-caddy

WORKDIR /build

RUN apk add --no-cache wget ca-certificates && \
    wget -q -O caddy.tar.gz https://caddyserver.com/download/linux/amd64?license=personal && \
    tar -xzf caddy.tar.gz

FROM alpine:3.8

RUN apk add --no-cache ca-certificates

WORKDIR /app

COPY --from=build-caddy /build/caddy /usr/local/bin/caddy
COPY Caddyfile /etc/

COPY images images
COPY index.html .

RUN mkdir .well-known && \
    chmod u+x /usr/local/bin/caddy

EXPOSE 80 443 2015

CMD ["caddy", "-agree", "-conf", "/etc/Caddyfile"]
