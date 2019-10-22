/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if an optional parameter (named or otherwise) with
 * no default value has a potentially non-nullable type.
 *
 * @description Check that it is a compile-time error if an optional parameter
 * (named or otherwise) with no default value has a potentially non-nullable
 * type. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "legacy_library_lib.dart";

class C<X extends A?> {
  X x;
  C(this.x);

  void test1<X extends A?>(var v, [X x]) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified

  void test2<X extends A?>(var v, {X x}) {}
//                                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test1<X extends A?>(var v, [X x]) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

void test2<X extends A?>(var v, {X x}) {}
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A? a = new A();
  C<A?> c = new C<A?>(a);
}