obj-m += battery-module.o

KERNEL = $(shell uname -r)

all:
	make -C /lib/modules/$(KERNEL)/build/ M="$(PWD)" modules
clean:
	make -C /lib/modules/$(KERNEL)/build/ M="$(PWD)" clean
install: all
	cp battery-module.ko /lib/modules/$(KERNEL)/
uninstall:
	rm /lib/modules/$(KERNEL)/battery-module.ko
