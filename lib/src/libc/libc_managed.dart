part of libc;

class FILE {
  //
}

class fpos_t {
  //
}

class LibCManaged {
  LibC _libc;

  BinaryTypes _types;

  LibCManaged(this._libc, this._types) {
    if (_libc == null) {
      throw new ArgumentError.notNull("_libc");
    }

    if (_types == null) {
      throw new ArgumentError.notNull("_types");
    }
  }

  void clearerr(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    _libc.clearerr(stream);
  }

  void fclose(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    _libc.fclose(data);
    _unregisterResource(stream);
  }

  FILE fdopen(int filedes, String opentype) {
    _checkNotNull(filedes, "filedes");
    _checkNotNull(opentype, "opentype");
    var result = _libc.fdopen(filedes, opentype);
    return _registerResource(new FILE(), result);
  }

  int feof(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.feof(stream);
  }

  int ferror(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.ferror(data);
  }

  int fflush(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.fflush(data);
  }

  int fgetc(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.fgetc(data);
  }

  int fgetpos(FILE stream, fpos_t position) {
    _checkNotNull(stream, "stream");
    _checkNotNull(position, "position");
    var data1 = _getFileData(stream, "stream");
    var data2 = _allocResourceData(position, "fpos_t*", "Invalid resource 'position'");
    var result = _libc.fgetpos(data1, data2);
    if (result != 0) {
      _unregisterResource(position);
    }

    return result;
  }

  // BinaryData fgets(s, int count, stream) {
  List<int> fgets(List<int> s, int count, FILE stream) {
    _checkNotNull(s, "s");
    _checkNotNull(count, "count");
    _checkNotNull(stream, "stream");
    _checkBufferSize(s, count, "Length of the buffer 's' does not equal 'count'");
    var data = _getFileData(stream, "stream");
    var buffer = _types["int"].array(count).alloc();
    var result = _libc.fgets(buffer, count, data);
    if (result.isNullPtr) {
      return null;
    }

    return _fillBuffer(buffer, s, s.length);
  }

  FILE fopen(String filename, String opentype) {
    _checkNotNull(filename, "filename");
    _checkNotNull(opentype, "opentype");
    var result = _libc.fopen(filename, opentype);
    if (result.isNullPtr) {
      return null;
    }

    return _registerResource(new FILE(), result);
  }

  int fputc(int c, FILE stream) {
    _checkNotNull(c, "c");
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.fputc(c, data);
  }

  int fputs(String s, FILE stream) {
    _checkNotNull(s, "s");
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.fputs(s, data);
  }

  int fread(List<int> data, int size, int count, FILE stream) {
    _checkNotNull(data, "data");
    _checkNotNull(size, "size");
    _checkNotNull(count, "count");
    _checkNotNull(stream, "stream");
    _checkBufferSize(data, size * count, "Length of the buffer 'data' does not equal 'size * count'");
    var data1 = _getFileData(stream, "stream");
    var buffer = _types["int"].array(size * count).alloc();
    var result = _libc.fread(buffer, size, count, data1);
    _fillBuffer(buffer, data, result * size);
    return result;
  }

  FILE freopen(String filename, String opentype, FILE stream) {
    _checkNotNull(filename, "filename");
    _checkNotNull(opentype, "opentype");
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    var result = _libc.freopen(filename, opentype, data);
    if (result.isNullPtr) {
      return null;
    }

    return _registerResource(new FILE(), result);
  }

  int fseek(FILE stream, int offset, int whence) {
    _checkNotNull(stream, "stream");
    _checkNotNull(offset, "offset");
    _checkNotNull(whence, "whence");
    var data = _getFileData(stream, "stream");
    return _libc.fseek(data, offset, whence);
  }

  int fsetpos(FILE stream, fpos_t position) {
    _checkNotNull(stream, "stream");
    _checkNotNull(position, "position");
    var data1 = _getFileData(stream, "stream");
    var data2 = _getFpos_tData(position, "position");
    var result = _libc.fsetpos(data1, data2);
    if (result != 0) {
      _unregisterResource(position);
    }

    return result;
  }

  int ftell(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.ftell(data);
  }

