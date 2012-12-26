/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If S.m exists, it is a static type warning if the type F of
 * S.m may not be assigned to a function type.
 * @description Checks that it is a static type warning if S.m can not be assigned to a function type.
 * @author msyabro
 * @reviewer kaigorodov
 * @issue 1604
 */

class S {
  int m;
}

class A extends S {
  test() {
    try {
      super.m(); /// static type warning - see "Super invocation"
      Expect.fail("NoSuchMethodError is expected");
    } on NoSuchMethodError catch(e) {}
  }
}

main() {
  new A().test();
}
