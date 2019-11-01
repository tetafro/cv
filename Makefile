.PHONY: docker
docker:
	@ docker build -t tetafro/cv .

.PHONY: run
run:
	@ docker run --rm --publish 127.0.0.1:2015:2015 --env-file=.env tetafro/cv
