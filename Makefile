
CC := gcc
MKDIR := mkdir
RM := rm -rf

DIR_TARGET := targets
DIR_OBJS := objs
DIRS := $(DIR_TARGET) $(DIR_OBJS)

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

OBJS := $(addprefix $(DIR_OBJS)/, $(OBJS))
TARGET := $(DIR_TARGET)/hello.out

$(TARGET) : $(DIRS) $(OBJS)
	$(CC) -o $@ $(OBJS)
	
$(DIR_OBJS)/%.o : %.c
    ifeq ($(DEBUG),true)
		$(CC) -o $@ -c -g $^
		@echo "debug version"
    else
		$(CC) -o $@ -c $^
		@echo "release version"
    endif
		
$(DIRS) : 
	$(MKDIR) $@
	
.PHONY : clean rebuild all

rebuild : clean all

all : $(TARGET)

clean : 
	$(RM) $(DIRS)
