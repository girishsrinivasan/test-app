FROM alpine:3.16.3

RUN mkdir -p  /test-app/downloads
COPY ./bin/test-app-darwin.tgz ./bin/test-app-linux.tgz ./bin/test-app-windows.tgz ./bin/version.txt /test-app/downloads/

WORKDIR /test-app
COPY  ./bin/test-app-linux ./
RUN chmod +x test-app-linux
RUN apk add libc6-compat
ENTRYPOINT [ "./test-app-linux" ] 