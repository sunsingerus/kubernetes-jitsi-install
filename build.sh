#!/bin/bash

ENV_FILE="${ENV_FILE:-env.example.sh}"

# Sequence does matter
cat jitsi-config-template.yaml | (set -a; source "${ENV_FILE}" set +a; envsubst) > 01.jitsi-config-generated.yaml

# Prosody
cat prosody-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 02.prosody-generated.yaml

# Jicofo
cat jicofo-template.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 03.jicofo-generated.yaml

# Jitsi-videobridge
cat jvb-template-Deployment.yaml       | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 04.jvb-generated-Deployment.yaml
cat jvb-template-ServiceNodePort.yaml  | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 04.jvb-generated-ServiceNodePort.yaml

# web-gui
cat web-template-Deployment.yaml       | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-Deployment.yaml
cat web-template-IssuerProd.yaml       | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-IssuerProd.yaml
cat web-template-Ingress.yaml          | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-Ingress.yaml
cat web-template-ServiceClusterIP.yaml | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-ServiceClusterIP.yaml
cat web-template-ServiceNodePort.yaml  | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-ServiceNodePort.yaml
cat web-template-ServiceNLB.yaml       | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 05.web-generated-ServiceNLB.yaml

# Jibri
cat jibri-template-Deployment.yaml       | (set -a; source "${ENV_FILE}"; set +a; envsubst) > 06.jibri-generated-Deployment.yaml

# Accumulate everything into one YAML file
cat \
	01.jitsi-config-generated.yaml \
\
	02.prosody-generated.yaml \
	03.jicofo-generated.yaml \
\
	04.jvb-generated-Deployment.yaml \
	04.jvb-generated-ServiceNodePort.yaml \
\
	05.web-generated-Deployment.yaml \
	05.web-generated-IssuerProd.yaml \
	05.web-generated-Ingress.yaml \
	05.web-generated-ServiceClusterIP.yaml \
	05.web-generated-ServiceNodePort.yaml \
	05.web-generated-ServiceNLB.yaml \
> jitsi.yaml

