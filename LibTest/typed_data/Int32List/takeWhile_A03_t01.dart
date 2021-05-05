// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Iterable<E> takeWhile(bool test(E value))
/// ...
/// Every new iterator of the returned iterable starts iterating over the
/// elements of [this].
/// @description Checks that every new iterator of the returned [Iterable]
/// iterates over elements of [this].
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var count = 0;
  bool test(int e) {
    ++count;
    return e < 3;
  }

  var list = new Int32List.fromList([1, 2, 3, 4, 5]);
  var res = list.takeWhile(test);
  Expect.equals(0, count);
  res.elementAt(0);
  Expect.equals(1, count);

  res.elementAt(0);
  Expect.equals(2, count);

  var it = res.iterator;
  it.moveNext();
  Expect.equals(3, count);

  it.moveNext();
  Expect.equals(4, count);
}
