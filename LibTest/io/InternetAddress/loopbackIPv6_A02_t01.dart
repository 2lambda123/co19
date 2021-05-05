// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion static InternetAddress LOOPBACK_IP_V4
/// read-only
/// @description Checks that [LOOPBACK_IP_V6] is read-only
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("192.168.16.23");;
  Expect.throws(() {
    address.LOOPBACK_IP_V6  = new InternetAddress("::11");
  }, (e) => e is NoSuchMethodError);
}
