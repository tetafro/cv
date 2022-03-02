.PHONY: login
login:
	docker login

.PHONY: build
build:
	docker build -t tetafro/cv .

.PHONY: push
push:
	docker push tetafro/cv
