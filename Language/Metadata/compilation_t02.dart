// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error if the expression is not one of the
/// following:
///   • A reference to a compile-time constant variable.
///   • A call to a constant constructor.
/// @description Check that function used as metadata cause a compile time error
/// @author a.semenov@unipro.ru

void metadata() {
}

  @metadata()
//^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ANNOTATION
// ^
// [cfe] Couldn't find constructor 'metadata'.
class A {}

main() {
  A? a;
}
