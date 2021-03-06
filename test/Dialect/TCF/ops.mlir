// RUN: npcomp-opt <%s | npcomp-opt | FileCheck %s --dump-input=fail

// CHECK-LABEL: func @binary_elementwise
func @binary_elementwise(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) {
  // CHECK: tcf.add %arg0, %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  // CHECK: tcf.max %arg0, %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  // CHECK: tcf.exp %arg0 : tensor<?xf32>
  %0 = tcf.add %arg0, %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  %1 = tcf.max %arg0, %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  %2 = tcf.exp %arg0 : tensor<?xf32>
  return
}

// CHECK-LABEL: func @matmul
func @matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
  // CHECK: tcf.matmul %arg0, %arg1 : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
  %0 = tcf.matmul %arg0, %arg1 : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

// CHECK-LABEL: func @conv_2d_nchw
func @conv_2d_nchw(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
  // CHECK: tcf.conv_2d_nchw %arg0, %arg1 : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
  %0 = tcf.conv_2d_nchw %arg0, %arg1 : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
  return %0 : tensor<?x?x?x?xf32>
}
