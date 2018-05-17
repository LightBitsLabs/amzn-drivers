include $(PWD)/Makefile.env

ENA_COM_PATH=../common/ena_com/

obj-m += ena.o
ena-objs := ena_netdev.o \
		ena_ethtool.o \
		$(ENA_COM_PATH)/ena_com.o \
		$(ENA_COM_PATH)/ena_eth_com.o

ena-$(CONFIG_SYSFS) += ena_sysfs.o

ccflags-y := -I$(src)
ccflags-y += -I$(src)/$(ENA_COM_PATH)/


#BUILD_KERNEL ?= $(shell uname -r)

ccflags-y += -Wfatal-errors
all:
	$(Q)$(MAKE) -C $(KDIR) M=$(CURDIR) modules

clean:
	$(Q)$(MAKE) -C $(KDIR) M=$(CURDIR) clean
	$(Q)find $(ENA_COM_PATH) -name "*.o" | xargs rm -f
