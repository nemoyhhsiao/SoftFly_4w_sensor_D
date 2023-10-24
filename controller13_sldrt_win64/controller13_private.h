/*
 * controller13_private.h
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

#ifndef RTW_HEADER_controller13_private_h_
#define RTW_HEADER_controller13_private_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include "zero_crossing_types.h"
#include "controller13.h"
#include "controller13_types.h"

extern real_T rt_urand_Upu32_Yd_f_pw_snf(uint32_T *u);
extern real_T rt_nrand_Upu32_Yd_f_pw_snf(uint32_T *u);
extern real_T rt_atan2d_snf(real_T u0, real_T u1);
extern real_T rt_hypotd_snf(real_T u0, real_T u1);
extern void rt_mrdivide_U1d1x3_U2d3x3_Yd1x3_snf(const real_T u0[3], const real_T
  u1[9], real_T y[3]);
extern real_T look1_binlxpw(real_T u0, const real_T bp0[], const real_T table[],
  uint32_T maxIndex);
extern int32_T div_nde_s32_floor(int32_T numerator, int32_T denominator);
extern void controller13_beeunitstoSI_Init(DW_beeunitstoSI_controller13_T
  *localDW);
extern void controller13_beeunitstoSI(const real_T rtu_s_bee[19],
  B_beeunitstoSI_controller13_T *localB, DW_beeunitstoSI_controller13_T *localDW);

/* private model entry point functions */
extern void controller13_derivatives(void);

#endif                                 /* RTW_HEADER_controller13_private_h_ */
