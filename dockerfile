FROM golang

USER root

ENV HTTP_PROXY="http://proxy.ar.bsch:8080"
ENV HTTPS_PROXY="http://proxy.ar.bsch:8080"
ENV API_PORT=3000

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

# Build the Go app
RUN go build -o main .

# Expose port 3000 to the outside world
EXPOSE $API_PORT

# Command to run the executable
CMD ["./main"]
