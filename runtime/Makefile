
all:	dump	libart.so

ART_ROOT		:= ../

include $(ART_ROOT)/buildconf.mk
include Android.mk

SRCS_ANDROID	:= $(LIBART_TARGET_SRC_FILES) $(LIBART_TARGET_SRC_FILES_$(ART_ARCH))
SRCS_LINUX	:= $(LIBART_HOST_SRC_FILES) $(LIBART_HOST_SRC_FILES_$(ART_ARCH))

SRCS_LINUX	:= $(SRCS_LINUX:.cc.arm=.cc)

### for now only build for native linux - skip android-specific stuff
OBJS_LINUX	:= $(SRCS_LINUX:.cc=.o)
OBJS_ANDROID	:= $(SRCS_ANDROID:.cc=.o)

CPPFLAGS	:= \
    $(LIBNATIVEHELPER_CPPFLAGS)	\
    $(LIBNATIVELOADER_CPPFLAGS)	\
    $(SYSTEM_CORE_CPPFLAGS)	\
    $(SIGCHAINLIB_CPPFLAGS)	\
    $(LZ4_CPPFLAGS)		\
    -DBUILDING_LIBART		\
    -I.				\
    -I..			\
    -I../cmdline

LIBS		:= \
    $(LZ4_LIBS)

CXXFLAGS	:= -std=c++11 -Wno-unused

CPPFLAGS += $(ART_COMMON_CPPFLAGS)

ART_HOST_CFLAGS += -DART_BASE_ADDRESS_MIN_DELTA=$(LIBART_IMG_HOST_MIN_BASE_ADDRESS_DELTA)
ART_HOST_CFLAGS += -DART_BASE_ADDRESS_MAX_DELTA=$(LIBART_IMG_HOST_MAX_BASE_ADDRESS_DELTA)
ART_HOST_CFLAGS += -DART_BASE_ADDRESS=$(LIBART_IMG_HOST_BASE_ADDRESS)

CPPFLAGS	+= $(ART_HOST_CFLAGS)
LIBS		+= -ldl $(LIBANDROID_LOG_LIBS) $(LIBANDROID_CUTILS_LIBS)

dump:
#	@echo $(SRCS_ANDROID) | tr ' ' '\n' | sort -u > srcs.android
#	@echo $(SRCS_LINUX) | tr ' ' '\n' | sort -u > srcs.linux
	@echo $(SRCS_ANDROID) | tr ' ' '\n' > srcs.android
	@echo $(SRCS_LINUX) | tr ' ' '\n' > srcs.linux

libart.so:	$(OBJS_LINUX)
	@$(CXX) -shared -pthread -Wl,--no-undefined -o $@ $(OBJS_LINUX) $(LIBS)
