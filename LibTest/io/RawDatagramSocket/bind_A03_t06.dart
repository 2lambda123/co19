// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Future<RawDatagramSocket> bind(
///   dynamic host,
///   int port,
///   {bool reuseAddress = true,
///   bool reusePort = false,
///   int ttl = 1}
/// )
/// Binds a socket to the given host and port.
/// ...
/// The `reusePort` specifies whether the port can be reused
///
/// @description Checks that if `reusePort` is set to `false` and `reuseAddress`
/// is `false` as well then two sockets cannot share the same address and port
/// @author sgrekhov22@gmail.com
/// @issue 49600

import "dart:io";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket socket1 =
      await RawDatagramSocket.bind(localhost, 0, reusePort: false);
  asyncStart();
  RawDatagramSocket.bind(localhost, socket1.port,
          reuseAddress: false, reusePort: true).then((_) {
    Expect.fail("SocketException expected");
  }, onError: (e) {
    Expect.isTrue(e is SocketException);
    asyncEnd();
  });
}
