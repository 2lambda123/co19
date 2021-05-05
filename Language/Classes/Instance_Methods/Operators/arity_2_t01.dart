// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if arity of the user-declared operator
/// []= is not 2.
/// @description Checks that a compile-time error is produced if a user-defined 
/// operator []= specifies three parameters.
/// @compile-error
/// @author vasya


class C {
  operator []=(var index, var val, var val2) {}
}

main() {
  try {
    new C()[0] = new C();
  } catch (ex) {}
}

