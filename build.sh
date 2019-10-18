#!/bin/bash

cat web-template.yaml | (set -a; source env.example; set +a; envsubst) > web-generated.yaml
cat jvb-template.yaml | (set -a; source env.example; set +a; envsubst) > jvb-generated.yaml
cat jicofo-template.yaml | (set -a; source env.example; set +a; envsubst) > jicofo-generated.yaml
cat prosody-template.yaml | (set -a; source env.example; set +a; envsubst) > prosody-generated.yaml

