FROM golang:1.22.0 as builder
WORKDIR /usr/src/app
COPY go.mod go.sum flashpaper.go .
RUN go mod download
RUN go mod verify
RUN CGO_ENABLED=0 GOOS=linux go build -v -o /usr/src/app/go-flashpaper ./...

FROM alpine
COPY --from=builder /usr/src/app/go-flashpaper /usr/local/bin/go-flashpaper
ENTRYPOINT ["/usr/local/bin/go-flashpaper"]
CMD ["-autocert", "true"]
EXPOSE 8443
