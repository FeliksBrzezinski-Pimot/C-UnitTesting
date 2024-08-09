# --------------------------
# -----DIRECTORY PATHS-----
# --------------------------
ROOT_DIR = ../..
# Adding production code paths
SRC_DIR = $(ROOT_DIR)/src
INCLUDE_DIR = $(SRC_DIR)/include

# Adding unity paths
UNITY_DIR = $(ROOT_DIR)/tools/Unity
SRC_UNITY_DIR = $(UNITY_DIR)/src
EXTRA_UNITY_DIR = $(UNITY_DIR)/extras

# Adding test paths
TEST_DIR = .

# --------------------------
# ----  FILES SEARCH  -----
# --------------------------
# Finding all .c files
# In Unity folders
CSOURCE += $(wildcard $(SRC_UNITY_DIR)/*.c)
CSOURCE += $(wildcard $(EXTRA_UNITY_DIR)/memory/src/*.c)
CSOURCE += $(wildcard $(EXTRA_UNITY_DIR)/fixture/src/*.c)

# In production code
CSOURCE += $(wildcard $(SRC_DIR)/src/*.c)

# In test folders
CSOURCE += $(wildcard $(TEST_DIR)/*/*.c)
CSOURCE += $(wildcard $(TEST_DIR)/*.c)


# Finding all directories of .h files
INCLUDE = -I$(INCLUDE_DIR)
INCLUDE += -I$(SRC_UNITY_DIR)
INCLUDE += -I$(EXTRA_UNITY_DIR)/memory/src
INCLUDE += -I$(EXTRA_UNITY_DIR)/fixture/src

# --------------------------
# ----COMPILER SETTINGS-----
# --------------------------
# If gcc is not in %PATH% then change below to absolute path
CC =gcc
CFLAGS =-Wall
CFLAGS += $(INCLUDE)
LDFLAGS += 

# --------------------------
# ----MAKEFILE VARIABLES----
# --------------------------
#Start dependancy
NAME = all_tests

#For building all object files from .c files
COBJECT = $(patsubst %.c, %.o, $(CSOURCE))
temp = $(patsubst %.o, "%.o", $(COBJECT))

#For del command 
OBJCLEAN = $(subst /,\, $(temp))

.PHONY: all
all: $(NAME) 
	@echo ===================================
	@echo          Finished build
	@echo ===================================
	@$(MAKE) clean
	@echo ===================================
	@echo         Finished cleaning
	@echo ===================================
	@echo Build: OK

$(COBJECT): %o : %c
%o: %c 
	@echo ===================================
	@echo Compiling...
	@echo ===================================
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: $(NAME)
$(NAME): $(COBJECT)
	@echo ===================================
	@echo Linking...
	@echo ===================================
	$(CC) $(COBJECT) -o $(NAME) $(LDFLAGS)

.PHONY: clean
clean: 
	@echo $(OBJCLEAN)
	@del /Q /S $(OBJCLEAN)