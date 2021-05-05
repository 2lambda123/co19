// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a yield statement appears in
/// a function that is not a generator function.
///
/// @description Check that it is compile error if yield statement appears
/// inside synchronous method.
///
/// @compile-error
/// @author a.semenov@unipro.ru


class A {
  test() {
    yield 1;
  }
}

main() {
  new A().test();
}
