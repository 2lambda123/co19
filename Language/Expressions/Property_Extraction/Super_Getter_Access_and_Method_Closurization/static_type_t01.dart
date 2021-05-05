// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of i is:
/// • The declared return type of Sstatic.m, if Sstatic has an accessible
///   instance getter named m.
/// • The static type of function Sstatic.m if Sstatic has an accessible
///   instance method named m.
/// • The type dynamic otherwise.
/// @description Check that static type of the extracted getter is declared
/// return type of the getter.
/// @static-clean
/// @author sgrekhov@unipro.ru


class A {
  int get m => 1;
}

class C extends A {
  void test() {
    int i = super.m;
  }
}

main() {
  C c = new C();
  c.test();
}
