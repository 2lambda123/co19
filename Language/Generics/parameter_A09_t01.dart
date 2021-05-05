// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A type parameter cannot be used as a generic type
/// @description Checks that class type parameter cannot be used as a generic
/// type
/// @compile-error
/// @author iarkh@unipro.ru


class A<T> {}

class B<T extends A> {
  testme() {
    T<int> t;
  }
}

main() {
}
