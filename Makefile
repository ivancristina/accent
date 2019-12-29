include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Accent

Accent_FILES = Tweak.x
Accent_CFLAGS = -fobjc-arc
Accent_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += accentpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk

