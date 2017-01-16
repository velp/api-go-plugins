# API-go-plugins #
Example of use of the new features go1.8 - plugins.

## Build ##

```
go get github.com/velp/api-go-plugins
cd $GOPATH/src/github.com/velp/api-go-plugins
```

Assembling example occurs in the docker container with go1.8beta

```
make build
```

## Run ##

```
$ cd ./_output
$ ls
api-go-plugins  plugin.so
$ ./api-go-plugins 
[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:	export GIN_MODE=release
 - using code:	gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /handler                  --> plugin/unnamed-960843f4df84355fedfa2da0761d5805320e8d6b.Handler (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```

In other terminal check:

```
$ curl -i http://localhost:8080/handler
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
Date: Mon, 16 Jan 2017 09:00:56 GMT
Content-Length: 32

{"msg":"plugin.Handler() call"}
```