USE_CAMERA_STUB := true
BOARD_USE_FROYO_LIBCAMERA := true

# inherit from the proprietary version
-include vendor/advent/vega/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
TARGET_HAVE_TEGRA_ERRATA_657451 := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := harmony

# Modem
TARGET_NO_RADIOIMAGE := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := wlan0
WIFI_DRIVER_MODULE_PATH     := "/system/lib/hw/wlan/ar6000.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "ar6000"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CSR := true

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_PAGE_SIZE := 0x00000800

#Audio Stuff
BOARD_USES_GENERIC_AUDIO := false
BOARD_PREBUILT_LIBAUDIO := false
USE_KINETO_COMPATIBILITY := true


BOARD_EGL_CFG := device/advent/vega/egl.cfg

#BOARD_NO_RGBX_8888 := true

# Enables Old Sensor Compatibility
TARGET_USES_OLD_LIBSENSORS_HAL:=true

# fix this up by examining /proc/mtd on a running device
# dev:    size   erasesize  name
# mtd0: 00200000 00020000 "misc"
# mtd1: 00500000 00020000 "recovery"
# mtd2: 00800000 00020000 "boot"
# mtd3: 077a0000 00020000 "system"
# mtd4: 02000000 00020000 "cache"
# mtd5: 00400000 00020000 "staging"
# mtd6: 14b40000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x077a0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x14b40000
BOARD_FLASH_BLOCK_SIZE := 131072

# Setting this to avoid boot locks on the system from using the "misc" partition.
BOARD_HAS_NO_MISC_PARTITION := true

# The devices' prebuilt kernel
TARGET_PREBUILT_KERNEL := device/advent/vega/kernel/kernel
