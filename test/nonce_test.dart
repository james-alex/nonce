import 'package:test/test.dart';
import 'package:nonce/nonce.dart';

void main() {
  test('Check for Continuity', () {
    var length = 0;

    for (var i = 0; i < 1000; i++) {
      if (i % 100 == 0) {
        length += 32;
      }

      final nonce = Nonce(length);

      expect(nonce.length, equals(length));

      expect(
        RegExp('[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
                ']{$length}')
            .hasMatch(nonce.toString()),
        equals(true),
      );
    }
  });
}
