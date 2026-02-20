#
# SPDX-FileCopyrightText: 2019 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/realme/salaa

##** Inherit from those products. Most specific first. **##
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

##** Shipping API level **##
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_TARGET_VNDK_VERSION := 31

##** Dynamic Partition **##
PRODUCT_USE_DYNAMIC_PARTITIONS := true

##** Property **##
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/prebuilt/salaa,recovery/root)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2

##** Ramdisk **##
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/ramdisk/fstab.mt6785:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6785

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fuse.passthrough.enable=true

##** HACK: Set vendor patch level **##
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.bootimage.build.date.utc=0 \
    ro.build.date.utc=0

##** Health **##
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

##** Keystore **##
PRODUCT_PACKAGES += \
    android.system.keystore2

##** Keymaster **##
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.0

##** Fastbootd **##
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

##** Update engine **##
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

##** Additional binaries & libraries needed for recovery **##
TARGET_RECOVERY_DEVICE_MODULES += \
    ashmemd_aidl_interface-cpp \
    libdmabufheap \
    libhidlmemory \
    libashmemd_client \
    libion \
    libnetutils \
    libxml2 \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

##** Soong namespaces **##
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
