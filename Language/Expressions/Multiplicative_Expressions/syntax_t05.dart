// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Multiplicative expressions invoke the multiplication operators on
/// objects.
/// multiplicativeExpression:
///   unaryExpression (multiplicativeOperator unaryExpression)* |
///   super (multiplicativeOperator unaryExpression)+
/// ;
/// multiplicativeOperator:
///   '*' |
///   '/' |
///   '%' |
///   '~/'
/// ;
/// A multiplicative expression is either a unary expression, or an invocation
/// of a multiplicative operator on either super or an expression e1, with
/// argument e2.
/// @description  Checks that expression of the form
/// [unaryExpression ('~/' unaryExpression)*] must have at least two operands
/// @compile-error
/// @author msyabro
/// @reviewer kaigorodov
/// @reviewer rodionov


main() {
  try {
    1 ~/;
  } catch (e) {}
}
