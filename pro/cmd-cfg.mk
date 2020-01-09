
MAKE := make
MKDIR := mkdir
RM := rm -rf
CC := gcc
AR := ar

LFLAGS :=

CFLAGS := -I$(DIR_INC) -I$(DIR_COMMON_INC)
AFLAGS := rcs

ifeq ($(DEBUG),true)
CFLAGS += -g
endif


