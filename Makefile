include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Accent

Accent_FILES = Tweak.x
Accent_CFLAGS = -fobjc-arc
Accent_EXTRA_FRAMEWORKS += Cephei
Accent_LIBRARIES = colorpicker
SDKVERSION = 13.3
SYSROOT = $(THEOS)/sdks/iPhoneOS13.3.sdk

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += accentpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk

