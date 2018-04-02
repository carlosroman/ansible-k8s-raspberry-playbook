# Raspberry PI Kubernetes cluster Ansible playbook

## Installation

To install the dependencies needed to run this playbook either :

```
$ pip install -r requirments.txt
```

## Building

To create your cluster you need to have an inventory file (I like to call mine `hosts`). Use the [`hosts.example`](hosts.example) to get an idea of what it should look like. This file needs to have details of which Pi will the be the master and which ones will be your nodes.

Once you have your inventory file, then run the following command:

```
$ ansible-playbook -i <path to your inventory file> site.yml
```

