PROGRAMS = prog7a prog7b

ifneq ($(MAKECMDGOALS),)

	ifneq ($(MAKECMDGOALS),clean)

		PROGRAMS = $(MAKECMDGOALS)

	endif

endif

all: $(PROGRAMS)

$(PROGRAMS): % : %.o

#	ld -o $@ $<  # this works
	ld -o bin/$@ $< # WS this works, puts executables in local bin/

clean:

#	rm -f *.o $(PROGRAMS) # this deletes the executable also
#	rm *.o $(PROGRAMS) # this also: PROGRAMS contains the executable names
	rm *.o # this works
