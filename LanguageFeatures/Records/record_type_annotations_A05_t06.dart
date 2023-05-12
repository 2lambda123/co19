// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a record type has any of:
///
/// The same field name more than once. This is true even if one or both of the
/// colliding fields is positional. We could permit collisions with positional
/// field names since they are only used for documentation, but we disallow it
/// because it's confusing and not useful.
///
/// Only one positional field and no trailing comma. This isn't ambiguous, since
/// there are no parenthesized type expressions in Dart. But prohibiting this is
/// symmetric with record expressions and leaves the potential for later support
/// for parentheses for grouping in type expressions.
///
/// A field named hashCode, runtimeType, noSuchMethod, or toString.
///
/// A field name that starts with an underscore.
///
/// A field name that collides with the synthesized getter name of a positional
/// field. For example: (int, $1: int) since the named field '$1' collides with
/// the getter for the first positional field.
///
/// @description Checks that it is a compile-time error if record contains a
/// positional field named `runtimeType`
/// @author sgrekhov22@gmail.com

typedef R1 = (Type runtimeType, {String s});
//                 ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef (Type runtimeType, {int i}) R2();
//            ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void R3((Type runtimeType, {String s}) r);
//                    ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

(int runtimeType, {int x}) foo() => (42, x: 0);
//   ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void bar((Type runtimeType, {bool b}) r) {}
//             ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  (int runtimeType, {String s}) r1 = (42, s: "");
//     ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  (double runtimeType, {int i}) r2 = (3.14, i: 42);
//        ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic d = (1, 3.14);
  if (d is (int runtimeType, {String s})) {
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  d as (int runtimeType, {double i});
//          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
