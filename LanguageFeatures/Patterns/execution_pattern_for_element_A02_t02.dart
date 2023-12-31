// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// A statement of the form:
///
/// for (<patternVariableDeclaration>; <condition>; <increment>) <statement>
///
/// Is executed like a traditional for loop though is more likely to declare
/// multiple variables.
///
/// @description Check that a pattern-for element is executed like a traditional
/// for loop. Test that it is a compile-time error if a final variable is
/// assigned in a pattern-for element in a map literal
/// @author sgrekhov22@gmail.com

import "patterns_lib.dart";

main() {
  var m1 = {
  for (final (int i) = 0; i < 3; i++) "k$i": i,
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var m2 = {
  for (final [a] = [0]; a < 3; [a] = [a + 1]) "k$a": a,
//                              ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var m3 = {
  for (final {"k1": a} = {"k1": 0}; a < 3; {"k1": a} = {"k1": a + 1}) "k$a": a,
//                                                ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var m4 = {
  for (final (a,) = (0,); a < 3; (a,) = (a + 1,)) "k$a": a,
//                                ^
// [analyzer] unspecified
// [cfe] unspecified
  };
  var m5 = {
  for (final Square(:areaAsInt) = Square(1); areaAsInt < 2;
      Square(:areaAsInt) = Square(areaAsInt + 1)) "k$areaAsInt": areaAsInt,
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
