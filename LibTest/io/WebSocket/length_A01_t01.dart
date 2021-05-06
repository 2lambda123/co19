// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion Future<int> length
 * Counts the elements in the stream.
 * @description Checks that the [length] returns the Future<int>.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  HttpServer.bind("127.0.0.1", 0).then((server) {
    server.listen((request) {
      WebSocketTransformer
          .upgrade(request)
          .then((websocket) {
        Expect.isTrue(websocket.length is Future<int>);
        websocket.close();
      });
    });

    var webs = WebSocket.connect("ws://127.0.0.1:${server.port}/");
    webs.then((client) {
      bool called = false;
      client.length.then((value) {
        Expect.equals(0, value);
        called = true;
      });
      client.close().then((_) async {
        await server.close();
        Expect.isTrue(called);
      });
    });
  });
}
