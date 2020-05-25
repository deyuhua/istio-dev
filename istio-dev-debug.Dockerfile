FROM golang:1.13-alpine

RUN apk add --no-cache --update alpine-sdk
RUN go get github.com/derekparker/delve/cmd/dlv


From docker.io/deyuhua/pilot:dev

RUN apt-get update && apt-get install golang git -y
RUN mkdir -p /go
ENV GOPATH /go
RUN go get github.com/deyuhua/delve/cmd/dlv 

EXPOSE 40000
ENTRYPOINT ["/go/bin/dlv", "--listen=:40000", "--headless=true", "--api-version=2", "exec", "/usr/local/bin/pilot-discovery", "--"]
