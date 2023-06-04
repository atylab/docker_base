FROM --platform=linux/amd64 almalinux:8

ARG version="1.20.4"

RUN dnf -y update && dnf clean all

RUN dnf -y install wget

RUN wget https://storage.googleapis.com/golang/go${version}.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go${version}.linux-amd64.tar.gz
RUN rm -rf /go${version}.linux-amd64.tar.gz

ENV PATH $PATH=$PATH:/usr/local/go/bin

ARG HOME_DIR='/vol'
ENV HOME $HOME_DIR

CMD ["/sbin/init"]
