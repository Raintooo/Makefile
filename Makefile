
TARGET := hello.out
CC := gcc

$(TARGET) : main.o func.o
	$(CC) -o $@ $^
	
	@echo "$(MAKE)"
	@echo "$(MAKECMDGOALS) "
	@echo "$(MAKEFILE_LIST)"

main.o : main.c
	$(CC) -o $@ -c $<

func.o : func.c
	$(CC) -o $@ -c $<


.PHONY : rebuild clean test

rebuild : clean all test

all : $(TARGET)

clean : 
	rm *.o $(TARGET)


#######################
first :
	@echo "first"
	
second :
	@echo "second"
	
third :
	@echo "third"

test:
	@$(MAKE) first
	@$(MAKE) second
	@$(MAKE) third