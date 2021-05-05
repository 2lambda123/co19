// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion String toStringAsFixed(int fractionDigits)
/// @description Checks the method on a set of values.
/// @author msyabro

import "../../../Utils/expect.dart";

check(String expected, double val, int digits) {
  Expect.equals(expected, val.toStringAsFixed(digits));
  Expect.equals('-$expected', (-val).toStringAsFixed(digits));
}

main() {
  check('1', 1.0, 0);
  check('1.0', 1.0, 1);
  check('1.00', 1.0, 2);
  check('1.000', 1.0, 3);
  check('1.0000', 1.0, 4);
  check('1.00000', 1.0, 5);

  check('0', 0.123456, 0);
  check('0.1', 0.123456, 1);
  check('0.12', 0.123456, 2);
  check('0.123', 0.123456, 3);
  check('0.1235', 0.123456, 4);
  check('0.12346', 0.123456, 5);

  check('0', 0.00000000000009, 0);
  check('0.0', 0.00000000000009, 1);
  check('0.00', 0.00000000000009, 2);
  check('0.000', 0.00000000000009, 3);
  check('0.0000', 0.00000000000009, 4);
  check('0.00000', 0.00000000000009, 5);

  check('3', 2.999999999, 0);
  check('3.0', 2.999999999, 1);
  check('3.00', 2.999999999, 2);
  check('3.000', 2.999999999, 3);
  check('3.0000', 2.999999999, 4);
  check('3.00000', 2.999999999, 5);

  check('111', 111.1111111, 0);
  check('111.1', 111.1111111, 1);
  check('111.11', 111.1111111, 2);
  check('111.111', 111.1111111, 3);
  check('111.1111', 111.1111111, 4);
  check('111.11111', 111.1111111, 5);
}
