LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS           += -O3
LOCAL_MODULE_PATH      := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE           := camera.$(TARGET_BOARD_PLATFORM)

LOCAL_MODULE_TAGS      := optional

ifneq (,$(filter beni cooper,$(CM_BUILD)))
    LOCAL_CFLAGS       += -DBOARD_CAMERA_5MP
endif

LOCAL_SRC_FILES        := cameraHAL.cpp
LOCAL_C_INCLUDES       := $(TOP)/frameworks/base/include
LOCAL_C_INCLUDES       += hardware/qcom/display-legacy/libgralloc

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils
LOCAL_SHARED_LIBRARIES += libui libhardware libcamera_client
LOCAL_C_INCLUDES       += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_LDFLAGS          += -Lvendor/samsung/msm7x27-common/proprietary/lib -lcamera

include $(BUILD_SHARED_LIBRARY)
