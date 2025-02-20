TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESS = SpringBoard

ARCHS := armv7

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DuolingoX

DuolingoX_FILES = Tweak.x
DuolingoX_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
