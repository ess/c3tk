.PHONY: build install uninstall

all: build install

build:
	docker build . -t tools:latest

install:
	./bin/install

uninstall:
	rm ~/.tools-aliases
