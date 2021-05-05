// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
///  ifNullExpression:
///   logicalOrExpression (‘??’ logicalOrExpression)*
///
/// @description Check that it is a compile time error, if
/// third logicalOrExpression is missing
/// @compile-error
/// @author a.semenov@unipro.ru


main() {
  var x = 10 ?? 20 ??;
}
