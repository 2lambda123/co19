// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The function type (T1, ... Tn, {Tx1 x1, ..., Txk xk}) -> T is a
/// subtype of the function type (S1, ..., Sn, {Sy1 y1, ..., Sym ym }) -> S, if
/// all of the following conditions are met:
/// 1. Either
///    • S is void, Or
///    • T ⇐⇒ S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si .
/// 3. k ≥ m and yi ∈ {x1 , ..., xk }, i ∈ 1..m.
/// 4. For all yi ∈ {y1 , ..., ym }, yi = xj ⇒ Tj ⇐⇒ Si.
/// @description Checks that this statement is true for functions with a single
/// named optional parameter (class, generic, function, dynamic).
/// @author rodionov
/// @reviewer kaigorodov

import "../../../Utils/expect.dart";

class A {}
class B implements A {}
class C implements B {}
class D implements C {}

typedef t1({B a});
typedef t2({C c});
typedef t3({int i});
typedef t4({var v});
typedef t5({Map m});
typedef t6({Map<int, num> m});
typedef t7({t1 f});
typedef t8({Object a});

typedef okWithT1_1({A a});
typedef okWithT1_2({B a});
typedef okWithT1_3({C a});
typedef okWithT1_4({D a});

main() {
  Expect.isTrue(({A a}) {} is t1);
  Expect.isTrue(({B a}) {} is t1);
  Expect.isTrue(({C a}) {} is t1);
  Expect.isTrue(({D a}) {} is t1);
  Expect.isTrue(({Object a}) {} is t1);
  Expect.isTrue(({var a}) {} is t1);

  Expect.isTrue(({A c}) {} is t2);
  Expect.isTrue(({B c}) {} is t2);
  Expect.isTrue(({C c}) {} is t2);
  Expect.isTrue(({D c}) {} is t2);
  Expect.isTrue(({Object c}) {} is t2);
  Expect.isTrue(({var c}) {} is t2);

  Expect.isTrue(({num i}) {} is t3);
  Expect.isTrue(({int i}) {} is t3);
  Expect.isTrue(({Object i}) {} is t3);
  Expect.isTrue(({var i}) {} is t3);

  Expect.isTrue(({A v}) {} is t4);
  Expect.isTrue(({B v}) {} is t4);
  Expect.isTrue(({C v}) {} is t4);
  Expect.isTrue(({D v}) {} is t4);
  Expect.isTrue(({Object v}) {} is t4);
  Expect.isTrue(({var v}) {} is t4);
  Expect.isTrue(({num v}) {} is t4);
  Expect.isTrue(({int v}) {} is t4);
  Expect.isTrue(({Map v}) {} is t4);
  Expect.isTrue(({Map<List<Map<List, List<int>>>, List> v}) {} is t4);
  Expect.isTrue(({List v}) {} is t4);
  Expect.isTrue(({t8 v}) {} is t4);
  Expect.isTrue(({t7 v}) {} is t4);

  Expect.isTrue(({Map m}) {} is t5);
  Expect.isTrue(({Map<List, t8> m}) {} is t5);
  Expect.isTrue(({Object m}) {} is t5);
  Expect.isTrue(({var m}) {} is t5);
  Expect.isTrue(({Map<List, List> m}) {} is t5);
  Expect.isTrue(({Map<int, t8> m}) {} is t5);

  Expect.isTrue(({Map<num, num> m}) {} is t6);
  Expect.isTrue(({Map<int, int> m}) {} is t6);
  Expect.isTrue(({Map m}) {} is t6);
  Expect.isTrue(({Object m}) {} is t6);
  Expect.isTrue(({var m}) {} is t6);

  Expect.isTrue(({okWithT1_1 f}) {} is t7);
  Expect.isTrue(({okWithT1_2 f}) {} is t7);
  Expect.isTrue(({okWithT1_3 f}) {} is t7);
  Expect.isTrue(({okWithT1_4 f}) {} is t7);

  Expect.isTrue(({A a}) {} is t8);
  Expect.isTrue(({B a}) {} is t8);
  Expect.isTrue(({C a}) {} is t8);
  Expect.isTrue(({D a}) {} is t8);
  Expect.isTrue(({Object a}) {} is t8);
  Expect.isTrue(({var a}) {} is t8);
  Expect.isTrue(({num a}) {} is t8);
  Expect.isTrue(({int a}) {} is t8);
  Expect.isTrue(({Map a}) {} is t8);
  Expect.isTrue(({Map<List<Map<List, List<int>>>, List> a}) {} is t8);
  Expect.isTrue(({List a}) {} is t8);
}
