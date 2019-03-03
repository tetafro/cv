.PHONY: run
run:
	@ caddy

.PHONY: docker
docker:
	@ docker build -t tetafro/cv .
