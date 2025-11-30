LED_DRIVER_VERSION = main
LED_DRIVER_SITE = https://github.com/hawa7555/final-project-assignment-hawa7555.git
LED_DRIVER_SITE_METHOD = git
LED_DRIVER_LICENSE = GPL-2.0
LED_DRIVER_MODULE_SUBDIRS = driver

define LED_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/scripts/led_load.sh $(TARGET_DIR)/usr/bin/led_load.sh
	$(INSTALL) -D -m 0755 $(@D)/scripts/led_unload.sh $(TARGET_DIR)/usr/bin/led_unload.sh
	$(INSTALL) -D -m 0644 $(@D)/driver/led_driver.ko \
		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/led_driver.ko
endef

$(eval $(kernel-module))
$(eval $(generic-package))
