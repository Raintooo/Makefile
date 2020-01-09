
MAKE := make
MKDIR := mkdir
RM := rm -rf
CC := gcc
AR := ar
CP := cp

LFLAGS :=

CFLAGS := -I$(DIR_INC) -I$(DIR_COMMON_INC) -I$(DIR_LIBS_INC)
AFLAGS := rcs

ifeq ($(DEBUG),true)
CFLAGS += -g
endif


