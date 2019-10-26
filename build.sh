#!/bin/bash

# First to install is prosody
cat prosody-template.yaml | (set -a; source env.example; set +a; envsubst) > 01.prosody-generated.yaml

# Second to install Jicofo
cat jicofo-template.yaml | (set -a; source env.example; set +a; envsubst) > 02.jicofo-generated.yaml

# Third to install Jitsi-videobridge
cat jvb-template.yaml | (set -a; source env.example; set +a; envsubst) > 03.jvb-generated.yaml

# Forth to install - web-gui
cat web-template.yaml | (set -a; source env.example; set +a; envsubst) > 04.web-generated.yaml

