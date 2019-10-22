/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Null: T0 is Null.
 * @description Check that if type T0 is Null and T1 is dynamic then T0 is a
 * subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */
/**
 * @description Check that if type T0 is a subtype of a type T1, then instance
 * of T0 can be be assigned to the to local variable of type T1
 * @author sgrekhov@unipro.ru
 */
/*
 * This test is generated from left_null_A02.dart and 
 * local_variable_x01.dart.
 * Don't modify it. If you want to change this file, change one of the files 
 * above and then run generator.dart to regenerate the tests.
 */


import '../../utils/common.dart';
// SharedOptions=--enable-experiment=non-nullable
Null t0Instance = null;
Null t1Instance = null;

const t1Default = null;




class LocalVariableTest {

  LocalVariableTest() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    Null t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  Null t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}