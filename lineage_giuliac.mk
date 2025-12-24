#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from giuliac device
$(call inherit-product, device/oneplus/giuliac/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_giuliac
PRODUCT_DEVICE := giuliac
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := PKG110

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi-user 16 BP2A.250605.015 1761899572161 release-keys" \
    BuildFingerprint=OnePlus/PKG110/OP5D2BL1:16/UKQ1.231108.001/V.202510311726:user/release-keys \
    DeviceName=OP5D2BL1 \
    DeviceProduct=PKG110 \
    SystemDevice=OP5D2BL1 \
    SystemName=PKG110
