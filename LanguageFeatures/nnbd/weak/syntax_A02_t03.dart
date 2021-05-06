// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion A new primitive type Never. This type is denoted by the built-in
 * type declaration Never declared in dart:core.
 *
 * @description Check new primitive type Never
 * @author sgrekhov@unipro.ru
 */
// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

main() {
  Object? o;
  Expect.isFalse(o is Never);
}
