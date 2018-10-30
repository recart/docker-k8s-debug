FROM alpine:latest

LABEL Maintener Recart Infrastracture Team

RUN set -x && \
  apk --update upgrade && \
  apk --no-cache add mongodb mysql curl ca-certificates tcpdump openssl python py-pip bash && \
  pip install awscli && \
  adduser debugger -Du 2342 && \
  curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  kubectl version --client

USER debugger

CMD ["/bin/bash"]

