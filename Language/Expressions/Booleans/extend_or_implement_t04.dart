// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error for a class to attempt to extend,
/// mix in or implement bool.
/// @description Checks that bool cannot be mixed in
/// @compile-error
/// @author sgrekhov@unipro.ru

class A {}

class C extends A with bool {}

main() {
  try {
    new C();
  } catch (e) {}
}
