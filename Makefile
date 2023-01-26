.DEFAULT_GOAL := all
CLI_BINARY_NAME=test-app


PATCH_NUMBER?=0
GIT_COMMIT := $(shell git rev-parse HEAD)
BUILD_DATE := $(shell date -u   +"%Y-%m-%dT%H:%M:%S%z")
BUILD_INFO=github.com/girishsrinivasan/test-app/buildinfo
BUILD_VERSION=0.0.${PATCH_NUMBER}
LDFLGS= -X '${BUILD_INFO}.Version=${BUILD_VERSION}' -X '${BUILD_INFO}.GitCommit=${GIT_COMMIT}'	-X '${BUILD_INFO}.Date=${BUILD_DATE}'

all: clean  test build
build: build-app
test: test-app 
run: run-app
clean: clean-app

build-app:
	GOARCH=amd64 GOOS=darwin go build -ldflags "${LDFLGS}" -o ./bin/${CLI_BINARY_NAME}-darwin .
	
	GOARCH=amd64 GOOS=linux go build  -ldflags "${LDFLGS}" -o ./bin/${CLI_BINARY_NAME}-linux .
	
	GOARCH=amd64 GOOS=windows go build -ldflags "${LDFLGS}" -o ./bin/${CLI_BINARY_NAME}-windows.exe .
	
	tar czf ./bin/${CLI_BINARY_NAME}-darwin.tgz ./bin/${CLI_BINARY_NAME}-darwin
	tar czf ./bin/${CLI_BINARY_NAME}-linux.tgz ./bin/${CLI_BINARY_NAME}-linux
	tar czf ./bin/${CLI_BINARY_NAME}-windows.tgz ./bin/${CLI_BINARY_NAME}-windows.exe

	@echo "${BUILD_VERSION}" > ./bin/version.txt



test-app:
	go test ./... -coverprofile=coverage.out


run-app:
	./bin/${CLI_BINARY_NAME}

clean-app:
	go clean -r .
	rm -f ${CLI_BINARY_NAME}-darwin
	rm -f ${CLI_BINARY_NAME}-linux
	rm -f ${CLI_BINARY_NAME}-windows

