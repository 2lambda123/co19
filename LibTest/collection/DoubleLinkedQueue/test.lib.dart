// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

import "dart:collection";

Iterable create([Iterable content]) {
  DoubleLinkedQueue res = new DoubleLinkedQueue();
  if (content != null) {
    res.addAll(content);
  }
  return res;
}  
