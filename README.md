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

Or run the following `make` command:

```
$ make build
```

This assumes that you have an inventory file called `hosts` in the current directory.

## Adding nodes

To add a node just create a simple inventory file that has your master and the node(s) you wish to join your cluster. Then all you need to run is:

```
$ ansible-playbook -i <path to your inventory file> site.yml --tags "join"
```

Or

```
$ make join
```

## Using Docker image

If you want you can run the playbook from a Docker image. Just build the Docker image as follows:

```
$ docker build -t k8s-raspberry .
```

Then you can run the following to build your cluster:

```
$ docker run -v <path to inventory file>:/usr/src/app/hosts --rm k8s-raspberry build
```

## Tear down the cluster

If you wanna reset the whole cluster to the state after a fresh install, just run the following command:

```
$ make reset
```

or

```
$ ansible-playbook -i <path to your inventory file> reset.yml
```
