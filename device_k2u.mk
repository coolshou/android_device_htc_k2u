#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/msm8960-common/msm8960.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/k2u/overlay

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
	device/htc/k2u/ramdisk/init.target.rc:root/init.target.rc \
    device/htc/k2u/ramdisk/ueventd.target.rc:root/ueventd.target.rc

# recovery and custom charging
PRODUCT_COPY_FILES += \
    device/htc/k2u/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/k2u/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/k2u/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/k2u/recovery/sbin/detect_key:recovery/root/sbin/detect_key

# HTC BT audio config
PRODUCT_COPY_FILES += \
    device/htc/k2u/configs/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/k2u/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# vold config
PRODUCT_COPY_FILES += \
    device/htc/k2u/configs/vold.fstab:system/etc/vold.fstab

# wifi config
PRODUCT_COPY_FILES += \
    device/htc/k2u/configs/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/htc/k2u/configs/wifi/p2p_supplicant.conf:/system/etc/wifi/p2p_supplicant.conf \
    device/htc/k2u/firmware/fw_bcm4334.bin:/system/etc/firmware/fw_bcm4334.bin \
    device/htc/k2u/firmware/fw_bcm4334_apsta.bin:/system/etc/firmware/fw_bcm4334_apsta.bin \
    device/htc/k2u/firmware/fw_bcm4334_p2p.bin:/system/etc/firmware/fw_bcm4334_p2p.bin \
    device/htc/k2u/firmware/BCM4334B0_002.001.013.0488.0604.hcd:/system/etc/firmware/BCM4334B0_002.001.013.0488.0604.hcd

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/k2u/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/k2u/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/k2u/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/k2u/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/k2u/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/k2u/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/k2u/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/k2u/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/htc/k2u/dsp/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/k2u/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/k2u/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/k2u/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/k2u/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/k2u/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/k2u/idc/projector_input.idc:system/usr/idc/projector_input.idc

# MSM8930 firmware
PRODUCT_COPY_FILES += \
    device/htc/k2u/firmware/a300_pm4.fw:/system/etc/firmware/a300_pm4.fw \
    device/htc/k2u/firmware/a300_pfp.fw:/system/etc/firmware/a300_pfp.fw \
    device/htc/k2u/firmware/modem_fw.b00:/system/etc/firmware/modem_fw.b00 \
    device/htc/k2u/firmware/modem_fw.b01:/system/etc/firmware/modem_fw.b01 \
    device/htc/k2u/firmware/modem_fw.b02:/system/etc/firmware/modem_fw.b02 \
    device/htc/k2u/firmware/modem_fw.b03:/system/etc/firmware/modem_fw.b03 \
    device/htc/k2u/firmware/modem_fw.b04:/system/etc/firmware/modem_fw.b04 \
    device/htc/k2u/firmware/modem_fw.b05:/system/etc/firmware/modem_fw.b05 \
    device/htc/k2u/firmware/modem_fw.b06:/system/etc/firmware/modem_fw.b06 \
    device/htc/k2u/firmware/modem_fw.b07:/system/etc/firmware/modem_fw.b07 \
    device/htc/k2u/firmware/modem_fw.b08:/system/etc/firmware/modem_fw.b08 \
    device/htc/k2u/firmware/modem_fw.b09:/system/etc/firmware/modem_fw.b09 \
    device/htc/k2u/firmware/modem_fw.b10:/system/etc/firmware/modem_fw.b10 \
    device/htc/k2u/firmware/modem_fw.b11:/system/etc/firmware/modem_fw.b11 \
    device/htc/k2u/firmware/modem_fw.b13:/system/etc/firmware/modem_fw.b13 \
    device/htc/k2u/firmware/modem_fw.b14:/system/etc/firmware/modem_fw.b14 \
    device/htc/k2u/firmware/modem_fw.b21:/system/etc/firmware/modem_fw.b21 \
    device/htc/k2u/firmware/modem_fw.b22:/system/etc/firmware/modem_fw.b22 \
    device/htc/k2u/firmware/modem_fw.b23:/system/etc/firmware/modem_fw.b23 \
    device/htc/k2u/firmware/modem_fw.b25:/system/etc/firmware/modem_fw.b25 \
    device/htc/k2u/firmware/modem_fw.b26:/system/etc/firmware/modem_fw.b26 \
    device/htc/k2u/firmware/modem_fw.b29:/system/etc/firmware/modem_fw.b29 \
    device/htc/k2u/firmware/modem_fw.mdt:/system/etc/firmware/modem_fw.mdt \
    device/htc/k2u/firmware/modem.b00:/system/etc/firmware/modem.b00 \
    device/htc/k2u/firmware/modem.b01:/system/etc/firmware/modem.b01 \
    device/htc/k2u/firmware/modem.b02:/system/etc/firmware/modem.b02 \
    device/htc/k2u/firmware/modem.b03:/system/etc/firmware/modem.b03 \
    device/htc/k2u/firmware/modem.b04:/system/etc/firmware/modem.b04 \
    device/htc/k2u/firmware/modem.b05:/system/etc/firmware/modem.b05 \
    device/htc/k2u/firmware/modem.b06:/system/etc/firmware/modem.b06 \
    device/htc/k2u/firmware/modem.b07:/system/etc/firmware/modem.b07 \
    device/htc/k2u/firmware/modem.b08:/system/etc/firmware/modem.b08 \
    device/htc/k2u/firmware/modem.b09:/system/etc/firmware/modem.b09 \
    device/htc/k2u/firmware/modem.b10:/system/etc/firmware/modem.b10 \
    device/htc/k2u/firmware/modem.mdt:/system/etc/firmware/modem.mdt \
    device/htc/k2u/firmware/q6.b00:/system/etc/firmware/q6.b00 \
    device/htc/k2u/firmware/q6.b01:/system/etc/firmware/q6.b01 \
    device/htc/k2u/firmware/q6.b03:/system/etc/firmware/q6.b03 \
    device/htc/k2u/firmware/q6.b04:/system/etc/firmware/q6.b04 \
    device/htc/k2u/firmware/q6.b05:/system/etc/firmware/q6.b05 \
    device/htc/k2u/firmware/q6.b06:/system/etc/firmware/q6.b06 \
    device/htc/k2u/firmware/q6.mdt:/system/etc/firmware/q6.mdt

# GPS
#PRODUCT_PACKAGES += \
#    gps.k2u \

# Torch
PRODUCT_PACKAGES += \
    Torch

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/k2u/k2u-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := k2u
PRODUCT_NAME := k2u
PRODUCT_BRAND := htc
PRODUCT_MODEL := One SV
PRODUCT_MANUFACTURER := HTC
