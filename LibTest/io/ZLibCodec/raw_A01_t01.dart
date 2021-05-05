// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion bool raw
/// When true, deflate generates raw data with no zlib header or trailer, and
/// will not compute an adler32 check value
/// @description Checks that [raw] is set correctly with value true or false.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  ZLibCodec v = new ZLibCodec(raw: true);
  Expect.equals(true, v.raw);
  v = new ZLibCodec(raw: false);
  Expect.equals(false, v.raw);
}
