#!/bin/bash

./build.sh

kubectl -n jitsi apply -f 01.jitsi-config-generated.yaml

kubectl -n jitsi apply -f 02.prosody-generated.yaml
sleep 60
kubectl -n jitsi apply -f 03.jicofo-generated.yaml
sleep 60
kubectl -n jitsi apply -f 04.jvb-generated-Deployment.yaml
sleep 60
kubectl -n jitsi apply -f 05.web-generated-Deployment.yaml
sleep 60
kubectl -n jitsi apply -f 06.jibri-generated-Deployment.yaml
watch 'kubectl -n jitsi get all'

