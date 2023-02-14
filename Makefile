.PHONY: build run

develop: build run

build:
	docker build -t myproject .

run:
	docker run -it --rm -v $(shell pwd):/project/develop myproject