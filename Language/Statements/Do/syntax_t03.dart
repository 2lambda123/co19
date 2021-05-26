// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The do statement supports conditional iteration, where the
/// condition is evaluated after the loop.
/// doStatement:
///   do statement while '(' expression ')' ';'
/// ;
/// @description Checks that it is a compile-time error if the opening bracket of
/// the loop expression is missing.
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov


main() {
  try {
    do {
      break;
    } while true);
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  } catch (x) {}
}

