#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/giulia

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5D3BL1,OP5D2BL1

# Display
TARGET_SCREEN_DENSITY := 500

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //device/oneplus/giulia:libudfps_extension.giulia

# Kernel
TARGET_KERNEL_CONFIG += vendor/oplus/giulia.config

# Partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 14262239232
BOARD_SUPER_PARTITION_SIZE := 14266433536

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/oneplus/giulia/BoardConfigVendor.mk
