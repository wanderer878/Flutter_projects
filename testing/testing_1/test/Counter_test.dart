import 'package:flutter_test/flutter_test.dart';
import 'package:testing_1/Counter.dart';

void main() {
  group("Counter", () {
    test('increment test for counter', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test("decrement test for counter", () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
    test("initial value", () {
      expect(Counter().value, 0);
    });
  });
}
