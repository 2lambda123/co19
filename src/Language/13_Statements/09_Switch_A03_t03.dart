/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the values of the expressions ek are not all
 * instances of the same class C or of a class that implements int or String, for all k ∈ 1..n.
 * @description Checks that it is a compile-time error if case expressions
 * are of mixed types.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 * @note renamed from 09_Switch_A02_t02
 */

main() {
  var x=1;
  try {
    switch(x) {
      case 1:
        x=1;
      case 2.0:
        x=2;
    }
  } catch(e) {}
}
