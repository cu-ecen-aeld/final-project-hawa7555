LLAMA_CPP_VERSION = b4315
LLAMA_CPP_SITE = $(call github,ggerganov,llama.cpp,$(LLAMA_CPP_VERSION))
LLAMA_CPP_LICENSE = MIT
LLAMA_CPP_INSTALL_STAGING = NO
LLAMA_CPP_INSTALL_TARGET = YES

LLAMA_CPP_CONF_OPTS = \
	-DGGML_CUDA=OFF \
	-DGGML_METAL=OFF \
	-DLLAMA_CURL=OFF \
	-DBUILD_SHARED_LIBS=OFF

define LLAMA_CPP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/llama-cli $(TARGET_DIR)/usr/bin/llama-cli
	$(INSTALL) -D -m 0755 $(@D)/bin/llama-server $(TARGET_DIR)/usr/bin/llama-server
endef

$(eval $(cmake-package))
