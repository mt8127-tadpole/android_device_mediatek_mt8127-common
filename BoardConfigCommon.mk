DEVICE_COMMON := device/mediatek/mt8127-common
KERNEL_COMMON := kernel/mediatek/mt8127-common
VENDOR_COMMON := vendor/mediatek/mt8127-common

include $(VENDOR_COMMON)/BoardConfigVendor.mk

# headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_COMMON)/include

# Platform
TARGET_BOARD_PLATFORM := mt8127
TARGET_BOARD_PLATFORM_GPU := mali-450mp4

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := narnia

# Architecture
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true

# Kernel Config
BOARD_KERNEL_BASE := 10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 00008000
BOARD_KERNEL_TAGS_OFFSET := 00000100
BOARD_RAMDISK_OFFSET := 01000000

BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_COMMON)/mkbootimg.mk

BOARD_MKBOOTIMG_ARGS := \
--cmdline "$(BOARD_KERNEL_CMDLINE)" \
--base $(BOARD_KERNEL_BASE) \
--pagesize $(BOARD_KERNEL_PAGESIZE) \
--kernel_offset $(BOARD_KERNEL_OFFSET) \
--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
--tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
#TARGET_KERNEL_SOURCE := $(KERNEL_COMMON)
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-

BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := mt66xx
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_STA:=P2P

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_COMMON)/bluetooth

# Graphics
BOARD_EGL_CFG := $(DEVICE_COMMON)/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_ION := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024

# Surfaceflinger optimization for VD surfaces
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
#NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10908336128
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# libxlog
TARGET_LDPRELOAD += libxlog.so
TARGET_LDPRELOAD += libshim_hwc.so

# System Prop
TARGET_SYSTEM_PROP += $(DEVICE_COMMON)/system.prop


# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

#ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
#RECOVERY_VARIANT := twrp
#endif
TARGET_RECOVERY_FSTAB := $(DEVICE_COMMON)/recovery.fstab
TW_NO_EXFAT := true
TWHAVE_SELINUX := true
#TW_USE_TOOLBOX := true
TW_NO_EXFAT_FUSE := true
TW_THEME := landscape_mdpi
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_SUPERSU := false
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEVICE_VERSION=1
TWRP_INCLUDE_LOGCAT := true
