// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of a string literal is String.
/// @description Checks that a compile error occurs when assigning
/// a raw multiline double-quoted string literal to an int variable.
/// @compile-error
/// @author msyabro
/// @reviewer iefremov


main() {
  int i = r"""abc""";
}
