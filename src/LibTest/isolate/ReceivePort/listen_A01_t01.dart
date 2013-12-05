/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * Adds a subscription to this stream.
 * On each data event from this stream, the subscriber's onData handler is called.
 * @description Checks that on each data event from this stream,
 * the subscriber's onData handler is called.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(List data) {
  ReceivePort s1=IsolateStream.fromIterable(data);
  List sink=new List();
  asyncStart();
  s1.listen((var event){
      sink.add(event);
    },
    onDone:(){
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  ); 
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
