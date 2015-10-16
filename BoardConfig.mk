#
# Copyright (C) 2013 Simon Sickle <simon@simonsickle.com>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

########################################################################
# inherit from common msm8960
#-include device/htc/msm8960-common/BoardConfigCommon.mk
BOARD_VENDOR := htc

# Bootloader
#TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := krait

# Flags
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# QCOM hardware
#BOARD_USES_QCOM_HARDWARE := true
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#TARGET_QCOM_AUDIO_VARIANT := caf
#TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_QCOM_MEDIA_VARIANT := caf
#TARGET_USES_QCOM_BSP := true

# Audio
BOARD_USES_ALSA_AUDIO := true
#only for aosp 4.4?
#BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Graphics
USE_OPENGL_RENDERER := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
BOARD_EGL_CFG := device/htc/k2u/configs/egl.cfg

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/htc/k2u/sepolicy
#    device/htc/msm8960-common/sepolicy

BOARD_SEPOLICY_UNION += \
    app.te \
    bluetooth.te \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    hci_init.te \
    healthd.te \
    init_shell.te \
    init.te \
    keystore.te \
    kickstart.te \
    mediaserver.te \
    rild.te \
    surfaceflinger.te \
    system.te \
    ueventd.te \
    wpa_socket.te \
    wpa.te

########################################################################
    
BOARD_VENDOR_PLATFORM := k2u

# Platform
##TARGET_BOARD_PLATFORM := msm8930
#TARGET_BOARD_PLATFORM := msm8960
#TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Bootloader
#TARGET_BOOTLOADER_BOARD_NAME := k2u
#TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false

# Architecture
#TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv7-a-neon
##TARGET_CPU_VARIANT := cortex-a9
#TARGET_CPU_ABI := armeabi-v7a
#TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_SMP := true
#TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true

# Kernel
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom
##BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31
#first ./system/core/rootdir/ueventd.rc
#then  ueventd.k2u.rc
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=k2u user_debug=31
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 user_debug=31
#msm8960
#BOARD_KERNEL_BASE := 0x80400000
#msm8930
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01408000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x80608000 --ramdisk_offset 0x81c08000 --second_offset 0x81500000 --tags_offset 0x80600100

TARGET_KERNEL_SOURCE := kernels/htc/k2u
#ln -sf $(TARGET_KERNEL_SOURCE) $(TOP)/kernel
#$(warning "##########TARGET_OUT: "$(OUT))
TARGET_OUT_INTERMEDIATES := $(OUT)/obj
#TARGET_KERNEL_CONFIG := k2_u_defconfig
TARGET_KERNEL_CONFIG := k2_u_defconfig-kk
KERNEL_DEFCONFIG := $(TARGET_KERNEL_CONFIG)
# Keep this as a fallback
TARGET_PREBUILT_KERNEL := device/htc/k2u/prebuilt/kernel
#KERNEL_DIR := $(TARGET_KERNEL_SOURCE)

#-include $(TOP)/$(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# device.mk doesn't know about us, and we can't PRODUCT_COPY_FILES here.
# So cp will do.
#ifneq ($(TARGET_PREBUILT_KERNEL),)
#$(warning "##########PRODUCT_OUT: "$(PRODUCT_OUT))
#.PHONY: $(PRODUCT_OUT)/kernel
#$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
#	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel
#endif

#KERNEL_EXTERNAL_MODULES:
#	make -C hardware/ti/wlan/wl1283/platforms/os/linux/ KERNEL_DIR=$(KERNEL_OUT) ARCH="arm" CROSS_COMPILE="arm-eabi-" TNETW=1273 RANDOM_MAC=n REPORT_LOG=n
#	mv hardware/ti/wlan/wl1283/platforms/os/linux/tiwlan_drv.ko $(KERNEL_MODULES_OUT)
#TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES	
	
# Use libril in the device tree
#BOARD_PROVIDES_LIBRIL := true

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# HTCLOG
#COMMON_GLOBAL_CFLAGS += -DHTCLOG

# QCOM GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := k2u

