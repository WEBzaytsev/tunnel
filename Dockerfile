FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN curl -L https://github.com/amalshaji/portr/releases/download/0.0.28-beta/portr_0.0.28-beta_Linux_x86_64.zip -o portr.zip \
    && unzip portr.zip \
    && mv portr /usr/local/bin/ \
    && chmod +x /usr/local/bin/portr \
    && rm portr.zip

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"] 