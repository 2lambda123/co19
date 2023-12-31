// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream asyncExpand(Stream convert(T event))
/// Creates a new stream with the events of a stream per original event.
///
/// This acts like expand, except that convert returns a Stream instead of an
/// Iterable. The events of the returned stream becomes the events of the
/// returned stream, in the order they are produced.
///
/// @description Checks that returned stream produces all the values generated by
/// the convert function.
/// @author a.semenov@unipro.ru

library asyncExpand_A01_t01;

import "dart:async";
import "../../../Utils/expect.dart";

void check<T, E>(
    Stream<T> stream, Stream<E> convert(T event), List<E> expected) {
  AsyncExpect.data(expected, stream.asyncExpand(convert));
}

void test(CreateStreamFunction create) {
  // expand to empty stream
  check(create([]), (_) => create([]), []);
  check(create([1, 2, 3, 4, 5]), (_) => create([]), []);
  // expand to the same stream
  check(create([]), (e) => create([e]), []);
  check(create([1, 2, 3, 4, 5]), (e) => create([e]), [1, 2, 3, 4, 5]);
  check(create(['a', null, 'b']), (e) => create([e]), ['a', null, 'b']);
  // double events in the input stream
  check(create([]), (e) => create([e, e]), []);
  check(create([1, 2, 3]), (e) => create([e, e]), [1, 1, 2, 2, 3, 3]);
  check(create(['a', null, 'b']), (e) => create([e, e]),
      ['a', 'a', null, null, 'b', 'b']);
}
