// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion void createSync(
///  String target, {
///  bool recursive: false
///  })
///  Synchronously create the link. Calling createSync on an existing link will
///  throw an exception.
///
///  If recursive is false, the default, the link is created only if all
///  directories in its path exist. If recursive is true, all non-existing path
///  components are created. The directories in the path of target are not
///  affected, unless they are also in path.
///
///  On the Windows platform, this call will create a true symbolic link instead
/// of a Junction. In order to create a symbolic link on Windows, Dart must be
/// run in Administrator mode or the system must have Developer Mode enabled,
/// otherwise a FileSystemException will be raised with ERROR_PRIVILEGE_NOT_HELD
/// set as the errno when this call is made.
///
///  On other platforms, the posix symlink() call is used to make a symbolic link
///  containing the string target. If target is a relative path, it will be
///  interpreted relative to the directory containing the link.
/// @description Checks that on the Windows platform relative paths to the target
/// is not converted to absolute paths (as it was in the past)
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  if (Platform.isWindows) {
    Directory dir = getTempDirectorySync(parent: sandbox);
    String dirName = getTempDirectoryName();
    Directory target =
        new Directory(dir.path + Platform.pathSeparator + dirName);
    target.createSync();
    Link link = new Link(
        dir.path + Platform.pathSeparator + getTempFileName(extension: "lnk"));
    link.createSync(dirName);
    Expect.equals(dirName, link.targetSync());
  }
}
