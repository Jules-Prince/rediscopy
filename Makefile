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

# Output directory
OUTPUT_DIR := output

# Executables
SERVER := $(OUTPUT_DIR)/server
CLIENT := $(OUTPUT_DIR)/client

# Default target
all: $(OUTPUT_DIR) $(SERVER) $(CLIENT)

# Create output directory
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Build server
$(SERVER): $(SERVER_SRC)
	$(CXX) $(CXXFLAGS) $(SERVER_SRC) -o $(SERVER)

# Build client
$(CLIENT): $(CLIENT_SRC)
	$(CXX) $(CXXFLAGS) $(CLIENT_SRC) -o $(CLIENT)

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