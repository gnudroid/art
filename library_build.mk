
all-lib : $(LIBRARY_OUT)

$(LIBRARY_OUT):	$(OBJS)
	@echo "linking: $@"
	@$(CXX) -shared $(LDFLAGS) -Wl,--no-undefined -o $@ $(OBJS) $(LIBS)
#	@$(CXX) -shared -pthread -Wl,--no-undefined -o $@ $(OBJS) $(LIBS)

%.o : %.c
%.o : %.c $(DEPDIR)/%.d
        @echo compiling: $@
	@$(COMPILE.c) $(OUTPUT_OPTION) $<
	@$(POSTCOMPILE)

%.o : %.cc
%.o : %.cc $(DEPDIR)/%.d
	@echo compiling: $@
	@$(COMPILE.cc) $(OUTPUT_OPTION) $<
	@$(POSTCOMPILE)

%.o : %.cxx
%.o : %.cxx $(DEPDIR)/%.d
	@echo compiling: $@"
	@$(COMPILE.cc) $(OUTPUT_OPTION) $<
	@$(POSTCOMPILE)

$(DEPDIR)/%.d: ;
.PRECIOUS: $(DEPDIR)/%.d

-include $(patsubst %,$(DEPDIR)/%.d,$(basename $(SRCS)))
