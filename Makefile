TARGET := iphone:clang:latest:6.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DuolingoX

DuolingoX_FILES = Tweak.x
DuolingoX_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
