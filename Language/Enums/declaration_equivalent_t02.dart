// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declaration of an enum of the form 
/// metadata enum E { id 0 , . . . id n−1 };
/// has the same effect as a class declaration
/// metadata class E {
/// final int index;
/// const E(this.index);
/// static const E id 0 = const E(0);
/// ...
/// static const E id n−1 = const E(n - 1);
/// static const List<E> values = const <E>[id 0 . . . id n−1 ];
/// String toString() => { 0: ‘E.id 0 ’, . . ., n-1: ‘E.id n−1 ’}[index]
/// }
/// @description Checks that type of each member of an enum is this enum type
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

enum E {a, b, c}

main() {
  Expect.isTrue(E.a is E);
  Expect.isTrue(E.b is E);
  Expect.isTrue(E.c is E);
  Expect.runtimeIsType<E>(E.a);
  Expect.runtimeIsType<E>(E.b);
  Expect.runtimeIsType<E>(E.c);
}
