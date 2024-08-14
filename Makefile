# Defining directories structure
MAIN_DIR =./src
INCLUDE_DIR =-I$(MAIN_DIR)/include
SRC_DIR =$(MAIN_DIR)/src
BIN_DIR =./bin

# Defining compilator behaviour
CC = gcc
CFLAGS +=-c -Wall $(INCLUDE_DIR)
LDFLAGS += 

# Looking for .c files
CSOURCE += $(MAIN_DIR)/main.c
CSOURCE += $(wildcard $(SRC_DIR)/*.c)

# List of .o files
COBJECT = $(patsubst %.c, %.o, $(CSOURCE))

#Windows is kinda stupid - for del command to understand path we need "\" instead of "/", and each path needs to be in parenthesis ""
temp = $(patsubst %.o, "%.o", $(COBJECT))
OBJCLEAN = $(subst /,\, $(temp))

# Build name
NAME = test

.PHONY: all
all: $(NAME)
	@echo Build successful
	@echo =======================================

$(COBJECT): %o : %c
%o : %c
	$(CC) $(CFLAGS) -c $(CSOURCE)

.PHONY: $(NAME)
$(NAME): $(COBJECT) | dir_create
	@echo Linking...
	$(CC) $(COBJECT) -o $(BIN_DIR)/$(NAME) $(LDFLAGS)

dir_create:
	mkdir bin

.PHONY: clean
clean:
	@echo $(OBJCLEAN)
	@del /Q /S $(OBJCLEAN)