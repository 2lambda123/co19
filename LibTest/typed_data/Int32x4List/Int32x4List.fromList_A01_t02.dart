// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Int32x4List.fromList(List<Int32x4> elements)
/// Creates a Int32x4List with the same length as the elements list and copies
/// over the elements.
/// @description Checks that a new instance of Int32x4List contains the same
/// elements as elements list.
/// @author ngl@unipro.ru

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) => o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;

void check(List<Int32x4> list) {
  var l = new Int32x4List.fromList(list);
  Expect.isTrue(l is Int32x4List);
  Expect.runtimeIsType<Int32x4List>(l);
  Expect.equals(l.length, list.length);
  for (int i = 0; i < l.length; ++i) {
    Expect.isTrue(equal(list[i], l[i]));
  }
}

main() {
  check([]);
  check([i32x4(1)]);
  check([
    i32x4(0), i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6),
    i32x4(7),i32x4(8), i32x4(9)
  ]);
}
