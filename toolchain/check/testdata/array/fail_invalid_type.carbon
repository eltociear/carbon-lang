// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// CHECK:STDERR: fail_invalid_type.carbon:[[@LINE+3]]:13: Cannot implicitly convert from `i32` to `type`.
// CHECK:STDERR: var a: [1; 1];
// CHECK:STDERR:             ^
var a: [1; 1];

// CHECK:STDOUT: package {
// CHECK:STDOUT:   %.loc10_9: i32 = int_literal 1
// CHECK:STDOUT:   %.loc10_12: i32 = int_literal 1
// CHECK:STDOUT:   %.loc10_13: type = array_type %.loc10_12, <error>
// CHECK:STDOUT:   %a: ref [<error>; 1] = var "a"
// CHECK:STDOUT: }
