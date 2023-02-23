TAG=my-tag
APP=my-cli
ARGUMENTS=-c 5 -r 7

.PHONY: develop build run tests

all: build run tests

build:
	docker build -t $(TAG) .

run:
	docker run --entrypoint "/usr/local/bin/$(APP)" --rm $(TAG) $(ARGUMENTS)

tests:
	docker run --entrypoint "/usr/local/bin/pytest" --rm $(TAG)