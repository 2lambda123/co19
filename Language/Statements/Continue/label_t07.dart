// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let sc be a continue statement. If sc is of the form continue L;,
/// then let sE be the innermost labeled do, for or while statement or case
/// clause with label L enclosing sc. If sc is of the form continue; then let sE
/// be the innermost do, for or while statement enclosing sc.
/// It is a compile-time error if no such statement or case clause sE exists
/// within the innermost function in which sc occurs.
/// @description Checks that it is a compile-time error if a 'continue L;'
/// statement occurs in a case clause of switch statement with label L and there
/// is no another enclosing statement with label L.
/// @author vasya
/// @issue 42593


main() {
  var x = 1;
  L:
  switch (x) {
    case 1:
      x = 0;
      continue L;
  //           ^
  // [analyzer] COMPILE_TIME_ERROR.CONTINUE_LABEL_INVALID
  //  ^^^^^^^^
  // [cfe] A 'continue' label must be on a loop or a switch member.
    default:
      x = 2;
  }
}
