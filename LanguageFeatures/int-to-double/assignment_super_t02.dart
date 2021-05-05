// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of a double valued integer literal is [double]
/// @description Checks that the static type of a double valued integer literal
/// is [double]. Test super assignment expression and hexadecimal values
/// @author sgrekhov@unipro.ru

class A {
  double m1;

  void set instanceSetter(double val) {
    m1 = val;
  }
}

class C extends A {
  test() {
    super.m1 = 0x42;
    super.m1 = (1 > 0 ? 0x42 : 3.14);
    super.m1 = (null ?? 0x42);
    super.m1 ??= 0x42;
    super.instanceSetter = 0x42;
  }
}

main() {
  C c = C();
  c.test();
}
