// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion double sqrt(num x)
/// Converts [x] to a double and returns the positive square root of the value.
/// @description Checks set of values.
/// @author msyabro
/// @reviewer pagolubev
/// @3rdparty sputnik-v1: S15.8.2.17_A6.js
/// @needsreview Returned value precision is not specified.
/// Checks exact match with values calculated with LibC.


import "dart:math" as Math;
import "../../Utils/expect.dart";

main() {
  int vnum = 64;
  var x = new List(64);
  x[0] = 0.00000000000000000000;
  x[1] = 0.25396825396825395000;
  x[2] = 0.50793650793650791000;
  x[3] = 0.76190476190476186000;
  x[4] = 1.01587301587301580000;
  x[5] = 1.26984126984126980000;
  x[6] = 1.52380952380952370000;
  x[7] = 1.77777777777777770000;
  x[8] = 2.03174603174603160000;
  x[9] = 2.28571428571428560000;
  x[10] = 2.53968253968253950000;
  x[11] = 2.79365079365079350000;
  x[12] = 3.04761904761904740000;
  x[13] = 3.30158730158730140000;
  x[14] = 3.55555555555555540000;
  x[15] = 3.80952380952380930000;
  x[16] = 4.06349206349206330000;
  x[17] = 4.31746031746031720000;
  x[18] = 4.57142857142857120000;
  x[19] = 4.82539682539682510000;
  x[20] = 5.07936507936507910000;
  x[21] = 5.33333333333333300000;
  x[22] = 5.58730158730158700000;
  x[23] = 5.84126984126984090000;
  x[24] = 6.09523809523809490000;
  x[25] = 6.34920634920634890000;
  x[26] = 6.60317460317460280000;
  x[27] = 6.85714285714285680000;
  x[28] = 7.11111111111111070000;
  x[29] = 7.36507936507936470000;
  x[30] = 7.61904761904761860000;
  x[31] = 7.87301587301587260000;
  x[32] = 8.12698412698412650000;
  x[33] = 8.38095238095238140000;
  x[34] = 8.63492063492063440000;
  x[35] = 8.88888888888888930000;
  x[36] = 9.14285714285714230000;
  x[37] = 9.39682539682539720000;
  x[38] = 9.65079365079365030000;
  x[39] = 9.90476190476190510000;
  x[40] = 10.15873015873015800000;
  x[41] = 10.41269841269841300000;
  x[42] = 10.66666666666666600000;
  x[43] = 10.92063492063492100000;
  x[44] = 11.17460317460317400000;
  x[45] = 11.42857142857142900000;
  x[46] = 11.68253968253968200000;
  x[47] = 11.93650793650793700000;
  x[48] = 12.19047619047619000000;
  x[49] = 12.44444444444444500000;
  x[50] = 12.69841269841269800000;
  x[51] = 12.95238095238095300000;
  x[52] = 13.20634920634920600000;
  x[53] = 13.46031746031746000000;
  x[54] = 13.71428571428571400000;
  x[55] = 13.96825396825396800000;
  x[56] = 14.22222222222222100000;
  x[57] = 14.47619047619047600000;
  x[58] = 14.73015873015872900000;
  x[59] = 14.98412698412698400000;
  x[60] = 15.23809523809523700000;
  x[61] = 15.49206349206349200000;
  x[62] = 15.74603174603174500000;
  x[63] = 16.00000000000000000000;


  var y = new List(64);
  y[0] = 0.00000000000000000000;
  y[1] = 0.50395263067896967000;
  y[2] = 0.71269664509979835000;
  y[3] = 0.87287156094396945000;
  y[4] = 1.00790526135793930000;
  y[5] = 1.12687233963802200000;
  y[6] = 1.23442679969673530000;
  y[7] = 1.33333333333333330000;
  y[8] = 1.42539329019959670000;
  y[9] = 1.51185789203690880000;
  y[10] = 1.59363814577919150000;
  y[11] = 1.67142178807468980000;
  y[12] = 1.74574312188793890000;
  y[13] = 1.81702705031799170000;
  y[14] = 1.88561808316412670000;
  y[15] = 1.95180014589706640000;
  y[16] = 2.01581052271587870000;
  y[17] = 2.07784992659727900000;
  y[18] = 2.13808993529939520000;
  y[19] = 2.19667858946110380000;
  y[20] = 2.25374467927604400000;
  y[21] = 2.30940107675850290000;
  y[22] = 2.36374736114111530000;
  y[23] = 2.41687191246657520000;
  y[24] = 2.46885359939347060000;
  y[25] = 2.51976315339484810000;
  y[26] = 2.56966429775848400000;
  y[27] = 2.61861468283190830000;
  y[28] = 2.66666666666666650000;
  y[29] = 2.71386797119523940000;
  y[30] = 2.76026223736941700000;
  y[31] = 2.80588949764880670000;
  y[32] = 2.85078658039919340000;
  y[33] = 2.89498745782298350000;
  y[34] = 2.93852354676981160000;
  y[35] = 2.98142396999971960000;
  y[36] = 3.02371578407381760000;
  y[37] = 3.06542417893925380000;
  y[38] = 3.10657265339049320000;
  y[39] = 3.14718316987777280000;
  y[40] = 3.18727629155838300000;
  y[41] = 3.22687130401855570000;
  y[42] = 3.26598632371090410000;
  y[43] = 3.30463839483761390000;
  y[44] = 3.34284357614937950000;
  y[45] = 3.38061701891406630000;
  y[46] = 3.41797303712883060000;
  y[47] = 3.45492517089848670000;
  y[48] = 3.49148624377587780000;
  y[49] = 3.52766841475278750000;
  y[50] = 3.56348322549899170000;
  y[51] = 3.59894164336974940000;
  y[52] = 3.63405410063598340000;
  y[53] = 3.66883053033489940000;
  y[54] = 3.70328039909020570000;
  y[55] = 3.73741273720925400000;
  y[56] = 3.77123616632825340000;
  y[57] = 3.80475892484536750000;
  y[58] = 3.83798889135426350000;
  y[59] = 3.87093360626696680000;
  y[60] = 3.90360029179413280000;
  y[61] = 3.93599587043272870000;
  y[62] = 3.96812698209517300000;
  y[63] = 4.00000000000000000000;

  for (int i = 0; i < vnum; i++) {
    Expect.equals(y[i], Math.sqrt(x[i]));
  }
}
