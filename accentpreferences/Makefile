include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AccentPreferences

AccentPreferences_FILES = APBRootListController.m
AccentPreferences_INSTALL_PATH = /Library/PreferenceBundles
AccentPreferences_FRAMEWORKS = UIKit
AccentPreferences_PRIVATE_FRAMEWORKS = Preferences
AccentPreferences_CFLAGS = -fobjc-arc
AccentPreferences_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AccentPreferences.plist$(ECHO_END)
