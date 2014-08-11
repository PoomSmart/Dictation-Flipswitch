ARCHS = armv7 arm64

include theos/makefiles/common.mk

BUNDLE_NAME = DictationToggle
DictationToggle_FILES = Switch.xm
DictationToggle_FRAMEWORKS = UIKit
DictationToggle_PRIVATE_FRAMEWORKS = AssistantServices
DictationToggle_LIBRARIES = flipswitch
DictationToggle_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

TWEAK_NAME = DictationToggleTweak
DictationToggleTweak_FILES = Tweak.xm
DictationToggleTweak_PRIVATE_FRAMEWORKS = AssistantServices


include $(THEOS_MAKE_PATH)/tweak.mk