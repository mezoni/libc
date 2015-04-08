part of libc.headers;

const Map<String, String> LIBC_HEADERS = const <String, String>{
  "assert.h": _ASSERT_H,
  "complex.h": _COMPLEX_H,
  "ctype.h": _CTYPE_H,
  "errno.h": _ERRNO_H,
  "fenv.h": _FENV_H,
  "float.h": _FLOAT_H,
  "inttypes.h": _INTTYPES_H,
  "iso646.h": _ISO646_H,
  "limits.h": _LIMITS_H,
  "locale.h": _LOCALE_H,
  "math.h": _MATH_H,
  "setjmp.h": _SETJMP_H,
  "signal.h": _SIGNAL_H,
  "stdarg.h": _STDARG_H,
  "stdbool.h": _STDBOOL_H,
  "stddef.h": _STDDEF_H,
  "stdint.h": _STDINT_H,
  "stdlib.h": _STDLIB_H,
  "stdio.h": _STDIO_H,
  "string.h": _STRING_H,
  "tgmath.h": _TGMATH_H,
  "time.h": _TIME_H,
  "wchar.h": _WCHAR_H,
  "wctype.h": _WCTYPE_H
};

const String _ASSERT_H = """
#ifndef _ASSERT_H_
#define _ASSERT_H_

#endif
""";

const String _COMPLEX_H = """
#ifndef _COMPLEX_H_
#define _COMPLEX_H_

#endif
""";

const String _CTYPE_H = """
#ifndef _CTYPE_H_
#define _CTYPE_H_

#endif
""";

const String _ERRNO_H = """
#ifndef _ERRNO_H_
#define _ERRNO_H_

#endif
""";

const String _FENV_H = """
#ifndef _FENV_H_
#define _FENV_H_

#endif
""";

const String _FLOAT_H = """
#ifndef _FLOAT_H_
#define _FLOAT_H_

#endif
""";

const String _INTTYPES_H = """
#ifndef _INTTYPES_H_
#define _INTTYPES_H_

#endif
""";

const String _ISO646_H = """
#ifndef _ISO646_H_
#define _ISO646_H_

#endif
""";

const String _LIMITS_H = """
#ifndef _LIMITS_H_
#define _LIMITS_H_

#define CHAR_BIT __CHAR_BIT
#define CHAR_MIN __CHAR_MIN
#define CHAR_MAX __CHAR_MAX

#define SCHAR_MIN (-(1 << __CHAR_BIT) / 2)
#define SCHAR_MAX ((1 << __CHAR_BIT) / 2 - 1)
#define UCHAR_MAX ((1 << __CHAR_BIT) - 1)

#define SHRT_MIN (-(1 << __SHORT_BIT) / 2)
#define SHRT_MAX ((1 << __SHORT_BIT) / 2 - 1)
#define USHRT_MAX ((1 << __SHORT_BIT) - 1)

#define INT_MIN (-(1 << __INT_BIT) / 2)
#define INT_MAX ((1 << __INT_BIT) / 2 - 1)
#define UINT_MAX ((1 << __INT_BIT) - 1)

#define LONG_MIN (-(1 << __LONG_BIT) / 2)
#define LONG_MAX ((1 << __LONG_BIT) / 2 - 1)
#define ULONG_MAX ((1 << __LONG_BIT) - 1)

#define LLONG_MIN (-(1 << __LLONG_BIT) / 2)
#define LLONG_MAX ((1 << __LLONG_BIT) / 2 - 1)
#define ULLONG_MAX ((1 << __LONG_LONG_BIT) - 1)

#endif
""";

const String _LOCALE_H = """
#ifndef _LOCALE_H_
#define _LOCALE_H_

#endif
""";

const String _MATH_H = """
#ifndef _MATH_H_
#define _MATH_H_

#endif
""";

const String _SETJMP_H = """
#ifndef _SETJMP_H_
#define _SETJMP_H_

#endif
""";

const String _SIGNAL_H = """
#ifndef _SIGNAL_H_
#define _SIGNAL_H_

#endif
""";

