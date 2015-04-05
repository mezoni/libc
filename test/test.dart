import "package:unittest/unittest.dart";
import "package:libc/headers.dart";
import "package:binary_interop/binary_interop.dart";

const Map<String, String> TEST_HEADERS = const <String, String>{"header.h": HEADER_H};

const String HEADER_H = """
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

void main() {
  var t = new BinaryTypes();
  var h = new BinaryTypeHelper(t);
  h.addHeaders(LIBC_HEADERS);
  h.addHeaders(TEST_HEADERS);
  h.declare("header.h");
}
