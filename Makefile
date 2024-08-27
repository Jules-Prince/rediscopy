# 'make' builds both server and client executables
# 'make clean' removes all executables and the output directory
# 'make run_server' runs the server
# 'make run_client' runs the client

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS := -Wall -Wextra -O2 -g

# Source files
SERVER_SRC := src/server.cpp
CLIENT_SRC := src/client.cpp
IO_UTILS_SRC := src/io_utils.cpp

# Output directory
OUTPUT_DIR := output

# Executables
SERVER := $(OUTPUT_DIR)/server
CLIENT := $(OUTPUT_DIR)/client

# Object files
SERVER_OBJ := $(OUTPUT_DIR)/server.o
CLIENT_OBJ := $(OUTPUT_DIR)/client.o
IO_UTILS_OBJ := $(OUTPUT_DIR)/io_utils.o

# Default target
all: $(OUTPUT_DIR) $(SERVER) $(CLIENT)

# Create output directory
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Build server
$(SERVER): $(SERVER_OBJ) $(IO_UTILS_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Build client
$(CLIENT): $(CLIENT_OBJ) $(IO_UTILS_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Compile server.cpp
$(SERVER_OBJ): $(SERVER_SRC)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile client.cpp
$(CLIENT_OBJ): $(CLIENT_SRC)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile io_utils.cpp
$(IO_UTILS_OBJ): $(IO_UTILS_SRC)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up
.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)

# Run server
.PHONY: run_server
run_server: $(SERVER)
	$(SERVER)

# Run client
.PHONY: run_client
run_client: $(CLIENT)
	$(CLIENT)