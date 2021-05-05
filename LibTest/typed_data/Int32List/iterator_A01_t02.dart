// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Iterator<E> iterator
/// Returns an [Iterator] that allows iterating the elements of this [Iterable].
/// @description Checks that [iterator] is read-only and can't be set.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  dynamic l = new Int32List.fromList([0]);
  try {
    l.iterator = l.iterator;
    Expect.fail("[iterator] should be read-only");
  } on NoSuchMethodError {}
}
