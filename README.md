# nonce

[![pub package](https://img.shields.io/pub/v/nonce.svg)](https://pub.dartlang.org/packages/nonce)

A utility class with a single method to generate alphanumeric nonces.

# Usage

```dart
import 'package:nonce/nonce.dart';
```

nonce contains a single utility class, [Nonce], with one method: `String generate([int length = 32])`.

`generate()` has an optional parameter, [length], to specify the length of the generated string.

```dart
print(Nonce.generate()); // Osp54up7WU6P3U97Jz92p9j892n9LP7z

print(Nonce.generate(64)); // LDwpr1H74qm894jbd15Lj63wF5RUL07r4L9XOY7zVMz7fLbBCXa68Y6oPw0N9XgV
```

`generate()` does not rely on Base64 encoding, instead it generates ASCII character codes directly.
