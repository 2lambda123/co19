// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// stringLiteral:
///   (multilineString | singleLineString)+
/// ;
/// singleLineString:
///   '"' stringContentDQ* '"' |
///   ''' stringContentSQ* ''' |
///   'r' ''' (~( ''' | NEWLINE ))* ''' |
///   'r' '"' (~( '"' | NEWLINE ))* '"'
/// ;
/// stringContentDQ:
///   ~( '\' | '"' | '$' | NEWLINE ) |
///   '\' ~( NEWLINE ) |
///   stringInterpolation
/// ;
/// stringContentSQ:
///   ~( '\' | ''' | '$' | NEWLINE ) |
///   '\' ~( NEWLINE ) |
///   stringInterpolation
/// ;
/// NEWLINE:
///   '\n' |
///   '\r'
/// ;
/// @description Checks that it is a compile-time error if a raw single-quoted
/// string contains \r.
/// @compile-error
/// @author msyabro
/// @reviewer iefremov


main() {
  try {
    r'stri
g';
  } catch (e) {}
}
