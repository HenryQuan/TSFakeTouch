export THEOS_DEVICE_IP = 192.168.1.34

TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = faketouch

faketouch_FILES = Tweak.x \
	Source/CGGeometry-KIFAdditions.m \
	Source/IOHIDEvent+KIF.m \
	Source/PTFakeMetaTouch.m \
	Source/UIApplication-KIFAdditions.m \
	Source/UIEvent+KIFAdditions.m \
	Source/UITouch-KIFAdditions.m \
	Source/UIView-KIFAdditions.m \
	Source/UIWindow-KIFAdditions.m

faketouch_FRAMEWORKS = CoreGraphics QuartzCore UIKit IOKit
faketouch_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
