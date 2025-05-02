#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
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

blob_fixups: blob_fixups_user_type = {
    'odm/etc/camera/CameraHWConfiguration.config': blob_fixup()
        .regex_replace('SystemCamera =  0;  0;  0;  1;  0; 1;', 'SystemCamera =  0;  0;  0;  0;  0; 0;')
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
