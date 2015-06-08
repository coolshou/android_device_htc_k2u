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

# RIL properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

########################################################################
# common msm8960 configs
#$(call inherit-product, device/htc/msm8960-common/msm8960.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Permissions
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
#    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
#    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
#    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
#    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
#    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
#    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
#    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
#    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
#    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
#    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
#    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
#    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
#    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    memtrack.msm8960

# Lights
PRODUCT_PACKAGES += \
    lights.msm8960

# OMX
PRODUCT_PACKAGES += \
    libdashplayer \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    power.msm8960
    
# sensors
PRODUCT_PACKAGES += \
    sensors.msm8960

# camera
PRODUCT_PACKAGES += \
    camera.msm8960

#GPS
PRODUCT_PACKAGES += \
    gps.default
#    gps.k2u \
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf


# QCOM rngd
PRODUCT_PACKAGES += \
    qrngd

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

########################################################################
DEVICE_PACKAGE_OVERLAYS += device/htc/k2u/overlay

#kernel
ifneq ($(TARGET_PREBUILT_KERNEL),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):$(PRODUCT_OUT)kernel
#modules    
#path? 3.4.10-g415aa3e-dirty
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    $(LOCAL_PATH)/prebuilt/modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    $(LOCAL_PATH)/prebuilt/modules/bluetooth-power.ko:system/lib/modules/bluetooth-power.ko \
    $(LOCAL_PATH)/prebuilt/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    $(LOCAL_PATH)/prebuilt/modules/eeprom_93cx6.ko:system/lib/modules/eeprom_93cx6.ko \
    $(LOCAL_PATH)/prebuilt/modules/evbug.ko:system/lib/modules/evbug.ko \
    $(LOCAL_PATH)/prebuilt/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    $(LOCAL_PATH)/prebuilt/modules/ks8851.ko:system/lib/modules/ks8851.ko \
    $(LOCAL_PATH)/prebuilt/modules/lcd.ko:system/lib/modules/lcd.ko \
    $(LOCAL_PATH)/prebuilt/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    $(LOCAL_PATH)/prebuilt/modules/qce40.ko:system/lib/modules/qce40.ko \
    $(LOCAL_PATH)/prebuilt/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    $(LOCAL_PATH)/prebuilt/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    $(LOCAL_PATH)/prebuilt/modules/reset_modem.ko:system/lib/modules/reset_modem.ko \
    $(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    $(LOCAL_PATH)/prebuilt/modules/spidev.ko:system/lib/modules/spidev.ko
endif

#qemu needed?
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/layout_version:data/.layout_version

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.k2u:root/fstab.k2u \
    $(LOCAL_PATH)/ramdisk/init.k2u.rc:root/init.k2u.rc \
    $(LOCAL_PATH)/ramdisk/init.goldfish.rc:root/init.goldfish.rc \
    $(LOCAL_PATH)/ramdisk/init.k2u.usb.rc:root/init.k2u.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.k2u.rc:root/ueventd.k2u.rc \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle

#TODO: recovery ramdisk
#root/init.recovery.*.rc

#    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/etc/init.qcom.q6_links.sh:system/etc/init.qcom.q6_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.radio_links.sh:system/etc/init.qcom.radio_links.sh

# recovery and custom charging
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key

# QC thermald
PRODUCT_PACKAGES += \
    thermald 
# QC thermald config    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermald.conf:system/etc/thermald.conf

# HTC BT audio config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioBTID.csv:system/etc/AudioBTID.csv \
    $(LOCAL_PATH)/configs/AudioBTIDnew.csv:system/etc/AudioBTIDnew.csv

# vold config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# wifi
PRODUCT_PACKAGES += \
    hostapd_cli \
    wpa_cli \
    wpscli_test_cmd
# wifi config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:/system/etc/wifi/p2p_supplicant.conf \
    $(LOCAL_PATH)/etc/calibration:/system/etc/calibration 
#    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf 
#Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor \
    libbt-utils \
    libbt-hci \
    audio.a2dp.default \
    bt_stack.conf \
    bt_did.conf \
    auto_pair_devlist.conf \
    libbt-brcm_stack \
    libbt-brcm_gki \
    libbt-brcm_bta \
    bluetooth.default \
    bluetoothd

# Sound configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    $(LOCAL_PATH)/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dsp/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
    $(LOCAL_PATH)/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    $(LOCAL_PATH)/dsp/snd_soc_msm/snd_soc_msm_2x_Fusion3:/system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
    $(LOCAL_PATH)/dsp/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/device-keypad.kl:system/usr/keylayout/device-keypad.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl \
    $(LOCAL_PATH)/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl 

#    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl 

# Input device config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/idc/projector_input.idc:system/usr/idc/projector_input.idc

# MSM8930 firmware
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/firmware/a225p5_pm4.fw:/system/etc/firmware/a225p5_pm4.fw \
#    $(LOCAL_PATH)/firmware/a225_pfp.fw:/system/etc/firmware/a225_pfp.fw \
#    $(LOCAL_PATH)/firmware/a225_pm4.fw:/system/etc/firmware/a225_pm4.fw \
#    $(LOCAL_PATH)/firmware/a300_pm4.fw:/system/etc/firmware/a300_pm4.fw \
#    $(LOCAL_PATH)/firmware/a300_pfp.fw:/system/etc/firmware/a300_pfp.fw \
#    $(LOCAL_PATH)/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
#    $(LOCAL_PATH)/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
#    $(LOCAL_PATH)/firmware/vidc.b00:/system/etc/firmware/vidc.b00 \
#    $(LOCAL_PATH)/firmware/vidc.b01:/system/etc/firmware/vidc.b01 \
#    $(LOCAL_PATH)/firmware/vidc.b02:/system/etc/firmware/vidc.b02 \
#    $(LOCAL_PATH)/firmware/vidc.b03:/system/etc/firmware/vidc.b03 \
#    $(LOCAL_PATH)/firmware/vidc.mdt:/system/etc/firmware/vidc.mdt \
#    $(LOCAL_PATH)/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw \
#    $(LOCAL_PATH)/firmware/vidcfw.elf:/system/etc/firmware/vidcfw.elf 
    
#k2u not have?
#PRODUCT_COPY_FILES += \    
#    $(LOCAL_PATH)/firmware/modem_fw.b00:/system/etc/firmware/modem_fw.b00 \
#    $(LOCAL_PATH)/firmware/modem_fw.b01:/system/etc/firmware/modem_fw.b01 \
#    $(LOCAL_PATH)/firmware/modem_fw.b02:/system/etc/firmware/modem_fw.b02 \
#    $(LOCAL_PATH)/firmware/modem_fw.b03:/system/etc/firmware/modem_fw.b03 \
#    $(LOCAL_PATH)/firmware/modem_fw.b04:/system/etc/firmware/modem_fw.b04 \
#    $(LOCAL_PATH)/firmware/modem_fw.b05:/system/etc/firmware/modem_fw.b05 \
#    $(LOCAL_PATH)/firmware/modem_fw.b06:/system/etc/firmware/modem_fw.b06 \
#    $(LOCAL_PATH)/firmware/modem_fw.b07:/system/etc/firmware/modem_fw.b07 \
#    $(LOCAL_PATH)/firmware/modem_fw.b08:/system/etc/firmware/modem_fw.b08 \
#    $(LOCAL_PATH)/firmware/modem_fw.b09:/system/etc/firmware/modem_fw.b09 \
#    $(LOCAL_PATH)/firmware/modem_fw.b10:/system/etc/firmware/modem_fw.b10 \
#    $(LOCAL_PATH)/firmware/modem_fw.b11:/system/etc/firmware/modem_fw.b11 \
#    $(LOCAL_PATH)/firmware/modem_fw.b13:/system/etc/firmware/modem_fw.b13 \
#    $(LOCAL_PATH)/firmware/modem_fw.b14:/system/etc/firmware/modem_fw.b14 \
#    $(LOCAL_PATH)/firmware/modem_fw.b21:/system/etc/firmware/modem_fw.b21 \
#    $(LOCAL_PATH)/firmware/modem_fw.b22:/system/etc/firmware/modem_fw.b22 \
#    $(LOCAL_PATH)/firmware/modem_fw.b23:/system/etc/firmware/modem_fw.b23 \
#    $(LOCAL_PATH)/firmware/modem_fw.b25:/system/etc/firmware/modem_fw.b25 \
#    $(LOCAL_PATH)/firmware/modem_fw.b26:/system/etc/firmware/modem_fw.b26 \
#    $(LOCAL_PATH)/firmware/modem_fw.b29:/system/etc/firmware/modem_fw.b29 \
#    $(LOCAL_PATH)/firmware/modem_fw.mdt:/system/etc/firmware/modem_fw.mdt \
#    $(LOCAL_PATH)/firmware/modem.b00:/system/etc/firmware/modem.b00 \
#    $(LOCAL_PATH)/firmware/modem.b01:/system/etc/firmware/modem.b01 \
#    $(LOCAL_PATH)/firmware/modem.b02:/system/etc/firmware/modem.b02 \
#    $(LOCAL_PATH)/firmware/modem.b03:/system/etc/firmware/modem.b03 \
#    $(LOCAL_PATH)/firmware/modem.b04:/system/etc/firmware/modem.b04 \
#    $(LOCAL_PATH)/firmware/modem.b05:/system/etc/firmware/modem.b05 \
#    $(LOCAL_PATH)/firmware/modem.b06:/system/etc/firmware/modem.b06 \
#    $(LOCAL_PATH)/firmware/modem.b07:/system/etc/firmware/modem.b07 \
#    $(LOCAL_PATH)/firmware/modem.b08:/system/etc/firmware/modem.b08 \
#    $(LOCAL_PATH)/firmware/modem.b09:/system/etc/firmware/modem.b09 \
#    $(LOCAL_PATH)/firmware/modem.b10:/system/etc/firmware/modem.b10 \
#    $(LOCAL_PATH)/firmware/modem.mdt:/system/etc/firmware/modem.mdt \
#    $(LOCAL_PATH)/firmware/q6.b00:/system/etc/firmware/q6.b00 \
#    $(LOCAL_PATH)/firmware/q6.b01:/system/etc/firmware/q6.b01 \
#    $(LOCAL_PATH)/firmware/q6.b03:/system/etc/firmware/q6.b03 \
#    $(LOCAL_PATH)/firmware/q6.b04:/system/etc/firmware/q6.b04 \
#    $(LOCAL_PATH)/firmware/q6.b05:/system/etc/firmware/q6.b05 \
#    $(LOCAL_PATH)/firmware/q6.b06:/system/etc/firmware/q6.b06 \
#    $(LOCAL_PATH)/firmware/q6.mdt:/system/etc/firmware/q6.mdt 


# Torch
PRODUCT_PACKAGES += \
    Torch

# Permissions
#PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
#    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
#    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
#    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
#    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
#    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
#    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml 

#    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \

#fix sdcard Permissions  
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/etc/permissions/platform.xml:system/etc/permissions/platform.xml

# NFC
PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras
    
# NFCEE access control
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nfcee_access.xml:system/etc/nfcee_access.xml

#common
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    ip \
    netsharing \
    port-bridge \
    udhcpd \
    radvd \
    usbhub \
    usbhub_init \
    radish \
    shutdown \
    snd \
    sound \
    pnpmgr \
    libemoji \
    amix \
    aplay \
    asound \
    dbus-daemon \
    ipv6tether \
    zchgd
    
#akm8975 : Auto rotate feature/查詢重力感應器狀態
AKMD_DEVICE_TYPE := 8975
PRODUCT_PACKAGES += \
    akmd \
    akmdfs

PRODUCT_PACKAGES += \
    libharfbuzz

#OVERRIDE_RUNTIMES:=runtime_libart runtime_libdvm_default 

#TODO##########################################add
# /data/.layout_version
# data/misc/keystore => folder will create in init.rc
# power module
# /system/lib/libnetcmdiface.so
# libemoji.so

# Extra properties

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.setupwizard.enable_bypass=1 \
#    dalvik.vm.lockprof.threshold=500 \
#    ro.com.google.locationfeatures=1 \
#    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_UTC_DATE=0

# Device uses high-density artwork where available
#AAPT: android assert packaging tool
#screen size: small, normal, large, and xlarge
#screen dpi:  ldpi (low), mdpi (medium), hdpi (high), xhdpi (extra high, API 8), xlarge (API 9)
#PRODUCT_AAPT_CONFIG := normal hdpi
#PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES := zh_TW hdpi

#jimmy, add nobootanimation for debug
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.nobootanimation = 1 

#    hw.lcd.width = 480 \
#    hw.lcd.height = 800 \
#    hw.lcd.density = 240
#system.prop    
#    ro.sf.lcd_density = 240 

#    ro.product.locale.language=zh \
#    ro.product.locale.region=TW
#duplicate
#    persist.hwc.mdpcomp.enable=true \

# Ensure that this property is always defined so that bionic_systrace.cpp
# can rely on it being initially set by init.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    debug.atrace.tags.enableflags=0

#

# call dalvik heap config
#$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
#$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

#jimmy
PRODUCT_PACKAGES += \
    InCallUI \
    su 

#usb debug mode
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1 

#emulator
BUILD_EMULATOR_OPENGL = true
BUILD_EMULATOR_OPENGL_DRIVER = true

#how to remove no needed apk => remove it from xml? dependence problem?

#super user
#SUPERUSER_PACKAGE := idv.coolshou.superuser

#avoid compiler error hardware/qcom/audio/legacy/alsa_sound/AudioPolicyManagerALSA.cpp:
# following cause error libsysutils needed by logd
#BUILD_TINY_ANDROID :=true

