// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Stream<ProgressEvent> get onLoadEnd
/// Stream of loadend events handled by this HttpRequestEventTarget.
/// @description Checks that only single event is fired.

import "dart:html";
import "dart:async";
import "../../../UtilsHtml/expect.dart";

main() {
  HttpRequest request = new HttpRequest();
  HttpRequestUpload upload = request.upload;
  bool first = true;
  request.open('GET', "test.dart");
  asyncStart();
  upload.onLoadEnd.listen((event) {
    Expect.isTrue(first);
    first = false;
    asyncEnd();
  });
  request.send();
}
