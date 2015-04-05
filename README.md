libc
=====

The C standard library wrapper (currently only header files) for the "binary interop" and "binary types".

Version: 0.0.4

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
import "package:binary_interop/binary_interop.dart";
import "package:libc/headers.dart";

void main() {
  var header = HEADERS.keys.first;
  var types = new BinaryTypes();
  var helper = new BinaryTypeHelper(types);
  helper.addHeaders(LIBC_HEADERS);
  helper.addHeaders(HEADERS);
  // "libc/example/header.h"
  helper.declare(header);
  var prototypes = helper.prototypes;
  for (var name in prototypes.keys) {
    var prototype = prototypes[name];
    if (prototype.filename == header) {
      print(prototype.type.name);
    }
  }
}

const Map<String, String> HEADERS = const <String, String>{"libc/example/header.h": _HEADER_H};

const String _HEADER_H = """
#include <stdio.h>

FILE * myfunc(const char * name);
""";

```

Output:

```
FILE * myfunc(char *)
```