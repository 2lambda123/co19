// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A null-shorting cascade expression e?..s translates as follows,
/// where x and y are fresh object level variables.
///  fn[k : Exp -> Exp] : Exp =>
///  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
///
/// @description Check that a null-shorting cascade expression e?..s translates
/// as follows, where x and y are fresh object level variables.
///  fn[k : Exp -> Exp] : Exp =>
///  let x = EXP(e) in x == null ? null : let y = EXP(x.s) in k(x)
/// @author sgrekhov@unipro.ru
/// @issue 39141
/// @issue 40959

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

class C {
  int c1 = 0, c2 = 0;
  String get log => "test1 called $c1 times, test2() called $c2 times";

  String get test1 {
    c1++;
    return "Show must go on";
  }

  String test2() {
    c2++;
    return "Let it be";
  }
}

main() {
  C c1 = new C();
  var actual1 = c1 ?.. test1;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
  var expected = c1;
  Expect.equals(expected, actual1);
  Expect.equals("test1 called 1 times, test2() called 0 times", c1.log);

  var actual2 = c1 ?.. test2();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
  Expect.equals(expected, actual2);
  Expect.equals("test1 called 1 times, test2() called 1 times", c1.log);

  var actual3 = c1
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
    ?.. test1
//  ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    .. test2();
  Expect.equals(expected, actual3);
  Expect.equals("test1 called 2 times, test2() called 2 times", c1.log);

  C? c2 = null;
  var actual4 = c2 ?.. test1;
  Expect.isNull(actual4);

  var actual5 = c2 ?.. test2();
  Expect.isNull(actual5);

  var actual6 = c2
    ?.. test1
    .. test2();
  Expect.isNull(actual6);

  c2 = new C();
  var actual7 = c2 ?.. test1;
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
  var expected2 = c2;
  Expect.equals(expected2, actual7);
  Expect.equals("test1 called 1 times, test2() called 0 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                              ^
// [cfe] Operand of null-aware operation '?.' has type 'C' which excludes null.

  var actual8 = c2 ?.. test2();
//                 ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
  Expect.equals(expected2, actual8);
  Expect.equals("test1 called 1 times, test2() called 1 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                              ^
// [cfe] Operand of null-aware operation '?.' has type 'C' which excludes null.

  var actual9 = c2
//              ^
// [cfe] Operand of null-aware operation '?..' has type 'C' which excludes null.
      ?.. test1
//    ^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
      .. test2();
  Expect.equals(expected2, actual9);
  Expect.equals("test1 called 2 times, test2() called 2 times", c2?.log);
//                                                                ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                              ^
// [cfe] Operand of null-aware operation '?.' has type 'C' which excludes null.
}
