// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile time error if a generic class declares a type
/// variable with the same name as the class or any of its members or
/// constructors.
/// @description Checks that a type variable can not have the same name as
/// the name of generic class instance method.
/// @compile-error
/// @author ilya


class A<T> {
  T() {}
}

main() {
  new A(); 
}
