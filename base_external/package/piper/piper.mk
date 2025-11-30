PIPER_VERSION = v1.2.0
PIPER_SITE = https://github.com/rhasspy/piper/releases/download/$(PIPER_VERSION)
PIPER_SOURCE = piper_arm64.tar.gz
PIPER_LICENSE = MIT
PIPER_INSTALL_TARGET = YES

define PIPER_EXTRACT_CMDS
	$(TAR) -C $(@D) -xzf $(PIPER_DL_DIR)/$(PIPER_SOURCE)
endef

define PIPER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/piper/piper $(TARGET_DIR)/usr/bin/piper
	$(INSTALL) -D -m 0755 $(@D)/piper/libespeak-ng.so.1.1.51 $(TARGET_DIR)/usr/lib/libespeak-ng.so.1.1.51
	ln -sf libespeak-ng.so.1.1.51 $(TARGET_DIR)/usr/lib/libespeak-ng.so.1
	ln -sf libespeak-ng.so.1.1.51 $(TARGET_DIR)/usr/lib/libespeak-ng.so
	$(INSTALL) -D -m 0755 $(@D)/piper/libonnxruntime.so.1.14.1 $(TARGET_DIR)/usr/lib/libonnxruntime.so.1.14.1
	ln -sf libonnxruntime.so.1.14.1 $(TARGET_DIR)/usr/lib/libonnxruntime.so
	$(INSTALL) -D -m 0755 $(@D)/piper/libpiper_phonemize.so.1 $(TARGET_DIR)/usr/lib/libpiper_phonemize.so.1
	mkdir -p $(TARGET_DIR)/usr/share
	cp -r $(@D)/piper/espeak-ng-data $(TARGET_DIR)/usr/share/
endef

$(eval $(generic-package))
