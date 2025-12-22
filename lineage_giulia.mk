#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from giulia device
$(call inherit-product, device/oneplus/giulia/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_giulia
PRODUCT_DEVICE := giulia
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2645

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="CPH2645-user 16 UKQ1.231108.001 V.R4T3.2ced612-c3b1f5-c58d28 release-keys" \
    BuildFingerprint=OnePlus/CPH2645/OP5D3BL1:16/UKQ1.231108.001/V.R4T3.2ced612-c3b1f5-c58d28:user/release-keys \
    DeviceName=OP5D3BL1 \
    DeviceProduct=CPH2645 \
    SystemDevice=OP5D3BL1 \
    SystemName=CPH2645