const String _STDARG_H = """
#ifndef _STDARG_H_
#define _STDARG_H_

typedef void * va_list;

#endif
""";

const String _STDBOOL_H = """
#ifndef _STDBOOL_H_
#define _STDBOOL_H_

#define bool _Bool
#define true 1
#define false 0
#define __bool_true_false_are_defined 1

#endif
""";

const String _STDDEF_H = """
#ifndef _STDDEF_H_
#define _STDDEF_H_

typedef __INTPTR_TYPE ptrdiff_t;
typedef __UINTPTR_TYPE size_t;

#if __OS != windows
typedef __INTPTR_TYPE ssize_t;
#endif

#if __OS == windows
typedef __UINT16_TYPE wchar_t;
#else
typedef __UINT32_TYPE wchar_t;
#endif

#endif
""";

const String _STDINT_H = """
#ifndef _STDINT_H_
#define _STDINT_H_

#include <limits.h>

typedef __INT8_TYPE int8_t;
typedef __INT16_TYPE int16_t;
typedef __INT32_TYPE int32_t;
typedef __INT64_TYPE int64_t;
typedef __UINT8_TYPE uint8_t;
typedef __UINT16_TYPE uint16_t;
typedef __UINT32_TYPE uint32_t;
typedef __UINT64_TYPE uint64_t;

typedef int8_t int_least8_t;
typedef int16_t int_least16_t;
typedef int32_t int_least32_t;
typedef int64_t int_least64_t;
typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;
typedef uint32_t uint_least32_t;
typedef uint64_t uint_least64_t;

typedef int8_t int_fast8_t;
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef int64_t int_fast64_t;
typedef uint8_t uint_fast8_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
typedef uint64_t uint_fast64_t;

typedef __INTPTR_TYPE intptr_t;
typedef __UINTPTR_TYPE uintptr_t;

typedef __INT64_TYPE intmax_t;
typedef __UINT64_TYPE uintmax_t;

#define INT8_MIN -128
#define INT16_MIN −32768
#define INT32_MIN −2147483648
#define INT64_MIN −9223372036854775808

#define INT8_MAX 127
#define INT16_MAX 32767
#define INT32_MAX 2147483647
#define INT64_MAX 9223372036854775807

#define UINT8_MAX 255
#define UINT16_MAX 65535
#define UINT32_MAX 4294967295
#define UINT64_MAX 18446744073709551615

#define INT_LEAST8_MIN INT8_MIN
#define INT_LEAST16_MIN INT16_MIN
#define INT_LEAST32_MIN INT32_MIN
#define INT_LEAST64_MIN INT64_MIN

#define INT_LEAST8_MAX INT8_MAX
#define INT_LEAST16_MAX INT16_MAX
#define INT_LEAST32_MAX INT32_MAX
#define INT_LEAST64_MAX INT64_MAX

#define UINT_LEAST8_MAX UINT8_MAX
#define UINT_LEAST16_MAX UINT16_MAX
#define UINT_LEAST32_MAX UINT32_MAX
#define UINT_LEAST64_MAX UINT64_MAX

#define INT_FAST8_MIN INT8_MIN
#define INT_FAST16_MIN INT16_MIN
#define INT_FAST32_MIN INT32_MIN
#define INT_FAST64_MIN INT64_MIN

#define INT_FAST8_MAX INT8_MAX
#define INT_FAST16_MAX INT16_MAX
#define INT_FAST32_MAX INT32_MAX
#define INT_FAST64_MAX INT64_MAX

#define UINT_FAST8_MAX UINT8_MAX
#define UINT_FAST16_MAX UINT16_MAX
#define UINT_FAST32_MAX UINT32_MAX
#define UINT_FAST64_MAX UINT64_MAX

#define INTPTR_MIN (-(1 << __PTR_BIT) / 2)
#define INTPTR_MAX ((1 << __PTR_BIT) / 2 - 1)
#define UINTPTR_MAX ((1 << __PTR_BIT) - 1)

#define PTRDIFF_MIN INTPTR_MIN 
#define PTRDIFF_MAX INTPTR_MAX

#define SIZE_MAX UINTPTR_MAX

#define WCHAR_MIN 0
#define WCHAR_MAX UINT16_MAX

#define WINT_MIN 0
#define WINT_MAX UINT16_MAX

#endif
""";

