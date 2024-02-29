FROM golang:1.22 as builder
WORKDIR /usr/src/app
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
RUN go build -v -o /usr/local/bin/go-flashpaper ./...

ENTRYPOINT ["/usr/local/bin/go-flashpaper"]
CMD ["-autocert", "true"]
EXPOSE 8443
