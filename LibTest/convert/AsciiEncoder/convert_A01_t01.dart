// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion List<int> convert(
///  String string, [
///  int start = 0,
///  int end
///  ])
/// Converts the String into a list of its code units.
/// ...
/// @description Checks that this method Converts the String into a list of its
/// code units.
/// @author sgrekhov@unipro.ru

import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  AsciiEncoder encoder = new AsciiEncoder();
  for (int i = 0; i < 128; i++) {
    String s = new String.fromCharCode(i);
    Expect.listEquals([i], encoder.convert(s));
  }
  Expect.listEquals([], encoder.convert(""));
}
