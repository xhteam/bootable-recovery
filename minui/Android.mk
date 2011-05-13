LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(HAVE_FSL_EPDC_FB),true)
LOCAL_CFLAGS += -DFSL_EPDC_FB
endif

LOCAL_SRC_FILES := graphics.c events.c resources.c

LOCAL_C_INCLUDES +=\
    external/libpng\
    external/zlib

LOCAL_MODULE := libminui

ifeq ($(TARGET_RECOVERY_PIXEL_FORMAT),"RGBX_8888")
  LOCAL_CFLAGS += -DRECOVERY_RGBX
endif
ifeq ($(TARGET_RECOVERY_PIXEL_FORMAT),"BGRA_8888")
  LOCAL_CFLAGS += -DRECOVERY_BGRA
endif

include $(BUILD_STATIC_LIBRARY)
