// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// AUTOUPDATE

// CHECK:STDERR: fail_value_as_type.carbon:[[@LINE+3]]:12: Cannot implicitly convert from `i32` to `type`.
// CHECK:STDERR: var x: (1, );
// CHECK:STDERR:            ^
var x: (1, );

// CHECK:STDOUT: package {
// CHECK:STDOUT:   %.loc10_9.1: i32 = int_literal 1
// CHECK:STDOUT:   %.loc10_9.2: i32 = stub_reference %.loc10_9.1
// CHECK:STDOUT:   %.loc10_12.1: type = tuple_type (i32)
// CHECK:STDOUT:   %.loc10_12.2: (i32,) = tuple_value (%.loc10_9.2)
// CHECK:STDOUT:   %.loc10_12.3: type = tuple_type (<error>)
// CHECK:STDOUT:   %x: ref (<error>,) = var "x"
// CHECK:STDOUT: }
