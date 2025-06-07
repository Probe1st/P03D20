CC = gcc
CFLAGS = -Wall -Wextra -Werror

# dirs
ROOT = .
BUILD_DIR = $(ROOT)/build
SRC_DIR = $(ROOT)/src

# targets
TARGET_GRAPH = $(BUILD_DIR)/graph

# objects
OBJECTS_GRAPH = $(addprefix $(BUILD_DIR)/, \
	graph.o)

# building graph
graph: $(TARGET_GRAPH)

$(TARGET_GRAPH): $(OBJECTS_GRAPH)
	$(CC) $(CFLAGS) -lm $^ -o $@

# general purposes
all: graph

clean:
	find $(BUILD_DIR) -type f --not-name .gitkeep -exec rm -f {} \;

rebuild: clean all

# accessory purposes

# general rules of compilation
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $< -o $@

.PHONY: all clean rebuild graph
