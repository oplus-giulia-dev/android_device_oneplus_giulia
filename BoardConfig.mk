#
# Copyright (C) 2021-2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
BOARD_SUPER_PARTITION_SIZE := 14578294784

# Include the common OEM chipset BoardConfig.
include device/oneplus/sm8650-common/BoardConfigCommon.mk

DEVICE_PATH := device/oneplus/giuliac

# Assert
TARGET_OTA_ASSERT_DEVICE := OP5D2BL1

# Display
TARGET_SCREEN_DENSITY := 560

# Kernel
TARGET_KERNEL_ADDITIONAL_FLAGS += \
    CONFIG_GIULIA_DTB=y \
    CONFIG_GIULIAC_DTB=y

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 103

# Include the proprietary files BoardConfig.
include vendor/oneplus/giuliac/BoardConfigVendor.mk
