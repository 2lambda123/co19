/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is of the form I<T1, ..., Tn> and
 * S is of the form I<S1, ..., Sn> and: Ti << Si , 1 <= i <= n
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T .
 * @description Checks that GenericType<T> is a subtype of GenericType<S> where T is a type parameter and
 * S is a type parameter bound (T and S are complex generics). Checks their mutual assignability 
 * (no static type warnings) as well.
 * @author iefremov
 * @reviewer rodionov
 */

abstract class I<A, B, T> {}
abstract class J<A, B, T> extends I<A, B, T> {}
abstract class K extends J {}
class C implements K {}

// supposedly, f_1 <=> f and f_2 <=> f (see 13.5)
typedef J f(I<J, List<Map>, num> i, [List j]);
typedef K f_1(I<K, List<Map<int, num>>, int> i, [List<Map> j]);
typedef I f_2(I<K, List<Map<int, num>>, int> i, [List<Map> j]);

class Checker_I<T extends I<f, num, List<Map<num, Map>>>> implements I {
  Checker_I() {}
  
  check() {
    Expect.isTrue(new Checker_I<T>() is Checker_I<I>);
    Checker_I<I<f, num, List<Map<num, Map>>>> i1 = new Checker_I<T>();
    Checker_I<T> i2 = Checker_I<I<f, num, List<Map<num, Map>>>> _() {} ();
  }
}

main() {
  new Checker_I().check();
  new Checker_I<I<dynamic, dynamic, dynamic>>().check();
  new Checker_I<I<f_1, int, List<Map<int, Map<int, int>>>>>().check();
  new Checker_I<I<f_2, int, List<Map<int, Map<int, int>>>>>().check();
  new Checker_I<J<f_1, int, List<Map<int, Map<int, int>>>>>().check();
  new Checker_I<J<f_2, int, List<Map<int, Map<int, int>>>>>().check();
}
