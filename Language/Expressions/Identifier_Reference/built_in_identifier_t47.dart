// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a built-in identifier is used as
/// the declared name of a prefix, class, type parameter or type alias.
/// @description Checks that it is a compile-time error if a built-in identifier
/// "library" is used as the declared name of a class.
/// @compile-error
/// @author ngl@unipro.ru


class library {}

main() {
  try {
    null is library;
  } catch (anything) {
  }
}
