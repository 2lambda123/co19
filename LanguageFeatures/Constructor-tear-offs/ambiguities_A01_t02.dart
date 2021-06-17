// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion This new syntax also introduces new ambiguities in the grammar,
/// similar to the one we introduced with generic functions. Examples include:
///
/// f(a<b,c>(d)); // Existing ambiguity, resolved to a generic method call.
/// f(x.a<b,c>[d]); // f((x.a<b, c>)[d]) or f((x.a < b), (c > [d]))
/// f(x.a<b,c>-d);  // f((x.a<b, c>)-d) or f((x.a < b), (c > -d]))
/// The x.a<b,c> can be an explicitly instantiated generic function tear-off or
/// an explicitly instantiated type literal named using a prefix, which is new.
/// While neither type objects nor functions declare operator- or operator[],
/// such could be added using extension methods.
///
/// We will disambiguate such situations heuristically based on the token
/// following the >. In the existing ambiguity we treat ( as a sign that it's a
/// generic invocation. If the next character is one which cannot start a new
/// expression (and thereby be the second operand of a > operator), the prior
/// tokens is parsed as an explicit instantiation. If the token can start a new
/// expression, then we make a choice depending on what we consider the most
/// likely intention (that's specifically - and [ in the examples above).
///
/// The look-ahead tokens which force the prior tokens to be type arguments are:
///
/// ( ) ] } : ; , . ? == != .. ?. ?? ?..
///
/// & | ^ + * %  / ~/
///
// Any other token following the ambiguous > will make the prior tokens be
// parsed as comma separated < and > operator invocations.
///
/// @description Checks disambiguate by '(' token. Test that f(a<b, c>(d)) is
/// parsed as f((a<b, c>)(d))
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

String f(a, [b]) => "$a, $b";

String a<T1, T2>(int x) {
  return "a<$T1, $T2>($x)";
}

typedef b = int;
typedef c = String;

main() {
  int d = 4;
  Expect.equals("a<int, String>(4), null",f(a<b, c>(d)));
}
