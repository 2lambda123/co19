// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void checkValidIndex(int index, indexable, [String name,
/// int length, String message])
/// ...
/// If length is provided, it is used as the length of the indexable object,
/// otherwise the length is found as indexable.length.
/// @description Checks that if length is provided, it is used as the length of
/// the indexable object
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

check(int index, indexable, String name, int length) {
  try {
    RangeError.checkValidIndex(index, indexable, name, length);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(index, e.invalidValue);
    if (name == null) {
      Expect.equals("index", e.name);
    } else {
      Expect.equals(name, e.name);
    }
    Expect.equals("Index out of range", e.message);
    Expect.equals(0, e.start);
    if (length == null) {
      Expect.equals(indexable.length - 1, e.end);
    } else {
      Expect.equals(length - 1, e.end);
    }
  }
}

main() {
  RangeError.checkValidIndex(0, [1, 2, 3], "name1", 10);
  RangeError.checkValidIndex(6, [1, 2, 3], "name2", 10);
  RangeError.checkValidIndex(7, [1, 2, 3], "name3", 10);
  RangeError.checkValidIndex(8, [1, 2, 3], null, 10);

  check(-1, [1, 2, 3], "name4", 10);
  check(10, [1, 2, 3], "name5", 10);
  check(11, [1, 2, 3], null, 10);
}
