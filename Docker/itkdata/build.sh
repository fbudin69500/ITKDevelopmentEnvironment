#!/bin/bash
GID_local=`id -g` # UID variable gives the good answer, but $GID is blank in the script
sed "s/@UID@/$UID/g" Dockerfile.in | sed "s/@GID@/$GID_local/g" > Dockerfile

docker build -t insighttoolkit/itkdata .
