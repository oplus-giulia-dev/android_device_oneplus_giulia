#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from waffle device
$(call inherit-product, device/oneplus/waffle/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_waffle
PRODUCT_DEVICE := waffle
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2581

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="CPH2581EEA-user 15 AP3A.240617.008 U.R4T3.1c799fe_ca44_2 release-keys" \
    BuildFingerprint=OnePlus/CPH2581EEA/OP595DL1:15/AP3A.240617.008/U.R4T3.1c799fe_ca44_2:user/release-keys \
    DeviceName=OP595DL1 \
    DeviceProduct=CPH2581 \
    SystemDevice=OP595DL1 \
    SystemName=CPH2581
