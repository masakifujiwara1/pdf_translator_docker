#!/bin/bash

eval "docker container run \
--network host \
-it \
--name my-pdf \
-e DISPLAY=$DISPLAY \
--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
-v $PWD/docker_share:/home/host_files \
-v $PWD/output:/home/Index_PDF_Translation/output \
-v $PWD/input:/home/Index_PDF_Translation/input \
--privileged \
--env="XAUTHORITY=$XAUTH" \
-v "$XAUTH:$XAUTH" \
--env="QT_X11_NO_MITSHM=1" \
--ipc=host \
masakifujiwara1/pdf-translator:ubuntu22.04-py3.11.0"
