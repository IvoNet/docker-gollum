# Gollum wiki

My wiki for notes


## Usage 

something like this

```shell

#!/usr/bin/env bash

docker rm -f notes 2>/dev/null
docker pull ivonet/gollum:latest
docker run \
   --name notes \
   -d \
   -p 32805:8080 \
   --restart unless-stopped \
   -v /notes.ivonet.it:/wiki ivonet/gollum

```
