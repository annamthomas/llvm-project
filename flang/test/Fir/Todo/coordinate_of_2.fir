// RUN: %not_todo_cmd fir-opt --fir-to-llvm-ir="target=x86_64-unknown-linux-gnu" %s 2>&1 | FileCheck %s

// CHECK: not yet implemented: fir.array nested inside other array and/or derived type

// `!fir.coordinate_of` - `!fir.array` inside "boxed" `!fir.type`
func.func @coordinate_box_array_inside_derived(%arg0: !fir.box<!fir.type<derived_2{field_1:!fir.array<10 x i32>, field_2:i32}>>, %arg1 : index) {
   %q = fir.coordinate_of %arg0, field_1, %arg1 : (!fir.box<!fir.type<derived_2{field_1:!fir.array<10 x i32>, field_2:i32}>>, index) -> !fir.ref<f32>
   return
}
