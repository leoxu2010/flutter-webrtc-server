all: linux darwin windows

release: all tar

clean:
	rm -rf bin/*

upx:
	upx -9 bin/*

linux:
	CGO_ENABLE=0 GOOS=linux GOARCH=amd64 go build -o bin/server-linux-amd64 -ldflags "-s -w" cmd/server/main.go
	CGO_ENABLE=0 GOOS=linux GOARCH=386 go build -o bin/server-linux-i386 -ldflags "-s -w" cmd/server/main.go

darwin:
	CGO_ENABLE=0 GOOS=darwin GOARCH=amd64 go build -o bin/server-darwin-amd64 -ldflags "-s -w" cmd/server/main.go

windows:
	CGO_ENABLE=0 GOOS=windows GOARCH=amd64 go build -o bin/server-windows-amd64.exe -ldflags "-s -w" cmd/server/main.go
	CGO_ENABLE=0 GOOS=windows GOARCH=386 go build -o bin/server-windows-i386.exe -ldflags "-s -w" cmd/server/main.go

tar:
	tar jcvf flutter-webrtc-server-bin.tar.bz2 bin certs html config
