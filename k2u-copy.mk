
# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.k2u:root/fstab.k2u \
    $(LOCAL_PATH)/ramdisk/init.k2u.rc:root/init.k2u.rc \
    $(LOCAL_PATH)/ramdisk/init.k2u.usb.rc:root/init.k2u.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.k2u.rc:root/ueventd.k2u.rc \
    $(LOCAL_PATH)/ramdisk/init.goldfish.rc:root/init.goldfish.rc 
    
#    $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.rc 
#    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle
#    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/device-keypad.kl:system/usr/keylayout/device-keypad.kl \
    $(LOCAL_PATH)/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    $(LOCAL_PATH)/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl \
    $(LOCAL_PATH)/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl 

#    $(LOCAL_PATH)/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl 
#    $(LOCAL_PATH)/keylayout/Generic.kl:system/usr/keylayout/Generic.kl
#    $(LOCAL_PATH)/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl
#    $(LOCAL_PATH)/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl
#    $(LOCAL_PATH)/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl
#    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl
#    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl
#    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl
#    $(LOCAL_PATH)/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl
#    $(LOCAL_PATH)/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl
#    $(LOCAL_PATH)/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl
#    $(LOCAL_PATH)/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl

#qemu needed?
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/layout_version:data/.layout_version


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.goldfish.sh:system/etc/init.goldfish.sh

#TODO: recovery ramdisk
#root/init.recovery.*.rc
#recovery init   
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.target.recovery.rc:root/init.recovery.rc

# recovery and custom charging
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/sbin/power_test:recovery/root/sbin/power_test \
    $(LOCAL_PATH)/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/sbin/detect_key:recovery/root/sbin/detect_key

#system init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/etc/init.qcom.q6_links.sh:system/etc/init.qcom.q6_links.sh \
    $(LOCAL_PATH)/etc/init.qcom.radio_links.sh:system/etc/init.qcom.radio_links.sh
