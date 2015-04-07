libc
=====

The C standard library wrapper (currently only header files) for the "binary interop" and "binary types".

Version: 0.0.9

### Warning

The `libc` library works directly with the binary data of the operating system!

### Purpose

Intended to simplify the use of the following software:

- [Binary interop](https://pub.dartlang.org/packages/binary_interop)
- [Binary types](https://pub.dartlang.org/packages/binary_types) 

Currently contains mostly empty headers. Types will be added as needed.  
Function prototypes will be added in the near future.  
Macro definitions possibly will be added in the future.

### Header files

- assert.h
- complex.h
- ctype.h
- errno.h
- fenv.h
- float.h
- inttypes.h
- iso646.h
- limits.h
- locale.h
- math.h
- setjmp.h
- signal.h
- stdarg.h
- stdbool.h
- stddef.h
- stdint.h
- stdio.h
- stdlib.h
- string.h
- tgmath.h
- time.h
- wchar.h
- wctype.h

### Example:

```dart
import "package:libc/headers.dart";
import "package:libc/libc.dart";
import "package:binary_interop/binary_interop.dart";

void main() {
  var types = new BinaryTypes();
  var helper = new BinaryTypeHelper(types);
  helper.addHeaders(LIBC_HEADERS);
  var libc = loadLibC(types);
  libc.printf("Hello, library '%s'!\n", ["libc"]);
}

```
