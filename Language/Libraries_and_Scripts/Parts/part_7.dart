// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

part of Parts_test_lib;

class A { }

get value { return _value; }
set value(value) { _value = value; }
var _value;

12 //error
