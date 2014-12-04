PACKAGE_VERSION = 0.0.2
SDKVERSION = 7.0
ARCHS = armv7 arm64
THEOS_DEVICE_IP = 192.168.0.11

BUNDLE_NAME = DictationToggle
DictationToggle_FILES = Switch.xm
DictationToggle_PRIVATE_FRAMEWORKS = AssistantServices
DictationToggle_LIBRARIES = flipswitch
DictationToggle_INSTALL_PATH = /Library/Switches

SUBPROJECTS += dictationtoggle

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/bundle.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

before-package::
	sudo chown -R root:wheel $(THEOS_STAGING_DIR)
	sudo chmod 755 $(THEOS_STAGING_DIR)
	sudo chmod 666 $(THEOS_STAGING_DIR)/Library/Switches/DictationToggle.bundle/*.pdf

after-install::
	install.exec "killall -9 SpringBoard"
	sudo rm -rf _
	make clean
	rm -rf .obj
	rm -rf obj
#	rm -rf .theos
#	rm -rf *.deb
