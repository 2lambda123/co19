// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion bool isNotEmpty
/// Returns true if there is at least one element in this collection.
/// @description Checks that isNotEmpty is read-only and cannot be set.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Int32x4List(0);
  try {
    l.isNotEmpty = false;
    Expect.fail("isNotEmpty should be read-only");
  } on NoSuchMethodError {}
}
