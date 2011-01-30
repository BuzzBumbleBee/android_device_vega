$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_vega
PRODUCT_DEVICE := vega

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 

# davik-cache to /data untill /cache can be fixed
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

$(call inherit-product-if-exists, vendor/advent/vega/vega-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/advent/vega/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    overlay.tegra \
    gralloc.default \
    gralloc.tegra \
    sensors.default \
    sensors.tegra \
    lights.tegra 


PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
    $(LOCAL_PATH)/ramdisk/init:root/init \
    $(LOCAL_PATH)/ramdisk/init_recovery.rc:root/init_recovery.rc \
    $(LOCAL_PATH)/ramdisk/initlogo.rle:root/initlogo.rle \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/ar6000.ko:system/lib/hw/wlan/ar6000.ko \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/eeprom.data:system/lib/hw/wlan/eeprom.data \
    $(LOCAL_PATH)/wifi/eeprom.bin:system/lib/hw/wlan/eeprom.bin \
    $(LOCAL_PATH)/wifi/data.patch.hw2_0.bin:system/lib/hw/wlan/data.patch.hw2_0.bin \
    $(LOCAL_PATH)/wifi/athwlan.bin.z77:system/lib/hw/wlan/athwlan.bin.z77

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel/cifs.ko:system/lib/modules/cifs.ko

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/advent/vega/kernel/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
