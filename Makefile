CC := gcc
CFLAGS := -Wall -Wextra -Iinclude/
DEBFLAGS := -fsanitize=address,undefined -g
CLIBS := -lm


CFILES := $(shell find src -type f -name "*.c" | cut -d'/' -f 2-)
OBJFILES := $(patsubst %.c,%.o,$(addprefix build/objs/, $(CFILES)))
DIRS := src include data build build/objs

	
exe: $(OBJFILES) | $(DIRS)
	@$(CC) -o build/exe $^ $(CFLAGS) $(DEBFLAGS)
	@cp -r data/* build/

bear:
	bear -- make --no-print-directory

.SECONDEXPANSION:
$(OBJFILES): $$(patsubst %.o,%.c, $$(addprefix src/,$$(shell echo "$$@" | cut -d'/' -f 3-)))
	@mkdir -p $(dir $@)
	@$(CC) -c -o $@ $^ $(CFLAGS) $(DEBFLAGS)


clean:
	rm -rf build/


$(DIRS):
	@mkdir -p $@
