imageName ?= api

current_dir := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
include $(current_dir)/../main.mk

k8s-obj: $(current_dir)/kube/*.yml.m4
	$(call generate_file,kube/1.deployment.yml.m4,kube/1.deployment.yml)
	$(call generate_file,kube/2.ingress.yml.m4,kube/2.ingress.yml)
	$(call generate_file,kube/3.service.yml.m4,kube/3.service.yml)



