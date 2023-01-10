#!/bin/bash

docker build -t "maxwai/external-ip-check:$1" .
docker build -t maxwai/external-ip-check:latest .
docker push "maxwai/external-ip-check:$1"
docker push maxwai/external-ip-check:latest