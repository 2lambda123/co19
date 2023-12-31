// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of an await expression a of the form await e
/// proceeds as follows: First, the expression e is evaluated. Next:
/// If e raises an exception x, then an instance f of class Future is allocated
/// and later completed with x. ... If f has completed with an exception x,
/// a raises x.
///
/// @description Check that if evaluation of e produces [UnsupportedError], then
/// await expression throws the same exception.
///
/// @author a.semenov@unipro.ru
/// @issue 42221

import '../../../Utils/expect.dart';

test() async {
  try {
    await (1 ~/ 0);
    Expect.fail('await expression should throw UnsupportedError');
  } catch (x) {
    Expect.isTrue(x is UnsupportedError);
  }
}

main() {
  asyncStart();
  test().then((value) => asyncEnd());
}
