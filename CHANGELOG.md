## 0.0.10

- Added type `wint_t` to the header `wchar.h`   

## 0.0.9

- All not a cross-platform constants was removed from the `white list`

## 0.0.8

- Constants generated from the macro defintions (`#define`) only if they included a special `white list` and passed to the generator. Only cross-platform constants will be included in such list 

## 0.0.7

- Generator of the library `libc` now generates the constants (from the `#define`) into class `LibC`

## 0.0.6

- Made adaptations of `stdio.h` for the correct linkage of the library `libc` on Windows

## 0.0.4

- Added generator of the library `libc` 
- Initial version of the library `libc` was generated

## 0.0.3

- Added function prototypes in `stdio.h`

## 0.0.1

- Initial release