  int fwrite(List<int> data, int size, int count, FILE stream) {
    _checkNotNull(data, "data");
    _checkNotNull(size, "size");
    _checkNotNull(count, "count");
    _checkNotNull(stream, "stream");
    _checkBufferSize(data, size * count, "Length of the buffer 'data' does not equal 'size * count'");
    var data1 = _getFileData(stream, "stream");
    var buffer = _types["int"].array(size * count).alloc();
    var result = _libc.fwrite(data, size, count, data1);
    _fillBuffer(buffer, data, result * size);
    return result;
  }

  int getc(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.getc(data);
  }

  int getchar() {
    return _libc.getchar();
  }

  void perror(String message) {
    _checkNotNull(message, "message");
    _libc.perror(message);
  }

  int putc(int c, FILE stream) {
    _checkNotNull(c, "c");
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.putc(c, data);
  }

  int putchar(int c) {
    _checkNotNull(c, "c");
    return _libc.putchar(c);
  }

  int remove(String filename) {
    _checkNotNull(filename, "filename");
    return _libc.remove(filename);
  }

  int rename(String oldname, String newname) {
    _checkNotNull(oldname, "oldname");
    _checkNotNull(newname, "newname");
    return _libc.rename(oldname, newname);
  }

  void rewind(FILE stream) {
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    _libc.rewind(stream);
  }

  FILE tmpfile() {
    var result = _libc.tmpfile();
    if (result.isNullPtr) {
      return null;
    }

    return _registerResource(new FILE(), result);
  }

  FILE tmpnam(String result) {
    _checkNotNull(result, "result");
    var result1 = _libc.tmpnam(result);
    if (result1.isNullPtr) {
      return null;
    }

    return _registerResource(new FILE(), result1);
  }

  int ungetc(int c, FILE stream) {
    _checkNotNull(c, "c");
    _checkNotNull(stream, "stream");
    var data = _getFileData(stream, "stream");
    return _libc.ungetc(c, data);
  }

  BinaryData _allocResourceData(Object resource, String type, String message) {
    var result = BinaryResources.getData(resource);
    if (result != null) {
      throw new ArgumentError(message);
    }

    return _types[type].alloc();
  }

  void _checkBufferSize(List buffer, int size, String message) {
    if (buffer.length != size) {
      throw new ArgumentError(message);
    }
  }

  void _checkDataType(BinaryType type, BinaryType expected, String message, [bool strong = true]) {
    if (!type.compatible(expected, strong)) {
      throw new ArgumentError(message);
    }
  }

  void _checkFileDataType(BinaryType type) {
    if (!type.compatible(_types["FILE"], true)) {
      throw new ArgumentError("Not a 'FILE' resource: ${type.name}");
    }
  }

  void _checkFpos_tDataType(BinaryType type) {
    if (!type.compatible(_types["fpos_t"], true)) {
      throw new ArgumentError("Not a 'fpos_t' resource: ${type.name}");
    }
  }

  void _checkNotNull(Object value, String name) {
    if (value == null) {
      throw new ArgumentError.notNull(name);
    }
  }

  List _fillBuffer(BinaryData data, List list, int count) {
    var length = list.length > count ? list.length : count;
    for (var i = 0; i < length; i++) {
      list[i] = data.getElementValue(i);
    }

    return list;
  }

  BinaryData _getData(Object resource, String message) {
    var result = BinaryResources.getData(resource);
    if (result == null) {
      throw new ArgumentError(message);
    }

    return result;
  }

  BinaryData _getFileData(Object resource, String name) {
    var data = _getData(resource, "Invalid 'FILE' resource: '$name'");
    _checkFileDataType(data.type);
    return data;
  }

  BinaryData _getFpos_tData(Object resource, String name) {
    var data = _getData(resource, "Invalid 'fpos_t' resource: '$name'");
    _checkFpos_tDataType(data.type);
    return data;
  }

  Object _registerResource(Object resource, BinaryData data) {
    return BinaryResources.registerResource(resource, data);
  }

  void _unregisterResource(Object resource) {
    BinaryResources.unregisterResource(resource);
  }
}
