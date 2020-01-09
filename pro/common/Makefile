.PHONY : clean all

DIR_COMMON_INC := /share_samba/My_Test/make_file/Makefile/pro/common/inc
DIR_BUILD := /share_samba/My_Test/make_file/Makefile/pro/build

TYPE_OBJ := .o
TYPE_SRC := .c
TYPE_INC := .h
TYPE_DEP := .d

DIR_SRC := src
DIR_INC := inc

CC := gcc
CFLAGS := -I$(DIR_INC) -I$(DIR_COMMON_INC)
AR := ar
AFLAGS := rcs

ifeq ($(DEBUG),true)
CFLAGS += -g
endif

SRC := $(wildcard $(DIR_SRC)/*$(TYPE_SRC))

MODLUDE := $(realpath .)
MODLUDE := $(notdir $(MODLUDE))

DIR_OUTPUT := $(addprefix $(DIR_BUILD)/,$(MODLUDE))
OUTPUT := $(MODLUDE).a
OUTPUT := $(addprefix $(DIR_BUILD)/,$(OUTPUT))

OBJS := $(SRC:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst $(DIR_SRC)/%,$(DIR_OUTPUT)/%,$(OBJS))

DEPS := $(SRC:$(TYPE_SRC)=$(TYPE_DEP))
DEPS := $(patsubst $(DIR_SRC)/%,$(DIR_OUTPUT)/%,$(DEPS))

vpath %$(TYPE_SRC) $(DIR_SRC)
vpath %$(TYPE_INC) $(DIR_INC)
vpath %$(TYPE_INC) $(DIR_COMMON_INC)
vpath %$(TYPE_DEP) $(DIR_OUTPUT)

include $(DEPS)

all : $(OUTPUT)
	@echo "COMPILE OK"
	
$(OUTPUT) : $(OBJS)
	$(AR) $(AFLAGS) $@ $^

$(DIR_OUTPUT)/%$(TYPE_OBJ) : %$(TYPE_SRC)
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(TYPE_SRC),$^)
	
$(DIR_OUTPUT)/%$(TYPE_DEP) : %$(TYPE_SRC)
	@echo "update $@"
	@set -e; \
	$(CC) $(CFLAGS) -MM -E $(filter %$(TYPE_SRC),$^) | sed 's,\(.*\)\.o[ :]*,$(DIR_OUTPUT)/\1.o $@: ,g' > $@
	
test : 
	@echo "$(OBJS)"
	
	
	
	
	
	
	
	
	