// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right FutureOr: T1 is FutureOr<S1> and
///   either T0 <: Future<S1>
///   or T0 <: S1
///   or T0 is X0 and X0 has bound S0 and S0 <: T1
///   or T0 is X0 & S0 and S0 <: T1
/// @description Check that if a type T1 is Future<S1> and a type T0 is X0 and X0
/// has bound S0 and S0 <: Future<S1>, then a type T0 is a subtype of a type T1.
/// @author ngl@unipro.ru

/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be used as a return value of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from right_FutureOr_A03.dart and 
 * return_value_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */



import "dart:async";

class S1 {}
class S0 implements Future<S1> {
  asStream() => null;
  catchError(Function onError, {bool test(Object error)}) => null;
  then<T0>(FutureOr<T0> onValue(S1 value), {Function onError}) => null;
  timeout(Duration timeLimit, {FutureOr<S1> onTimeout()}) => null;
  whenComplete(FutureOr action()) => null;
}
class X0 extends S0 {
}

X0 t0Instance = new X0();
FutureOr<S1> t1Instance = new Future.value(new S1());




FutureOr<S1> returnValueFunc() => t0Instance;

class ReturnValueTest {
  static FutureOr<S1> staticTestMethod() => t0Instance;

  FutureOr<S1> testMethod() => t0Instance;

  FutureOr<S1> get testGetter => t0Instance;
}

main() {
  FutureOr<S1> returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;

}
