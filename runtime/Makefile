
#DEPDIR := .d
#$(shell mkdir -p $(DEPDIR) >/dev/null)

#DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.Td
#
#COMPILE.c = $(CC) $(DEPFLAGS) $(CFLAGS) $(CPPFLAGS) -c
#COMPILE.cc = $(CXX) $(DEPFLAGS) $(CXXFLAGS) $(CPPFLAGS) -c
#POSTCOMPILE = mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d

ART_ROOT		:= ../

include $(ART_ROOT)/buildconf.mk

all:	$(LIBRARY_OUT)

include Android.mk

SRCS_ANDROID	:= $(LIBART_TARGET_SRC_FILES) $(LIBART_TARGET_SRC_FILES_$(ART_ARCH))
SRCS_LINUX	:= $(LIBART_HOST_SRC_FILES) $(LIBART_HOST_SRC_FILES_$(ART_ARCH))

SRCS_LINUX	:= $(SRCS_LINUX:.cc.arm=.cc)

### for now only build for native linux - skip android-specific stuff
OBJS_LINUX	:= $(SRCS_LINUX:.cc=.o)
OBJS_ANDROID	:= $(SRCS_ANDROID:.cc=.o)

SRCS		:= $(SRCS_LINUX)
OBJS		:= $(OBJS_LINUX)

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

LIBRARY_NAME	+= art

#libart.so:	$(OBJS)
#	@echo "linking $@"
#	@$(CXX) -shared -pthread -Wl,--no-undefined -o $@ $(OBJS) $#(LIBS)

#%.o : %.c
#%.o : %.c $(DEPDIR)/%.d
#	$(COMPILE.c) $(OUTPUT_OPTION) $<
#	$(POSTCOMPILE)

#%.o : %.cc
#%.o : %.cc $(DEPDIR)/%.d
#	$(COMPILE.cc) $(OUTPUT_OPTION) $<
#	$(POSTCOMPILE)

#%.o : %.cxx
#%.o : %.cxx $(DEPDIR)/%.d
#	$(COMPILE.cc) $(OUTPUT_OPTION) $<
#	$(POSTCOMPILE)

#$(DEPDIR)/%.d: ;
#.PRECIOUS: $(DEPDIR)/%.d

#-include $(patsubst %,$(DEPDIR)/%.d,$(basename $(SRCS)))

include $(ART_ROOT)/library_build.mk
