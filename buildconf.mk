
STANDALONE_BUILD	:= 1

PKG_CONFIG		?= pkg-config

## available types: SS CMS GSS
ART_DEFAULT_GC_TYPE ?= CMS
ART_IMT_SIZE        ?= 64

## fixme: should detect it via toolchain
ART_ARCH ?= x86

## fixme: move out these libraries and detect via pkg-config
LIBNATIVEHELPER_CPPFLAGS	?= -I$(ART_ROOT)/../libnativehelper/include/nativehelper
LIBNATIVELOADER_CPPFLAGS	?= -I$(ART_ROOT)/../system/core/libnativeloader/include
SYSTEM_CORE_CPPFLAGS		?= -I$(ART_ROOT)/../system/core/include
SIGCHAINLIB_CPPFLAGS		?= -I$(ART_ROOT)/sigchainlib
LZ4_CPPFLAGS			?= $(shell pkg-config --cflags liblz4)
LZ4_LIBS			?= $(shell pkg-config --libs liblz4)

LIBANDROID_CUTILS_LIBS		?= -L$(ART_ROOT)/../system/core/libcutils -landroid_cutils
LIBANDROID_LOG_LIBS		?= -L$(ART_ROOT)/../system/core/liblog -landroid_log

ART_COMMON_CPPFLAGS		+= -DIMT_SIZE=$(ART_IMT_SIZE)
ART_COMMON_CPPFLAGS		+= -DART_DEFAULT_GC_TYPE_IS_$(ART_DEFAULT_GC_TYPE)

LIBART_IMG_HOST_MIN_BASE_ADDRESS_DELTA	:= -0x1000000
LIBART_IMG_HOST_MAX_BASE_ADDRESS_DELTA	:= 0x1000000
LIBART_IMG_HOST_BASE_ADDRESS		:= 0x60000000
