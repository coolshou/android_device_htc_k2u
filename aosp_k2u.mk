#
# Copyright 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit from the common Open Source product configuration

#already in $(SRC_TARGET_DIR)/product/full_base_telephony.mk
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

#
$(call inherit-product, device/htc/k2u/BoardConfig.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/htc/k2u/device_k2u.mk)

#ro.product.name=htc_asia_tw
#TARGET_PRODUCT = add_lunch_combo aosp_k2u-XXX
#$(warning "##########"$(PRODUCT_NAME))
PRODUCT_NAME := aosp_k2u

#PRODUCT_NAME := htc_asia_tw
#BUILD_ID := KTU84Q
#BUILD_DISPLAY_ID := KTU84Q
#To use these proprietary files, comment out this line
#PRODUCT_RESTRICT_VENDOR_FILES := true

#with following line, the system.img & userdata.img will be in full size like AOSP x86 image
# system.img size = BOARD_SYSTEMIMAGE_PARTITION_SIZE
# userdata.img size = BOARD_USERDATAIMAGE_PARTITION_SIZE
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

#eng版本要生成odex的话，那么只需要把WITH_DEXPREOPT := true ；
WITH_DEXPREOPT := true
#user版不想生成odex，那么只需要定义DISABLE_DEXPREOPT := true；
DISABLE_DEXPREOPT := false
#如果想单独控制某一个应用是否生成odex的话可以在这个应用的Android.mk中添加WITH_DEXPREOPT := true；

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/k2u/k2u-vendor.mk)

# call the vendor-app setup
$(call inherit-product-if-exists, vendor/htc/k2u/k2u-vendor-app.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := k2u
#PRODUCT_NAME := k2u
PRODUCT_BRAND := htc
PRODUCT_MODEL := One SV
PRODUCT_MANUFACTURER := HTC
