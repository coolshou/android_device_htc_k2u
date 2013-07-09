USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/htc/k2_u/BoardConfigVendor.mk

# Platform
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k2_u
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 user_debug=31
BOARD_KERNEL_BASE := 0x80400000
BOARD_KERNEL_PAGESIZE := 2048

# In jellybean this is okay, but in cm10.1 use
# BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x81808000
BOARD_FORCE_RAMDISK_ADDRESS := 0x81808000

# fix this up by examining /proc/emmc on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1426062336
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1241513472
BOARD_FLASH_BLOCK_SIZE := 512

TARGET_PREBUILT_KERNEL := device/htc/k2_u/prebuilt/kernel

# Allow Power Button To Be Select In Recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# EXT4 larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true

# Vold
BOARD_VOLD_MAX_PARTITIONS := 38
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# TWRP Specific
DEVICE_RESOLUTION := 480x800

# TWRP Internal SD
TW_INTERNAL_STORAGE_PATH := "/int_sd"
TW_INTERNAL_STORAGE_MOUNT_POINT := "int_sd"

# TWRP External SD
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_DEFAULT_EXTERNAL_STORAGE := true

# Fix for weird FB issue
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
