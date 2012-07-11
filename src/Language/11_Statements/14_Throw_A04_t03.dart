/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a statement of the form throw; is not enclosed
 * within a catch clause.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

main() {
  switch(1) {
    case 1:
      break;
    case 2:
      throw;
    default:
  }
}
