#!/bin/bash

cat web-template.yaml | (set -a; source env.example; set _a; envsubst) > web-generated.yaml
cat jvb-template.yaml | (set -a; source env.example; set _a; envsubst) > jvb-generated.yaml
cat jicofo-template.yaml | (set -a; source env.example; set _a; envsubst) > jicofo-generated.yaml
cat prosody-template.yaml | (set -a; source env.example; set _a; envsubst) > prosody-generated.yaml

