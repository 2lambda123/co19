// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9


library before_import_lib1;

@A() import 'before_import_lib2.dart';

class A {
  const A();
}
