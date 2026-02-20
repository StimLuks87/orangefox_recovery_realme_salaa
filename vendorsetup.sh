#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

if [ -z "$BASH_SOURCE" ]; then
  echo "warn: This command should be run with /bin/bash shell"
  return
fi

VENDORSETUP_PATH=$(dirname "${BASH_SOURCE[0]}")

set -a

if [ "$NOT_ORANGEFOX" != "1" ]; then
  if [ -z "$FOX_BUILD_DEVICE" ]; then
    FOX_BUILD_DEVICE=salaa
  fi
  if [ "$FOX_BUILD_DEVICE" = "salaa" ]; then
    source "${VENDORSETUP_PATH}/fox_env.sh"
  fi
fi

set +a
