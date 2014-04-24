# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := k2_u

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/k2_u/device_k2_u.mk)

# Device naming
PRODUCT_DEVICE := k2_u
PRODUCT_NAME := cm_k2_u
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One SV
PRODUCT_MANUFACTURER := HTC
