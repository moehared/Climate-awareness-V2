
import 'package:app/dummy_test.dart/dummy_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}
