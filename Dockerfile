FROM golang:1.10.2

LABEL "com.github.actions.name"="fission-action"
LABEL "com.github.actions.description"="A action for Fission functions"
LABEL "com.github.actions.color"="gray-dark"

LABEL "name"="fission-apply-action"
LABEL "maintainer"="Vishal Biyani <vishal@infracloud.io>"
LABEL "version"="0.1.0"

LABEL "repository"="http://github.com/fission/action"
LABEL "homepage"="http://github.com/fission/fission"

ARG K8S_VERSION=v1.11.5

RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$K8S_VERSION/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl

RUN wget -O /usr/local/bin/fission https://github.com/fission/fission/releases/download/1.0.0/fission-cli-linux && \
  chmod +x /usr/local/bin/fission

COPY entrypoint.sh /entrypoint.sh
COPY kubeconfig /kubeconfig
ENV KUBECONFIG=/kubeconfig

ENTRYPOINT ["/entrypoint.sh"]