import "dart:convert";
import "dart:io";

import "package:binary_generator/library_generator/library_generator.dart";
import "package:libc/headers.dart";

void main() {
  const String header = "libc/tool/generate.h";
  const String name = "LibC";
  var headers = <String, String>{header: _HEADER_H};
  headers.addAll(LIBC_HEADERS);
  var constants = new LineSplitter().convert(_CONSTANTS);
  var directives = <String>["part of libc.libc_library"];
  //_addImport("package:binary_interop/binary_interop.dart", directives);
  var links = LIBC_HEADERS.keys.toList();
  var options = new LibraryGeneratorOptions(
      constants: constants, directives: directives, header: header, headers: headers, links: links, name: name);
  var generator = new LibraryGenerator();
  var lines = generator.generate(options);
  var path = "lib/src/libc_library/libc_binary.dart";
  var file = new File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(lines.join("\n"));
}

const String _CONSTANTS = """
CHAR_BIT
CHAR_MAX
CHAR_MIN
INT16_MAX
INT32_MAX
INT64_MAX
INT8_MAX
INTPTR_MAX
INTPTR_MIN
INT_FAST16_MAX
INT_FAST16_MIN
INT_FAST32_MAX
INT_FAST32_MIN
INT_FAST64_MAX
INT_FAST64_MIN
INT_FAST8_MAX
INT_FAST8_MIN
INT_LEAST16_MAX
INT_LEAST16_MIN
INT_LEAST32_MAX
INT_LEAST32_MIN
INT_LEAST64_MAX
INT_LEAST64_MIN
INT_LEAST8_MAX
INT_LEAST8_MIN
INT_MAX
INT_MIN
LLONG_MAX
LLONG_MIN
LONG_MAX
LONG_MIN
PTRDIFF_MAX
PTRDIFF_MIN
SCHAR_MAX
SCHAR_MIN
SHRT_MAX
SHRT_MIN
SIZE_MAX
UCHAR_MAX
UINT16_MAX
UINT32_MAX
UINT64_MAX
UINT8_MAX
UINTPTR_MAX
UINT_FAST16_MAX
UINT_FAST32_MAX
UINT_FAST64_MAX
UINT_FAST8_MAX
UINT_LEAST16_MAX
UINT_LEAST32_MAX
UINT_LEAST64_MAX
UINT_LEAST8_MAX
UINT_MAX
ULLONG_MAX
ULONG_MAX
USHRT_MAX
WCHAR_MAX
WCHAR_MIN
WINT_MAX
WINT_MIN""";

const String _HEADER_H = """
#include <assert.h>
#include <complex.h>
#include <ctype.h>
#include <errno.h>
#include <fenv.h>
#include <float.h>
#include <inttypes.h>
#include <iso646.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <tgmath.h>
#include <time.h>
#include <wchar.h>
#include <wctype.h>
""";

void _addImport(String url, List directives) {
  directives.add("import \"$url\"");
}
