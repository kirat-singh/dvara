FROM golang:1.5.1
ENV GO15VENDOREXPERIMENT 1

ADD . /go/src/github.com/intercom/dvara
RUN go install github.com/intercom/dvara/cmd/dvara
ENTRYPOINT /go/bin/dvara -addrs=$MONGO_ADDRS -max_connections=1000 -max_per_client_connections=100 --port_start=6000 --port_end=6010

EXPOSE 6000-6010
