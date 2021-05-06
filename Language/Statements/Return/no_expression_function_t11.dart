// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion Consider a return statement s of the form return e?;
 * ...
 * It is a compile-time error if s is
 *  return;, unless T is void, dynamic, or Null
 *
 * @description Checks that a compile error occurs if a statement of the form
 * "return;" is used in an asynchronous instance method whose declared return
 * type may not be assigned to Future<Null>.
 *
 * @Issue 42459
 * @author a.semenov@unipro.ru
 */
import 'dart:async';

class C {
  C() { }
  Future<int> foo() async {
    if (true) {
      return 1;
    } else {
      return;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  new C().foo();
}
