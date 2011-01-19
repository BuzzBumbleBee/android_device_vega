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
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

$(call inherit-product-if-exists, vendor/advent/vega/vega-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/advent/vega/overlay

PRODUCT_PACKAGES += \
    librs_jni \
    overlay.default \
    gralloc.default \
    sensors.vega \
    lights.vega 


PRODUCT_LOCALES += mdpi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/init.rc:root/init.rc \
    $(LOCAL_PATH)/init:root/init \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/ar6000.ko:system/lib/hw/wlan/ar6000.ko \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/dhcpcd.conf:/system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/wifi/eeprom.data:system/lib/hw/wlan/eeprom.data \
    $(LOCAL_PATH)/wifi/eeprom.bin:system/lib/hw/wlan/eeprom.bin \
    $(LOCAL_PATH)/wifi/data.patch.hw2_0.bin:system/lib/hw/wlan/data.patch.hw2_0.bin \
    $(LOCAL_PATH)/wifi/athwlan.bin.z77:system/lib/hw/wlan/athwlan.bin.z77

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/advent/vega/kernel/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel
