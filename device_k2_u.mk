$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/k2_u/k2_u-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/k2_u/overlay

LOCAL_PATH := device/htc/k2_u
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_COPY_FILES += \
    device/htc/k2_u/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/k2_u/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/k2_u/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/k2_u/recovery/sbin/power_test:recovery/root/sbin/power_test  \
    device/htc/k2_u/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := One SV
PRODUCT_DEVICE := k2_u
