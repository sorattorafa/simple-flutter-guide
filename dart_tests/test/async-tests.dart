import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('Future.value() returns the value', () async {
    var value = await Future.value(10);
    expect(value, equals(10));
  });
  test('Future.value() returns the value', () {
    expect(Future.value(10), completion(equals(10)));
  });

  test('Future.error() throws the error', () {
    expect(Future.error('oh no'), throwsA(equals('oh no')));
    expect(Future.error(StateError('bad state')), throwsStateError);
  });

  test('Stream.fromIterable() emits the values in the iterable', () {
    var stream = Stream.fromIterable([1, 2, 3]);

    stream.listen(expectAsync1((number) {
      expect(number, inInclusiveRange(1, 3));
    }, count: 3));
  
  });

    test('process emits status messages', () {
    // Dummy data to mimic something that might be emitted by a process.
    var stdoutLines = Stream.fromIterable([
      'Ready.',
      'Loading took 150ms.',
      'Succeeded!'
    ]);

    expect(stdoutLines, emitsInOrder([
      // Values match individual events.
      'Ready.',

      // Matchers also run against individual events.
      startsWith('Loading took'),

      // Stream matchers can be nested. This asserts that one of two events are
      // emitted after the "Loading took" line.
      emitsAnyOf(['Succeeded!', 'Failed!']),

      // By default, more events are allowed after the matcher finishes
      // matching. This asserts instead that the stream emits a done event and
      // nothing else.
      emitsDone
    ]));
  });
}
