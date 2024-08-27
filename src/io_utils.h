// io_utils.h

#ifndef IO_UTILS_H
#define IO_UTILS_H

#include <stdint.h>
#include <stdlib.h>

// Function to read `n` bytes from a file descriptor
int32_t read_full(int fd, char *buf, size_t n);

// Function to write `n` bytes to a file descriptor
int32_t write_all(int fd, const char *buf, size_t n);

// Function to handle fatal errors by printing an error message and terminating the program
void die(const char *msg);

#endif // IO_UTILS_H
