#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/salaa

##** For building with minimal manifest **##
ALLOW_MISSING_DEPENDENCIES := true

##** Build Rules **##
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true
BUILD_BROKEN_DUP_SYSPROP := true

##** Architecture **##
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

##** CPU BOOST **##
TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

##** Assert **##
TARGET_OTA_ASSERT_DEVICE := RMX2155,RMX2155L1,RMX2151,RMX2151L1,RMX2156L1,RMX2161L1,RMX2163L1,salaa

##** Bootloader **##
TARGET_BOOTLOADER_BOARD_NAME := RM6785
TARGET_NO_BOOTLOADER := true

##** Platform **##
TARGET_BOARD_PLATFORM := mt6785
BOARD_HAS_MTK_HARDWARE := true
BOARD_USES_MTK_HARDWARE := true
MTK_HARDWARE := true

##** Display Size & Density **##
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_DENSITY := 440

##** Boot Image Header and Memory Layout **##
BOARD_KERNEL_CMDLINE         := bootopt=64S3,32N2,64N2
BOARD_KERNEL_IMAGE_NAME      := kernel
BOARD_BOOT_HEADER_VERSION    := 2
BOARD_KERNEL_BASE            := 0x40078000
BOARD_KERNEL_OFFSET          := 0x00008000
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_KERNEL_TAGS_OFFSET     := 0x0bc08000
BOARD_RAMDISK_OFFSET         := 0x07c08000
BOARD_SECOND_OFFSET          := 0xbff88000
BOARD_DTB_OFFSET             := 0x0bc08000
BOARD_INCLUDE_RECOVERY_DTBO  := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

##** mkbootimg Arguments **##
BOARD_MKBOOTIMG_ARGS := --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --board ""

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/realme/mt6785
TARGET_KERNEL_CONFIG := salaa_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := r547379
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc
TARGET_KERNEL_ADDITIONAL_FLAGS += LLVM=1 LLVM_IAS=1
TARGET_KERNEL_NO_GCC := true
#BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_IMAGE_NAME := Image.gz

USE_PREBUILT_KERNEL := true
ifeq ($(USE_PREBUILT_KERNEL),true)
BOARD_INCLUDE_RECOVERY_DTBO  := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
endif

##** Metadata **##
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS := metadata

##** Partition Sizes (in bytes) **##
BOARD_FLASH_BLOCK_SIZE                := 131072  # 128 KB
BOARD_BOOTIMAGE_PARTITION_SIZE        := 33554432  # 32 MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 102760448 # ~98 MB
BOARD_CACHEIMAGE_PARTITION_SIZE       := 452984832 # ~432 MB

##** Partition File System Types **##
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EROFS := true

##** Dynamic Partitions Configuration **##
BOARD_SUPER_PARTITION_SIZE            := 8053063680         # ~7.5 GB
BOARD_SUPER_PARTITION_GROUPS          := main
BOARD_MAIN_SIZE                       := 8048869376         # (8053063680 - 4194304)
BOARD_MAIN_PARTITION_LIST := \
    system \
    vendor \
    product \
    system_ext \
    odm

##**  Partition Mount Points
TARGET_COPY_OUT_SYSTEM_EXT            := system_ext
TARGET_COPY_OUT_VENDOR                := vendor
TARGET_COPY_OUT_PRODUCT               := product
TARGET_COPY_OUT_ODM                   := odm

# Dynamic Partition handling flags
IGNORE_UPDATE_LOGICAL_PARTITION_ERROR := true # Makes twrp ignore "unable to update logical partition" error
ALLOW_LOGICAL_PARTITION_WIPE := true # lets the dynamic partitions be wipable/resizable in twrp > wipe

# these dynamic partitions will get mounted as rw
BOARD_RW_DYNAMIC_PARTITIONS_LIST := system system_ext vendor product odm

##** Crypto **##
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true
TW_USE_FSCRYPT_POLICY := 2
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY := true

##** Hack: prevent anti rollback **##
PLATFORM_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

##** AVB **##
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH)/libinit:libinit_salaa
TARGET_RECOVERY_DEVICE_MODULES := libinit_MT6785

##** Recovery **##
RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
BOARD_SPRUPESS_EMMC_WIPE := true
RECOVERY_SDCARD_ON_DATA := true   
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true                 
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/prebuilt/salaa/system/etc/recovery.fstab
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP := $(DEVICE_PATH)/properties/vendor.prop
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_USES_MKE2FS := true

##** TWRP Configuration	**##
TW_CLOCK_OFFSET := "SAUST-3;SAUDT"																																																																								
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024
TW_FRAMERATE := 60
TW_DEFAULT_LANGUAGE := en
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_NO_LEGACY_PROPS := true
TW_INCLUDE_LPDUMP:= true
TW_EXCLUDE_LPTOOLS := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/power_supply/battery/temp
TW_INCLUDE_LOGICAL := my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_bigball my_manifest
TW_HAS_USB_STORAGE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true 
TW_FORCE_KEYMASTER_VER := true
TW_INCLUDE_FASTBOOTD := true
TW_USE_TOOLBOX := true
#TW_SKIP_COMPATIBILITY_CHECK := true
#TW_FORCE_CPUINFO_FOR_DEVICE_ID := true
#TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
#TW_LOAD_VENDOR_BOOT_MODULES := true
#TW_LOAD_VENDOR_MODULES := ""
#TW_NEVER_UNMOUNT_SYSTEM := true
#TW_FORCE_USE_BUSYBOX := true
#TW_USE_NEW_MINADBD := true

##** Storage **##
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb
TW_NO_USB_STORAGE := false
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file

##** Resolution **##
TW_THEME := portrait_hdpi

##** Debug flags **##
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

##** resetprop and magiskboot **##
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP :=true

##** Excludes **##
#TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true
#TW_EXCLUDE_PYTHON := false

##** Configure Status bar icons "TWRP builds only" **##
TW_Y_OFFSET := 12
TW_H_OFFSET := -12
#TW_CUSTOM_CPU_POS := 190
#TW_CUSTOM_BATTERY_POS := 916
#TW_CUSTOM_CLOCK_POS := 520
#TW_STATUS_ICONS_ALIGN := center

##** Custom TWRP Versioning **##
##** device version is optional - the default value is "0" if nothing is set in device tree **##
#CUSTOM_TWRP_DEVICE_VERSION := RUI_V3.0

##** version prefix is optional - the default value is "LOCAL" if nothing is set in device tree **##
#CUSTOM_TWRP_VERSION_PREFIX := By LUKS

#include device/common/version-info/custom_twrp_version.mk

#ifeq ($(CUSTOM_TWRP_VERSION),)
#CUSTOM_TWRP_VERSION := $(shell date +%Y%m%d)-01
#endif
