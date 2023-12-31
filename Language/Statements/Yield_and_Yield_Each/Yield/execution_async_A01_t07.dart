// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of a statement s of the form yield e; proceeds as
/// follows:
///   First, the expression `e` is evaluated to an object `o`. If the enclosing
/// function `m` is marked `async*` and the stream `u` associated with `m` has
/// been paused, then the nearest enclosing asynchronous `for` loop if any, is
/// paused and execution of `m` is suspended until `u` is resumed or canceled.
///   Next, `o` is added to the iterable or stream associated with the
/// immediately enclosing function.
///   If the enclosing function `m` is marked `async*` and the stream `u`
/// associated with `m` has been canceled, then the `yield` statement returns
/// without an object, otherwise it completes normally.
///   Otherwise, if the enclosing function `m` is marked `async*` then the
/// enclosing function may suspend, in which case the nearest enclosing
/// asynchronous `for` loop, if any, is paused first.
///
/// @description Check that if the enclosing function `m` is marked `async*` and
/// the stream `u` associated with `m` has been paused, then execution of `m` is
/// suspended until `u` is canceled. Test the case when `u` is paused during the
/// delivery, then resumed, paused again and then cancelled
///
/// @author sgrekhov22@gmail.com
/// @issue 49465

import 'dart:async';
import '../../../../Utils/expect.dart';

List<int> readyToSend = [];
List<int> sent = [];

Stream<int> generator() async* {
  for (int i = 1; i <= 5; i++) {
    readyToSend.add(i);
    yield i;
    sent.add(i);
  }
}

main() async {
  asyncStart();
  Completer c = new Completer();
  List received = [];
  Stream<int> s = generator();
  late StreamSubscription<int> ss;
  ss = s.listen((int i) async {
    received.add(i);
    if (i == 2) {
      Expect.listEquals([1], sent);
      Expect.listEquals([1, 2], readyToSend);
      ss.pause();
      await null;
      Expect.listEquals([1], sent);
      Expect.listEquals([1, 2], readyToSend);
      ss.resume();
      Expect.listEquals([1], sent);
      Expect.listEquals([1, 2], readyToSend);
      ss.pause();
      await null;
      // It's ok if generator function performed one iteration
      // See https://github.com/dart-lang/sdk/issues/49465
      Expect.isTrue(sent.length == 1 || sent.length == 2 && sent.contains(2));
      await ss.cancel();
      c.complete();
    }
  });
  await c.future;
  // Let's wait to be sure that there are no more events
  await Future.delayed(Duration(milliseconds: 100));
  Expect.listEquals([1, 2], received);
  Expect.listEquals([1, 2], sent);
  Expect.listEquals([1, 2, 3], readyToSend);
  asyncEnd();
}
