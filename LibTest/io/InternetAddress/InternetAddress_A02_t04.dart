// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion InternetAddress(String address)
/// If the [address] in address is not a numeric IPv4 (dotted-decimal notation)
/// or IPv6 (hexadecimal representation) address [ArgumentError] is thrown.
/// @description Checks that attempt to create an [InternetAddress] with
/// IPv4 address in hexadecimal format causes an [ArgumentError].
/// @author iarkh@unipro.ru


import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.throws(() { new InternetAddress("0xC0.0x00.0x02.0xEB"); },
      (e) => e is ArgumentError);
}
