/*
 * controller13_dt.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "controller13".
 *
 * Model version              : 1.280
 * Simulink Coder version : 9.9 (R2023a) 19-Nov-2022
 * C source code generated on : Tue Oct 24 12:48:44 2023
 *
 * Target selection: sldrt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Linux 64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(int32_T),
  sizeof(int64_T),
  sizeof(uint64_T),
  sizeof(struct_ZkbZOHZIQ12OrHsHSZ9BxE),
  sizeof(struct_zWQ2UeKRPJXs0YiBnSx2iG),
  sizeof(struct_swDfGweWqG74EXQcL13RhH),
  sizeof(struct_p3zOljnrL2X4Qf74Xm0EnB),
  sizeof(struct_UpQiVKryEBqs2KRn8vEU2D),
  sizeof(struct_2KYTscT7yaKYRdkMxD6U9E),
  sizeof(struct_HhckT6rntEraqECYVIDvCC),
  sizeof(struct_Wa8sJQmUGLqlUCHjNRY8jH),
  sizeof(struct_wpXnDpHRbNQy93v0PODtoB),
  sizeof(struct_0yAgXIcEc7Qfnq3WyOOAEE),
  sizeof(struct_Lgc9AULsY4Mx15GiYQzZ5D),
  sizeof(struct_kSQgeIWP8CJFyhJa3BCkKH),
  sizeof(struct_RR1HfhpOgJkNft4L0oceKG),
  sizeof(struct_BMPh5m1Di0rqBrJELygvTF),
  sizeof(struct_US0zWSxBeiGO76BJVagXU),
  sizeof(struct_Mm8baDtvJ6F1HwYR9vQKoB),
  sizeof(struct_xYWfUN9SkUJsVTws5uSKmG),
  sizeof(struct_OVnAWbOGG6051k5E2XFKrF),
  sizeof(struct_Jr4MvxEGd3eYSWnINMGRAH),
  sizeof(struct_gdZsCdVYjdZks1rrDmq8jC),
  sizeof(struct_xe46UU7ReCQJsoezraLOuF),
  sizeof(struct_B1Vk66atRZ2ph9uociFBiB),
  sizeof(struct_v7QRUNg0bRzIKbxTGkLU5G),
  sizeof(struct_ni8MyV2eSea2CB8OwzYye),
  sizeof(struct_g1w3fqsCwWkKPZWZIBXZBB),
  sizeof(struct_noVORLylIAY3lMNihjoU5G),
  sizeof(struct_zS9ZPv1VboOoAtSuxv7pSB),
  sizeof(struct_htaV0FftsCH0OM1YQj23kC),
  sizeof(struct_f1GAQCuR5iH3zg1HgRGwdH),
  sizeof(struct_u2xjbNN0BtlKoljw3A6ZWB),
  sizeof(struct_za6Z1msdjv4nO78vSPS3MB),
  sizeof(struct_k0moZOrCNzzUVH6dO9P6gC),
  sizeof(struct_5L5BeC6jiZn5OLuHBViB8),
  sizeof(struct_RrLi2swEfwBt8aIms8AxPE),
  sizeof(struct_w9plDi2yBqPkIcn1td2FHG),
  sizeof(struct_Xhks7ZntxlOipz1r1axNSG),
  sizeof(struct_xCxkVOM47tJqjufwphtwGG),
  sizeof(struct_5p9bYaTTEhTX8feCDegopB),
  sizeof(struct_qT6B9pjYW863D2bpz1kcaE),
  sizeof(struct_g6gaPCTXvoA8FlBdYhRAtF),
  sizeof(struct_PovbDhjxK7nz9gwPkFJWfE),
  sizeof(struct_bsOxv4bUJLWxVy6smMTssG),
  sizeof(struct_1x16MxYnJf7oS5TSEa1ILD),
  sizeof(struct_4HnKuGjcb7cOCUJVaqeEEF),
  sizeof(struct_Hk4Z6TSaAlsOnGuIc7gYNE),
  sizeof(struct_KfV94jJYa0IvUQJ0JjwHYD),
  sizeof(struct_TfPjd5bcXWAi4tLma7cKxD),
  sizeof(struct_PnJy5R3HzCjafF7TLm4DbE),
  sizeof(struct_WWtcgODJFNP4tHc5z1TP3G),
  sizeof(struct_nBlY7EPQDGdIoVBiDbH2yB),
  sizeof(struct_KhXwpRPEcLAekIa5XUXTOE),
  sizeof
  (robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T),
  sizeof(uint64_T),
  sizeof(int64_T),
  sizeof(uint_T),
  sizeof(char_T),
  sizeof(uchar_T),
  sizeof(time_T)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "physical_connection",
  "int64_T",
  "uint64_T",
  "struct_ZkbZOHZIQ12OrHsHSZ9BxE",
  "struct_zWQ2UeKRPJXs0YiBnSx2iG",
  "struct_swDfGweWqG74EXQcL13RhH",
  "struct_p3zOljnrL2X4Qf74Xm0EnB",
  "struct_UpQiVKryEBqs2KRn8vEU2D",
  "struct_2KYTscT7yaKYRdkMxD6U9E",
  "struct_HhckT6rntEraqECYVIDvCC",
  "struct_Wa8sJQmUGLqlUCHjNRY8jH",
  "struct_wpXnDpHRbNQy93v0PODtoB",
  "struct_0yAgXIcEc7Qfnq3WyOOAEE",
  "struct_Lgc9AULsY4Mx15GiYQzZ5D",
  "struct_kSQgeIWP8CJFyhJa3BCkKH",
  "struct_RR1HfhpOgJkNft4L0oceKG",
  "struct_BMPh5m1Di0rqBrJELygvTF",
  "struct_US0zWSxBeiGO76BJVagXU",
  "struct_Mm8baDtvJ6F1HwYR9vQKoB",
  "struct_xYWfUN9SkUJsVTws5uSKmG",
  "struct_OVnAWbOGG6051k5E2XFKrF",
  "struct_Jr4MvxEGd3eYSWnINMGRAH",
  "struct_gdZsCdVYjdZks1rrDmq8jC",
  "struct_xe46UU7ReCQJsoezraLOuF",
  "struct_B1Vk66atRZ2ph9uociFBiB",
  "struct_v7QRUNg0bRzIKbxTGkLU5G",
  "struct_ni8MyV2eSea2CB8OwzYye",
  "struct_g1w3fqsCwWkKPZWZIBXZBB",
  "struct_noVORLylIAY3lMNihjoU5G",
  "struct_zS9ZPv1VboOoAtSuxv7pSB",
  "struct_htaV0FftsCH0OM1YQj23kC",
  "struct_f1GAQCuR5iH3zg1HgRGwdH",
  "struct_u2xjbNN0BtlKoljw3A6ZWB",
  "struct_za6Z1msdjv4nO78vSPS3MB",
  "struct_k0moZOrCNzzUVH6dO9P6gC",
  "struct_5L5BeC6jiZn5OLuHBViB8",
  "struct_RrLi2swEfwBt8aIms8AxPE",
  "struct_w9plDi2yBqPkIcn1td2FHG",
  "struct_Xhks7ZntxlOipz1r1axNSG",
  "struct_xCxkVOM47tJqjufwphtwGG",
  "struct_5p9bYaTTEhTX8feCDegopB",
  "struct_qT6B9pjYW863D2bpz1kcaE",
  "struct_g6gaPCTXvoA8FlBdYhRAtF",
  "struct_PovbDhjxK7nz9gwPkFJWfE",
  "struct_bsOxv4bUJLWxVy6smMTssG",
  "struct_1x16MxYnJf7oS5TSEa1ILD",
  "struct_4HnKuGjcb7cOCUJVaqeEEF",
  "struct_Hk4Z6TSaAlsOnGuIc7gYNE",
  "struct_KfV94jJYa0IvUQJ0JjwHYD",
  "struct_TfPjd5bcXWAi4tLma7cKxD",
  "struct_PnJy5R3HzCjafF7TLm4DbE",
  "struct_WWtcgODJFNP4tHc5z1TP3G",
  "struct_nBlY7EPQDGdIoVBiDbH2yB",
  "struct_KhXwpRPEcLAekIa5XUXTOE",
  "robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T",
  "uint64_T",
  "int64_T",
  "uint_T",
  "char_T",
  "uchar_T",
  "time_T"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&controller13_B.Product), 0, 0, 1068 },

  { (char_T *)(&controller13_B.DataTypeConversion), 3, 0, 6 },

  { (char_T *)(&controller13_B.sf_beeunitstoSI1.s_si[0]), 0, 0, 19 },

  { (char_T *)(&controller13_B.sf_beeunitstoSI.s_si[0]), 0, 0, 19 }
  ,

  { (char_T *)(&controller13_DW.SaturatingRamp_DSTATE), 0, 0, 472 },

  { (char_T *)(&controller13_DW.highdrivingsignal_PWORK.LoggedData), 11, 0, 36 },

  { (char_T *)(&controller13_DW.sfEvent), 6, 0, 23 },

  { (char_T *)(&controller13_DW.RandSeed), 7, 0, 6 },

  { (char_T *)(&controller13_DW.obj), 68, 0, 1 },

  { (char_T *)(&controller13_DW.q0q1q2q3_IWORK), 10, 0, 1 },

  { (char_T *)(&controller13_DW.If_ActiveSubsystem), 2, 0, 4 },

  { (char_T *)(&controller13_DW.is_active_c31_controller13), 3, 0, 23 },

  { (char_T *)(&controller13_DW.doneDoubleBufferReInit), 8, 0, 24 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI1.sfEvent), 6, 0, 1 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI1.is_active_c15_controller13), 3,
    0, 1 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI1.doneDoubleBufferReInit), 8, 0,
    1 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI.sfEvent), 6, 0, 1 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI.is_active_c15_controller13), 3,
    0, 1 },

  { (char_T *)(&controller13_DW.sf_beeunitstoSI.doneDoubleBufferReInit), 8, 0, 1
  }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  19U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&controller13_P.rbt), 24, 0, 1 },

  { (char_T *)(&controller13_P.lut), 67, 0, 1 },

  { (char_T *)(&controller13_P.ctr), 55, 0, 1 },

  { (char_T *)(&controller13_P.rsim), 66, 0, 1 },

  { (char_T *)(&controller13_P.mdl), 19, 0, 1 },

  { (char_T *)(&controller13_P.ukf_P0_flat[0]), 0, 0, 634 },

  { (char_T *)(&controller13_P.Constant22_Value), 8, 0, 2 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  7U,
  rtPTransitions
};

/* [EOF] controller13_dt.h */
