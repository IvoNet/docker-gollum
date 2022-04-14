FROM ivonet/alpine-base:3.15
LABEL maintainer="@ivonet"

RUN apk update \
 && apk add --no-cache --virtual build-deps build-base icu-dev ruby-dev

RUN apk add --no-cache \
    icu-libs \
    cmake \
    ruby \
    git \
    openssl-dev \
    gcompat

RUN gem install gollum \
 && gem install github-markdown \
 && gem install rdoc

RUN apk del cmake build-base build-deps icu-dev ruby-dev

COPY root/ /

# create a volume and
WORKDIR /wiki

#ENTRYPOINT ["/bin/sh", "-c", "git init && gollum --port 8080 --emoji --allow-uploads page --h1-title --css --js --config /config.rb /wiki"]
EXPOSE 8080

#runit -p 8080:8080 -v "$(pwd)/gollum/wiki/notes.ivonet.it:/wiki" ivonet/gollum