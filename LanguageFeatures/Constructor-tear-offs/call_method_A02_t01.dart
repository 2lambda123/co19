// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Currently you can do instantiated tear-offs of instance methods.
/// We restrict that to interface methods, which precisely excludes the call
/// methods of function types. We do not allow instantiating function values,
/// and therefore also cannot allow side-stepping that restriction by
/// instantiation the .call "instance" method of such a value.
///
/// That makes it a compile-time error to explicitly instantiate the call method
/// of an expression with a function type or of type Function, and the tear-off
/// of a call method of a function type is not subject to implicit instantiation
/// (so the tear-off is always generic, even if the context type requires it not
/// to be, which is then guaranteed to introduce a type error).
///
/// @description Checks that it is a compile-time error to tear-off a call
/// method of a generic function type
/// @author sgrekhov@unipro.ru
/// @issue 46902

// SharedOptions=--enable-experiment=constructor-tearoffs

T foo1<T>(T value) => value;

main() {
  var funcValue1 = foo1;
  int Function(int) f1 = funcValue1.call;
//                                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  T foo2<T>(T value) => value;
  var funcValue2 = foo2;
  int Function(int) f2 = funcValue2.call;
//                                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
