# Copyright (C) 2009-2015 Motorola Mobility, Inc.
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := sensors.iio
LOCAL_MODULE_TAGS := optional

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
    LOCAL_CFLAGS += -DDEBUG
endif

LOCAL_CFLAGS += -DLOG_TAG=\"IioSensors\"

LOCAL_SRC_FILES := \
    Hal.cpp \
    IioHal.cpp \
    DynamicMetaSensor.cpp \
    IioSensor.cpp \
    UeventListener.cpp \
    ../motosh_hal/SensorBase.cpp

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/.. \
    $(LOCAL_PATH)/../motosh_hal \
    system/core/base/include \
    motorola/external/libiio \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

# Needs to be added after KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(ANDROID_BUILD_TOP)/kernel/include

LOCAL_SHARED_LIBRARIES += libiio
LOCAL_SHARED_LIBRARIES += liblog libcutils libutils libc
LOCAL_CFLAGS += -Wall -Wextra
LOCAL_CXXFLAGS += -Weffc++ -std=c++14

#LOCAL_PRELINK_MODULE := false

# Multi-HAL looks in /system/lib/hw/ for sub-HALs
LOCAL_MODULE_RELATIVE_PATH := hw

include $(BUILD_SHARED_LIBRARY)

