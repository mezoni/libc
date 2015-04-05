import "package:libc/headers.dart";
import "package:libc/libc_library.dart";
import "package:binary_interop/binary_interop.dart";

void main() {
  var types = new BinaryTypes();
  var helper = new BinaryTypeHelper(types);
  helper.addHeaders(LIBC_HEADERS);
  var libc = loadLibC(types);
  libc.printf("Hello, %s\n", ["libc"]);
}
