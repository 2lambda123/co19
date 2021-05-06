// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * @description Checks that [isEmpty] is read-only and can't be set.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Float32x4List(0);
  Expect.throws(() { l.isNotEmpty = false; }, (e) => e is NoSuchMethodError);
}
