# Kubernetes on (vanilla) Raspbian Lite Ansible playbook

This Ansible playbook is based on the guide written by [Alex Elli](https://gist.github.com/alexellis/fdbc90de7691a1b9edb545c17da2d975). 

## Pre-reqs:

* You must use an RPi 2 or 3 for use with Kubernetes
* Each Pi should be running [Raspbian Lite](https://www.raspberrypi.org/downloads/raspbian/) (this was tested using Raspbian Stretch Lite March 2018) 

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
