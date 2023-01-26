@echo off

REM image name: test-app, repository: gsrinivasanverint, tag: 1
REM for a private registry use something like 
REM     docker build --no-cache -t myregistryhost:5000/gsrinivasanverint/test-app:1 .  
REM This would tag the image with:  
REM  private repo  address: myregistryhost, private repo port: 5000, repository: gsrinivasanverint, image name: test-app, tag: 1
REM Then  push by doing 
REM     docker image push myregistryhost:5000/gsrinivasanverint/test-app:1

docker build --no-cache -t gsrinivasanverint/test-app:1  -f ./docker/Dockerfile .  