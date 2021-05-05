// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void sessionTimeout=(int timeout)
/// Sets the timeout, in seconds, for sessions of this HttpServer. The default
/// timeout is 20 minutes.
/// @description Checks that session dies after timeout, set by this setter
/// @author sgrekhov@unipro.ru

import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

test() async {
  HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.sessionTimeout = 1;
  asyncStart();
  server.listen((HttpRequest request) {
    request.response.close();
    String id = request.session.id;
    new Future.delayed(new Duration(seconds: 2), () {
      Expect.notEquals(id, request.session.id);
      server.close();
      asyncEnd();
    });
  });

  asyncStart();
  HttpClient client = new HttpClient();
  client
      .getUrl(Uri.parse(
      "http://${InternetAddress.loopbackIPv4.address}:${server.port}"))
      .then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    Expect.equals(HttpStatus.ok, response.statusCode);
    asyncEnd();
  });
  asyncEnd();
}

main() {
  asyncStart();
  test();
}
