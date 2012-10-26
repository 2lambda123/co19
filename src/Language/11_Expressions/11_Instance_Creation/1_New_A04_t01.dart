/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e of the form new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) it is
 * a static warning if the type T does not declare a constructor with the same
 * name as the declaration of T.
 * @description Checks that it is a static warning if a class does not declare
 * a constructor with the same name.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  C.constructor() {}
}

main() {
  try {
    new C();
    Expect.fail("Should throw a NoSuchMethodError");
  } catch(e) {}
}
