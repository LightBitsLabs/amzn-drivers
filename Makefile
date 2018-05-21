all: build

include $(WORKSPACE_TOP)/amzn-drivers/Makefile.env

checkout_deps:
	lb-build -d

build: modules

modules: checkout_deps
	$(Q)$(MAKE) -C kernel/linux/ena all

install: |install_dir
	$(Q)find . -name "*.ko" -exec cp {} $(AMZN_INSTALL_DIR)/ \;

install_dir:
	$(Q)mkdir -p $(AMZN_INSTALL_DIR)

checkin:
	$(Q)component-tool checkin -v --repo=amzn-drivers --type=$(BUILD_TYPE) aws_modules

clean: checkout_deps
	$(Q)$(MAKE) -C kernel/linux/ena clean

.PHONY: checkout_deps clean install_dir checkin
