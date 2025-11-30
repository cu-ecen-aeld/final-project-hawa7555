################################################################################
#
# ai-models
#
################################################################################

AI_MODELS_VERSION = 1.0
AI_MODELS_SOURCE =
AI_MODELS_SITE = 
AI_MODELS_LICENSE = MIT
AI_MODELS_INSTALL_TARGET = YES

# No source to extract
define AI_MODELS_EXTRACT_CMDS
	mkdir -p $(@D)
endef

# Download models
define AI_MODELS_BUILD_CMDS
	mkdir -p $(@D)/models/whisper
	wget -O $(@D)/models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
		https://huggingface.co/TheBloke/TinyLlama-1.1B-Chat-v1.0-GGUF/resolve/main/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf
	wget -O $(@D)/models/whisper/ggml-tiny.en.bin \
		https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-tiny.en.bin
	wget -O $(@D)/models/en_US-lessac-medium.onnx \
		https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/lessac/medium/en_US-lessac-medium.onnx
	wget -O $(@D)/models/en_US-lessac-medium.onnx.json \
		https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json
endef

define AI_MODELS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/root/models/whisper
	$(INSTALL) -D -m 0644 $(@D)/models/tinyllama-1.1b-chat-v1.0.Q4_K_M.gguf \
		$(TARGET_DIR)/root/models/
	$(INSTALL) -D -m 0644 $(@D)/models/whisper/ggml-tiny.en.bin \
		$(TARGET_DIR)/root/models/whisper/
	$(INSTALL) -D -m 0644 $(@D)/models/en_US-lessac-medium.onnx \
		$(TARGET_DIR)/root/models/
	$(INSTALL) -D -m 0644 $(@D)/models/en_US-lessac-medium.onnx.json \
		$(TARGET_DIR)/root/models/
endef

$(eval $(generic-package))
