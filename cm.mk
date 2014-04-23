# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := k2_ul

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/k2_ul/device_k2_ul.mk)

# Device naming
PRODUCT_DEVICE := k2_ul
PRODUCT_NAME := cm_k2_ul
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One SV
PRODUCT_MANUFACTURER := HTC
