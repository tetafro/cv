.PHONY: lint
lint: yamllint ansible-lint

.PHONY: yamllint
yamllint:
	@echo '----------------'
	@echo 'Running yamllint'
	@echo '----------------'
	@yamllint --format colored --strict ./deploy/*.yml && echo OK

.PHONY: ansible-lint
ansible-lint:
	@echo '--------------------'
	@echo 'Running ansible-lint'
	@echo '--------------------'
	@ansible-lint ./deploy/*.yml && echo OK

.PHONY: build
build:
	docker build -t ghcr.io/tetafro/cv .
