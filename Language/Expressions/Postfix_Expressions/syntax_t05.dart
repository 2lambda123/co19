// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Postfix expressions invoke the postfix operators on objects.
/// postfixExpression:
///   assignableExpression postfixOperator |
///   primary (selector* | (‘#’ ( (identifier ‘=’?) | operator)))
/// ;
/// postfixOperator:
///   incrementOperator
/// ;
/// selector:
///   assignableSelector |
///   arguments
/// ;
/// incrementOperator:
///   '++' |
///   '--'
/// ;
/// A postfix expression is either a primary expression, a function, method or
/// getter invocation, or an invocation of a postfix operator on an expression e.
/// @description Checks that a type parameter cannot be used with postfixOperator
/// without a compile error.
/// @compile-error
/// @author msyabro
/// @reviewer kaigorodov
/// @reviewer rodionov


class A<T> {
  test() {
    T++;
  }
}

main() {
  A a = new A();
  a.test();
}
