// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion An on-catch clause of the form on T catch (p1) s is equivalent to
/// an on-catch clause on T catch (p1, p2) s where p2 is an identiier that does
/// not occur anywhere else in the program.
/// @description Checks that it is not an error when the least specific catch
/// clause is placed first, followed by more specific, and therefore redundant,
/// catch clauses and that an exception can not be caught with clauses that don't
/// match.
/// @author iefremov
/// @reviewer rodionov

import '../../../Utils/expect.dart';

class A {}
class B extends A {}
class C extends B {}

main() {
  try {
    try {
      throw new Object();
    } on A catch (ex) {
      Expect.fail("This clause shouldn't be executed");
    } on B catch (ex) {
      Expect.fail ("This clause shouldn't be executed");
    } on C catch (ex) {
      Expect.fail ("This clause shouldn't be executed");
    }
  } on Object catch (o) {}
}
