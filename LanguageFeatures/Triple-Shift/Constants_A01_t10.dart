// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Constant-update-2018 Spec:
/// The operator [>>>] is now allowed in a potentially constant expression, and
/// it is valid in constant expression if its left and right operands are [int]
/// instances, and the operation doesn't throw. The [>>>] operator has not been
/// added to the [int] class yet, so unless the left-hand operand's static type
/// is [dynamic], the program will still be rejected. When the operator is added,
/// it should then also work in a constant expression.
/// @description Checks that arguments of [>>>] operator should be int.
/// @Issue 30886
/// @author iarkh@unipro.ru


main() {
  const d1 = 14;
  const d2 = 1000;
  const d3 = 0;

  const d4 = -1;
  const d5 = -99999;

  const c1 = d1 >>> d4;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c2 = d2 >>> d5;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c3 = d3 >>> -11;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c4 = 1 >>> -9999;
//           ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c5 = d4 >>> -2;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const c6 = -24 >>> d5;
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
