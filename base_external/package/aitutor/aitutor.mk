AITUTOR_VERSION = main
AITUTOR_SITE = https://github.com/hawa7555/final-project-assignment-hawa7555.git
AITUTOR_SITE_METHOD = git
AITUTOR_LICENSE = GPL-2.0
AITUTOR_DEPENDENCIES = alsa-lib led-driver

define AITUTOR_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/app
endef

define AITUTOR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/app/aitutor $(TARGET_DIR)/usr/bin/aitutor
	$(INSTALL) -D -m 0755 $(@D)/scripts/start_llama.sh $(TARGET_DIR)/usr/bin/start_llama.sh
endef

$(eval $(generic-package))
