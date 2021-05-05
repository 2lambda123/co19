// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion List<E> toList({bool growable: true})
/// ...
/// The list is fixed-length if [growable] is false.
/// @description Checks that the returned list is fixed-length if [growable] is
/// false.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  Uint8ClampedList list = new Uint8ClampedList.fromList([0]);
  dynamic resList = list.toList(growable: false);

  try {
    resList.length = 10;
    Expect.fail("List should be fixed-length");
  } on UnsupportedError {}
  Expect.equals(1, resList.length);
}
