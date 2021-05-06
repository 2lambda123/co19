// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion Let C be the class in which the superinitializer super()
 * (respectively, super.id()) appears and let S be the superclass of C. It is
 * a compile-time error if class S does not declare a generative constructor
 * named S (respectively S.id)
 * @description Checks that it is a compile-time error when the superclass S
 * declares a named factory constructor referenced by a superinitializer in its
 * subclass's initializer list.
 * @compile-error
 * @author rodionov
 */

class S {
  S() {}
  factory S.ctor() {return new S();}
}

class C extends S {
  C() : super.ctor() {}
}

main() {
  new C();
}
