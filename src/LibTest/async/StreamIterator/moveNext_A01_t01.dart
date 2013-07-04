/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future<bool> moveNext()
 * Wait for the next stream value to be available.
 * It is not allowed to call this function again until the future has completed.
 * If the returned future completes with anything except true, the iterator is done,
 * and no new value will ever be available.
 * The future may complete with an error, if the stream produces an error.
 * and only until the next call to moveNext.
 * @description Checks that the property returns the current value of the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(expected) {
  StreamController controller=new StreamController();
  StreamIterator streamIterator=new StreamIterator(controller.stream);
  controller.add(expected);
  streamIterator.moveNext().then((var value){
    Expect.isTrue(value);
    Expect.equals(expected, streamIterator.current);
  });
}

main() {
  check(null);
  check(12345);
  check("expected");
  check(["expected"]);
}
