// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void removeRange(int start, int end)
/// Removes the objects in the range start inclusive to end exclusive.
/// ...
/// An UnsupportedError occurs if the list is fixed-length.
/// @description Checks that an UnsupportedError is thrown as Int32x4List is
/// fixed-length.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  var list = [i32x4(0), i32x4(1), i32x4(2), i32x4(3)];
  var l = new Int32x4List.fromList(list);
  try {
    l.removeRange(6, 8);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(list.length, l.length);

  try {
    l.removeRange(1, 3);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(list.length, l.length);

  l = new Int32x4List(0);
  try {
    l.removeRange(0, 2);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError {}
  Expect.equals(0, l.length);
}
