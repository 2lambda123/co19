// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion List<int> encode(String input)
/// @description Checks that system encoding encodes to UTF-8 on Linux and Mac
/// @author a.semenov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  if (Platform.isLinux || Platform.isMacOS) {
    Expect.listEquals([117, 116, 102, 45, 56], systemEncoding.encode("utf-8"));
    Expect.listEquals(
        [0x44, 0x61, 0x74, 0x65, 0x20, 0x64, 0x65, 0x20,
          0x63, 0x72, 0xc3, 0xa9, 0x61, 0x74, 0x69, 0x6f, 0x6e],
        systemEncoding.encode("Date de création")
    );
  }
  // For windows there is no way to find current code page
}
