import 'dart:async';

import 'package:async/async.dart';
import 'package:test/test.dart';

void main() {
  test('process emits a WebSocket URL', () async {
    // Wrap the Stream in a StreamQueue so that we can request events.
    var stdout = StreamQueue(Stream.fromIterable([
      'WebSocket URL:',
      'ws://localhost:1234/',
      'Waiting for connection...'
    ]));

    // Ignore lines from the process until it's about to emit the URL.
    await expectLater(stdout, emitsThrough('WebSocket URL:'));

    // Parse the next line as a URL.
    var url = Uri.parse(await stdout.next);
    expect(url.host, equals('localhost'));

    // You can match against the same StreamQueue multiple times.
    await expectLater(stdout, emits('Waiting for connection...'));
  });
}