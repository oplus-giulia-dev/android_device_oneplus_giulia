#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/oneplus/sm8650-common',
    'hardware/qcom-caf/sm8650',
    'hardware/oplus',
    'vendor/qcom/opensource/commonsys/display',
    'vendor/qcom/opensource/commonsys-intf/display',
]

def lib_fixup_odm_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'odm' else None

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libarcsoft_triple_sat',
        'libarcsoft_triple_zoomtranslator',
        'libdualcam_optical_zoom_control',
        'libdualcam_video_optical_zoom',
        'libhwconfigurationutil',
        'libtriplecam_optical_zoom_control',
        'libtriplecam_video_optical_zoom',
        'vendor.oplus.hardware.cammidasservice-V1-ndk',
        'vendor.oplus.hardware.camera_rfi-V1-ndk',
    ): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    'odm/giulia/etc/camera/CameraHWConfiguration.config': blob_fixup()
        .regex_replace('SystemCamera =  0;  0;  0;  1;  0; 1;', 'SystemCamera =  0;  0;  0;  0;  0; 0;'),
    'odm/giuliacn/etc/camera/CameraHWConfiguration.config': blob_fixup()
        .regex_replace('SystemCamera =  0;  0;  0;  1;  0; 1;', 'SystemCamera =  0;  0;  0;  0;  0; 0;'),
    'odm/lib64/libAlgoProcess.so': blob_fixup()
        .replace_needed('android.hardware.graphics.common-V3-ndk.so', 'android.hardware.graphics.common-V6-ndk.so')
        .remove_needed('android.hardware.graphics.common-V4-ndk.so'),
    ('odm/lib64/libCOppLceTonemapAPI.so', 'odm/lib64/libYTCommon.so'): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so'),
    ('odm/lib64/libEIS.so', 'odm/lib64/libHIS.so', 'odm/lib64/libOPAlgoCamFaceBeautyCap.so', 'odm/lib64/libOGLManager.so'): blob_fixup()
        .clear_symbol_version('AHardwareBuffer_allocate')
        .clear_symbol_version('AHardwareBuffer_describe')
        .clear_symbol_version('AHardwareBuffer_lock')
        .clear_symbol_version('AHardwareBuffer_release')
        .clear_symbol_version('AHardwareBuffer_unlock'),
    'odm/lib64/libarcsoft_high_dynamic_range_v4.so': blob_fixup()
        .clear_symbol_version('remote_handle_close')
        .clear_symbol_version('remote_handle_invoke')
        .clear_symbol_version('remote_handle_open')
        .clear_symbol_version('remote_register_buf_attr')
        .clear_symbol_version('remote_register_buf'),
    ('odm/lib64/camera.device@3.3-impl_odm.so','odm/lib64/vendor.oplus.hardware.virtual_device.camera.provider@2.4-impl.so', 'odm/lib64/vendor.oplus.hardware.virtual_device.camera.provider@2.5-impl.so', 'odm/lib64/vendor.oplus.hardware.virtual_device.camera.provider@2.6-impl.so', 'odm/lib64/vendor.oplus.hardware.virtual_device.camera.provider@2.7-impl.so'): blob_fixup()
        .replace_needed('camera.device@3.2-impl.so', 'camera.device@3.2-impl_odm.so')
        .replace_needed('camera.device@3.3-impl.so', 'camera.device@3.3-impl_odm.so'),
    'odm/lib64/vendor.oplus.hardware.virtual_device.camera.manager@1.0-impl.so': blob_fixup()
        .add_needed('libui_shim.so'),
    'vendor/etc/libnfc-nci.conf': blob_fixup()
        .regex_replace('NFC_DEBUG_ENABLED=1', 'NFC_DEBUG_ENABLED=0'),
    'vendor/etc/libnfc-nxp.conf': blob_fixup()
        .regex_replace('(NXPLOG_.*_LOGLEVEL)=0x03', '\\1=0x02')
        .regex_replace('NFC_DEBUG_ENABLED=1', 'NFC_DEBUG_ENABLED=0'),
}  # fmt: skip

module = ExtractUtilsModule(
    'giulia',
    'oneplus',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
