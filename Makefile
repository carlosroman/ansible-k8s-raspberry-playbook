.PHONY: build k8s join debug join upgrade status reset

ANSIBLE_INVENTORY := hosts

export ANSIBLE_INVENTORY

ANSIBLE_PLAYBOOK := site.yml

export ANSIBLE_PLAYBOOK

ANSIBLE_CMD := ansible-playbook -i $(ANSIBLE_INVENTORY)

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
