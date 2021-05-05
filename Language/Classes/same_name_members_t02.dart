// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a class declares two members of 
/// the same name.
/// @description Checks that it is a compile-time error if a class declares 
/// a function and a getter of the same name.
/// @compile-error
/// @author rodionov


class C {
  void f() {}
  int get f {return 1;}
}

main() {
  try {
    new C();
  } catch (e) {}
}

