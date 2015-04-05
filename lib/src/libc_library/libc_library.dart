part of libc.libc_library;

LibC loadLibC(BinaryTypes types) {
  if (types == null) {
    throw new ArgumentError.notNull("types");
  }

  var operatingSystem = Platform.operatingSystem;
  String filename;
  switch (operatingSystem) {
    case "android":
    case "linux":
      filename = "libc.so.6";
      break;
    case "macos":
      filename = "libSystem.dylib";
      break;
    case "windows":
      filename = "msvcr100.dll";
      break;
    default:
      throw new StateError("Unsupported operating system: $operatingSystem");
  }

  var library = DynamicLibrary.load(filename, types: types);
  if (library == null) {
    throw new StateError("Unable to load library: $filename");
  }

  return new LibC(library);
}
