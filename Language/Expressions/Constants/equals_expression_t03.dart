// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • An expression of one of the forms e1 == e2 or e1 != e2 where e1 and e2 are
///   constant expressions that evaluate to a numeric, string or boolean value
///   or to null.
/// @description Checks that it is a compile-time error when an expression of
/// the form e1 == e2 where e1 does not evaluate to a numeric, string or boolean
/// value, is used to initialize a constant variable.
/// @author kaigorodov


class A {
  const A() : a = "hello";
  final a;
}

final constList = const [
//                ^
// [cfe] unspecified
   const A() == "hello",
// ^
// [analyzer] unspecified
];

main() {
  try {
    constList is List;
  } catch (x) {}
}
