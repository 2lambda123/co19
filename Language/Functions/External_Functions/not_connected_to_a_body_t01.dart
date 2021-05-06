// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion An external function is a function whose body is provided
 * separately from its declaration. An external function may be a top-level
 * function, a method, a getter, a setter or a non-redirecting constructor.
 * External functions are introduced via the built-in identifier external
 * followed by the function signature.
 * An external function is connected to its body by an implementation specific
 * mechanism. Attempting to invoke an external function that has not been
 * connected to its body will raise a NoSuchMethodError or some subclass
 * thereof.
 * @description Checks that invoking an external function that is not connected
 * to its body indeed results in a NoSuchMethodError or its subclass being
 * thrown.
 * @Issue 42182
 * @author rodionov
 */
import '../../../Utils/expect.dart';

external f();
external g([var x]);
external h({var x});

main() {
  Expect.throws(() { f(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { g(); }, (e) => e is NoSuchMethodError);
  Expect.throws(() { h(); }, (e) => e is NoSuchMethodError);
}
