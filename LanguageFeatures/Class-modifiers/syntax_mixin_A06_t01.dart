// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin can be implemented and mixed in but not constructed or
/// extended and is not exhaustive
///
/// @description Checks that a `mixin` is not exhaustive
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

mixin _M {}
class ImplementsM implements _M {}
class WithM with _M {}

String test1(_M c) => switch (c) {
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ImplementsM _ => "ImplementsM",
      WithM _ => "WithM"
    };

String test2(Mixin c) => switch (c) {
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      ImplementsMixin _ => "ImplementsMixin",
      WithMixin _ => "WithMixin"
    };

main() {
  test1(ImplementsM());
  test2(ImplementsMixin());
}
