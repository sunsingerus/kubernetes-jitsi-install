#!/bin/bash


kubectl -n jitsi delete -f 02.prosody-generated.yaml
kubectl -n jitsi delete -f 03.jicofo-generated.yaml
kubectl -n jitsi delete -f 04.jvb-generated-Deployment.yaml
kubectl -n jitsi delete -f 05.web-generated-Deployment.yaml
kubectl -n jitsi delete -f 06.jibri-generated-Deployment.yaml
