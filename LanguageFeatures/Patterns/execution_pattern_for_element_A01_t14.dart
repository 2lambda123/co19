// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Likewise, a collection element of the form:
///
/// for (<patternVariableDeclaration>; <condition>; <increment>) <element>
/// Is executed like a traditional for loop though is more likely to declare
/// multiple variables
///
/// @description Check that a pattern-for element is executed like a traditional
/// for loop. Test a record pattern in a set literal
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

main() {
  var set = {-1, for (var (a, b) = (0, 1); a <= 8; (a, b) = (b, a + b)) a, 13};
  // Set may contain only one 1, so we have 0, 1, 2... instead of 0, 1, 1, 2,...
  Expect.setEquals({-1, 0, 1, 2, 3, 5, 8, 13}, set);
}
