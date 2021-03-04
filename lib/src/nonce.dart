import 'dart:math';

/// A utility class with a single method to
/// generate random alphanumeric strings.
class Nonce {
  const Nonce._(this._value);

  /// Creates a [Nonce] containing a random alphanumeric
  /// string [length] characters long.
  factory Nonce([int length = 32]) {
    assert(length > 0);
    return Nonce._(generate(length: length));
  }

  /// Constructs a [Nonce] that's unique from every other [Nonce]
  /// that's been generated by this global instance.
  factory Nonce.unique([int length = 32]) {
    assert(length > 0);
    var value = generate(length: length);
    while (_uniqueNonces.contains(value)) {
      value = generate(length: length);
    }
    _uniqueNonces.add(value);
    return Nonce._(value);
  }

  /// Constructs a [Nonce] generated with a secure [Random] that's unique from
  /// every other [Nonce] that's been generated by this global instance.
  factory Nonce.secure([int length = 32]) {
    assert(length > 0);
    var value = generate(length: length, secure: true);
    while (_uniqueNonces.contains(value)) {
      value = generate(length: length, secure: true);
    }
    _uniqueNonces.add(value);
    return Nonce._(value);
  }

  /// Constructs a [unique] nonce `16` characters in length.
  factory Nonce.key() => Nonce.unique(16);

  /// The alphanumeric string represented by this nonce.
  final String _value;

  /// Returns the length of this nonce.
  int get length => _value.length;

  /// Generates a random alphanumeric string
  /// [length] characters long.
  static String generate({int length = 32, int? seed, bool secure = false}) {
    assert(length > 0);
    assert(!secure || seed == null, 'Secure [Random]s don\'t accept seeds.');

    final random = secure ? Random.secure() : Random(seed);

    final charCodes = List<int>.generate(length, (_) {
      late int codeUnit;
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

  /// Returns `true` if [other] is a [Nonce] or a [String]
  /// with the same [value] as `this`.
  @override
  bool operator ==(Object other) =>
      (other is Nonce && _value == other._value) ||
      (other is String && _value == other);

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() => _value;

  /// Every nonce that's been generated by the [unique] constructor.
  static final Set<String> _uniqueNonces = <String>{};
}
