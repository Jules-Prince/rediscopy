#ifndef IO_UTILS_H
#define IO_UTILS_H

#include <cstdint>
#include <cstddef>

int32_t read_full(int fd, char *buf, size_t n);
int32_t write_all(int fd, const char *buf, size_t n);

#endif // IO_UTILS_H