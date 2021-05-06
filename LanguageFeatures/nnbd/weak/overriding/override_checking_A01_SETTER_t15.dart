// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion In an unmigrated library, override checking is done using legacy
 * types. This means that an unmigrated library can bring together otherwise
 * incompatible methods. When choosing the most specific signature during
 * interface computation, all nullability and requiredness annotations are
 * ignored, and the [Never] type is treated as [Null].
 *
 * @description Check that if legacy class is a mixin with opted-in class,
 * legacy setter can accept non-null values if corresponding parent setter is of
 * nullable type.
 *
 * @author iarkh@unipro.ru
 */
// Requirements=nnbd-weak
// @dart=2.6

import "dart:async";
import "../../../../Utils/expect.dart";
import "override_checking_A01_opted_in_lib.dart";

void testme1() {}

class A with OPTED_NULLABLE_SETTER {
  void set setInt(int i)           { Expect.equals(1, i); }
  void set setObject(Object o)     { Expect.equals(1, o); }
  void set setFunction(Function f) { Expect.equals(testme1, f); }
  void set setFutureOr(FutureOr i) { Expect.equals(1, i); }
  void set setDynamic(dynamic d)   { Expect.equals(1, d); }
}

main() {
  A a = A();

  a.setInt      = 1;
  a.setObject   = 1;
  a.setFutureOr = 1;
  a.setFunction = testme1;
  a.setDynamic  = 1;
}
