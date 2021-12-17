PROGRAMS = prog7a prog7b

ifneq ($(MAKECMDGOALS),)

	ifneq ($(MAKECMDGOALS),clean)

		PROGRAMS = $(MAKECMDGOALS)

	endif

endif

all: $(PROGRAMS)

$(PROGRAMS): % : %.o

	ld -o $@ $<

clean:

	rm -f *.o $(PROGRAMS)
