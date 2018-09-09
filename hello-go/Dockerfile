FROM    golang:1.10.4
WORKDIR /go/src/app
COPY    main.go .
RUN     CGO_ENABLED=0 go build \
        -a -tags netgo \
        -ldflags '-w -extldflags "-static"' \
        -o func \
        main.go

FROM    scratch
COPY    --from=0 /go/src/app/func /app/func
ENTRYPOINT ["/app/func"]

