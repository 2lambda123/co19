// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A conditional expression evaluates one of two expressions
/// based on a boolean condition.
/// conditionalExpression:
///   ifNullExpression ('?' expressionWithoutCascade ':'
/// expressionWithoutCascade)?
/// ;
/// @description Checks that super can't be used in a conditional expression
/// as the condition.
/// @compile-error
/// @author msyabro
/// @reviewer kaigorodov


class S {}

class A extends S {
  test() {
    try {
      super ? 1 : 2;
    } catch (e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
