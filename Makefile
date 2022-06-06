
TAG=gb-http

.PHONY: build 
build:
	$(call build-images,$(TAG))

.PHONY: push
push:
	$(call push-images,$(TAG))

### push images with tag
### 1 : tag
define push-images
	@echo ">> push-images exec: "
	@echo ">> docker push kekek/centosgb:$(strip $(1)) ."
	docker push kekek/centosgb:$(strip $(1))
endef

### build images with tag
### 1 : tag
define build-images
	@echo ">> build-images exec: "
	@echo ">> docker build -t kekek/centosgb:$(strip $(1)) ."
	docker build -t kekek/centosgb:$(strip $(1)) .
endef
