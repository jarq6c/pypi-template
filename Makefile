TAG=my-tag
APP=my-cli
ARGUMENTS=-c 5 -r 7

.PHONY: build setup run tests

build: tests
	docker run --name $(TAG)-builder $(TAG)
	docker cp $(TAG)-builder:/project/install/dist $(PWD)/dist
	docker stop $(TAG)-builder
	docker rm $(TAG)-builder

setup:
	docker build -t $(TAG) .

run: setup
	docker run --entrypoint "/usr/local/bin/$(APP)" --rm $(TAG) $(ARGUMENTS)

tests: setup
	docker run --entrypoint "/usr/local/bin/pytest" --rm $(TAG)