.PHONY : clean rebuild compile link


DIR_PROJECT := $(realpath .)

DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/,$(MODULE))

MODULE_LIB := $(addsuffix .a,$(MODULE))
MODULE_LIB := $(addprefix $(DIR_BUILD)/,$(MODULE_LIB))

APP := $(addprefix $(DIR_BUILD)/,$(APP)) 

all: compile $(APP)
	@echo "success!! output => $(APP)"

compile : $(DIR_BUILD) $(DIR_BUILD_SUB)
	@echo "compile start.."
	@set -e;\
	for dir in $(MODULE);\
	do\
		cd $$dir \
		&& make all DEBUG:=$(DEBUG) \
		DIR_BUILD:=$(addprefix $(DIR_PROJECT)/,$(DIR_BUILD))\
		DIR_COMMON_INC:=$(addprefix $(DIR_PROJECT)/,$(DIR_COMMON_INC))\
		MODULE_CFG:=$(addprefix $(DIR_PROJECT)/,$(MODULE_CFG))\
		MODULE_CMD:=$(addprefix $(DIR_PROJECT)/,$(MODULE_CMD))\
		MODULE_RULE:=$(addprefix $(DIR_PROJECT)/,$(MODULE_RULE))\
		&& cd ..;\
	done
	
	@echo "compile OK"
	
$(DIR_BUILD_SUB) $(DIR_BUILD) : 
	$(MKDIR) $@
	
link $(APP) :  $(MODULE_LIB)
	$(CC) $(LFLAGS) -o $(APP) -Xlinker "-(" $^ -Xlinker "-)" 
	
clean : 
	$(RM) $(DIR_BUILD) $(APP)
	
rebuild : clean all