# Lights - device/htc/msm8960-common/
#TARGET_PROVIDES_LIBLIGHTS := true

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
#original wpa_cli v2.0-devel-4.2.2
#TODO: 2.1
#WPA_SUPPLICANT_VERSION           := VER_2_1_DEVEL
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4334_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
#libwlwpscli

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 000ffa00 00000200 "misc"
#mmcblk0p21: 00fffe00 00000200 "recovery"
#mmcblk0p20: 01000000 00000200 "boot"
#mmcblk0p33: 54fffc00 00000200 "system"
#mmcblk0p29: 00140200 00000200 "local"
#mmcblk0p34: 0dfffe00 00000200 "cache"
#mmcblk0p35: 49fffe00 00000200 "userdata"
#mmcblk0p25: 01400000 00000200 "devlog"
#mmcblk0p27: 00040000 00000200 "pdata"
#mmcblk0p36: 1097fe000 00000200 "fat"
#mmcblk0p30: 00010000 00000200 "extra"
#mmcblk0p16: 02d00000 00000200 "radio"
#mmcblk0p17: 00a00000 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 00500000 00000200 "wcnss"
#mmcblk0p19: 007ffa00 00000200 "radio_config"
#mmcblk0p23: 00400000 00000200 "modem_st1"
#mmcblk0p24: 00400000 00000200 "modem_st2"
#mmcblk0p31: 00100000 00000200 "cdma_record"
#mmcblk0p32: 06069e00 00000200 "reserve"

#kernel/htc/k2u/arch/arm/mach-msm/emmc_partitions.c

# fix this up by examining /proc/emmc on a running device
TARGET_USERIMAGES_USE_EXT4 := true
#mmcblk0p20
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
#mmcblk0p21
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
#mmcblk0p33
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1426062336
#mmcblk0p35
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1241513472
#TODO: mmcblk0p35 + mmcblk0p36 = 49fffe00 + 1097fe000 = 1537FDE00 = 5695856128
#      BOARD_USERDATAIMAGE_PARTITION_SIZE := 5695856128
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_VOLD_MAX_PARTITIONS := 38

# Allow Power Button To Be Select In Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# EXT4 larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Fix FB flicker in recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

#Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
		
#TODO, remove
#ro.build.user=coolshou
#ro.build.host=coolshou-ubuntu

#TODO: Add #####################################33
#dbus (4.2.2 bluetooth?)
#res_ctrl.conf
#voicemail-conf.xml
#com.broadcom.bt.le.jar
#modemwarnup.jar
#usbnet.jar
#BrcmBluetoothService.apk
#
#########################################################################
#TWRP touch recovery (TODO) ###############################################
DEVICE_RESOLUTION := $(TARGET_SCREEN_WIDTH)x$(TARGET_SCREEN_HEIGHT)
##-- this enables proper handling of /data/media on devices that have this folder for storage (most Honeycomb and devices that originally shipped with ICS like Galaxy Nexus)
RECOVERY_SDCARD_ON_DATA := true
##-- fixes slanty looking graphics on some devices
RECOVERY_GRAPHICS_USE_LINELENGTH := true
##-- disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
#BOARD_HAS_NO_REAL_SDCARD := true
##-- includes HTC Dumlock for devices that need it
#TW_INCLUDE_DUMLOCK := true

TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

#TW_NO_BATT_PERCENT := true -- disables the display of the battery percentage for devices that don't support it properly
#TW_CUSTOM_POWER_BUTTON := 107 -- custom maps the power button for the lockscreen
#TW_NO_REBOOT_BOOTLOADER := true -- removes the reboot bootloader button from the reboot menu
#TW_NO_REBOOT_RECOVERY := true -- removes the reboot recovery button from the reboot menu
#TW_NO_USB_STORAGE := true -- removes the USB storage button on devices that don't support USB storage
#RECOVERY_TOUCHSCREEN_SWAP_XY := true -- swaps the mapping of touches between the X and Y axis
#RECOVERY_TOUCHSCREEN_FLIP_Y := true -- flips y axis touchscreen values
#RECOVERY_TOUCHSCREEN_FLIP_X := true -- flips x axis touchscreen values
#TW_ALWAYS_RMRF := true -- forces the rm -rf option to always be on (needed for some Motorola devices)
#TW_NEVER_UNMOUNT_SYSTEM := true -- never unmount system (needed for some Motorola devices)
#TW_INCLUDE_INJECTTWRP := true -- adds ability to inject TWRP into some Samsung boot images for Samsung devices that have recovery as a second ramdisk in the boot image
#TW_DEFAULT_EXTERNAL_STORAGE := true -- defaults to external storage instead of internal on dual storage devices (largely deprecated)
#TWRP_EVENT_LOGGING := true -- enables touch event logging to help debug touchscreen issues (don't leave this on for a release - it will fill up your logfile very quickly)

