include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AccentPreferences

AccentPreferences_FILES = APBRootListController.m
AccentPreferences_INSTALL_PATH = /Library/PreferenceBundles
AccentPreferences_FRAMEWORKS = UIKit
AccentPreferences_PRIVATE_FRAMEWORKS = Preferences Foundation UIKit
AccentPreferences_CFLAGS = -fobjc-arc
AccentPreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs
AccentPreferences_LIBRARIES = colorpicker
SDKVERSION = 13.3
SYSROOT = $(THEOS)/sdks/iPhoneOS13.3.sdk

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AccentPreferences.plist$(ECHO_END)
