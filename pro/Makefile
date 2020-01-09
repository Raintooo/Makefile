.PHONY : clean rebuild compile link

MODULE := main common module

MAKE := make
MKDIR := mkdir
RM := rm -rf
CC := gcc
CFLAGS := 

DIR_PROJECT := $(realpath .)
DIR_BUILD := build
DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/,$(MODULE))

MODULE_LIB := $(addsuffix .a,$(MODULE))
MODULE_LIB := $(addprefix $(DIR_BUILD)/,$(MODULE_LIB))

APP := app.out
APP := $(addprefix $(DIR_BUILD)/,$(APP)) 

all: compile $(APP)
	@echo "success!! output => $(APP)"
	

compile : $(DIR_BUILD) $(DIR_BUILD_SUB)
	@echo "compile start.."
	@set -e;\
	for dir in $(MODULE);\
	do\
		cd $$dir && make all DEBUG=$(DEBUG) && cd ..;\
	done
	
	@echo "compile OK"
	
$(DIR_BUILD_SUB) $(DIR_BUILD) : 
	$(MKDIR) $@
	
link $(APP) :  $(MODULE_LIB)
	$(CC) $(CFLAGS) -o $(APP) -Xlinker "-(" $^ -Xlinker "-)" 
	
clean : 
	$(RM) $(DIR_BUILD) $(APP)
	
rebuild : clean all
	