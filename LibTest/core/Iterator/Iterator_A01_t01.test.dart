// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Iterator<E> abstract class 
/// The for-in construct transparently uses Iterator to test for the end of the
/// iteration, and to get each item (or element).
/// @description Checks that the returned [Iterator] iterates all elements of the
/// list.
/// @author vasya

library iterator_A01_t01;

import "../../../Utils/expect.dart";

test(Iterator create([Iterable? content]), {bool isSet = false}) {
  void checkIterator(Iterator it, Iterable a) {
    List l = new List.from(a);
    while (it.moveNext()) {
      Expect.isTrue(l.contains(it.current));
      l.remove(it.current);
    }
    Expect.isTrue(l.isEmpty);
  }

  checkIterator(create(<int>[]), []);
  if (!isSet) {
    List<int> l = new List.filled(300, 0);
    checkIterator(create(l), l);
  }

  List<int> a = new List.filled(365, 0);
  for (var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  checkIterator(create(a), a);
  checkIterator(create(<int>[0, 1, 2, 3, 4, 5]), [0, 1, 2, 3, 4, 5]);
}
