/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion "assert" is a reserved word.
 * @description Checks that it is a compile-time error when a reserved word "assert"
 * is used as a class member name.
 * @compile-error
 * @author rodionov
 */

class C {
  int assert;
}

main() {
  try {
    new C().assert is int;
  } catch (anything) {
  }
}