const String _STDIO_H = """
#ifndef _STDIO_H_
#define _STDIO_H_

#include <stdarg.h>
#include <stddef.h>

typedef struct _STDIO_H_FILE FILE;
typedef struct _STDIO_H_fpos_t fpos_t;

void clearerr (FILE *stream);
int fclose (FILE *stream);
FILE * fdopen (int filedes, const char *opentype);
int feof (FILE *stream);
int ferror (FILE *stream);
int fflush (FILE *stream);
int fgetc (FILE *stream);
char * fgets (char *s, int count, FILE *stream);
int fgetpos (FILE *stream, fpos_t *position);
FILE * fopen (const char *filename, const char *opentype);
int fprintf (FILE *stream, const char *template, ...);
int fputc (int c, FILE *stream);
int fputs (const char *s, FILE *stream);
size_t fread (void *data, size_t size, size_t count, FILE *stream);
FILE * freopen (const char *filename, const char *opentype, FILE *stream);
int fscanf (FILE *stream, const char *template, ...);
int fseek (FILE *stream, long int offset, int whence);
int fsetpos (FILE *stream, const fpos_t *position);
long int ftell (FILE *stream);
size_t fwrite (const void *data, size_t size, size_t count, FILE *stream);
int getc (FILE *stream);
int getchar (void);
char * gets (char *s);
void perror (const char *message);
int printf (const char *template, ...);
int putc (int c, FILE *stream);
int putchar (int c);
int puts (const char *s);
int remove (const char *filename);
int rename (const char *oldname, const char *newname);
void rewind (FILE *stream);
int scanf (const char *template, ...);
void setbuf (FILE *stream, char *buf);
int setvbuf (FILE *stream, char *buf, int mode, size_t size);
int snprintf (char *s, size_t size, const char *template, ...);
int sprintf (char *s, const char *template, ...);
int sscanf (const char *s, const char *template, ...);
FILE * tmpfile (void);
char * tmpnam (char *result);
int ungetc (int c, FILE *stream);
int vfprintf (FILE *stream, const char *template, va_list ap);
int vprintf (const char *template, va_list ap);
// int vsnprintf (char *s, size_t size, const char *template, va_list ap);
int vsprintf (char *s, const char *template, va_list ap);

#if __OS != windows
int vfscanf (FILE *stream, const char *template, va_list ap);
int vscanf (const char *template, va_list ap);
int vsscanf (const char *s, const char *template, va_list ap);
#endif

#if __OS == windows
FILE * fdopen (int filedes, const char *opentype) __attribute__((alias(_fdopen)));
int snprintf (char *s, size_t size, const char *template, ...) __attribute__((alias(_snprintf)));
#endif

#endif
""";

// TODO: define SIG_ATOMIC_MIN
// TODO: define SIG_ATOMIC_MAX
const String _STDLIB_H = """
#ifndef _STDLIB_H_
#define _STDLIB_H_

#endif
""";

const String _STRING_H = """
#ifndef _STRING_H_
#define _STRING_H_

#endif
""";

const String _TGMATH_H = """
#ifndef _TGMATH_H_
#define _TGMATH_H_

#endif
""";

const String _TIME_H = """
#ifndef _TIME_H_
#define _TIME_H_

#endif
""";

const String _WCHAR_H = """
#ifndef _WCHAR_H_
#define _WCHAR_H_

#include <stddef.h>

typedef wchar_t wint_t;
// mbstate_t
// wctype_t

#endif
""";

const String _WCTYPE_H = """
#ifndef _WCTYPE_H_
#define _WCTYPE_H_

#endif
""";
