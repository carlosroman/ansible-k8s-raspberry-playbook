.PHONY: build k8s join debug join upgrade status reset

ANSIBLE_PLAYBOOK := site.yml

ANSIBLE_CMD := ansible-playbook -i hosts

debug: ANSIBLE_DEBUG := -v

debug: build

build:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG)

setup:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "setup"

k8s:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "k8s"

join:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "join"

upgrade:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "upgrade"

status:
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG) --tags "status"

reset: ANSIBLE_PLAYBOOK := reset.yml 

reset: 
	@$(ANSIBLE_CMD) $(ANSIBLE_PLAYBOOK) $(ANSIBLE_DEBUG)
