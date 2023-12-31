// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch expression with a list as a matched type can be exhaustive
///
/// @description Check that it is a compile-time error if a matched type of a
/// switch expression is a list and cases are not exhaustive.
/// @author sgrekhov22@gmail.com

String test1(List<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, _] => "3"
  };

String test2(List<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, _] => "3",
    [...[_]] => "-"
  };

String test3(List<int> l) =>
  switch (l) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    [] => "0",
    [_] => "1",
    [_, _] => "2",
    [_, _, ... List<String> r] => "2+"
  };

main() {
  test1([]);
  test2([]);
  test3([]);
}
