// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// ARGS: compile --phase=lex %s
//
// AUTOUPDATE

// --- file1.carbon

// CHECK:STDERR: file1.carbon:[[@LINE+3]]:24: Closing symbol does not match most recent opening symbol.
// CHECK:STDERR: fn run(String program) {
// CHECK:STDERR:                        ^
fn run(String program) {
  return True;

// --- file2.carbon

// CHECK:STDERR: file2.carbon:[[@LINE+3]]:10: Invalid digit 'a' in decimal numeric literal.
// CHECK:STDERR: var x = 3a;
// CHECK:STDERR:          ^
var x = 3a;
