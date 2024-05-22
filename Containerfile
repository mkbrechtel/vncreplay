FROM debian:bookworm as env

RUN apt-get update && apt-get -y install golang ca-certificates libpcap-dev && apt-get clean

WORKDIR /app

COPY . .

RUN go mod download -x

FROM env

RUN go run build.go