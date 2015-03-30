all: build

build:
	@sudo docker build --tag=${USER}/mirror .
