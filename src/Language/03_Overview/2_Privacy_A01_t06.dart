/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private iff its name begins with an underscore (the _ character) 
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is public.
 * @description Checks that a private type declared with typedef is inaccessible outside the library.
 * Inaccessible type in type test should produce a dynamic type error in checked mode.
 * @author msyabro
 * @reviewer iefremov
 * @reviewer kaigorodov
 */

import "lib.dart";
import "../../Utils/dynamic_check.dart";

main() {
  if(isCheckedMode()) {
    checkTypeError( () {
      (p) {} is _inaccessibleFuncType; /// static type warning [12.31 Type Test] It is a static warning
                                       // if T does not denote a type available in the current lexical scope.
    });
  } else {
    var fail = false;
    try {
      (p) {} is _inaccessibleFuncType; /// static type warning [12.31 Type Test] It is a static warning
                                       // if T does not denote a type available in the current lexical scope.
      fail = true;
    } catch(ok) {//a run-time error in a production mode, as per spec ch. 11.29
    }
    Expect.isFalse(fail, "A run-time error expected when using inaccessible type in a type test!");
  }
}
