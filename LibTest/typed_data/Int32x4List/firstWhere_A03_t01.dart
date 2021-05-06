// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * ...
 * If no element satisfies test, the result of invoking the orElse function is
 * returned.
 * @description Checks that if no element satisfies test, the result of invoking
 * the orElse function is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

equal(o1, o2) => o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;

main() {
  Int32x4 test() => i32x4(0);
  var list = [i32x4(1), i32x4(2), i32x4(3), i32x4(4), i32x4(5), i32x4(6)];
  var l = new Int32x4List.fromList(list);

  var res = l.firstWhere((e) => e.x > 6, orElse: test);
  Expect.isTrue(equal(i32x4(0), res));

  res = l.firstWhere((e) => e.y == 10, orElse: test);
  Expect.isTrue(equal(i32x4(0), res));

  res = l.firstWhere((e) => e.z < 0, orElse: test);
  Expect.isTrue(equal(i32x4(0), res));
}
