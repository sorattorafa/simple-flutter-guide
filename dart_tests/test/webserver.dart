// ## test/web_socket_server.dart

// The library loaded by spawnHybridUri() can import any packages that your
// package depends on, including those that only work on the VM.
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:stream_channel/stream_channel.dart';

// Once the hybrid isolate starts, it will call the special function
// hybridMain() with a StreamChannel that's connected to the channel
// returned spawnHybridCode().
hybridMain(StreamChannel channel) async {
  // Start a WebSocket server that just sends "hello!" to its clients.
  var server = await io.serve(webSocketHandler((webSocket) {
    webSocket.sink.add('hello!');
  }), 'localhost', 0);

  // Send the port number of the WebSocket server to the browser test, so
  // it knows what to connect to.
  channel.sink.add(server.port);
}


// ## test/web_socket_test.dart

@TestOn('browser')

import 'dart:html';

import 'package:test/test.dart';

void main() {
  test('connects to a server-side WebSocket', () async {
    // Each spawnHybrid function returns a StreamChannel that communicates with
    // the hybrid isolate. You can close this channel to kill the isolate.
    var channel = spawnHybridUri('web_socket_server.dart');

    // Get the port for the WebSocket server from the hybrid isolate.
    var port = await channel.stream.first;

    var socket = WebSocket('ws://localhost:$port');
    var message = await socket.onMessage.first;
    expect(message.data, equals('hello!'));
  });
}