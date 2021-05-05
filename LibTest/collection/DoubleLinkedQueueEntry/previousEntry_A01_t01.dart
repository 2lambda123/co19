// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion previousEntry() → DoubleLinkedQueueEntry<E>
/// Returns the previous entry or [null] if there is none.
/// @description Checks that nextEntry() returns the previous element
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  DoubleLinkedQueueEntry e = new DoubleLinkedQueueEntry(1);
  e.prepend(2);

  Expect.equals(2, e.previousEntry().element);
}
