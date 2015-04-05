import "dart:io";
import "package:binary_generator/library_generator/library_generator.dart";
import "package:libc/headers.dart";

void main() {
  const String header = "libc/tool/generate.h";
  const String name = "LibC";
  var headers = <String, String>{header: _HEADER_H};
  headers.addAll(LIBC_HEADERS);
  var directives = <String>["part of libc.libc_library"];
  //_addImport("package:binary_interop/binary_interop.dart", directives);
  var links = LIBC_HEADERS.keys.toList();  
  var options = new LibraryGeneratorOptions(
      directives: directives, header: header, headers: headers, links: links, name: name);
  var generator = new LibraryGenerator();
  var lines = generator.generate(options);
  var path = "lib/src/libc_library/libc_binary.dart";
  var file = new File(path);
  file.createSync(recursive: true);
  file.writeAsStringSync(lines.join("\n"));
}

void _addImport(String url, List directives) {
  directives.add("import \"$url\"");
}

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
