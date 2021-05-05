// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Let [G] be a generic class or parameterized type alias with formal
/// type parameter declarations [F1] .. [Fk] containing formal type parameters
/// [X1] .. [Xk] and bounds [B1] .. [Bk]. We say that the formal type parameter
/// [Xj] has a simple bound when one of the following requirements is satisfied:
/// [Bj] is omitted.
/// [Bj] is included, but does not contain any of [X1] .. [Xk]. If [Bj] contains
/// a type [T] on the form qualified (for instance, [C] or [p.D]) which denotes a
/// generic class or parameterized type alias [G1] (that is, [T] is a raw type),
/// every type argument of [G1] has a simple bound.
/// @description Checks that instantiate-to-bounds works as expected for [class
/// G<X extends A<B>, X1 extends B<X>> ]
/// @author iarkh@unipro.ru

typedef F<X> = void Function<Y extends X>();
F<X> toF<X>(X x) => null;

class A<X> {}
class B<X> {}
class G<X extends A<B>, X1 extends B<X>> {}

main() {
  G source;
  var fsource = toF(source);
  F<G<A<B<dynamic>>, B<A<B<dynamic>>>>> target = fsource;

  F<G<A<B<int>>, B<A<B<dynamic>>>>> target1  = fsource; //# 01: compile-time error
  F<G<A<B<dynamic>>, B<A<B<int>>>>> target2  = fsource; //# 02: compile-time error
  F<G<A<B<Null>>, B<A<B<dynamic>>>>> target3 = fsource; //# 03: compile-time error
  F<G<A<B<dynamic>>, B<A<B<Null>>>>> target4 = fsource; //# 04: compile-time error
  F<G<A<B<int>>, B<A<B<int>>>>> target5      = fsource; //# 05: compile-time error
  F<G<A<B<Null>>, B<A<B<Null>>>>> target6    = fsource; //# 06: compile-time error

  G();
}
