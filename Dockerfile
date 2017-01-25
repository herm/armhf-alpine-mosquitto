FROM container4armhf/armhf-alpine:latest
MAINTAINER Hermann Kraus <docker@kraus.space>

RUN apk add --no-cache mosquitto
RUN mkdir -p /mqtt/config /mqtt/data /mqtt/log && chown mosquitto:mosquitto /mqtt/*

COPY config /mqtt/config
VOLUME ["/mqtt/config", "/mqtt/data", "/mqtt/log"]

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf
