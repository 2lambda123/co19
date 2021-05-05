// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion ElementStream<MouseEvent> get onMouseOver
/// Stream of mouseover events handled by this Element.
/// @description Checks that correct events are delivered via the stream

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var type = 'mouseover';
  var x = document.body;

  asyncStart();
  x.onMouseOver.listen((e) {
    Expect.equals(type, e.type);
    asyncEnd();
  });

  var event = new Event(type);
  x.dispatchEvent(event);
}
