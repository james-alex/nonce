import 'dart:math';

/// A utility class with a single method to
/// generate random alphanumeric strings.
class Nonce {
  const Nonce._();

  /// Generates a random alphanumeric string, [length] characters long.
  static String generate([int length = 32]) {
    assert(length != null && length > 0);

    final random = Random();

    final charCodes = List<int>.generate(length, (_) {
      int codeUnit;

      switch (random.nextInt(3)) {
        case 0:
          codeUnit = random.nextInt(10) + 48;
          break;
        case 1:
          codeUnit = random.nextInt(26) + 65;
          break;
        case 2:
          codeUnit = random.nextInt(26) + 97;
          break;
      }

      return codeUnit;
    });

    return String.fromCharCodes(charCodes);
  }
}
