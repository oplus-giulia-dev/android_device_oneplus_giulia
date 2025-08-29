#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2376
TARGET_SCREEN_WIDTH := 1080

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946652107814787.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946652107814787.xml

# Fingerprint
$(call soong_config_set,surfaceflinger,udfps_lib,//device/oneplus/giulia:libudfps_extension.giulia)

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0-service \
    hwservicemanager

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

PRODUCT_PACKAGES += \
    OPlusFrameworksResTarget \
    OPlusFrameworksResTargetCN \
    OPlusSettingsProviderResTarget \
    OPlusSettingsResTarget \
    OPlusSystemUIResTarget \
    OPlusWifiResTarget

# Regional properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/23851/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/23851/build.default.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/23867/build.EU.prop:$(TARGET_COPY_OUT_ODM)/etc/23867/build.EU.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/23867/build.IN.prop:$(TARGET_COPY_OUT_ODM)/etc/23867/build.IN.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/23867/build.NA.prop:$(TARGET_COPY_OUT_ODM)/etc/23867/build.NA.prop \
    $(LOCAL_PATH)/recovery/root/vendor/odm/etc/23867/build.default.prop:$(TARGET_COPY_OUT_ODM)/etc/23867/build.default.prop

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 35

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch features
$(call soong_config_set,OPLUS_LINEAGE_TOUCH_HAL,ENABLE_GM,true)
$(call soong_config_set,OPLUS_LINEAGE_TOUCH_HAL,ENABLE_HTPR,false)

# Vibrator
$(call soong_config_set,OPLUS_LINEAGE_VIBRATOR_HAL,INCLUDE_DIR,$(LOCAL_PATH)/vibrator/include)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/oneplus/sm8650-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/oneplus/giulia/giulia-vendor.mk)
