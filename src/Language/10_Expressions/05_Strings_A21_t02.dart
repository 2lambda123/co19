/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Adjacent single line strings are implicitly concatenated
 * to form a single string literal.
 * @description Checks that the value of a concatenated string literal is correct.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 1867 - assertion doesn't mention multi-line string literals
 */


main() {
  Expect.equals("", ""'');
  Expect.equals('a', 'a''');
  Expect.equals('a', '' 'a');
  Expect.equals('ab', 'a''b');
  Expect.equals("12", "1""2");
  Expect.equals(@'\n\n', @'\n'@'\n');
  Expect.equals("a", ""@"a");
  Expect.equals('ab', @'a'"b");
  Expect.equals('string', 's''t''r''i''n''g');
  Expect.equals("22", '${1 + 1}' "${3 - 1}");
  var s = 'a'
          "b"
          '''c'''
          """d"""
          """
e"""
          '''
f''';
  Expect.equals('abcdef', s);

  // "a""""""b""" should be tokenized as "a" """""b""", aka. "a" '""b'.
  Expect.isTrue('a""b' === "a""""""b""");
  Expect.isTrue('a""b' === """a""""""""b""");
}
