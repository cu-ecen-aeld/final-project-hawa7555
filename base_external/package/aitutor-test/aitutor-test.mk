AITUTOR_TEST_VERSION = main
AITUTOR_TEST_SITE = https://github.com/hawa7555/final-project-assignment-hawa7555.git
AITUTOR_TEST_SITE_METHOD = git
AITUTOR_TEST_LICENSE = GPL-2.0
AITUTOR_TEST_DEPENDENCIES = alsa-lib led-driver

define AITUTOR_TEST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/test
endef

define AITUTOR_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/test/led_test $(TARGET_DIR)/usr/bin/led_test
	$(INSTALL) -D -m 0755 $(@D)/test/audio_test $(TARGET_DIR)/usr/bin/audio_test
	$(INSTALL) -D -m 0755 $(@D)/test/audio_playback_test $(TARGET_DIR)/usr/bin/audio_playback_test
	$(INSTALL) -D -m 0755 $(@D)/test/stt_test $(TARGET_DIR)/usr/bin/stt_test
	$(INSTALL) -D -m 0755 $(@D)/test/tts_test $(TARGET_DIR)/usr/bin/tts_test
	$(INSTALL) -D -m 0755 $(@D)/test/llm_test $(TARGET_DIR)/usr/bin/llm_test
endef

$(eval $(generic-package))
