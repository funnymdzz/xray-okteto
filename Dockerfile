FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy wget && \
    wget -qO- https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip | busybox unzip - && \
    chmod +x /xray && \
    rm -rf /var/cache/apk/*
    
ENV AUUID 7b193f93-f2e4-49d4-9682-0f6bbcc619f1
ENV PORT 8080
ENV CADDYIndexPage https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html
ENV CONFIGCADDY https://raw.githubusercontent.com/funnymdzz/xray-okteto/master/etc/Caddyfile
ENV CONFIGXRAY https://raw.githubusercontent.com/funnymdzz/xray-okteto/master/etc/xray.json
ENV ParameterSSENCYPT chacha20-ietf-poly1305
ENV StoreFiles https://raw.githubusercontent.com/mixool/xrayku/master/etc/StoreFiles

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
