imageTag ?= latest
namespace ?= test
repo ?= jasonyihk

define generate_file
    m4	-D _NAMESPACE_=$(namespace)	-D _IMAGE_TAG_=$(imageTag)	-D _REPO_=$(repo) $(current_dir)/$(1) > $(current_dir)/$(2)
endef

build: $(current_dir)/Dockerfile
	docker build -f $(current_dir)/Dockerfile -t $(imageName) .
	docker build -f $(current_dir)/Dockerfile.test -t $(imageName).test .

dockerfile: $(current_dir)/Dockerfile.test.m4
	$(call generate_file,Dockerfile.test.m4,Dockerfile.test)

clean:
	rm -f $(current_dir)/kube/*.yml $(current_dir)/Dockerfile.test
