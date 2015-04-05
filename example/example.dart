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
