// Part of the Carbon Language project, under the Apache License v2.0 with LLVM
// Exceptions. See /LICENSE for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// ARGS: compile --phase=check --dump-semantics-ir --dump-raw-semantics-ir %s
//
// Check that we can combine textual IR and raw IR dumping in one compile.
//
// AUTOUPDATE

fn Foo(n: i32) -> (i32, f64) {
  return (n + 2, 3.4);
}

// CHECK:STDOUT: cross_reference_irs_size: 1
// CHECK:STDOUT: functions: [
// CHECK:STDOUT:   {name: str0, param_refs: block2, return_type: type3, return_slot: node+6, body: [block5]},
// CHECK:STDOUT: ]
// CHECK:STDOUT: integer_literals: [
// CHECK:STDOUT:   2,
// CHECK:STDOUT: ]
// CHECK:STDOUT: real_literals: [
// CHECK:STDOUT:   {mantissa: 34, exponent: -1, is_decimal: 1},
// CHECK:STDOUT: ]
// CHECK:STDOUT: strings: [
// CHECK:STDOUT:   Foo,
// CHECK:STDOUT:   n,
// CHECK:STDOUT:   return,
// CHECK:STDOUT: ]
// CHECK:STDOUT: types: [
// CHECK:STDOUT:   nodeIntegerType,
// CHECK:STDOUT:   node+3,
// CHECK:STDOUT:   nodeFloatingPointType,
// CHECK:STDOUT:   node+5,
// CHECK:STDOUT: ]
// CHECK:STDOUT: type_blocks: [
// CHECK:STDOUT:   [
// CHECK:STDOUT:     typeTypeType,
// CHECK:STDOUT:     typeTypeType,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     type0,
// CHECK:STDOUT:     type2,
// CHECK:STDOUT:   ],
// CHECK:STDOUT: ]
// CHECK:STDOUT: nodes: [
// CHECK:STDOUT:   {kind: Parameter, arg0: str1, type: type0},
// CHECK:STDOUT:   {kind: StubReference, arg0: nodeIntegerType, type: typeTypeType},
// CHECK:STDOUT:   {kind: StubReference, arg0: nodeFloatingPointType, type: typeTypeType},
// CHECK:STDOUT:   {kind: TupleType, arg0: typeBlock0, type: typeTypeType},
// CHECK:STDOUT:   {kind: TupleValue, arg0: block3, type: type1},
// CHECK:STDOUT:   {kind: TupleType, arg0: typeBlock1, type: typeTypeType},
// CHECK:STDOUT:   {kind: VarStorage, arg0: str2, type: type3},
// CHECK:STDOUT:   {kind: FunctionDeclaration, arg0: function0},
// CHECK:STDOUT:   {kind: IntegerLiteral, arg0: int0, type: type0},
// CHECK:STDOUT:   {kind: BinaryOperatorAdd, arg0: node+0, arg1: node+8, type: type0},
// CHECK:STDOUT:   {kind: StubReference, arg0: node+9, type: type0},
// CHECK:STDOUT:   {kind: RealLiteral, arg0: real0, type: type2},
// CHECK:STDOUT:   {kind: StubReference, arg0: node+11, type: type2},
// CHECK:STDOUT:   {kind: TupleValue, arg0: block6, type: type3},
// CHECK:STDOUT:   {kind: ReturnExpression, arg0: node+13},
// CHECK:STDOUT: ]
// CHECK:STDOUT: node_blocks: [
// CHECK:STDOUT:   [
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+0,
// CHECK:STDOUT:     node+1,
// CHECK:STDOUT:     node+2,
// CHECK:STDOUT:     node+3,
// CHECK:STDOUT:     node+4,
// CHECK:STDOUT:     node+5,
// CHECK:STDOUT:     node+6,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+0,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+1,
// CHECK:STDOUT:     node+2,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+7,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+8,
// CHECK:STDOUT:     node+9,
// CHECK:STDOUT:     node+10,
// CHECK:STDOUT:     node+11,
// CHECK:STDOUT:     node+12,
// CHECK:STDOUT:     node+13,
// CHECK:STDOUT:     node+14,
// CHECK:STDOUT:   ],
// CHECK:STDOUT:   [
// CHECK:STDOUT:     node+10,
// CHECK:STDOUT:     node+12,
// CHECK:STDOUT:   ],
// CHECK:STDOUT: ]
// CHECK:STDOUT:
// CHECK:STDOUT: package {
// CHECK:STDOUT:   %.loc11 = fn_decl @Foo
// CHECK:STDOUT: }
// CHECK:STDOUT:
// CHECK:STDOUT: fn @Foo(%n: i32) -> %return: (i32, f64) {
// CHECK:STDOUT: !entry:
// CHECK:STDOUT:   %.loc12_15: i32 = int_literal 2
// CHECK:STDOUT:   %.loc12_13.1: i32 = add %n, %.loc12_15
// CHECK:STDOUT:   %.loc12_13.2: i32 = stub_reference %.loc12_13.1
// CHECK:STDOUT:   %.loc12_18.1: f64 = real_literal 34e-1
// CHECK:STDOUT:   %.loc12_18.2: f64 = stub_reference %.loc12_18.1
// CHECK:STDOUT:   %.loc12_21: (i32, f64) = tuple_value (%.loc12_13.2, %.loc12_18.2)
// CHECK:STDOUT:   return %.loc12_21
// CHECK:STDOUT: }
