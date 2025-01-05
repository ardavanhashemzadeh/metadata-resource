FROM alpine

LABEL maintainer="Ardy Hashem <priv@c.y>"

ADD check /opt/resource/check

RUN apk add --no-cache bash
RUN chmod +x /opt/resource/check
RUN ln -s /opt/resource/check /opt/resource/in
RUN ln -s /opt/resource/check /opt/resource/out
