// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Effectively, each super parameters, super.p:
///
/// Introduces a final variable p with the parameter’s name, just like this.p
/// does, only in scope in the initializer list.
///
/// @description Check that the super parameter introduces a final variable
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=super-parameters

class S {
  int s;
  S([int x = 0]) : s = ++x;
}

class C extends S {
  int c;
  C([super.x = 1]) : c = x++;
//                       ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(1);
}
