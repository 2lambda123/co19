// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void setAll(int index, Iterable<E> iterable)
/// ...
/// The index must be non-negative and no greater than length.
/// @description Checks that an error is thrown if [index] is out of bounds.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float32List.fromList(list);
  Expect.throws(() {
    l.setAll(-1, []);
  });                                                                   

  Expect.throws(() {
    l.setAll(list.length + 1, []);
  });

  Expect.throws(() {
    l.setAll(0x80000000, []);
  });

  Expect.throws(() {
    l.setAll(0x7fffffff, []);
  });
}

main() {
  check([]);
  check([1.0]);
  check([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
}

