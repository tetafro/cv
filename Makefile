.PHONY: lint
lint: yamllint ansible-lint

.PHONY: yamllint
yamllint:
	@echo '----------------'
	@echo 'Running yamllint'
	@echo '----------------'
	@yamllint --format colored --strict ./playbook.yml && echo OK

.PHONY: ansible-lint
ansible-lint:
	@echo '--------------------'
	@echo 'Running ansible-lint'
	@echo '--------------------'
	@ansible-lint ./playbook.yml && echo OK

.PHONY: docker
docker:
	docker build -t ghcr.io/tetafro/cv .

.PHONY: deploy
deploy:
	@ ansible-playbook \
	--private-key ~/.ssh/id_ed25519 \
	--inventory '${SSH_SERVER},' \
	--user ${SSH_USER} \
	./playbook.yml
