
TARGET := hello.out
OBJS := func.o main.o const.o
CC := gcc

$(TARGET) : $(OBJS)
	$(CC) -o $@ $^
	
	@echo "$(MAKE)"
	@echo "$(MAKECMDGOALS) "
	@echo "$(MAKEFILE_LIST)"

$(OBJS) : %.o : %.c
	$(CC) -o $@ -c $<
	
	
.PHONY : rebuild clean test

rebuild : clean all test

all : $(TARGET)

clean : 
	$(RM) *.o $(TARGET)


#######################

xx := aaabbbccc aaaeeeccc
kk := $(xx:aaa%ccc=yyy%kkk)

override define cmd
	@echo "xxxx"	
	@ls	-l			
endef

test:
#	@$(MAKE) first
#	@$(MAKE) second
#	@$(MAKE) third
	
	@echo "$(hm)"
	$(cmd)
	


	
