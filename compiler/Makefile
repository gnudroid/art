
all:	foo

STANDALONE_BUILD=1

LZMA_CPPFLAGS			?= -I$(SYSROOT)/usr/include/lzma
LIBNATIVEHELPER_CPPFLAGS	?= -I../../libnativehelper/include/nativehelper
SYSTEM_CORE_CPPFLAGS		?= -I../../system/core/include
VIXL_CPPFLAGS			?= -I../../external/vixl/src/
LZ4_CPPFLAGS			?= -I../../external/lz4/lib

## available types: SS CMS GSS
ART_DEFAULT_GC_TYPE=CMS
ART_IMT_SIZE=64

include Android.mk

SRCS = $(LIBART_COMPILER_SRC_FILES) $(LIBART_COMPILER_SRC_FILES_x86)
OBJS = $(SRCS:.cc=.o)

CPPFLAGS += -I../runtime/ -I. $(LZMA_CPPFLAGS) \
    -I../disassembler \
    $(LIBNATIVEHELPER_CPPFLAGS) \
    $(SYSTEM_CORE_CPPFLAGS) \
    $(VIXL_CPPFLAGS) \
    $(LZ4_CPPFLAGS) \
    -DART_ENABLE_CODEGEN_arm \
    -DART_ENABLE_CODEGEN_arm64 \
    -DART_ENABLE_CODEGEN_x86

CXXFLAGS += -std=c++11

CPPFLAGS += -DIMT_SIZE=$(ART_IMT_SIZE)
CPPFLAGS += -DART_DEFAULT_GC_TYPE_IS_$(ART_DEFAULT_GC_TYPE)

foo:	$(OBJS)
	echo "...: $(OBJS)"
	$(CXX) -o $@ $(OBJS)
