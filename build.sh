#!/bin/bash

ENV_FILE="env.example"

# Sequence does matter
cat jitsi-config-template.yaml | (set -a; source "${ENV_FILE}" set +a; envsubst) > 01.jitsi-config-generated.yaml

# Prosody
cat prosody-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 02.prosody-generated.yaml

# Jicofo
cat jicofo-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 03.jicofo-generated.yaml

# Jitsi-videobridge
cat jvb-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 04.jvb-generated.yaml

# web-gui
cat web-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated.yaml

