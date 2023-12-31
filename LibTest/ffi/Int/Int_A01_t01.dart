// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C int type.
///
/// Typically a signed 32-bit integer. For a guaranteed 32-bit integer, use
/// [Int32] with the C int32_t type. For an unsigned int, use [UnsignedInt].
///
/// The [Int] type is a native type, and should not be constructed in Dart code.
/// It occurs only in native type signatures and as annotation on [Struct] and
/// [Union] fields.
///
/// @description Checks that this type represents C int type.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Int> p1 = calloc<Int>();
  try {
    p1.value = 42;
    Expect.equals(42, p1.value);
    p1.value = -42;
    Expect.equals(-42, p1.value);
    p1.value = 32768;
    Expect.equals(32768, p1.value);
    p1.value = -32768;
    Expect.equals(-32768, p1.value);
    p1.value = 2147483647;
    Expect.equals(2147483647, p1.value);
    p1.value = 2147483648;
    Expect.equals(-2147483648, p1.value);
    p1.value = -2147483649;
    Expect.equals(2147483647, p1.value);
  } finally {
    calloc.free(p1);
  }
}
