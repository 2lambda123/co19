// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion final Element parent
/// The parent element of this node.
/// Returns null if this node either does not have a parent or its parent is
/// not an element.
/// @description Checks that parent of DocumentFragment child is null

import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var f = document.createDocumentFragment();
  var x = new Element.html('<span></span>');
  f.append(x);

  Expect.isNull(x.parent);
}
