// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void retainWhere(bool test(E element))
/// The [test] function must not throw or modify the queue.
/// @description Checks case when test function clears the queue
/// @author iarkh@unipro.ru
/// @issue 27920


import "dart:collection";
import "../../../Utils/expect.dart";

List list = [1, 3, 3, 4, 5, 6];
DoubleLinkedQueue queue;

bool testClear1(var element) {
  queue.clear();
  return element == 1;
}

bool testClear2(var element) {
  queue.clear();
  return false;
}

bool testClear3(var element) {
  queue.clear();
  return true;
}

check(bool test(var element)) {
  queue = new DoubleLinkedQueue.from(list);
  queue.retainWhere(test);
  Expect.equals(0, queue.length);
}

main() {
  check(testClear1);
  check(testClear2);
  check(testClear3);
}
