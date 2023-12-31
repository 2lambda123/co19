// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form [e as T] is accepted as a potentially
/// and compile-time constant expression if [e] is potentially constant or
/// compile-time constant, respectively, and [T] is a compile-time constant type.
/// A compile-time constant type means any type that doesn't contain free type
/// variables, so the type expression always resolves to the exact same type.
/// @description Checks that an expression of the form [e as T] is accepted if
/// [e] is potentially constant
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A {
  const A();
}

class B extends A {
  const B();
}

class MyClass {
  final A a;
  const MyClass(Object o) : a = o as A;
}

main() {
  const MyClass c1 = MyClass(A());
  Expect.isTrue(c1.a is A);
  Expect.runtimeIsType<A>(c1.a);

  const MyClass c2 = MyClass(B());
  Expect.isTrue(c2.a is B);
  Expect.runtimeIsType<B>(c2.a);
}
