.section .data
values:
  .byte 12
  .byte 97
  .byte 133
  .byte 82
  .byte 236

.section .text
.globl _start
_start:
  mov $0, %eax    # set sum to 0
  mov $0, %ebx    # set counter to 0
  mov $values, %ecx   # set pointer to start of data section
  mov $5, %edx    # set loop counter to 5 (number of values in data section)

loop:
  addb (%ecx), %al   # add current value to sum
  inc %ecx      # increment pointer to next value
  inc %ebx      # increment counter
  loop loop     # repeat until loop counter reaches 0

  divb %bl      # divide sum by counter to compute average
  mov %al, result   # store result in memory location

  # exit program
  mov $1, %eax
  xor %ebx, %ebx
  int $0x80

.section .bss
result:
  .byte 0   # reserve space for result
