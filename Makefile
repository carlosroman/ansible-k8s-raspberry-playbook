.PHONY: build k8s join debug join upgrade status

ANSIBLE_PLAYBOOK = ansible-playbook -i hosts site.yml
ANSIBLE_DEBUG =

debug: ANSIBLE_DEBUG = -v

build:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG)

setup:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "setup"

k8s:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "k8s"

join:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "join"

upgrade:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "upgrade"

status:
	@$(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "status"
