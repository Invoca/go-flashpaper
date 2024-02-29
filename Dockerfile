FROM golang:1.22.0 as builder
RUN CGO_ENABLED=0 go install github.com/rawdigits/go-flashpaper@v0.0.0-20200219173301-25acfd6c37cd

FROM scratch
COPY --from=builder /go/bin/go-flashpaper /usr/local/bin/go-flashpaper
ENTRYPOINT ["/usr/local/bin/go-flashpaper"]
CMD ["-autocert", "true"]
EXPOSE 8443
