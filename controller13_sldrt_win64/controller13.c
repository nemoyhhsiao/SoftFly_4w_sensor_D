/*
 * controller13.c
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

#include "controller13.h"
#include "rtwtypes.h"
#include "controller13_types.h"
#include "controller13_private.h"
#include <string.h>
#include <math.h>
#include "rt_nonfinite.h"
#include <emmintrin.h>
#include "rt_defines.h"
#include "controller13_dt.h"

/* Named constants for MATLAB Function: '<S32>/bee units to SI' */
#define controller13_CALL_EVENT        (-1)

/* Named constants for MATLAB Function: '<S9>/Geometric Attitude Controller' */
#define controller13_CALL_EVENT_l      (-1)

/* list of Simulink Desktop Real-Time timers */
const int SLDRTTimerCount = 1;
const double SLDRTTimers[2] = {
  0.0005, 0.0,
};

/* Block signals (default storage) */
B_controller13_T controller13_B;

/* Continuous states */
X_controller13_T controller13_X;

/* Block states (default storage) */
DW_controller13_T controller13_DW;

/* Real-time model */
static RT_MODEL_controller13_T controller13_M_;
RT_MODEL_controller13_T *const controller13_M = &controller13_M_;

/* Forward declaration for local functions */
static void controller13_expand_atan2_m(const real_T a_data[], const int32_T
  a_size[3], const real_T b_data[], const int32_T b_size[3], real_T c_data[],
  int32_T c_size[3]);
static void controller13_xzlascl(real_T cfrom, real_T cto, real_T A[16]);
static real_T controller13_xnrm2(int32_T n, const real_T x[16], int32_T ix0);
static void controller13_xzgebal(real_T A[16], int32_T *ilo, int32_T *ihi,
  real_T scale[4]);
static real_T controller13_xzlarfg(int32_T n, real_T *alpha1, real_T x[16],
  int32_T ix0);
static void controller13_xzlarf(int32_T m, int32_T n, int32_T iv0, real_T tau,
  real_T C[16], int32_T ic0, real_T work[4]);
static void controller13_xzgehrd(real_T a[16], int32_T ilo, int32_T ihi, real_T
  tau[3]);
static void controller13_xzunghr(int32_T ilo, int32_T ihi, real_T A[16], const
  real_T tau[3]);
static real_T controller13_xnrm2_b(int32_T n, const real_T x[3]);
static real_T controller13_xzlarfg_b(int32_T n, real_T *alpha1, real_T x[3]);
static void controller13_xdlanv2(real_T *a, real_T *b, real_T *c, real_T *d,
  real_T *rt1r, real_T *rt1i, real_T *rt2r, real_T *rt2i, real_T *cs, real_T *sn);
static void controller13_xdlahqr(int32_T ilo, int32_T ihi, real_T h[16], int32_T
  iloz, int32_T ihiz, real_T z[16], int32_T *info, real_T wr[4], real_T wi[4]);
static void controller13_xgemv(int32_T n, const real_T x[12], real_T beta1,
  real_T y[16], int32_T iy0);
static void controller13_dladiv1(real_T a, real_T b, real_T c, real_T d, real_T *
  p, real_T *q);
static void controller13_xdladiv(real_T a, real_T b, real_T c, real_T d, real_T *
  p, real_T *q);
static void controller13_xdlaln2(int32_T na, int32_T nw, real_T smin, const
  real_T A[16], int32_T ia0, const real_T B[12], int32_T ib0, real_T wr, real_T
  wi, real_T X[4], real_T *scale, real_T *xnorm);
static void controller13_xaxpy(int32_T n, real_T a, const real_T x[16], int32_T
  ix0, real_T y[12]);
static void controller13_xdtrevc3(const real_T T[16], real_T vr[16]);
static void controller13_xzlascl_g(real_T cfrom, real_T cto, int32_T m, real_T
  A[4], int32_T iA0);
static void controller13_eigStandard(const real_T A[16], creal_T V[16], creal_T
  D[4]);
static void controller13_xzlascl_gc(real_T cfrom, real_T cto, int32_T m, real_T
  A[3], int32_T iA0);
static void controller13_xzlartg(real_T f, real_T g, real_T *cs, real_T *sn,
  real_T *r);
static void controller13_rotateRight_f(int32_T n, real_T z[16], int32_T iz0,
  const real_T cs[6], int32_T ic0, int32_T is0);
static void controller13_xdlaev2(real_T a, real_T b, real_T c, real_T *rt1,
  real_T *rt2, real_T *cs1, real_T *sn1);
static void controller13_rotateRight(int32_T n, real_T z[16], int32_T iz0, const
  real_T cs[6], int32_T ic0, int32_T is0);
static int32_T controller13_xzsteqr(real_T d[4], real_T e[3], real_T z[16]);
static void controller13_eig(const real_T A[16], creal_T V[16], creal_T D[4]);
static real_T controller13_norm_h(const real_T x[4]);
static void controller13_chol(real_T A[324]);
static void controller13_Quaternion_multiply(const real_T q_left[4], const
  real_T q_right[4], real_T q[4]);
static void controller13_UKF_dp_to_q(const real_T dp[3], const real_T q_ref[4],
  real_T q[4]);
static void controller13_quat2rotm(real_T q_a, real_T q_b, real_T q_c, real_T
  q_d, real_T R[9]);
static void controller13_Dynamics_step(const real_T p_k[3], const real_T
  p_dot_k[3], const real_T q_k[4], const real_T omega_k[3], real_T f_cmd_k,
  real_T tau_cmd_x_k, real_T tau_cmd_y_k, const real_T F_ext_k[3], const real_T
  tau_ext_k[3], const real_T constants_J[9], real_T p_k_plus_1[3], real_T
  p_dot_k_plus_1[3], real_T q_k_plus_1[4], real_T omega_k_plus_1[3]);
static void controller13_UKF_q_to_dp(const real_T q[4], const real_T q_ref[4],
  real_T dp[3]);
static void controller13_mrdiv(const real_T A[108], const real_T B[36], real_T
  Y[108]);
static void controller13_rotm2quat(const real_T R[9], real_T quat[4]);
static void controller13_expand_atan2(const real_T a_data[], const int32_T
  a_size[3], const real_T b_data[], const int32_T b_size[3], real_T c_data[],
  int32_T c_size[3]);
static void controller13_rotm2eul(const real_T R[9], real_T eul[3]);
static real_T controller13_norm(const real_T x[3]);
static void controller13_unflatten_rotm(const real_T R[9], real_T b_R[9]);
static real_T controller13_xnrm2_m(int32_T n, const real_T x[36], int32_T ix0);
static real_T controller13_xzlarfg_ba(int32_T n, real_T *alpha1, real_T x[36],
  int32_T ix0);
static void controller13_xzlarf_j(int32_T m, int32_T n, int32_T iv0, real_T tau,
  real_T C[36], int32_T ic0, real_T work[9]);
static void controller13_qrf(real_T A[36], int32_T m, int32_T n, int32_T nfxd,
  real_T tau[4]);
static void controller13_factorQRE(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  int32_T mrows, int32_T ncols);
static void controller13_countsort(int32_T x[9], int32_T xLen, int32_T
  workspace[9], int32_T xMin, int32_T xMax);
static void controller13_removeConstr(sawH9C58NaQx0EcT16OdroH_controller13_T
  *obj, int32_T idx_global);
static void controller13_RemoveDependentIneq_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
   sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
   soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace, real_T tolfactor);
static void controller13_factorQR(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  const real_T A[36], int32_T mrows, int32_T ncols);
static void controller13_computeQ_(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  int32_T nrows);
static boolean_T controller13_feasibleX0ForWorkingSet(real_T workspace[36],
  real_T xCurrent[4], sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager);
static real_T controller13_maxConstraintViolation
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj, const real_T x[4]);
static void controller13_modifyOverheadPhaseOne_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj);
static void controller13_setProblemType(sawH9C58NaQx0EcT16OdroH_controller13_T
  *obj, int32_T PROBLEM_TYPE);
static void controller13_linearForm_(boolean_T obj_hasLinear, int32_T obj_nvar,
  real_T workspace[36], const real_T H[9], const real_T f[3], const real_T x[4]);
static real_T controller13_computeFval(const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, real_T workspace[36], const
  real_T H[9], const real_T f[3], const real_T x[4]);
static void controller13_xgemv_k(int32_T m, int32_T n, const real_T A[9],
  int32_T lda, const real_T x[4], real_T y[3]);
static void controller13_computeGrad_StoreHx
  (sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, const real_T H[9], const real_T
   f[3], const real_T x[4]);
static real_T controller13_computeFval_ReuseHx(const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, real_T workspace[36], const
  real_T f[3], const real_T x[4]);
static void controller13_xrotg(real_T *a, real_T *b, real_T *c, real_T *s);
static void controller13_deleteColMoveEnd(sYbuiRVtE6jido5obBecKYC_controller13_T
  *obj, int32_T idx);
static void controller13_fullColLDL2_(sh58oWPwY89XybeLiY7aWPG_controller13_T
  *obj, int32_T NColsRemain, real_T REG_PRIMAL);
static void controller13_xgemv_kl(int32_T m, int32_T n, const real_T A[16],
  int32_T ia0, const real_T x[36], real_T y[4]);
static void controller13_compute_deltax(const real_T H[9],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace, const
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager, const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective);
static real_T controller13_xnrm2_mx(int32_T n, const real_T x[4]);
static void controller13_xgemv_klw(int32_T m, const real_T A[32], const real_T
  x[4], real_T y[36]);
static void controller13_ratiotest(const real_T solution_xstar[4], const real_T
  solution_searchDir[4], real_T workspace[36], int32_T workingset_nVar, const
  real_T workingset_Aineq[32], const real_T workingset_bineq[8], const int32_T
  workingset_indexLB[4], const int32_T workingset_sizes[5], const int32_T
  workingset_isActiveIdx[6], const boolean_T workingset_isActiveConstr[9], const
  int32_T workingset_nWConstr[5], real_T *toldelta, real_T *alpha, boolean_T
  *newBlocking, int32_T *constrType, int32_T *constrIdx);
static void controller13_feasibleratiotest(const real_T solution_xstar[4], const
  real_T solution_searchDir[4], real_T workspace[36], int32_T workingset_nVar,
  const real_T workingset_Aineq[32], const real_T workingset_bineq[8], const
  int32_T workingset_indexLB[4], const int32_T workingset_sizes[5], const
  int32_T workingset_isActiveIdx[6], const boolean_T workingset_isActiveConstr[9],
  const int32_T workingset_nWConstr[5], boolean_T isPhaseOne, real_T *alpha,
  boolean_T *newBlocking, int32_T *constrType, int32_T *constrIdx);
static void controller13_addBoundToActiveSetMatrix_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj, int32_T TYPE, int32_T idx_local);
static void controller13_compute_lambda(real_T workspace[36],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution, const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, const
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager);
static void controller13_iterate(const real_T H[9], const real_T f[3],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
  sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager,
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, real_T
  options_ObjectiveLimit, real_T options_StepTolerance, real_T
  runTimeOptions_ConstrRelTolFactor, real_T runTimeOptions_ProbRelTolFactor,
  boolean_T runTimeOptions_RemainFeasible);
static void controller13_PresolveWorkingSet
  (seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
   soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
   sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
   sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager);
static void controller13_computeFirstOrderOpt
  (seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution, const
   sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, int32_T workingset_nVar,
   const real_T workingset_ATwset[36], int32_T workingset_nActiveConstr, real_T
   workspace[36]);
static void controller13_driver(const real_T H[9], const real_T f[3],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
  sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager, real_T
  runTimeOptions_ConstrRelTolFactor, real_T runTimeOptions_ProbRelTolFactor,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective);
static void controller13_linearForm__d(boolean_T obj_hasLinear, int32_T obj_nvar,
  real_T workspace[4], const real_T H[9], const real_T f[3], const real_T x[4]);
static void rate_scheduler(void);
real_T look1_binlxpw(real_T u0, const real_T bp0[], const real_T table[],
                     uint32_T maxIndex)
{
  real_T frac;
  real_T yL_0d0;
  uint32_T iLeft;

  /* Column-major Lookup 1-D
     Search method: 'binary'
     Use previous index: 'off'
     Interpolation method: 'Linear point-slope'
     Extrapolation method: 'Linear'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  /* Prelookup - Index and Fraction
     Index Search method: 'binary'
     Extrapolation method: 'Linear'
     Use previous index: 'off'
     Use last breakpoint for index at or above upper limit: 'off'
     Remove protection against out-of-range input in generated code: 'off'
   */
  if (u0 <= bp0[0U]) {
    iLeft = 0U;
    frac = (u0 - bp0[0U]) / (bp0[1U] - bp0[0U]);
  } else if (u0 < bp0[maxIndex]) {
    uint32_T bpIdx;
    uint32_T iRght;

    /* Binary Search */
    bpIdx = maxIndex >> 1U;
    iLeft = 0U;
    iRght = maxIndex;
    while (iRght - iLeft > 1U) {
      if (u0 < bp0[bpIdx]) {
        iRght = bpIdx;
      } else {
        iLeft = bpIdx;
      }

      bpIdx = (iRght + iLeft) >> 1U;
    }

    frac = (u0 - bp0[iLeft]) / (bp0[iLeft + 1U] - bp0[iLeft]);
  } else {
    iLeft = maxIndex - 1U;
    frac = (u0 - bp0[maxIndex - 1U]) / (bp0[maxIndex] - bp0[maxIndex - 1U]);
  }

  /* Column-major Interpolation 1-D
     Interpolation method: 'Linear point-slope'
     Use last breakpoint for index at or above upper limit: 'off'
     Overflow mode: 'portable wrapping'
   */
  yL_0d0 = table[iLeft];
  return (table[iLeft + 1U] - yL_0d0) * frac + yL_0d0;
}

int32_T div_nde_s32_floor(int32_T numerator, int32_T denominator)
{
  return (((numerator < 0) != (denominator < 0)) && (numerator % denominator !=
           0) ? -1 : 0) + numerator / denominator;
}

/*
 *         This function updates active task flag for each subrate.
 *         The function is called at model base rate, hence the
 *         generated code self-manages all its subrates.
 */
static void rate_scheduler(void)
{
  /* Compute which subrates run during the next base time step.  Subrates
   * are an integer multiple of the base rate counter.  Therefore, the subtask
   * counter is reset when it reaches its limit (zero means run).
   */
  (controller13_M->Timing.TaskCounters.TID[2])++;
  if ((controller13_M->Timing.TaskCounters.TID[2]) > 1) {/* Sample time: [0.001s, 0.0s] */
    controller13_M->Timing.TaskCounters.TID[2] = 0;
  }

  controller13_M->Timing.sampleHits[2] =
    (controller13_M->Timing.TaskCounters.TID[2] == 0) ? 1 : 0;
  (controller13_M->Timing.TaskCounters.TID[3])++;
  if ((controller13_M->Timing.TaskCounters.TID[3]) > 4) {/* Sample time: [0.0025s, 0.0s] */
    controller13_M->Timing.TaskCounters.TID[3] = 0;
  }

  controller13_M->Timing.sampleHits[3] =
    (controller13_M->Timing.TaskCounters.TID[3] == 0) ? 1 : 0;
}

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 13;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  controller13_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  controller13_output();
  controller13_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  controller13_output();
  controller13_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/*
 * System initialize for atomic system:
 *    '<S32>/bee units to SI'
 *    '<S32>/bee units to SI1'
 */
void controller13_beeunitstoSI_Init(DW_beeunitstoSI_controller13_T *localDW)
{
  localDW->sfEvent = controller13_CALL_EVENT;
  localDW->is_active_c15_controller13 = 0U;
}

/*
 * Output and update for atomic system:
 *    '<S32>/bee units to SI'
 *    '<S32>/bee units to SI1'
 */
void controller13_beeunitstoSI(const real_T rtu_s_bee[19],
  B_beeunitstoSI_controller13_T *localB, DW_beeunitstoSI_controller13_T *localDW)
{
  localDW->sfEvent = controller13_CALL_EVENT;
  memcpy(&localB->s_si[0], &rtu_s_bee[0], 19U * sizeof(real_T));
  localB->s_si[0] = rtu_s_bee[0] / 10.0;
  localB->s_si[7] = rtu_s_bee[7] / 10.0;
  localB->s_si[13] = rtu_s_bee[13] / 10000.0;
  localB->s_si[16] = rtu_s_bee[16] / 100000.0;
  localB->s_si[1] = rtu_s_bee[1] / 10.0;
  localB->s_si[8] = rtu_s_bee[8] / 10.0;
  localB->s_si[14] = rtu_s_bee[14] / 10000.0;
  localB->s_si[17] = rtu_s_bee[17] / 100000.0;
  localB->s_si[2] = rtu_s_bee[2] / 10.0;
  localB->s_si[9] = rtu_s_bee[9] / 10.0;
  localB->s_si[15] = rtu_s_bee[15] / 10000.0;
  localB->s_si[18] = rtu_s_bee[18] / 100000.0;
}

real_T rt_urand_Upu32_Yd_f_pw_snf(uint32_T *u)
{
  uint32_T hi;
  uint32_T lo;

  /* Uniform random number generator (random number between 0 and 1)

     #define IA      16807                      magic multiplier = 7^5
     #define IM      2147483647                 modulus = 2^31-1
     #define IQ      127773                     IM div IA
     #define IR      2836                       IM modulo IA
     #define S       4.656612875245797e-10      reciprocal of 2^31-1
     test = IA * (seed % IQ) - IR * (seed/IQ)
     seed = test < 0 ? (test + IM) : test
     return (seed*S)
   */
  lo = *u % 127773U * 16807U;
  hi = *u / 127773U * 2836U;
  if (lo < hi) {
    *u = 2147483647U - (hi - lo);
  } else {
    *u = lo - hi;
  }

  return (real_T)*u * 4.6566128752457969E-10;
}

real_T rt_nrand_Upu32_Yd_f_pw_snf(uint32_T *u)
{
  real_T si;
  real_T sr;
  real_T y;

  /* Normal (Gaussian) random number generator */
  do {
    sr = 2.0 * rt_urand_Upu32_Yd_f_pw_snf(u) - 1.0;
    si = 2.0 * rt_urand_Upu32_Yd_f_pw_snf(u) - 1.0;
    si = sr * sr + si * si;
  } while (si > 1.0);

  y = sqrt(-2.0 * log(si) / si) * sr;
  return y;
}

real_T rt_atan2d_snf(real_T u0, real_T u1)
{
  real_T y;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else if (rtIsInf(u0) && rtIsInf(u1)) {
    int32_T tmp;
    int32_T tmp_0;
    if (u0 > 0.0) {
      tmp = 1;
    } else {
      tmp = -1;
    }

    if (u1 > 0.0) {
      tmp_0 = 1;
    } else {
      tmp_0 = -1;
    }

    y = atan2(tmp, tmp_0);
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = atan2(u0, u1);
  }

  return y;
}

static void controller13_expand_atan2_m(const real_T a_data[], const int32_T
  a_size[3], const real_T b_data[], const int32_T b_size[3], real_T c_data[],
  int32_T c_size[3])
{
  int32_T c_data_tmp;
  c_size[0] = 1;
  c_size[1] = 1;
  if (b_size[2] == 1) {
    c_size[2] = a_size[2];
    c_data_tmp = a_size[2];
  } else {
    c_size[2] = 0;
    c_data_tmp = 0;
  }

  if (c_data_tmp != 0) {
    c_data[0] = rt_atan2d_snf(a_data[0], b_data[0]);
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzlascl(real_T cfrom, real_T cto, real_T A[16])
{
  real_T cfromc;
  real_T ctoc;
  int32_T i;
  boolean_T notdone;
  cfromc = cfrom;
  ctoc = cto;
  notdone = true;
  while (notdone) {
    real_T cfrom1;
    real_T cto1;
    real_T mul;
    cfrom1 = cfromc * 2.0041683600089728E-292;
    cto1 = ctoc / 4.9896007738368E+291;
    if ((fabs(cfrom1) > fabs(ctoc)) && (ctoc != 0.0)) {
      mul = 2.0041683600089728E-292;
      cfromc = cfrom1;
    } else if (fabs(cto1) > fabs(cfromc)) {
      mul = 4.9896007738368E+291;
      ctoc = cto1;
    } else {
      mul = ctoc / cfromc;
      notdone = false;
    }

    for (i = 0; i <= 14; i += 2) {
      __m128d tmp;
      tmp = _mm_loadu_pd(&A[i]);
      _mm_storeu_pd(&A[i], _mm_mul_pd(tmp, _mm_set1_pd(mul)));
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static real_T controller13_xnrm2(int32_T n, const real_T x[16], int32_T ix0)
{
  real_T y;
  int32_T k;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[ix0 - 1]);
    } else {
      real_T scale;
      int32_T kend;
      scale = 3.3121686421112381E-170;
      kend = (ix0 + n) - 1;
      for (k = ix0; k <= kend; k++) {
        real_T absxk;
        absxk = fabs(x[k - 1]);
        if (absxk > scale) {
          real_T t;
          t = scale / absxk;
          y = y * t * t + 1.0;
          scale = absxk;
        } else {
          real_T t;
          t = absxk / scale;
          y += t * t;
        }
      }

      y = scale * sqrt(y);
    }
  }

  return y;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzgebal(real_T A[16], int32_T *ilo, int32_T *ihi,
  real_T scale[4])
{
  __m128d tmp;
  real_T absxk;
  real_T b_scale;
  real_T c;
  real_T g;
  real_T r;
  real_T s;
  real_T t;
  int32_T c_i;
  int32_T c_ix0;
  int32_T c_tmp;
  int32_T c_tmp_0;
  int32_T exitg1;
  int32_T exitg2;
  int32_T exitg4;
  int32_T exitg5;
  int32_T f_ix;
  int32_T f_ix_tmp;
  int32_T ica;
  int32_T kend;
  boolean_T exitg3;
  boolean_T exitg6;
  boolean_T exitg7;
  boolean_T notdone;
  boolean_T skipThisColumn;
  scale[0] = 1.0;
  scale[1] = 1.0;
  scale[2] = 1.0;
  scale[3] = 1.0;
  *ilo = 1;
  *ihi = 4;
  notdone = true;
  do {
    exitg5 = 0;
    if (notdone) {
      notdone = false;
      c_i = *ihi;
      do {
        exitg4 = 0;
        if (c_i > 0) {
          skipThisColumn = false;
          f_ix = 0;
          exitg6 = false;
          while ((!exitg6) && (f_ix <= (uint8_T)*ihi - 1)) {
            if ((f_ix + 1 == c_i) || (!(A[((f_ix << 2) + c_i) - 1] != 0.0))) {
              f_ix++;
            } else {
              skipThisColumn = true;
              exitg6 = true;
            }
          }

          if (skipThisColumn) {
            c_i--;
          } else {
            scale[*ihi - 1] = c_i;
            if (c_i != *ihi) {
              ica = (c_i - 1) << 2;
              kend = (*ihi - 1) << 2;
              c_ix0 = (uint8_T)*ihi;
              for (f_ix = 0; f_ix < c_ix0; f_ix++) {
                c_tmp = ica + f_ix;
                c = A[c_tmp];
                f_ix_tmp = kend + f_ix;
                A[c_tmp] = A[f_ix_tmp];
                A[f_ix_tmp] = c;
              }

              c = A[c_i - 1];
              A[c_i - 1] = A[*ihi - 1];
              A[*ihi - 1] = c;
              c = A[c_i + 3];
              A[c_i + 3] = A[*ihi + 3];
              A[*ihi + 3] = c;
              c = A[c_i + 7];
              A[c_i + 7] = A[*ihi + 7];
              A[*ihi + 7] = c;
              c = A[c_i + 11];
              A[c_i + 11] = A[*ihi + 11];
              A[*ihi + 11] = c;
            }

            exitg4 = 1;
          }
        } else {
          exitg4 = 2;
        }
      } while (exitg4 == 0);

      if (exitg4 == 1) {
        if (*ihi == 1) {
          exitg5 = 1;
        } else {
          (*ihi)--;
          notdone = true;
        }
      }
    } else {
      notdone = true;
      while (notdone) {
        notdone = false;
        c_i = *ilo;
        exitg6 = false;
        while ((!exitg6) && (c_i <= *ihi)) {
          skipThisColumn = false;
          f_ix = *ilo;
          exitg7 = false;
          while ((!exitg7) && (f_ix <= *ihi)) {
            if ((f_ix == c_i) || (!(A[(((c_i - 1) << 2) + f_ix) - 1] != 0.0))) {
              f_ix++;
            } else {
              skipThisColumn = true;
              exitg7 = true;
            }
          }

          if (skipThisColumn) {
            c_i++;
          } else {
            scale[*ilo - 1] = c_i;
            if (c_i != *ilo) {
              ica = (c_i - 1) << 2;
              c_tmp_0 = (*ilo - 1) << 2;
              c_ix0 = (uint8_T)*ihi;
              for (f_ix = 0; f_ix < c_ix0; f_ix++) {
                c_tmp = ica + f_ix;
                c = A[c_tmp];
                f_ix_tmp = c_tmp_0 + f_ix;
                A[c_tmp] = A[f_ix_tmp];
                A[f_ix_tmp] = c;
              }

              f_ix = (c_tmp_0 + c_i) - 1;
              ica = (c_tmp_0 + *ilo) - 1;
              kend = (uint8_T)(5 - *ilo);
              for (c_i = 0; c_i < kend; c_i++) {
                c_tmp = c_i << 2;
                c_tmp_0 = c_tmp + f_ix;
                c = A[c_tmp_0];
                f_ix_tmp = c_tmp + ica;
                A[c_tmp_0] = A[f_ix_tmp];
                A[f_ix_tmp] = c;
              }
            }

            (*ilo)++;
            notdone = true;
            exitg6 = true;
          }
        }
      }

      exitg5 = 2;
    }
  } while (exitg5 == 0);

  if (exitg5 == 1) {
  } else {
    exitg3 = false;
    while ((!exitg3) && (!notdone)) {
      notdone = true;
      c_i = *ilo - 1;
      do {
        exitg2 = 0;
        if (c_i + 1 <= *ihi) {
          c_tmp = (*ihi - *ilo) + 1;
          c_tmp_0 = c_i << 2;
          c = controller13_xnrm2(c_tmp, A, c_tmp_0 + *ilo);
          f_ix_tmp = ((*ilo - 1) << 2) + c_i;
          r = 0.0;
          if (c_tmp >= 1) {
            if (c_tmp == 1) {
              r = fabs(A[f_ix_tmp]);
            } else {
              b_scale = 3.3121686421112381E-170;
              kend = (((c_tmp - 1) << 2) + f_ix_tmp) + 1;
              for (ica = f_ix_tmp + 1; ica <= kend; ica += 4) {
                absxk = fabs(A[ica - 1]);
                if (absxk > b_scale) {
                  t = b_scale / absxk;
                  r = r * t * t + 1.0;
                  b_scale = absxk;
                } else {
                  t = absxk / b_scale;
                  r += t * t;
                }
              }

              r = b_scale * sqrt(r);
            }
          }

          ica = 1;
          if (*ihi > 1) {
            b_scale = fabs(A[c_tmp_0]);
            for (f_ix = 2; f_ix <= *ihi; f_ix++) {
              absxk = fabs(A[(c_tmp_0 + f_ix) - 1]);
              if (absxk > b_scale) {
                ica = f_ix;
                b_scale = absxk;
              }
            }
          }

          b_scale = fabs(A[(c_tmp_0 + ica) - 1]);
          f_ix = 5 - *ilo;
          if (5 - *ilo < 1) {
            ica = 0;
          } else {
            ica = 1;
            if (5 - *ilo > 1) {
              absxk = fabs(A[f_ix_tmp]);
              for (c_ix0 = 2; c_ix0 <= f_ix; c_ix0++) {
                t = fabs(A[((c_ix0 - 1) << 2) + f_ix_tmp]);
                if (t > absxk) {
                  ica = c_ix0;
                  absxk = t;
                }
              }
            }
          }

          t = fabs(A[(((ica + *ilo) - 2) << 2) + c_i]);
          if ((c == 0.0) || (r == 0.0)) {
            c_i++;
          } else {
            g = r / 2.0;
            absxk = 1.0;
            s = c + r;
            do {
              exitg1 = 0;
              if ((c < g) && (fmax(absxk, fmax(c, b_scale)) <
                              4.9896007738368E+291) && (fmin(r, fmin(g, t)) >
                   2.0041683600089728E-292)) {
                if (rtIsNaN(((((c + absxk) + b_scale) + r) + g) + t)) {
                  exitg1 = 1;
                } else {
                  absxk *= 2.0;
                  c *= 2.0;
                  b_scale *= 2.0;
                  r /= 2.0;
                  g /= 2.0;
                  t /= 2.0;
                }
              } else {
                g = c / 2.0;
                while ((g >= r) && (fmax(r, t) < 4.9896007738368E+291) && (fmin
                        (fmin(absxk, c), fmin(g, b_scale)) >
                        2.0041683600089728E-292)) {
                  absxk /= 2.0;
                  c /= 2.0;
                  g /= 2.0;
                  b_scale /= 2.0;
                  r *= 2.0;
                  t *= 2.0;
                }

                if ((c + r >= 0.95 * s) || ((absxk < 1.0) && (scale[c_i] < 1.0) &&
                     (absxk * scale[c_i] <= 1.0020841800044864E-292)) || ((absxk
                      > 1.0) && (scale[c_i] > 1.0) && (scale[c_i] >=
                      9.9792015476736E+291 / absxk))) {
                } else {
                  c = 1.0 / absxk;
                  scale[c_i] *= absxk;
                  ica = f_ix_tmp + 1;
                  kend = (((4 - *ilo) << 2) + f_ix_tmp) + 1;
                  for (f_ix = ica; f_ix <= kend; f_ix += 4) {
                    A[f_ix - 1] *= c;
                  }

                  kend = c_tmp_0 + *ihi;
                  ica = ((((kend - c_tmp_0) / 2) << 1) + c_tmp_0) + 1;
                  c_ix0 = ica - 2;
                  for (f_ix = c_tmp_0 + 1; f_ix <= c_ix0; f_ix += 2) {
                    tmp = _mm_loadu_pd(&A[f_ix - 1]);
                    _mm_storeu_pd(&A[f_ix - 1], _mm_mul_pd(tmp, _mm_set1_pd
                      (absxk)));
                  }

                  for (f_ix = ica; f_ix <= kend; f_ix++) {
                    A[f_ix - 1] *= absxk;
                  }

                  notdone = false;
                }

                exitg1 = 2;
              }
            } while (exitg1 == 0);

            if (exitg1 == 1) {
              exitg2 = 2;
            } else {
              c_i++;
            }
          }
        } else {
          exitg2 = 1;
        }
      } while (exitg2 == 0);

      if (exitg2 == 1) {
      } else {
        exitg3 = true;
      }
    }
  }
}

real_T rt_hypotd_snf(real_T u0, real_T u1)
{
  real_T a;
  real_T b;
  real_T y;
  a = fabs(u0);
  b = fabs(u1);
  if (a < b) {
    a /= b;
    y = sqrt(a * a + 1.0) * b;
  } else if (a > b) {
    b /= a;
    y = sqrt(b * b + 1.0) * a;
  } else if (rtIsNaN(b)) {
    y = (rtNaN);
  } else {
    y = a * 1.4142135623730951;
  }

  return y;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static real_T controller13_xzlarfg(int32_T n, real_T *alpha1, real_T x[16],
  int32_T ix0)
{
  __m128d tmp;
  real_T a;
  real_T tau;
  real_T xnorm;
  int32_T c;
  int32_T knt;
  int32_T scalarLB;
  int32_T vectorUB;
  int32_T vectorUB_tmp;
  tau = 0.0;
  if (n > 0) {
    xnorm = controller13_xnrm2(n - 1, x, ix0);
    if (xnorm != 0.0) {
      xnorm = rt_hypotd_snf(*alpha1, xnorm);
      if (*alpha1 >= 0.0) {
        xnorm = -xnorm;
      }

      if (fabs(xnorm) < 1.0020841800044864E-292) {
        knt = 0;
        do {
          knt++;
          scalarLB = (ix0 + n) - 2;
          vectorUB = ((((scalarLB - ix0) + 1) / 2) << 1) + ix0;
          vectorUB_tmp = vectorUB - 2;
          for (c = ix0; c <= vectorUB_tmp; c += 2) {
            tmp = _mm_loadu_pd(&x[c - 1]);
            _mm_storeu_pd(&x[c - 1], _mm_mul_pd(tmp, _mm_set1_pd
              (9.9792015476736E+291)));
          }

          for (c = vectorUB; c <= scalarLB; c++) {
            x[c - 1] *= 9.9792015476736E+291;
          }

          xnorm *= 9.9792015476736E+291;
          *alpha1 *= 9.9792015476736E+291;
        } while ((fabs(xnorm) < 1.0020841800044864E-292) && (knt < 20));

        xnorm = rt_hypotd_snf(*alpha1, controller13_xnrm2(n - 1, x, ix0));
        if (*alpha1 >= 0.0) {
          xnorm = -xnorm;
        }

        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        for (c = ix0; c <= vectorUB_tmp; c += 2) {
          tmp = _mm_loadu_pd(&x[c - 1]);
          _mm_storeu_pd(&x[c - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (c = vectorUB; c <= scalarLB; c++) {
          x[c - 1] *= a;
        }

        for (c = 0; c < knt; c++) {
          xnorm *= 1.0020841800044864E-292;
        }

        *alpha1 = xnorm;
      } else {
        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        c = (ix0 + n) - 2;
        scalarLB = ((((c - ix0) + 1) / 2) << 1) + ix0;
        vectorUB = scalarLB - 2;
        for (knt = ix0; knt <= vectorUB; knt += 2) {
          tmp = _mm_loadu_pd(&x[knt - 1]);
          _mm_storeu_pd(&x[knt - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (knt = scalarLB; knt <= c; knt++) {
          x[knt - 1] *= a;
        }

        *alpha1 = xnorm;
      }
    }
  }

  return tau;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzlarf(int32_T m, int32_T n, int32_T iv0, real_T tau,
  real_T C[16], int32_T ic0, real_T work[4])
{
  int32_T coltop;
  int32_T jA;
  int32_T lastc;
  int32_T lastv;
  if (tau != 0.0) {
    boolean_T exitg2;
    lastv = m;
    lastc = iv0 + m;
    while ((lastv > 0) && (C[lastc - 2] == 0.0)) {
      lastv--;
      lastc--;
    }

    lastc = n;
    exitg2 = false;
    while ((!exitg2) && (lastc > 0)) {
      int32_T exitg1;
      coltop = ((lastc - 1) << 2) + ic0;
      jA = coltop;
      do {
        exitg1 = 0;
        if (jA <= (coltop + lastv) - 1) {
          if (C[jA - 1] != 0.0) {
            exitg1 = 1;
          } else {
            jA++;
          }
        } else {
          lastc--;
          exitg1 = 2;
        }
      } while (exitg1 == 0);

      if (exitg1 == 1) {
        exitg2 = true;
      }
    }
  } else {
    lastv = 0;
    lastc = 0;
  }

  if (lastv > 0) {
    real_T c;
    int32_T d;
    int32_T e;
    if (lastc != 0) {
      memset(&work[0], 0, (uint8_T)lastc * sizeof(real_T));
      d = ((lastc - 1) << 2) + ic0;
      for (coltop = ic0; coltop <= d; coltop += 4) {
        c = 0.0;
        e = (coltop + lastv) - 1;
        for (jA = coltop; jA <= e; jA++) {
          c += C[((iv0 + jA) - coltop) - 1] * C[jA - 1];
        }

        jA = (coltop - ic0) >> 2;
        work[jA] += c;
      }
    }

    if (!(-tau == 0.0)) {
      jA = ic0;
      d = (uint8_T)lastc;
      for (lastc = 0; lastc < d; lastc++) {
        c = work[lastc];
        if (c != 0.0) {
          c *= -tau;
          e = lastv + jA;
          for (coltop = jA; coltop < e; coltop++) {
            C[coltop - 1] += C[((iv0 + coltop) - jA) - 1] * c;
          }
        }

        jA += 4;
      }
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzgehrd(real_T a[16], int32_T ilo, int32_T ihi, real_T
  tau[3])
{
  __m128d tmp;
  __m128d tmp_0;
  real_T work[4];
  real_T alpha1;
  real_T tau_0;
  real_T temp;
  int32_T alpha1_tmp_tmp;
  int32_T b_ia;
  int32_T b_ix;
  int32_T e;
  int32_T exitg1;
  int32_T i;
  int32_T im1n;
  int32_T ix;
  int32_T lastc;
  int32_T lastv;
  int32_T rowleft;
  int32_T tau_tmp;
  int32_T work_tmp;
  boolean_T exitg2;
  if ((ihi - ilo) + 1 > 1) {
    if ((uint8_T)(ilo - 1) - 1 >= 0) {
      memset(&tau[0], 0, (uint8_T)(ilo - 1) * sizeof(real_T));
    }

    for (i = ihi; i < 4; i++) {
      tau[i - 1] = 0.0;
    }

    work[0] = 0.0;
    work[1] = 0.0;
    work[2] = 0.0;
    work[3] = 0.0;
    for (i = ilo; i < ihi; i++) {
      rowleft = (i - 1) << 2;
      im1n = i << 2;
      alpha1_tmp_tmp = rowleft + i;
      alpha1 = a[alpha1_tmp_tmp];
      if (i + 2 <= 4) {
        lastv = i + 2;
      } else {
        lastv = 4;
      }

      tau_tmp = ihi - i;
      tau_0 = controller13_xzlarfg(tau_tmp, &alpha1, a, rowleft + lastv);
      tau[i - 1] = tau_0;
      a[alpha1_tmp_tmp] = 1.0;
      lastv = tau_tmp;
      if (tau_0 != 0.0) {
        lastc = alpha1_tmp_tmp + tau_tmp;
        while ((lastv > 0) && (a[lastc - 1] == 0.0)) {
          lastv--;
          lastc--;
        }

        lastc = ihi;
        exitg2 = false;
        while ((!exitg2) && (lastc > 0)) {
          rowleft = im1n + lastc;
          b_ia = rowleft;
          do {
            exitg1 = 0;
            if (b_ia <= ((lastv - 1) << 2) + rowleft) {
              if (a[b_ia - 1] != 0.0) {
                exitg1 = 1;
              } else {
                b_ia += 4;
              }
            } else {
              lastc--;
              exitg1 = 2;
            }
          } while (exitg1 == 0);

          if (exitg1 == 1) {
            exitg2 = true;
          }
        }
      } else {
        lastv = 0;
        lastc = 0;
      }

      if (lastv > 0) {
        if (lastc != 0) {
          memset(&work[0], 0, (uint8_T)lastc * sizeof(real_T));
          ix = alpha1_tmp_tmp;
          b_ix = (((lastv - 1) << 2) + im1n) + 1;
          for (rowleft = im1n + 1; rowleft <= b_ix; rowleft += 4) {
            e = (rowleft + lastc) - 1;
            for (b_ia = rowleft; b_ia <= e; b_ia++) {
              work_tmp = b_ia - rowleft;
              work[work_tmp] += a[b_ia - 1] * a[ix];
            }

            ix++;
          }
        }

        tau_0 = -tau[i - 1];
        if (!(tau_0 == 0.0)) {
          rowleft = im1n + 1;
          ix = (uint8_T)lastv;
          for (lastv = 0; lastv < ix; lastv++) {
            temp = a[alpha1_tmp_tmp + lastv];
            if (temp != 0.0) {
              temp *= tau_0;
              b_ix = (lastc + rowleft) - 1;
              e = ((((b_ix - rowleft) + 1) / 2) << 1) + rowleft;
              work_tmp = e - 2;
              for (b_ia = rowleft; b_ia <= work_tmp; b_ia += 2) {
                tmp = _mm_loadu_pd(&work[b_ia - rowleft]);
                tmp_0 = _mm_loadu_pd(&a[b_ia - 1]);
                _mm_storeu_pd(&a[b_ia - 1], _mm_add_pd(_mm_mul_pd(tmp,
                  _mm_set1_pd(temp)), tmp_0));
              }

              for (b_ia = e; b_ia <= b_ix; b_ia++) {
                a[b_ia - 1] += work[b_ia - rowleft] * temp;
              }
            }

            rowleft += 4;
          }
        }
      }

      controller13_xzlarf(tau_tmp, 4 - i, alpha1_tmp_tmp + 1, tau[i - 1], a, (i
        + im1n) + 1, work);
      a[alpha1_tmp_tmp] = alpha1;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzunghr(int32_T ilo, int32_T ihi, real_T A[16], const
  real_T tau[3])
{
  __m128d tmp;
  real_T work[4];
  int32_T b_ia;
  int32_T e;
  int32_T f_i;
  int32_T ia;
  int32_T itau;
  int32_T k;
  int32_T nh;
  int32_T scalarLB;
  int32_T vectorUB;
  nh = ihi - ilo;
  for (itau = ihi; itau >= ilo + 1; itau--) {
    ia = (itau - 1) << 2;
    memset(&A[ia], 0, (uint32_T)(((uint8_T)(itau - 1) + ia) - ia) * sizeof
           (real_T));
    for (f_i = itau + 1; f_i <= ihi; f_i++) {
      k = ia + f_i;
      A[k - 1] = A[k - 5];
    }

    if (ihi + 1 <= 4) {
      memset(&A[ihi + ia], 0, (uint32_T)(((ia - ihi) - ia) + 4) * sizeof(real_T));
    }
  }

  b_ia = (uint8_T)ilo;
  for (itau = 0; itau < b_ia; itau++) {
    ia = itau << 2;
    A[ia] = 0.0;
    A[ia + 1] = 0.0;
    A[ia + 2] = 0.0;
    A[ia + 3] = 0.0;
    A[ia + itau] = 1.0;
  }

  for (itau = ihi + 1; itau < 5; itau++) {
    ia = (itau - 1) << 2;
    A[ia] = 0.0;
    A[ia + 1] = 0.0;
    A[ia + 2] = 0.0;
    A[ia + 3] = 0.0;
    A[(ia + itau) - 1] = 1.0;
  }

  ia = (ilo << 2) + ilo;
  if (nh >= 1) {
    for (itau = nh; itau < nh; itau++) {
      b_ia = (itau << 2) + ia;
      memset(&A[b_ia], 0, (uint32_T)((nh + b_ia) - b_ia) * sizeof(real_T));
      A[b_ia + itau] = 1.0;
    }

    itau = (ilo + nh) - 2;
    work[0] = 0.0;
    work[1] = 0.0;
    work[2] = 0.0;
    work[3] = 0.0;
    for (f_i = nh; f_i >= 1; f_i--) {
      b_ia = (((f_i - 1) << 2) + ia) + f_i;
      if (f_i < nh) {
        A[b_ia - 1] = 1.0;
        k = nh - f_i;
        controller13_xzlarf(k + 1, k, b_ia, tau[itau], A, b_ia + 4, work);
        e = (b_ia + nh) - f_i;
        scalarLB = ((((e - b_ia) / 2) << 1) + b_ia) + 1;
        vectorUB = scalarLB - 2;
        for (k = b_ia + 1; k <= vectorUB; k += 2) {
          tmp = _mm_loadu_pd(&A[k - 1]);
          _mm_storeu_pd(&A[k - 1], _mm_mul_pd(tmp, _mm_set1_pd(-tau[itau])));
        }

        for (k = scalarLB; k <= e; k++) {
          A[k - 1] *= -tau[itau];
        }
      }

      A[b_ia - 1] = 1.0 - tau[itau];
      e = (uint8_T)(f_i - 1);
      for (k = 0; k < e; k++) {
        A[(b_ia - k) - 2] = 0.0;
      }

      itau--;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static real_T controller13_xnrm2_b(int32_T n, const real_T x[3])
{
  real_T y;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[1]);
    } else {
      real_T absxk;
      real_T scale;
      real_T t;
      scale = 3.3121686421112381E-170;
      absxk = fabs(x[1]);
      if (absxk > 3.3121686421112381E-170) {
        y = 1.0;
        scale = absxk;
      } else {
        t = absxk / 3.3121686421112381E-170;
        y = t * t;
      }

      absxk = fabs(x[2]);
      if (absxk > scale) {
        t = scale / absxk;
        y = y * t * t + 1.0;
        scale = absxk;
      } else {
        t = absxk / scale;
        y += t * t;
      }

      y = scale * sqrt(y);
    }
  }

  return y;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static real_T controller13_xzlarfg_b(int32_T n, real_T *alpha1, real_T x[3])
{
  __m128d tmp;
  real_T a;
  real_T tau;
  real_T xnorm;
  int32_T knt;
  int32_T scalarLB;
  int32_T vectorUB;
  int32_T vectorUB_tmp;
  tau = 0.0;
  if (n > 0) {
    xnorm = controller13_xnrm2_b(n - 1, x);
    if (xnorm != 0.0) {
      xnorm = rt_hypotd_snf(*alpha1, xnorm);
      if (*alpha1 >= 0.0) {
        xnorm = -xnorm;
      }

      if (fabs(xnorm) < 1.0020841800044864E-292) {
        knt = 0;
        do {
          knt++;
          vectorUB = (((n - 1) / 2) << 1) + 2;
          vectorUB_tmp = vectorUB - 2;
          for (scalarLB = 2; scalarLB <= vectorUB_tmp; scalarLB += 2) {
            tmp = _mm_loadu_pd(&x[scalarLB - 1]);
            _mm_storeu_pd(&x[scalarLB - 1], _mm_mul_pd(tmp, _mm_set1_pd
              (9.9792015476736E+291)));
          }

          for (scalarLB = vectorUB; scalarLB <= n; scalarLB++) {
            x[scalarLB - 1] *= 9.9792015476736E+291;
          }

          xnorm *= 9.9792015476736E+291;
          *alpha1 *= 9.9792015476736E+291;
        } while ((fabs(xnorm) < 1.0020841800044864E-292) && (knt < 20));

        xnorm = rt_hypotd_snf(*alpha1, controller13_xnrm2_b(n - 1, x));
        if (*alpha1 >= 0.0) {
          xnorm = -xnorm;
        }

        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        for (scalarLB = 2; scalarLB <= vectorUB_tmp; scalarLB += 2) {
          tmp = _mm_loadu_pd(&x[scalarLB - 1]);
          _mm_storeu_pd(&x[scalarLB - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (scalarLB = vectorUB; scalarLB <= n; scalarLB++) {
          x[scalarLB - 1] *= a;
        }

        for (scalarLB = 0; scalarLB < knt; scalarLB++) {
          xnorm *= 1.0020841800044864E-292;
        }

        *alpha1 = xnorm;
      } else {
        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        scalarLB = (((n - 1) / 2) << 1) + 2;
        vectorUB = scalarLB - 2;
        for (knt = 2; knt <= vectorUB; knt += 2) {
          tmp = _mm_loadu_pd(&x[knt - 1]);
          _mm_storeu_pd(&x[knt - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (knt = scalarLB; knt <= n; knt++) {
          x[knt - 1] *= a;
        }

        *alpha1 = xnorm;
      }
    }
  }

  return tau;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdlanv2(real_T *a, real_T *b, real_T *c, real_T *d,
  real_T *rt1r, real_T *rt1i, real_T *rt2r, real_T *rt2i, real_T *cs, real_T *sn)
{
  real_T bcmax;
  real_T bcmis;
  real_T p;
  real_T scale;
  real_T temp;
  real_T z;
  int32_T count;
  int32_T tmp;
  if (*c == 0.0) {
    *cs = 1.0;
    *sn = 0.0;
  } else if (*b == 0.0) {
    *cs = 0.0;
    *sn = 1.0;
    temp = *d;
    *d = *a;
    *a = temp;
    *b = -*c;
    *c = 0.0;
  } else {
    temp = *a - *d;
    if ((temp == 0.0) && ((*b < 0.0) != (*c < 0.0))) {
      *cs = 1.0;
      *sn = 0.0;
    } else {
      p = 0.5 * temp;
      bcmis = fabs(*b);
      scale = fabs(*c);
      bcmax = fmax(bcmis, scale);
      if (!(*b < 0.0)) {
        count = 1;
      } else {
        count = -1;
      }

      if (!(*c < 0.0)) {
        tmp = 1;
      } else {
        tmp = -1;
      }

      bcmis = fmin(bcmis, scale) * (real_T)count * (real_T)tmp;
      scale = fmax(fabs(p), bcmax);
      z = p / scale * p + bcmax / scale * bcmis;
      if (z >= 8.8817841970012523E-16) {
        if (!(p < 0.0)) {
          temp = sqrt(scale) * sqrt(z);
        } else {
          temp = -(sqrt(scale) * sqrt(z));
        }

        z = p + temp;
        *a = *d + z;
        *d -= bcmax / z * bcmis;
        bcmax = rt_hypotd_snf(*c, z);
        *cs = z / bcmax;
        *sn = *c / bcmax;
        *b -= *c;
        *c = 0.0;
      } else {
        p = *b + *c;
        scale = fmax(fabs(temp), fabs(p));
        count = 0;
        while ((scale >= 7.4428285367870146E+137) && (count <= 20)) {
          p *= 1.3435752215134178E-138;
          temp *= 1.3435752215134178E-138;
          scale = fmax(fabs(temp), fabs(p));
          count++;
        }

        while ((scale <= 1.3435752215134178E-138) && (count <= 20)) {
          p *= 7.4428285367870146E+137;
          temp *= 7.4428285367870146E+137;
          scale = fmax(fabs(temp), fabs(p));
          count++;
        }

        bcmax = rt_hypotd_snf(p, temp);
        *cs = sqrt((fabs(p) / bcmax + 1.0) * 0.5);
        if (!(p < 0.0)) {
          count = 1;
        } else {
          count = -1;
        }

        *sn = -(0.5 * temp / (bcmax * *cs)) * (real_T)count;
        temp = *a * *cs + *b * *sn;
        p = -*a * *sn + *b * *cs;
        bcmax = *c * *cs + *d * *sn;
        bcmis = -*c * *sn + *d * *cs;
        *b = p * *cs + bcmis * *sn;
        *c = -temp * *sn + bcmax * *cs;
        temp = ((temp * *cs + bcmax * *sn) + (-p * *sn + bcmis * *cs)) * 0.5;
        *a = temp;
        *d = temp;
        if (*c != 0.0) {
          if (*b != 0.0) {
            if ((*b < 0.0) == (*c < 0.0)) {
              scale = sqrt(fabs(*b));
              bcmis = sqrt(fabs(*c));
              p = scale * bcmis;
              if (*c < 0.0) {
                p = -p;
              }

              bcmax = 1.0 / sqrt(fabs(*b + *c));
              *a = temp + p;
              *d = temp - p;
              *b -= *c;
              *c = 0.0;
              p = scale * bcmax;
              bcmax *= bcmis;
              temp = *cs * p - *sn * bcmax;
              *sn = *cs * bcmax + *sn * p;
              *cs = temp;
            }
          } else {
            *b = -*c;
            *c = 0.0;
            temp = *cs;
            *cs = -*sn;
            *sn = temp;
          }
        }
      }
    }
  }

  *rt1r = *a;
  *rt2r = *d;
  if (*c == 0.0) {
    *rt1i = 0.0;
    *rt2i = 0.0;
  } else {
    *rt1i = sqrt(fabs(*b)) * sqrt(fabs(*c));
    *rt2i = -*rt1i;
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdlahqr(int32_T ilo, int32_T ihi, real_T h[16], int32_T
  iloz, int32_T ihiz, real_T z[16], int32_T *info, real_T wr[4], real_T wi[4])
{
  real_T v[3];
  real_T bb;
  real_T h12;
  real_T h21;
  real_T h22;
  real_T h22_tmp;
  real_T h_0;
  real_T s;
  real_T s_tmp;
  real_T smlnum;
  real_T tst;
  int32_T c_ix;
  int32_T d_k;
  int32_T h_tmp;
  int32_T h_tmp_0;
  int32_T i;
  int32_T ix0;
  int32_T iy;
  int32_T k;
  int32_T kdefl;
  int32_T l;
  int32_T m;
  int32_T nr;
  int32_T nz;
  boolean_T converged;
  boolean_T exitg1;
  boolean_T exitg2;
  boolean_T exitg3;
  *info = 0;
  l = (uint8_T)(ilo - 1);
  for (nz = 0; nz < l; nz++) {
    wr[nz] = h[(nz << 2) + nz];
    wi[nz] = 0.0;
  }

  for (nz = ihi + 1; nz < 5; nz++) {
    wr[nz - 1] = h[(((nz - 1) << 2) + nz) - 1];
    wi[nz - 1] = 0.0;
  }

  if (ilo == ihi) {
    wr[ilo - 1] = h[(((ilo - 1) << 2) + ilo) - 1];
    wi[ilo - 1] = 0.0;
  } else {
    for (nz = ilo; nz <= ihi - 3; nz++) {
      h[2] = 0.0;
      h[3] = 0.0;
    }

    if (ilo <= ihi - 2) {
      h[(ihi + ((ihi - 3) << 2)) - 1] = 0.0;
    }

    nz = (ihiz - iloz) + 1;
    smlnum = (real_T)((ihi - ilo) + 1) / 2.2204460492503131E-16 *
      2.2250738585072014E-308;
    kdefl = 0;
    i = ihi - 1;
    exitg1 = false;
    while ((!exitg1) && (i + 1 >= ilo)) {
      l = ilo;
      converged = false;
      iy = 0;
      exitg2 = false;
      while ((!exitg2) && (iy < 301)) {
        k = i;
        exitg3 = false;
        while ((!exitg3) && (k + 1 > l)) {
          m = ((k - 1) << 2) + k;
          h22_tmp = fabs(h[m]);
          if (h22_tmp <= smlnum) {
            exitg3 = true;
          } else {
            c_ix = (k << 2) + k;
            h12 = h[c_ix];
            s = fabs(h12);
            bb = h[m - 1];
            tst = fabs(bb) + s;
            if (tst == 0.0) {
              if (k - 1 >= ilo) {
                tst = fabs(h[(((k - 2) << 2) + k) - 1]);
              }

              if (k + 2 <= ihi) {
                tst += fabs(h[c_ix + 1]);
              }
            }

            if (h22_tmp <= 2.2204460492503131E-16 * tst) {
              h22 = fabs(bb - h12);
              tst = fmax(s, h22);
              bb = fmin(s, h22);
              s = tst + bb;
              h21 = fabs(h[c_ix - 1]);
              if (fmax(h22_tmp, h21) / s * fmin(h22_tmp, h21) <= fmax(smlnum,
                   tst / s * bb * 2.2204460492503131E-16)) {
                exitg3 = true;
              } else {
                k--;
              }
            } else {
              k--;
            }
          }
        }

        l = k + 1;
        if (k + 1 > ilo) {
          h[k + ((k - 1) << 2)] = 0.0;
        }

        if (k + 1 >= i) {
          converged = true;
          exitg2 = true;
        } else {
          kdefl++;
          if (kdefl - kdefl / 20 * 20 == 0) {
            s = fabs(h[(((i - 2) << 2) + i) - 1]) + fabs(h[((i - 1) << 2) + i]);
            bb = h[(i << 2) + i] + 0.75 * s;
            h12 = -0.4375 * s;
            h21 = s;
            h22 = bb;
          } else if (kdefl - kdefl / 10 * 10 == 0) {
            c_ix = (k << 2) + k;
            s = fabs(h[(((k + 1) << 2) + k) + 2]) + fabs(h[c_ix + 1]);
            bb = 0.75 * s + h[c_ix];
            h12 = -0.4375 * s;
            h21 = s;
            h22 = bb;
          } else {
            c_ix = ((i - 1) << 2) + i;
            bb = h[c_ix - 1];
            h21 = h[c_ix];
            c_ix = (i << 2) + i;
            h12 = h[c_ix - 1];
            h22 = h[c_ix];
          }

          s = ((fabs(bb) + fabs(h12)) + fabs(h21)) + fabs(h22);
          if (s == 0.0) {
            bb = 0.0;
            h22 = 0.0;
            tst = 0.0;
            h21 = 0.0;
          } else {
            bb /= s;
            h22 /= s;
            tst = (bb + h22) / 2.0;
            bb = (bb - tst) * (h22 - tst) - h12 / s * (h21 / s);
            h21 = sqrt(fabs(bb));
            if (bb >= 0.0) {
              bb = tst * s;
              tst = bb;
              h22 = h21 * s;
              h21 = -h22;
            } else {
              bb = tst + h21;
              tst -= h21;
              if (fabs(bb - h22) <= fabs(tst - h22)) {
                bb *= s;
                tst = bb;
              } else {
                tst *= s;
                bb = tst;
              }

              h22 = 0.0;
              h21 = 0.0;
            }
          }

          m = i - 1;
          exitg3 = false;
          while ((!exitg3) && (m >= k + 1)) {
            c_ix = ((m - 1) << 2) + m;
            h12 = h[c_ix];
            h22_tmp = h[c_ix - 1];
            s_tmp = h22_tmp - tst;
            s = (fabs(s_tmp) + fabs(h21)) + fabs(h12);
            h12 /= s;
            c_ix = (m << 2) + m;
            v[0] = (s_tmp / s * s_tmp + h[c_ix - 1] * h12) - h21 / s * h22;
            s_tmp = h[c_ix];
            v[1] = (((h22_tmp + s_tmp) - bb) - tst) * h12;
            v[2] = h[c_ix + 1] * h12;
            s = (fabs(v[0]) + fabs(v[1])) + fabs(v[2]);
            v[0] /= s;
            v[1] /= s;
            v[2] /= s;
            if ((k + 1 == m) || (fabs(h[m - 1]) * (fabs(v[1]) + fabs(v[2])) <=
                                 ((fabs(h22_tmp) + fabs(h[0])) + fabs(s_tmp)) *
                                 (2.2204460492503131E-16 * fabs(v[0])))) {
              exitg3 = true;
            } else {
              m--;
            }
          }

          for (c_ix = m; c_ix <= i; c_ix++) {
            nr = (i - c_ix) + 2;
            if (nr >= 3) {
              nr = 3;
            }

            if (c_ix > m) {
              ix0 = (((c_ix - 2) << 2) + c_ix) - 1;
              for (d_k = 0; d_k < nr; d_k++) {
                v[d_k] = h[ix0 + d_k];
              }
            }

            h22 = v[0];
            s = controller13_xzlarfg_b(nr, &h22, v);
            if (c_ix > m) {
              d_k = ((c_ix - 2) << 2) + c_ix;
              h[d_k - 1] = h22;
              h[d_k] = 0.0;
              if (c_ix < i) {
                h[c_ix + 1] = 0.0;
              }
            } else if (m > k + 1) {
              h[c_ix - 1] *= 1.0 - s;
            }

            h22 = v[1];
            tst = s * v[1];
            if (nr == 3) {
              h21 = v[2];
              h12 = s * v[2];
              for (d_k = c_ix; d_k < 5; d_k++) {
                ix0 = ((d_k - 1) << 2) + c_ix;
                h22_tmp = h[ix0 - 1];
                s_tmp = h[ix0];
                h_0 = h[ix0 + 1];
                bb = (h22 * s_tmp + h22_tmp) + h21 * h_0;
                h[ix0 - 1] = h22_tmp - bb * s;
                h[ix0] = s_tmp - bb * tst;
                h[ix0 + 1] = h_0 - bb * h12;
              }

              if (c_ix + 3 <= i + 1) {
                nr = (uint8_T)(c_ix + 3);
              } else {
                nr = (uint8_T)(i + 1);
              }

              for (d_k = 0; d_k < nr; d_k++) {
                ix0 = ((c_ix - 1) << 2) + d_k;
                h22_tmp = h[ix0];
                h_tmp_0 = (c_ix << 2) + d_k;
                s_tmp = h[h_tmp_0];
                h_tmp = ((c_ix + 1) << 2) + d_k;
                h_0 = h[h_tmp];
                bb = (h22 * s_tmp + h22_tmp) + h21 * h_0;
                h[ix0] = h22_tmp - bb * s;
                h[h_tmp_0] = s_tmp - bb * tst;
                h[h_tmp] = h_0 - bb * h12;
              }

              for (d_k = iloz; d_k <= ihiz; d_k++) {
                nr = (((c_ix - 1) << 2) + d_k) - 1;
                h22_tmp = z[nr];
                ix0 = ((c_ix << 2) + d_k) - 1;
                s_tmp = z[ix0];
                h_tmp_0 = (((c_ix + 1) << 2) + d_k) - 1;
                h_0 = z[h_tmp_0];
                bb = (h22 * s_tmp + h22_tmp) + h21 * h_0;
                z[nr] = h22_tmp - bb * s;
                z[ix0] = s_tmp - bb * tst;
                z[h_tmp_0] = h_0 - bb * h12;
              }
            } else if (nr == 2) {
              for (d_k = c_ix; d_k < 5; d_k++) {
                ix0 = ((d_k - 1) << 2) + c_ix;
                h22_tmp = h[ix0 - 1];
                s_tmp = h[ix0];
                bb = h22 * s_tmp + h22_tmp;
                h[ix0 - 1] = h22_tmp - bb * s;
                h[ix0] = s_tmp - bb * tst;
              }

              nr = (uint8_T)(i + 1);
              for (d_k = 0; d_k < nr; d_k++) {
                ix0 = ((c_ix - 1) << 2) + d_k;
                h22_tmp = h[ix0];
                h_tmp_0 = (c_ix << 2) + d_k;
                s_tmp = h[h_tmp_0];
                bb = h22 * s_tmp + h22_tmp;
                h[ix0] = h22_tmp - bb * s;
                h[h_tmp_0] = s_tmp - bb * tst;
              }

              for (d_k = iloz; d_k <= ihiz; d_k++) {
                nr = (((c_ix - 1) << 2) + d_k) - 1;
                h22_tmp = z[nr];
                ix0 = ((c_ix << 2) + d_k) - 1;
                s_tmp = z[ix0];
                bb = h22 * s_tmp + h22_tmp;
                z[nr] = h22_tmp - bb * s;
                z[ix0] = s_tmp - bb * tst;
              }
            }
          }

          iy++;
        }
      }

      if (!converged) {
        *info = i + 1;
        exitg1 = true;
      } else {
        if (i + 1 == l) {
          wr[i] = h[(i << 2) + i];
          wi[i] = 0.0;
        } else if (l == i) {
          m = i << 2;
          iy = m + i;
          tst = h[iy - 1];
          kdefl = (i - 1) << 2;
          c_ix = kdefl + i;
          bb = h[c_ix];
          h21 = h[iy];
          controller13_xdlanv2(&h[c_ix - 1], &tst, &bb, &h21, &wr[i - 1], &wi[i
                               - 1], &h12, &h22_tmp, &s, &h22);
          wr[i] = h12;
          wi[i] = h22_tmp;
          h[iy - 1] = tst;
          h[c_ix] = bb;
          h[iy] = h21;
          if (i + 1 < 4) {
            nr = ((i + 1) << 2) + i;
            k = (uint8_T)(3 - i);
            for (c_ix = 0; c_ix < k; c_ix++) {
              iy = c_ix << 2;
              d_k = iy + nr;
              bb = h[d_k];
              iy = (iy + nr) - 1;
              tst = h[iy];
              h[d_k] = bb * s - tst * h22;
              h[iy] = tst * s + bb * h22;
            }
          }

          if (i - 1 >= 1) {
            k = (uint8_T)(i - 1);
            for (c_ix = 0; c_ix < k; c_ix++) {
              d_k = m + c_ix;
              bb = h[d_k];
              iy = kdefl + c_ix;
              tst = h[iy];
              h[d_k] = bb * s - tst * h22;
              h[iy] = tst * s + bb * h22;
            }
          }

          if (nz >= 1) {
            c_ix = (kdefl + iloz) - 1;
            kdefl = (m + iloz) - 1;
            iy = (uint8_T)nz;
            for (i = 0; i < iy; i++) {
              m = kdefl + i;
              bb = z[m];
              d_k = c_ix + i;
              tst = z[d_k];
              z[m] = bb * s - tst * h22;
              z[d_k] = tst * s + bb * h22;
            }
          }
        }

        kdefl = 0;
        i = l - 2;
      }
    }

    for (nz = 0; nz < 2; nz++) {
      for (l = nz + 3; l < 5; l++) {
        h[(l + (nz << 2)) - 1] = 0.0;
      }
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xgemv(int32_T n, const real_T x[12], real_T beta1,
  real_T y[16], int32_T iy0)
{
  int32_T b;
  int32_T c_iy;
  int32_T ix;
  int32_T iyend;
  iyend = iy0 + 3;
  if (beta1 != 1.0) {
    for (c_iy = iy0; c_iy <= iyend; c_iy++) {
      if (beta1 == 0.0) {
        y[c_iy - 1] = 0.0;
      } else {
        y[c_iy - 1] *= beta1;
      }
    }
  }

  ix = 8;
  b = ((n - 1) << 2) + 1;
  for (iyend = 1; iyend <= b; iyend += 4) {
    for (c_iy = iyend; c_iy <= iyend + 3; c_iy++) {
      int32_T tmp;
      tmp = ((iy0 + c_iy) - iyend) - 1;
      y[tmp] += y[c_iy - 1] * x[ix];
    }

    ix++;
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_dladiv1(real_T a, real_T b, real_T c, real_T d, real_T *
  p, real_T *q)
{
  real_T r;
  real_T t;
  r = d / c;
  t = 1.0 / (d * r + c);
  if (r != 0.0) {
    real_T br;
    br = b * r;
    if (br != 0.0) {
      *p = (a + br) * t;
    } else {
      *p = b * t * r + a * t;
    }

    br = -a * r;
    if (br != 0.0) {
      *q = (b + br) * t;
    } else {
      *q = -a * t * r + b * t;
    }
  } else {
    *p = (b / c * d + a) * t;
    *q = (-a / c * d + b) * t;
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdladiv(real_T a, real_T b, real_T c, real_T d, real_T *
  p, real_T *q)
{
  real_T aa;
  real_T ab;
  real_T bb;
  real_T cc;
  real_T cd;
  real_T cd_tmp;
  real_T cd_tmp_0;
  real_T dd;
  real_T s;
  aa = a;
  bb = b;
  cc = c;
  dd = d;
  ab = fmax(fabs(a), fabs(b));
  cd_tmp = fabs(d);
  cd_tmp_0 = fabs(c);
  cd = fmax(cd_tmp_0, cd_tmp);
  s = 1.0;
  if (ab >= 8.9884656743115785E+307) {
    aa = 0.5 * a;
    bb = 0.5 * b;
    s = 2.0;
  }

  if (cd >= 8.9884656743115785E+307) {
    cc = 0.5 * c;
    dd = 0.5 * d;
    s *= 0.5;
  }

  if (ab <= 2.0041683600089728E-292) {
    aa *= 4.0564819207303341E+31;
    bb *= 4.0564819207303341E+31;
    s /= 4.0564819207303341E+31;
  }

  if (cd <= 2.0041683600089728E-292) {
    cc *= 4.0564819207303341E+31;
    dd *= 4.0564819207303341E+31;
    s *= 4.0564819207303341E+31;
  }

  if (cd_tmp <= cd_tmp_0) {
    controller13_dladiv1(aa, bb, cc, dd, p, q);
  } else {
    controller13_dladiv1(bb, aa, dd, cc, p, &ab);
    *q = -ab;
  }

  *p *= s;
  *q *= s;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdlaln2(int32_T na, int32_T nw, real_T smin, const
  real_T A[16], int32_T ia0, const real_T B[12], int32_T ib0, real_T wr, real_T
  wi, real_T X[4], real_T *scale, real_T *xnorm)
{
  real_T ci[4];
  real_T cr[4];
  real_T bi1;
  real_T bi2;
  real_T br2;
  real_T cmax;
  real_T li21;
  real_T lr21;
  real_T temp;
  real_T u22abs;
  real_T ui11r;
  real_T ui12s;
  real_T ui22;
  real_T ur11r;
  real_T ur12s;
  real_T ur22;
  int32_T icmax;
  int32_T lr21_tmp;
  int32_T lr21_tmp_tmp;
  static const int8_T b[16] = { 1, 2, 3, 4, 2, 1, 4, 3, 3, 4, 1, 2, 4, 3, 2, 1 };

  *scale = 1.0;
  if (na == 1) {
    if (nw == 1) {
      ur11r = A[ia0 - 1] - wr;
      ui11r = fabs(ur11r);
      if (ui11r < smin) {
        ur11r = smin;
        ui11r = smin;
      }

      lr21 = B[ib0 - 1];
      cmax = fabs(lr21);
      if ((ui11r < 1.0) && (cmax > 1.0) && (cmax > 2.2471164185778949E+307 *
           ui11r)) {
        *scale = 1.0 / cmax;
      }

      X[0] = lr21 * *scale / ur11r;
      *xnorm = fabs(X[0]);
    } else {
      ur11r = A[ia0 - 1] - wr;
      temp = -wi;
      ui11r = fabs(ur11r) + fabs(-wi);
      if (ui11r < smin) {
        ur11r = smin;
        temp = 0.0;
        ui11r = smin;
      }

      lr21 = B[ib0 - 1];
      ur22 = B[ib0 + 3];
      cmax = fabs(lr21) + fabs(ur22);
      if ((ui11r < 1.0) && (cmax > 1.0) && (cmax > 2.2471164185778949E+307 *
           ui11r)) {
        *scale = 1.0 / cmax;
      }

      controller13_xdladiv(*scale * lr21, *scale * ur22, ur11r, temp, &X[0], &X
                           [2]);
      *xnorm = fabs(X[0]) + fabs(X[2]);
    }
  } else {
    cr[0] = A[ia0 - 1] - wr;
    cr[3] = A[ia0 + 4] - wr;
    cr[1] = A[ia0];
    cr[2] = A[ia0 + 3];
    if (nw == 1) {
      cmax = 0.0;
      icmax = -1;
      ui11r = fabs(cr[0]);
      if (ui11r > 0.0) {
        cmax = ui11r;
        icmax = 0;
      }

      ui11r = fabs(cr[1]);
      if (ui11r > cmax) {
        cmax = ui11r;
        icmax = 1;
      }

      ui11r = fabs(cr[2]);
      if (ui11r > cmax) {
        cmax = ui11r;
        icmax = 2;
      }

      ui11r = fabs(cr[3]);
      if (ui11r > cmax) {
        cmax = ui11r;
        icmax = 3;
      }

      if (cmax < smin) {
        lr21 = B[ib0 - 1];
        cmax = fmax(fabs(lr21), fabs(B[ib0]));
        if ((smin < 1.0) && (cmax > 1.0) && (cmax > 2.2471164185778949E+307 *
             smin)) {
          *scale = 1.0 / cmax;
        }

        temp = *scale / smin;
        X[0] = lr21 * temp;
        X[1] = temp * B[ib0];
        *xnorm = temp * cmax;
      } else {
        ur11r = 1.0 / cr[icmax];
        lr21_tmp = icmax << 2;
        lr21 = cr[b[lr21_tmp + 1] - 1] * ur11r;
        li21 = cr[b[lr21_tmp + 2] - 1];
        ur22 = cr[b[lr21_tmp + 3] - 1] - li21 * lr21;
        if (fabs(ur22) < smin) {
          ur22 = smin;
        }

        if ((icmax + 1 == 2) || (icmax + 1 == 4)) {
          temp = B[ib0];
          br2 = B[ib0 - 1];
        } else {
          temp = B[ib0 - 1];
          br2 = B[ib0];
        }

        br2 -= lr21 * temp;
        lr21 = fmax(fabs(ur22 * ur11r * temp), fabs(br2));
        if (lr21 > 1.0) {
          ui11r = fabs(ur22);
          if ((ui11r < 1.0) && (lr21 >= 2.2471164185778949E+307 * ui11r)) {
            *scale = 1.0 / lr21;
          }
        }

        ui11r = br2 * *scale / ur22;
        ur22 = *scale * temp * ur11r - li21 * ur11r * ui11r;
        if ((icmax + 1 == 3) || (icmax + 1 == 4)) {
          X[0] = ui11r;
          X[1] = ur22;
        } else {
          X[0] = ur22;
          X[1] = ui11r;
        }

        *xnorm = fmax(fabs(ur22), fabs(ui11r));
        if ((*xnorm > 1.0) && (cmax > 1.0) && (*xnorm > 2.2471164185778949E+307 /
             cmax)) {
          temp = cmax / 2.2471164185778949E+307;
          X[0] *= temp;
          X[1] *= temp;
          *xnorm *= temp;
          *scale *= temp;
        }
      }
    } else {
      ci[0] = -wi;
      ci[1] = 0.0;
      ci[2] = 0.0;
      ci[3] = -wi;
      cmax = 0.0;
      icmax = -1;
      ur11r = fabs(-wi);
      temp = fabs(cr[0]) + ur11r;
      if (temp > 0.0) {
        cmax = temp;
        icmax = 0;
      }

      temp = fabs(cr[1]);
      if (temp > cmax) {
        cmax = temp;
        icmax = 1;
      }

      temp = fabs(cr[2]);
      if (temp > cmax) {
        cmax = temp;
        icmax = 2;
      }

      temp = fabs(cr[3]) + ur11r;
      if (temp > cmax) {
        cmax = temp;
        icmax = 3;
      }

      if (cmax < smin) {
        lr21 = B[ib0 - 1];
        ur22 = B[ib0 + 3];
        ur11r = B[ib0 + 4];
        cmax = fmax(fabs(lr21) + fabs(ur22), fabs(ur11r) + fabs(B[ib0]));
        if ((smin < 1.0) && (cmax > 1.0) && (cmax > 2.2471164185778949E+307 *
             smin)) {
          *scale = 1.0 / cmax;
        }

        temp = *scale / smin;
        X[0] = lr21 * temp;
        X[1] = temp * B[ib0];
        X[2] = ur22 * temp;
        X[3] = ur11r * temp;
        *xnorm = temp * cmax;
      } else {
        if ((icmax + 1 == 1) || (icmax + 1 == 4)) {
          if (fabs(cr[icmax]) > fabs(ci[icmax])) {
            temp = ci[icmax] / cr[icmax];
            ur11r = 1.0 / ((temp * temp + 1.0) * cr[icmax]);
            ui11r = -temp * ur11r;
          } else {
            temp = cr[icmax] / ci[icmax];
            ui11r = -1.0 / ((temp * temp + 1.0) * ci[icmax]);
            ur11r = -temp * ui11r;
          }

          lr21_tmp_tmp = icmax << 2;
          temp = cr[b[lr21_tmp_tmp + 1] - 1];
          lr21 = temp * ur11r;
          li21 = temp * ui11r;
          temp = cr[b[lr21_tmp_tmp + 2] - 1];
          ur12s = temp * ur11r;
          ui12s = temp * ui11r;
          lr21_tmp_tmp = b[lr21_tmp_tmp + 3] - 1;
          ur22 = cr[lr21_tmp_tmp] - temp * lr21;
          ui22 = ci[lr21_tmp_tmp] - temp * li21;
        } else {
          ur11r = 1.0 / cr[icmax];
          ui11r = 0.0;
          lr21_tmp_tmp = icmax << 2;
          lr21_tmp = b[lr21_tmp_tmp + 1] - 1;
          lr21 = cr[lr21_tmp] * ur11r;
          li21 = ci[lr21_tmp] * ur11r;
          lr21_tmp = b[lr21_tmp_tmp + 2] - 1;
          temp = cr[lr21_tmp];
          ur12s = temp * ur11r;
          br2 = ci[lr21_tmp];
          ui12s = br2 * ur11r;
          ur22 = (cr[b[lr21_tmp_tmp + 3] - 1] - temp * lr21) + br2 * li21;
          ui22 = -temp * li21 - br2 * lr21;
        }

        u22abs = fabs(ur22) + fabs(ui22);
        if (u22abs < smin) {
          ur22 = smin;
          ui22 = 0.0;
        }

        if ((icmax + 1 == 2) || (icmax + 1 == 4)) {
          br2 = B[ib0 - 1];
          temp = B[ib0];
          bi2 = B[ib0 + 3];
          bi1 = B[ib0 + 4];
        } else {
          temp = B[ib0 - 1];
          br2 = B[ib0];
          bi1 = B[ib0 + 3];
          bi2 = B[ib0 + 4];
        }

        br2 = (br2 - lr21 * temp) + li21 * bi1;
        bi2 = (bi2 - li21 * temp) - lr21 * bi1;
        lr21 = fmax((fabs(ur11r) + fabs(ui11r)) * u22abs * (fabs(temp) + fabs
          (bi1)), fabs(br2) + fabs(bi2));
        if ((lr21 > 1.0) && (u22abs < 1.0) && (lr21 >= 2.2471164185778949E+307 *
             u22abs)) {
          *scale = 1.0 / lr21;
          temp *= *scale;
          bi1 *= *scale;
          br2 *= *scale;
          bi2 *= *scale;
        }

        controller13_xdladiv(br2, bi2, ur22, ui22, &u22abs, &lr21);
        ur22 = ((ur11r * temp - ui11r * bi1) - ur12s * u22abs) + ui12s * lr21;
        ur11r = ((ui11r * temp + ur11r * bi1) - ui12s * u22abs) - ur12s * lr21;
        if ((icmax + 1 == 3) || (icmax + 1 == 4)) {
          X[0] = u22abs;
          X[1] = ur22;
          X[2] = lr21;
          X[3] = ur11r;
        } else {
          X[0] = ur22;
          X[1] = u22abs;
          X[2] = ur11r;
          X[3] = lr21;
        }

        *xnorm = fmax(fabs(ur22) + fabs(ur11r), fabs(u22abs) + fabs(lr21));
        if ((*xnorm > 1.0) && (cmax > 1.0) && (*xnorm > 2.2471164185778949E+307 /
             cmax)) {
          temp = cmax / 2.2471164185778949E+307;
          X[0] *= temp;
          X[1] *= temp;
          X[2] *= temp;
          X[3] *= temp;
          *xnorm *= temp;
          *scale *= temp;
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xaxpy(int32_T n, real_T a, const real_T x[16], int32_T
  ix0, real_T y[12])
{
  int32_T k;
  if ((n >= 1) && (!(a == 0.0))) {
    int32_T scalarLB;
    int32_T vectorUB;
    scalarLB = (n / 2) << 1;
    vectorUB = scalarLB - 2;
    for (k = 0; k <= vectorUB; k += 2) {
      __m128d tmp;
      tmp = _mm_loadu_pd(&y[k + 8]);
      _mm_storeu_pd(&y[k + 8], _mm_add_pd(_mm_mul_pd(_mm_loadu_pd(&x[(ix0 + k) -
        1]), _mm_set1_pd(a)), tmp));
    }

    for (k = scalarLB; k < n; k++) {
      y[k + 8] += x[(ix0 + k) - 1] * a;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdtrevc3(const real_T T[16], real_T vr[16])
{
  __m128d tmp;
  real_T work[12];
  real_T x[4];
  real_T rec;
  real_T scale;
  real_T smin;
  real_T wi;
  real_T wr;
  int32_T T_tmp;
  int32_T T_tmp_0;
  int32_T T_tmp_tmp;
  int32_T b_ix;
  int32_T b_j;
  int32_T exitg1;
  int32_T ip;
  int32_T iyend;
  int32_T j;
  int32_T scalarLB_tmp;
  int32_T vectorUB;
  boolean_T guard1;
  memset(&work[0], 0, 12U * sizeof(real_T));
  x[0] = 0.0;
  x[1] = 0.0;
  x[2] = 0.0;
  x[3] = 0.0;
  work[0] = 0.0;
  for (b_j = 0; b_j < 3; b_j++) {
    work[b_j + 1] = 0.0;
    for (ip = 0; ip <= b_j; ip++) {
      work[b_j + 1] += fabs(T[((b_j + 1) << 2) + ip]);
    }
  }

  ip = 0;
  for (b_j = 3; b_j >= 0; b_j--) {
    if (ip == -1) {
      ip = 1;
    } else {
      if ((b_j + 1 == 1) || (T[((b_j - 1) << 2) + b_j] == 0.0)) {
        ip = 0;
      } else {
        ip = -1;
      }

      T_tmp_tmp = b_j << 2;
      T_tmp = T_tmp_tmp + b_j;
      wr = T[T_tmp];
      wi = 0.0;
      if (ip != 0) {
        wi = sqrt(fabs(T[((b_j - 1) << 2) + b_j])) * sqrt(fabs(T[T_tmp - 1]));
      }

      smin = fmax((fabs(wr) + wi) * 2.2204460492503131E-16,
                  4.0083367200179456E-292);
      if (ip == 0) {
        work[b_j + 8] = 1.0;
        b_ix = (b_j / 2) << 1;
        vectorUB = b_ix - 2;
        for (j = 0; j <= vectorUB; j += 2) {
          _mm_storeu_pd(&work[j + 8], _mm_mul_pd(_mm_loadu_pd(&T[T_tmp_tmp + j]),
            _mm_set1_pd(-1.0)));
        }

        for (j = b_ix; j < b_j; j++) {
          work[j + 8] = -T[T_tmp_tmp + j];
        }

        j = b_j - 1;
        do {
          exitg1 = 0;
          if (j + 1 >= 1) {
            guard1 = false;
            if (j + 1 == 1) {
              guard1 = true;
            } else {
              T_tmp = (j - 1) << 2;
              T_tmp_0 = T_tmp + j;
              if (T[T_tmp_0] == 0.0) {
                guard1 = true;
              } else {
                controller13_xdlaln2(2, 1, smin, T, T_tmp_0, work, j + 8, wr,
                                     0.0, x, &scale, &wi);
                if ((wi > 1.0) && (fmax(work[j - 1], work[j]) >
                                   2.4948003869183992E+291 / wi)) {
                  x[0] /= wi;
                  x[1] /= wi;
                  scale /= wi;
                }

                if (scale != 1.0) {
                  b_ix = (((b_j + 1) / 2) << 1) + 9;
                  vectorUB = b_ix - 2;
                  for (iyend = 9; iyend <= vectorUB; iyend += 2) {
                    tmp = _mm_loadu_pd(&work[iyend - 1]);
                    _mm_storeu_pd(&work[iyend - 1], _mm_mul_pd(tmp, _mm_set1_pd
                      (scale)));
                  }

                  for (iyend = b_ix; iyend <= b_j + 9; iyend++) {
                    work[iyend - 1] *= scale;
                  }
                }

                work[j + 7] = x[0];
                work[j + 8] = x[1];
                controller13_xaxpy(j - 1, -x[0], T, T_tmp + 1, work);
                controller13_xaxpy(j - 1, -x[1], T, (j << 2) + 1, work);
                j -= 2;
              }
            }

            if (guard1) {
              T_tmp = j << 2;
              controller13_xdlaln2(1, 1, smin, T, (T_tmp + j) + 1, work, j + 9,
                                   wr, 0.0, x, &scale, &wi);
              if ((wi > 1.0) && (work[j] > 2.4948003869183992E+291 / wi)) {
                x[0] /= wi;
                scale /= wi;
              }

              if (scale != 1.0) {
                b_ix = (((b_j + 1) / 2) << 1) + 9;
                vectorUB = b_ix - 2;
                for (iyend = 9; iyend <= vectorUB; iyend += 2) {
                  tmp = _mm_loadu_pd(&work[iyend - 1]);
                  _mm_storeu_pd(&work[iyend - 1], _mm_mul_pd(tmp, _mm_set1_pd
                    (scale)));
                }

                for (iyend = b_ix; iyend <= b_j + 9; iyend++) {
                  work[iyend - 1] *= scale;
                }
              }

              work[j + 8] = x[0];
              controller13_xaxpy(j, -x[0], T, T_tmp + 1, work);
              j--;
            }
          } else {
            exitg1 = 1;
          }
        } while (exitg1 == 0);

        if (b_j + 1 > 1) {
          controller13_xgemv(b_j, work, work[b_j + 8], vr, T_tmp_tmp + 1);
        }

        iyend = -1;
        wr = fabs(vr[T_tmp_tmp]);
        T_tmp_0 = T_tmp_tmp + 1;
        smin = fabs(vr[T_tmp_tmp + 1]);
        if (smin > wr) {
          iyend = 0;
          wr = smin;
        }

        smin = fabs(vr[T_tmp_tmp + 2]);
        if (smin > wr) {
          iyend = 1;
          wr = smin;
        }

        if (fabs(vr[T_tmp_tmp + 3]) > wr) {
          iyend = 2;
        }

        wr = 1.0 / fabs(vr[(T_tmp_tmp + iyend) + 1]);
        b_ix = T_tmp_tmp + 5;
        vectorUB = T_tmp_tmp + 3;
        for (j = T_tmp_0; j <= vectorUB; j += 2) {
          tmp = _mm_loadu_pd(&vr[j - 1]);
          _mm_storeu_pd(&vr[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(wr)));
        }

        for (j = b_ix; j <= T_tmp_0 + 3; j++) {
          vr[j - 1] *= wr;
        }
      } else {
        T_tmp_0 = (b_j - 1) << 2;
        scale = T[T_tmp_0 + b_j];
        rec = T[T_tmp - 1];
        if (fabs(rec) >= fabs(scale)) {
          work[b_j + 3] = 1.0;
          work[b_j + 8] = wi / rec;
        } else {
          work[b_j + 3] = -wi / scale;
          work[b_j + 8] = 1.0;
        }

        work[b_j + 4] = 0.0;
        work[b_j + 7] = 0.0;
        for (j = 0; j <= b_j - 2; j++) {
          work[j + 4] = T[T_tmp_0 + j] * -work[b_j + 3];
          work[j + 8] = T[T_tmp_tmp + j] * -work[b_j + 8];
        }

        j = b_j - 2;
        while (j + 1 >= 1) {
          if ((j + 1 == 1) || (T[1] == 0.0)) {
            T_tmp = j << 2;
            controller13_xdlaln2(1, 2, smin, T, (T_tmp + j) + 1, work, j + 5, wr,
                                 wi, x, &scale, &rec);
            if ((rec > 1.0) && (work[j] > 2.4948003869183992E+291 / rec)) {
              x[0] /= rec;
              x[2] /= rec;
              scale /= rec;
            }

            if (scale != 1.0) {
              scalarLB_tmp = ((b_j + 1) / 2) << 1;
              b_ix = scalarLB_tmp + 5;
              vectorUB = scalarLB_tmp + 3;
              for (iyend = 5; iyend <= vectorUB; iyend += 2) {
                tmp = _mm_loadu_pd(&work[iyend - 1]);
                _mm_storeu_pd(&work[iyend - 1], _mm_mul_pd(tmp, _mm_set1_pd
                  (scale)));
              }

              for (iyend = b_ix; iyend <= b_j + 5; iyend++) {
                work[iyend - 1] *= scale;
              }

              b_ix = scalarLB_tmp + 9;
              vectorUB = scalarLB_tmp + 7;
              for (iyend = 9; iyend <= vectorUB; iyend += 2) {
                tmp = _mm_loadu_pd(&work[iyend - 1]);
                _mm_storeu_pd(&work[iyend - 1], _mm_mul_pd(tmp, _mm_set1_pd
                  (scale)));
              }

              for (iyend = b_ix; iyend <= b_j + 9; iyend++) {
                work[iyend - 1] *= scale;
              }
            }

            work[j + 4] = x[0];
            work[j + 8] = x[2];
            if ((j >= 1) && (!(-x[0] == 0.0))) {
              work[4] += T[T_tmp] * -x[0];
            }

            controller13_xaxpy(j, -x[2], T, T_tmp + 1, work);
            j--;
          } else {
            controller13_xdlaln2(2, 2, smin, T, 1, work, 5, wr, wi, x, &scale,
                                 &rec);
            if ((rec > 1.0) && (fmax(work[0], work[1]) > 2.4948003869183992E+291
                                / rec)) {
              rec = 1.0 / rec;
              x[0] *= rec;
              x[2] *= rec;
              x[1] *= rec;
              x[3] *= rec;
              scale *= rec;
            }

            if (scale != 1.0) {
              scalarLB_tmp = ((b_j + 1) / 2) << 1;
              b_ix = scalarLB_tmp + 5;
              vectorUB = scalarLB_tmp + 3;
              for (j = 5; j <= vectorUB; j += 2) {
                tmp = _mm_loadu_pd(&work[j - 1]);
                _mm_storeu_pd(&work[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(scale)));
              }

              for (j = b_ix; j <= b_j + 5; j++) {
                work[j - 1] *= scale;
              }

              b_ix = scalarLB_tmp + 9;
              vectorUB = scalarLB_tmp + 7;
              for (j = 9; j <= vectorUB; j += 2) {
                tmp = _mm_loadu_pd(&work[j - 1]);
                _mm_storeu_pd(&work[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(scale)));
              }

              for (j = b_ix; j <= b_j + 9; j++) {
                work[j - 1] *= scale;
              }
            }

            work[4] = x[0];
            work[5] = x[1];
            work[8] = x[2];
            work[9] = x[3];
            controller13_xaxpy(0, -x[2], T, 1, work);
            controller13_xaxpy(0, -x[3], T, 5, work);
            j = -1;
          }
        }

        if (b_j + 1 > 2) {
          iyend = T_tmp_0 + 4;
          smin = work[b_j + 3];
          if (smin != 1.0) {
            for (j = T_tmp_0 + 1; j <= iyend; j++) {
              if (smin == 0.0) {
                vr[j - 1] = 0.0;
              } else {
                vr[j - 1] *= smin;
              }
            }
          }

          b_ix = 4;
          vectorUB = ((b_j - 2) << 2) + 1;
          for (iyend = 1; iyend <= vectorUB; iyend += 4) {
            for (j = iyend; j <= iyend + 3; j++) {
              T_tmp = (T_tmp_0 + j) - iyend;
              vr[T_tmp] += vr[j - 1] * work[b_ix];
            }

            b_ix++;
          }

          controller13_xgemv(b_j - 1, work, work[b_j + 8], vr, T_tmp_tmp + 1);
        } else {
          iyend = T_tmp_0 + 1;
          b_ix = T_tmp_0 + 5;
          vectorUB = T_tmp_0 + 3;
          for (j = iyend; j <= vectorUB; j += 2) {
            tmp = _mm_loadu_pd(&vr[j - 1]);
            _mm_storeu_pd(&vr[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(work[4])));
          }

          for (j = b_ix; j <= iyend + 3; j++) {
            vr[j - 1] *= work[4];
          }

          iyend = T_tmp_tmp + 1;
          b_ix = T_tmp_tmp + 5;
          vectorUB = T_tmp_tmp + 3;
          for (j = iyend; j <= vectorUB; j += 2) {
            tmp = _mm_loadu_pd(&vr[j - 1]);
            _mm_storeu_pd(&vr[j - 1], _mm_mul_pd(_mm_set1_pd(work[b_j + 8]), tmp));
          }

          for (j = b_ix; j <= iyend + 3; j++) {
            vr[j - 1] *= work[b_j + 8];
          }
        }

        T_tmp = T_tmp_0 + 1;
        iyend = T_tmp_tmp + 1;
        wr = 1.0 / fmax(fmax(fmax(fmax(0.0, fabs(vr[T_tmp_0]) + fabs
          (vr[T_tmp_tmp])), fabs(vr[T_tmp_0 + 1]) + fabs(vr[T_tmp_tmp + 1])),
                             fabs(vr[T_tmp_0 + 2]) + fabs(vr[T_tmp_tmp + 2])),
                        fabs(vr[T_tmp_0 + 3]) + fabs(vr[T_tmp_tmp + 3]));
        b_ix = T_tmp_0 + 5;
        vectorUB = T_tmp_0 + 3;
        for (j = T_tmp; j <= vectorUB; j += 2) {
          tmp = _mm_loadu_pd(&vr[j - 1]);
          _mm_storeu_pd(&vr[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(wr)));
        }

        for (j = b_ix; j <= T_tmp + 3; j++) {
          vr[j - 1] *= wr;
        }

        b_ix = T_tmp_tmp + 5;
        vectorUB = T_tmp_tmp + 3;
        for (j = iyend; j <= vectorUB; j += 2) {
          tmp = _mm_loadu_pd(&vr[j - 1]);
          _mm_storeu_pd(&vr[j - 1], _mm_mul_pd(tmp, _mm_set1_pd(wr)));
        }

        for (j = b_ix; j <= iyend + 3; j++) {
          vr[j - 1] *= wr;
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzlascl_g(real_T cfrom, real_T cto, int32_T m, real_T
  A[4], int32_T iA0)
{
  real_T cfromc;
  real_T ctoc;
  int32_T b_i;
  boolean_T notdone;
  cfromc = cfrom;
  ctoc = cto;
  notdone = true;
  while (notdone) {
    real_T cfrom1;
    real_T cto1;
    real_T mul;
    int32_T scalarLB;
    int32_T tmp_0;
    int32_T vectorUB;
    cfrom1 = cfromc * 2.0041683600089728E-292;
    cto1 = ctoc / 4.9896007738368E+291;
    if ((fabs(cfrom1) > fabs(ctoc)) && (ctoc != 0.0)) {
      mul = 2.0041683600089728E-292;
      cfromc = cfrom1;
    } else if (fabs(cto1) > fabs(cfromc)) {
      mul = 4.9896007738368E+291;
      ctoc = cto1;
    } else {
      mul = ctoc / cfromc;
      notdone = false;
    }

    scalarLB = (m / 2) << 1;
    vectorUB = scalarLB - 2;
    for (b_i = 0; b_i <= vectorUB; b_i += 2) {
      __m128d tmp;
      tmp_0 = (b_i + iA0) - 1;
      tmp = _mm_loadu_pd(&A[tmp_0]);
      _mm_storeu_pd(&A[tmp_0], _mm_mul_pd(tmp, _mm_set1_pd(mul)));
    }

    for (b_i = scalarLB; b_i < m; b_i++) {
      tmp_0 = (b_i + iA0) - 1;
      A[tmp_0] *= mul;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_eigStandard(const real_T A[16], creal_T V[16], creal_T
  D[4])
{
  __m128d tmp;
  real_T b_A[16];
  real_T vr[16];
  real_T scale[4];
  real_T wi[4];
  real_T wr[4];
  real_T tau[3];
  real_T absxk;
  real_T anrm;
  real_T b_scale;
  real_T b_temp;
  real_T f1;
  real_T f1_tmp;
  real_T g1;
  real_T g1_tmp;
  real_T s;
  int32_T b_k;
  int32_T b_temp_tmp;
  int32_T b_temp_tmp_0;
  int32_T b_temp_tmp_tmp;
  int32_T b_temp_tmp_tmp_0;
  int32_T c_ix;
  int32_T ihi;
  int32_T info;
  int32_T k;
  int32_T vectorUB;
  boolean_T exitg1;
  boolean_T scalea;
  memcpy(&b_A[0], &A[0], sizeof(real_T) << 4U);
  anrm = 0.0;
  b_k = 0;
  exitg1 = false;
  while ((!exitg1) && (b_k < 16)) {
    absxk = fabs(A[b_k]);
    if (rtIsNaN(absxk)) {
      anrm = (rtNaN);
      exitg1 = true;
    } else {
      if (absxk > anrm) {
        anrm = absxk;
      }

      b_k++;
    }
  }

  if (rtIsInf(anrm) || rtIsNaN(anrm)) {
    D[0].re = (rtNaN);
    D[0].im = 0.0;
    D[1].re = (rtNaN);
    D[1].im = 0.0;
    D[2].re = (rtNaN);
    D[2].im = 0.0;
    D[3].re = (rtNaN);
    D[3].im = 0.0;
    for (b_temp_tmp_0 = 0; b_temp_tmp_0 < 16; b_temp_tmp_0++) {
      V[b_temp_tmp_0].re = (rtNaN);
      V[b_temp_tmp_0].im = 0.0;
    }
  } else {
    absxk = anrm;
    scalea = false;
    if ((anrm > 0.0) && (anrm < 6.7178761075670888E-139)) {
      scalea = true;
      absxk = 6.7178761075670888E-139;
      controller13_xzlascl(anrm, absxk, b_A);
    } else if (anrm > 1.4885657073574029E+138) {
      scalea = true;
      absxk = 1.4885657073574029E+138;
      controller13_xzlascl(anrm, absxk, b_A);
    }

    controller13_xzgebal(b_A, &b_k, &ihi, scale);
    controller13_xzgehrd(b_A, b_k, ihi, tau);
    memcpy(&vr[0], &b_A[0], sizeof(real_T) << 4U);
    controller13_xzunghr(b_k, ihi, vr, tau);
    controller13_xdlahqr(b_k, ihi, b_A, b_k, ihi, vr, &info, wr, wi);
    if (info == 0) {
      controller13_xdtrevc3(b_A, vr);
      if (b_k != ihi) {
        for (k = b_k; k <= ihi; k++) {
          for (c_ix = k; c_ix <= k + 12; c_ix += 4) {
            vr[c_ix - 1] *= scale[k - 1];
          }
        }
      }

      for (k = b_k - 1; k >= 1; k--) {
        s = scale[k - 1];
        if ((int32_T)s != k) {
          b_temp = vr[k - 1];
          vr[k - 1] = vr[(int32_T)s - 1];
          vr[(int32_T)s - 1] = b_temp;
          b_temp = vr[k + 3];
          vr[k + 3] = vr[(int32_T)s + 3];
          vr[(int32_T)s + 3] = b_temp;
          b_temp = vr[k + 7];
          vr[k + 7] = vr[(int32_T)s + 7];
          vr[(int32_T)s + 7] = b_temp;
          b_temp = vr[k + 11];
          vr[k + 11] = vr[(int32_T)s + 11];
          vr[(int32_T)s + 11] = b_temp;
        }
      }

      for (k = ihi + 1; k < 5; k++) {
        s = scale[k - 1];
        if ((int32_T)s != k) {
          b_temp = vr[k - 1];
          vr[k - 1] = vr[(int32_T)s - 1];
          vr[(int32_T)s - 1] = b_temp;
          b_temp = vr[k + 3];
          vr[k + 3] = vr[(int32_T)s + 3];
          vr[(int32_T)s + 3] = b_temp;
          b_temp = vr[k + 7];
          vr[k + 7] = vr[(int32_T)s + 7];
          vr[(int32_T)s + 7] = b_temp;
          b_temp = vr[k + 11];
          vr[k + 11] = vr[(int32_T)s + 11];
          vr[(int32_T)s + 11] = b_temp;
        }
      }

      for (ihi = 0; ihi < 4; ihi++) {
        b_temp = wi[ihi];
        if (!(b_temp < 0.0)) {
          if ((ihi + 1 != 4) && (b_temp > 0.0)) {
            b_temp_tmp_tmp = ihi << 2;
            b_temp_tmp_0 = b_temp_tmp_tmp + 1;
            b_temp_tmp_tmp_0 = (ihi + 1) << 2;
            b_temp_tmp = b_temp_tmp_tmp_0 + 1;
            b_temp = 1.0 / rt_hypotd_snf(controller13_xnrm2(4, vr,
              b_temp_tmp_tmp + 1), controller13_xnrm2(4, vr, b_temp_tmp_tmp_0 +
              1));
            k = b_temp_tmp_tmp + 5;
            vectorUB = b_temp_tmp_tmp + 3;
            for (c_ix = b_temp_tmp_0; c_ix <= vectorUB; c_ix += 2) {
              tmp = _mm_loadu_pd(&vr[c_ix - 1]);
              _mm_storeu_pd(&vr[c_ix - 1], _mm_mul_pd(tmp, _mm_set1_pd(b_temp)));
            }

            for (c_ix = k; c_ix <= b_temp_tmp_0 + 3; c_ix++) {
              vr[c_ix - 1] *= b_temp;
            }

            k = b_temp_tmp_tmp_0 + 5;
            vectorUB = b_temp_tmp_tmp_0 + 3;
            for (c_ix = b_temp_tmp; c_ix <= vectorUB; c_ix += 2) {
              tmp = _mm_loadu_pd(&vr[c_ix - 1]);
              _mm_storeu_pd(&vr[c_ix - 1], _mm_mul_pd(tmp, _mm_set1_pd(b_temp)));
            }

            for (c_ix = k; c_ix <= b_temp_tmp + 3; c_ix++) {
              vr[c_ix - 1] *= b_temp;
            }

            f1 = vr[b_temp_tmp_tmp];
            g1 = vr[b_temp_tmp_tmp_0];
            scale[0] = f1 * f1 + g1 * g1;
            f1 = vr[b_temp_tmp_tmp + 1];
            s = vr[b_temp_tmp_tmp_0 + 1];
            b_scale = vr[b_temp_tmp_tmp + 2];
            g1 = vr[b_temp_tmp_tmp_0 + 2];
            f1_tmp = vr[b_temp_tmp_tmp + 3];
            g1_tmp = vr[b_temp_tmp_tmp_0 + 3];
            k = 0;
            c_ix = 0;
            b_temp = fabs(scale[0]);
            s = fabs(f1 * f1 + s * s);
            if (s > b_temp) {
              k = 1;
              b_temp = s;
            }

            s = fabs(b_scale * b_scale + g1 * g1);
            if (s > b_temp) {
              k = 2;
              b_temp = s;
            }

            if (fabs(f1_tmp * f1_tmp + g1_tmp * g1_tmp) > b_temp) {
              k = 3;
            }

            b_temp_tmp_0 = b_temp_tmp_tmp_0 + k;
            g1 = vr[b_temp_tmp_0];
            if (g1 == 0.0) {
              f1 = 1.0;
              g1 = 0.0;
            } else {
              f1 = vr[b_temp_tmp_tmp + k];
              if (f1 == 0.0) {
                f1 = 0.0;
                g1 = 1.0;
              } else {
                b_temp = fabs(f1);
                s = fabs(g1);
                b_scale = fmax(b_temp, s);
                if (b_scale >= 7.4428285367870146E+137) {
                  do {
                    c_ix++;
                    f1 *= 1.3435752215134178E-138;
                    g1 *= 1.3435752215134178E-138;
                  } while ((fmax(fabs(f1), fabs(g1)) >= 7.4428285367870146E+137)
                           && (c_ix < 20));

                  b_scale = rt_hypotd_snf(f1, g1);
                  f1 /= b_scale;
                  g1 /= b_scale;
                } else if (b_scale <= 1.3435752215134178E-138) {
                  do {
                    f1 *= 7.4428285367870146E+137;
                    g1 *= 7.4428285367870146E+137;
                  } while (fmax(fabs(f1), fabs(g1)) <= 1.3435752215134178E-138);

                  b_scale = rt_hypotd_snf(f1, g1);
                  f1 /= b_scale;
                  g1 /= b_scale;
                } else {
                  b_scale = rt_hypotd_snf(f1, g1);
                  f1 /= b_scale;
                  g1 /= b_scale;
                }

                if ((b_temp > s) && (f1 < 0.0)) {
                  f1 = -f1;
                  g1 = -g1;
                }
              }
            }

            b_temp = f1 * vr[b_temp_tmp_tmp] + g1 * vr[b_temp_tmp_tmp_0];
            vr[b_temp_tmp_tmp_0] = f1 * vr[b_temp_tmp_tmp_0] - g1 *
              vr[b_temp_tmp_tmp];
            vr[b_temp_tmp_tmp] = b_temp;
            b_scale = vr[b_temp_tmp_tmp_0 + 1];
            s = vr[b_temp_tmp_tmp + 1];
            vr[b_temp_tmp_tmp_0 + 1] = b_scale * f1 - s * g1;
            vr[b_temp_tmp_tmp + 1] = s * f1 + b_scale * g1;
            b_temp = vr[b_temp_tmp_tmp_0 + 2];
            b_scale = vr[b_temp_tmp_tmp + 2];
            vr[b_temp_tmp_tmp_0 + 2] = b_temp * f1 - b_scale * g1;
            vr[b_temp_tmp_tmp + 2] = b_scale * f1 + b_temp * g1;
            b_scale = vr[b_temp_tmp_tmp_0 + 3];
            b_temp = vr[b_temp_tmp_tmp + 3];
            vr[b_temp_tmp_tmp_0 + 3] = b_scale * f1 - b_temp * g1;
            vr[b_temp_tmp_tmp + 3] = b_temp * f1 + b_scale * g1;
            vr[b_temp_tmp_0] = 0.0;
          } else {
            b_temp_tmp_0 = (ihi << 2) + 1;
            b_temp = 1.0 / controller13_xnrm2(4, vr, b_temp_tmp_0);
            k = 4 + b_temp_tmp_0;
            vectorUB = b_temp_tmp_0 + 2;
            for (c_ix = b_temp_tmp_0; c_ix <= vectorUB; c_ix += 2) {
              tmp = _mm_loadu_pd(&vr[c_ix - 1]);
              _mm_storeu_pd(&vr[c_ix - 1], _mm_mul_pd(tmp, _mm_set1_pd(b_temp)));
            }

            for (c_ix = k; c_ix <= b_temp_tmp_0 + 3; c_ix++) {
              vr[c_ix - 1] *= b_temp;
            }
          }
        }
      }

      for (b_temp_tmp_0 = 0; b_temp_tmp_0 < 16; b_temp_tmp_0++) {
        V[b_temp_tmp_0].re = vr[b_temp_tmp_0];
        V[b_temp_tmp_0].im = 0.0;
      }

      for (ihi = 0; ihi < 3; ihi++) {
        if ((wi[ihi] > 0.0) && (wi[ihi + 1] < 0.0)) {
          c_ix = ihi << 2;
          b_temp = V[c_ix].re;
          s = V[(ihi + 1) << 2].re;
          V[c_ix].re = b_temp;
          V[c_ix].im = s;
          V[(ihi + 1) << 2].re = b_temp;
          V[(ihi + 1) << 2].im = -s;
          b_temp = V[(ihi << 2) + 1].re;
          s = V[((ihi + 1) << 2) + 1].re;
          V[(ihi << 2) + 1].re = b_temp;
          V[(ihi << 2) + 1].im = s;
          V[((ihi + 1) << 2) + 1].re = b_temp;
          V[((ihi + 1) << 2) + 1].im = -s;
          b_temp = V[c_ix + 2].re;
          b_temp_tmp_tmp = ((ihi + 1) << 2) + 2;
          s = V[b_temp_tmp_tmp].re;
          V[c_ix + 2].re = b_temp;
          V[c_ix + 2].im = s;
          V[b_temp_tmp_tmp].re = b_temp;
          V[b_temp_tmp_tmp].im = -s;
          b_temp = V[c_ix + 3].re;
          b_temp_tmp_tmp = ((ihi + 1) << 2) + 3;
          s = V[b_temp_tmp_tmp].re;
          V[c_ix + 3].re = b_temp;
          V[c_ix + 3].im = s;
          V[b_temp_tmp_tmp].re = b_temp;
          V[b_temp_tmp_tmp].im = -s;
        }
      }
    } else {
      for (b_temp_tmp_0 = 0; b_temp_tmp_0 < 16; b_temp_tmp_0++) {
        V[b_temp_tmp_0].re = (rtNaN);
        V[b_temp_tmp_0].im = 0.0;
      }
    }

    if (scalea) {
      controller13_xzlascl_g(absxk, anrm, 4 - info, wr, info + 1);
      controller13_xzlascl_g(absxk, anrm, 4 - info, wi, info + 1);
      if (info != 0) {
        controller13_xzlascl_g(absxk, anrm, b_k - 1, wr, 1);
        controller13_xzlascl_g(absxk, anrm, b_k - 1, wi, 1);
      }
    }

    if (info != 0) {
      for (ihi = b_k; ihi <= info; ihi++) {
        wr[ihi - 1] = (rtNaN);
        wi[ihi - 1] = 0.0;
      }
    }

    D[0].re = wr[0];
    D[0].im = wi[0];
    D[1].re = wr[1];
    D[1].im = wi[1];
    D[2].re = wr[2];
    D[2].im = wi[2];
    D[3].re = wr[3];
    D[3].im = wi[3];
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzlascl_gc(real_T cfrom, real_T cto, int32_T m, real_T
  A[3], int32_T iA0)
{
  real_T cfromc;
  real_T ctoc;
  int32_T b_i;
  boolean_T notdone;
  cfromc = cfrom;
  ctoc = cto;
  notdone = true;
  while (notdone) {
    real_T cfrom1;
    real_T cto1;
    real_T mul;
    int32_T scalarLB;
    int32_T tmp_0;
    int32_T vectorUB;
    cfrom1 = cfromc * 2.0041683600089728E-292;
    cto1 = ctoc / 4.9896007738368E+291;
    if ((fabs(cfrom1) > fabs(ctoc)) && (ctoc != 0.0)) {
      mul = 2.0041683600089728E-292;
      cfromc = cfrom1;
    } else if (fabs(cto1) > fabs(cfromc)) {
      mul = 4.9896007738368E+291;
      ctoc = cto1;
    } else {
      mul = ctoc / cfromc;
      notdone = false;
    }

    scalarLB = (m / 2) << 1;
    vectorUB = scalarLB - 2;
    for (b_i = 0; b_i <= vectorUB; b_i += 2) {
      __m128d tmp;
      tmp_0 = (b_i + iA0) - 1;
      tmp = _mm_loadu_pd(&A[tmp_0]);
      _mm_storeu_pd(&A[tmp_0], _mm_mul_pd(tmp, _mm_set1_pd(mul)));
    }

    for (b_i = scalarLB; b_i < m; b_i++) {
      tmp_0 = (b_i + iA0) - 1;
      A[tmp_0] *= mul;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xzlartg(real_T f, real_T g, real_T *cs, real_T *sn,
  real_T *r)
{
  real_T f1;
  real_T g1;
  real_T scale;
  real_T scale_tmp;
  real_T scale_tmp_0;
  int32_T b_i;
  int32_T count;
  if (g == 0.0) {
    *cs = 1.0;
    *sn = 0.0;
    *r = f;
  } else if (f == 0.0) {
    *cs = 0.0;
    *sn = 1.0;
    *r = g;
  } else {
    f1 = f;
    g1 = g;
    scale_tmp = fabs(f);
    scale_tmp_0 = fabs(g);
    scale = fmax(scale_tmp, scale_tmp_0);
    count = -1;
    if (scale >= 7.4428285367870146E+137) {
      do {
        count++;
        f1 *= 1.3435752215134178E-138;
        g1 *= 1.3435752215134178E-138;
      } while ((fmax(fabs(f1), fabs(g1)) >= 7.4428285367870146E+137) && (count +
                1 < 20));

      *r = rt_hypotd_snf(f1, g1);
      *cs = f1 / *r;
      *sn = g1 / *r;
      for (b_i = 0; b_i <= count; b_i++) {
        *r *= 7.4428285367870146E+137;
      }
    } else if (scale <= 1.3435752215134178E-138) {
      do {
        count++;
        f1 *= 7.4428285367870146E+137;
        g1 *= 7.4428285367870146E+137;
      } while (fmax(fabs(f1), fabs(g1)) <= 1.3435752215134178E-138);

      *r = rt_hypotd_snf(f1, g1);
      *cs = f1 / *r;
      *sn = g1 / *r;
      for (b_i = 0; b_i <= count; b_i++) {
        *r *= 1.3435752215134178E-138;
      }
    } else {
      *r = rt_hypotd_snf(f, g);
      *cs = f / *r;
      *sn = g / *r;
    }

    if ((scale_tmp > scale_tmp_0) && (*cs < 0.0)) {
      *cs = -*cs;
      *sn = -*sn;
      *r = -*r;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_rotateRight_f(int32_T n, real_T z[16], int32_T iz0,
  const real_T cs[6], int32_T ic0, int32_T is0)
{
  int32_T b_j;
  for (b_j = 0; b_j <= n - 2; b_j++) {
    real_T ctemp;
    real_T stemp;
    int32_T offsetj;
    int32_T offsetjp1;
    ctemp = cs[(ic0 + b_j) - 1];
    stemp = cs[(is0 + b_j) - 1];
    offsetj = ((b_j << 2) + iz0) - 1;
    offsetjp1 = (((b_j + 1) << 2) + iz0) - 1;
    if ((ctemp != 1.0) || (stemp != 0.0)) {
      real_T temp;
      real_T z_0;
      temp = z[offsetjp1];
      z_0 = z[offsetj];
      z[offsetjp1] = ctemp * temp - stemp * z_0;
      z[offsetj] = stemp * temp + ctemp * z_0;
      temp = z[offsetjp1 + 1];
      z_0 = z[offsetj + 1];
      z[offsetjp1 + 1] = ctemp * temp - z_0 * stemp;
      z[offsetj + 1] = z_0 * ctemp + stemp * temp;
      temp = z[offsetjp1 + 2];
      z_0 = z[offsetj + 2];
      z[offsetjp1 + 2] = ctemp * temp - z_0 * stemp;
      z[offsetj + 2] = z_0 * ctemp + stemp * temp;
      temp = z[offsetjp1 + 3];
      z_0 = z[offsetj + 3];
      z[offsetjp1 + 3] = ctemp * temp - z_0 * stemp;
      z[offsetj + 3] = z_0 * ctemp + stemp * temp;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_xdlaev2(real_T a, real_T b, real_T c, real_T *rt1,
  real_T *rt2, real_T *cs1, real_T *sn1)
{
  real_T ab;
  real_T acmn;
  real_T acmx;
  real_T adf;
  real_T df;
  real_T sm;
  real_T tb;
  int32_T sgn1;
  int32_T sgn2;
  sm = a + c;
  df = a - c;
  adf = fabs(df);
  tb = b + b;
  ab = fabs(tb);
  if (fabs(a) > fabs(c)) {
    acmx = a;
    acmn = c;
  } else {
    acmx = c;
    acmn = a;
  }

  if (adf > ab) {
    real_T b_a;
    b_a = ab / adf;
    adf *= sqrt(b_a * b_a + 1.0);
  } else if (adf < ab) {
    adf /= ab;
    adf = sqrt(adf * adf + 1.0) * ab;
  } else {
    adf = ab * 1.4142135623730951;
  }

  if (sm < 0.0) {
    *rt1 = (sm - adf) * 0.5;
    sgn1 = -1;
    *rt2 = acmx / *rt1 * acmn - b / *rt1 * b;
  } else if (sm > 0.0) {
    *rt1 = (sm + adf) * 0.5;
    sgn1 = 1;
    *rt2 = acmx / *rt1 * acmn - b / *rt1 * b;
  } else {
    *rt1 = 0.5 * adf;
    *rt2 = -0.5 * adf;
    sgn1 = 1;
  }

  if (df >= 0.0) {
    df += adf;
    sgn2 = 1;
  } else {
    df -= adf;
    sgn2 = -1;
  }

  if (fabs(df) > ab) {
    tb = -tb / df;
    *sn1 = 1.0 / sqrt(tb * tb + 1.0);
    *cs1 = tb * *sn1;
  } else if (ab == 0.0) {
    *cs1 = 1.0;
    *sn1 = 0.0;
  } else {
    tb = -df / tb;
    *cs1 = 1.0 / sqrt(tb * tb + 1.0);
    *sn1 = tb * *cs1;
  }

  if (sgn1 == sgn2) {
    tb = *cs1;
    *cs1 = -*sn1;
    *sn1 = tb;
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_rotateRight(int32_T n, real_T z[16], int32_T iz0, const
  real_T cs[6], int32_T ic0, int32_T is0)
{
  int32_T j;
  for (j = n - 1; j >= 1; j--) {
    real_T ctemp;
    real_T stemp;
    int32_T offsetj;
    int32_T offsetjp1;
    ctemp = cs[(ic0 + j) - 2];
    stemp = cs[(is0 + j) - 2];
    offsetj = (((j - 1) << 2) + iz0) - 1;
    offsetjp1 = ((j << 2) + iz0) - 1;
    if ((ctemp != 1.0) || (stemp != 0.0)) {
      real_T temp;
      real_T z_0;
      temp = z[offsetjp1];
      z_0 = z[offsetj];
      z[offsetjp1] = ctemp * temp - stemp * z_0;
      z[offsetj] = stemp * temp + ctemp * z_0;
      temp = z[offsetjp1 + 1];
      z_0 = z[offsetj + 1];
      z[offsetjp1 + 1] = ctemp * temp - z_0 * stemp;
      z[offsetj + 1] = z_0 * ctemp + stemp * temp;
      temp = z[offsetjp1 + 2];
      z_0 = z[offsetj + 2];
      z[offsetjp1 + 2] = ctemp * temp - z_0 * stemp;
      z[offsetj + 2] = z_0 * ctemp + stemp * temp;
      temp = z[offsetjp1 + 3];
      z_0 = z[offsetj + 3];
      z[offsetjp1 + 3] = ctemp * temp - z_0 * stemp;
      z[offsetj + 3] = z_0 * ctemp + stemp * temp;
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static int32_T controller13_xzsteqr(real_T d[4], real_T e[3], real_T z[16])
{
  real_T work[6];
  real_T b;
  real_T b_anorm;
  real_T b_s;
  real_T c;
  real_T e_0;
  real_T p;
  real_T r;
  real_T s;
  real_T tst;
  int32_T b_anorm_tmp;
  int32_T exitg1;
  int32_T exitg3;
  int32_T exitg4;
  int32_T i;
  int32_T info;
  int32_T iscale;
  int32_T l;
  int32_T l1;
  int32_T lend;
  int32_T lendsv;
  int32_T lsv;
  int32_T m;
  int32_T n_tmp;
  boolean_T exitg2;
  info = 0;
  for (i = 0; i < 6; i++) {
    work[i] = 0.0;
  }

  i = 0;
  l1 = 1;
  do {
    exitg1 = 0;
    if (l1 > 4) {
      for (i = 0; i < 3; i++) {
        l = i;
        p = d[i];
        for (l1 = i + 2; l1 < 5; l1++) {
          tst = d[l1 - 1];
          if (tst < p) {
            l = l1 - 1;
            p = tst;
          }
        }

        if (l != i) {
          d[l] = d[i];
          d[i] = p;
          m = i << 2;
          l <<= 2;
          tst = z[m];
          z[m] = z[l];
          z[l] = tst;
          tst = z[m + 1];
          z[m + 1] = z[l + 1];
          z[l + 1] = tst;
          tst = z[m + 2];
          z[m + 2] = z[l + 2];
          z[l + 2] = tst;
          tst = z[m + 3];
          z[m + 3] = z[l + 3];
          z[l + 3] = tst;
        }
      }

      exitg1 = 1;
    } else {
      if (l1 > 1) {
        e[l1 - 2] = 0.0;
      }

      m = l1;
      exitg2 = false;
      while ((!exitg2) && (m < 4)) {
        tst = fabs(e[m - 1]);
        if (tst == 0.0) {
          exitg2 = true;
        } else if (tst <= sqrt(fabs(d[m - 1])) * sqrt(fabs(d[m])) *
                   2.2204460492503131E-16) {
          e[m - 1] = 0.0;
          exitg2 = true;
        } else {
          m++;
        }
      }

      l = l1 - 1;
      lsv = l1;
      lend = m;
      lendsv = m;
      l1 = m + 1;
      if (l + 1 == m) {
      } else {
        n_tmp = m - l;
        if (n_tmp <= 0) {
          tst = 0.0;
        } else {
          tst = fabs(d[(l + n_tmp) - 1]);
          iscale = 0;
          exitg2 = false;
          while ((!exitg2) && (iscale <= n_tmp - 2)) {
            b_anorm_tmp = l + iscale;
            b_anorm = fabs(d[b_anorm_tmp]);
            if (rtIsNaN(b_anorm)) {
              tst = (rtNaN);
              exitg2 = true;
            } else {
              if (b_anorm > tst) {
                tst = b_anorm;
              }

              b_anorm = fabs(e[b_anorm_tmp]);
              if (rtIsNaN(b_anorm)) {
                tst = (rtNaN);
                exitg2 = true;
              } else {
                if (b_anorm > tst) {
                  tst = b_anorm;
                }

                iscale++;
              }
            }
          }
        }

        iscale = 0;
        if (tst == 0.0) {
        } else if (rtIsInf(tst) || rtIsNaN(tst)) {
          d[0] = (rtNaN);
          d[1] = (rtNaN);
          d[2] = (rtNaN);
          d[3] = (rtNaN);
          for (m = 0; m < 16; m++) {
            z[m] = (rtNaN);
          }

          exitg1 = 1;
        } else {
          if (tst > 2.2346346549904327E+153) {
            iscale = 1;
            controller13_xzlascl_g(tst, 2.2346346549904327E+153, n_tmp, d, l + 1);
            controller13_xzlascl_gc(tst, 2.2346346549904327E+153, n_tmp - 1, e,
              l + 1);
          } else if (tst < 3.02546243347603E-123) {
            iscale = 2;
            controller13_xzlascl_g(tst, 3.02546243347603E-123, n_tmp, d, l + 1);
            controller13_xzlascl_gc(tst, 3.02546243347603E-123, n_tmp - 1, e, l
              + 1);
          }

          if (fabs(d[m - 1]) < fabs(d[l])) {
            lend = lsv;
            l = m - 1;
          }

          if (lend > l + 1) {
            do {
              exitg4 = 0;
              if (l + 1 != lend) {
                m = l;
                exitg2 = false;
                while ((!exitg2) && (m + 1 < lend)) {
                  b_anorm = fabs(e[m]);
                  if (b_anorm * b_anorm <= 4.9303806576313238E-32 * fabs(d[m]) *
                      fabs(d[m + 1]) + 2.2250738585072014E-308) {
                    exitg2 = true;
                  } else {
                    m++;
                  }
                }
              } else {
                m = lend - 1;
              }

              if (m + 1 < lend) {
                e[m] = 0.0;
              }

              if (m + 1 == l + 1) {
                l++;
                if (l + 1 > lend) {
                  exitg4 = 1;
                }
              } else if (m + 1 == l + 2) {
                controller13_xdlaev2(d[l], e[l], d[l + 1], &d[l], &b_anorm,
                                     &work[l], &s);
                d[l + 1] = b_anorm;
                work[l + 3] = s;
                controller13_rotateRight(2, z, (l << 2) + 1, work, l + 1, l + 4);
                e[l] = 0.0;
                l += 2;
                if (l + 1 > lend) {
                  exitg4 = 1;
                }
              } else if (i == 120) {
                exitg4 = 1;
              } else {
                i++;
                b_anorm = (d[l + 1] - d[l]) / (2.0 * e[l]);
                s = rt_hypotd_snf(b_anorm, 1.0);
                if (!(b_anorm >= 0.0)) {
                  s = -s;
                }

                b_anorm = e[l] / (b_anorm + s) + (d[m] - d[l]);
                s = 1.0;
                c = 1.0;
                p = 0.0;
                for (n_tmp = m; n_tmp >= l + 1; n_tmp--) {
                  e_0 = e[n_tmp - 1];
                  b = c * e_0;
                  controller13_xzlartg(b_anorm, s * e_0, &c, &b_s, &r);
                  s = b_s;
                  if (n_tmp != m) {
                    e[n_tmp] = r;
                  }

                  b_anorm = d[n_tmp] - p;
                  r = (d[n_tmp - 1] - b_anorm) * b_s + 2.0 * c * b;
                  p = b_s * r;
                  d[n_tmp] = b_anorm + p;
                  b_anorm = c * r - b;
                  work[n_tmp - 1] = c;
                  work[n_tmp + 2] = -b_s;
                }

                controller13_rotateRight((m - l) + 1, z, (l << 2) + 1, work, l +
                  1, l + 4);
                d[l] -= p;
                e[l] = b_anorm;
              }
            } while (exitg4 == 0);
          } else {
            do {
              exitg3 = 0;
              if (l + 1 != lend) {
                m = l + 1;
                exitg2 = false;
                while ((!exitg2) && (m > lend)) {
                  b_anorm = fabs(e[m - 2]);
                  if (b_anorm * b_anorm <= fabs(d[m - 1]) *
                      4.9303806576313238E-32 * fabs(d[m - 2]) +
                      2.2250738585072014E-308) {
                    exitg2 = true;
                  } else {
                    m--;
                  }
                }
              } else {
                m = lend;
              }

              if (m > lend) {
                e[m - 2] = 0.0;
              }

              if (l + 1 == m) {
                l--;
                if (l + 1 < lend) {
                  exitg3 = 1;
                }
              } else if (m == l) {
                controller13_xdlaev2(d[l - 1], e[l - 1], d[l], &d[l - 1],
                                     &b_anorm, &work[m - 1], &s);
                d[l] = b_anorm;
                work[m + 2] = s;
                controller13_rotateRight_f(2, z, ((l - 1) << 2) + 1, work, m, m
                  + 3);
                e[l - 1] = 0.0;
                l -= 2;
                if (l + 1 < lend) {
                  exitg3 = 1;
                }
              } else if (i == 120) {
                exitg3 = 1;
              } else {
                i++;
                p = e[l - 1];
                b_anorm = (d[l - 1] - d[l]) / (p * 2.0);
                s = rt_hypotd_snf(b_anorm, 1.0);
                if (!(b_anorm >= 0.0)) {
                  s = -s;
                }

                b_anorm = (d[m - 1] - d[l]) + p / (b_anorm + s);
                s = 1.0;
                c = 1.0;
                p = 0.0;
                for (n_tmp = m; n_tmp <= l; n_tmp++) {
                  e_0 = e[n_tmp - 1];
                  b = c * e_0;
                  controller13_xzlartg(b_anorm, s * e_0, &c, &b_s, &r);
                  s = b_s;
                  if (n_tmp != m) {
                    e[n_tmp - 2] = r;
                  }

                  b_anorm = d[n_tmp - 1] - p;
                  r = (d[n_tmp] - b_anorm) * b_s + 2.0 * c * b;
                  p = b_s * r;
                  d[n_tmp - 1] = b_anorm + p;
                  b_anorm = c * r - b;
                  work[n_tmp - 1] = c;
                  work[n_tmp + 2] = b_s;
                }

                controller13_rotateRight_f((l - m) + 2, z, ((m - 1) << 2) + 1,
                  work, m, m + 3);
                d[l] -= p;
                e[l - 1] = b_anorm;
              }
            } while (exitg3 == 0);
          }

          if (iscale == 1) {
            m = lendsv - lsv;
            controller13_xzlascl_g(2.2346346549904327E+153, tst, m + 1, d, lsv);
            controller13_xzlascl_gc(2.2346346549904327E+153, tst, m, e, lsv);
          } else if (iscale == 2) {
            m = lendsv - lsv;
            controller13_xzlascl_g(3.02546243347603E-123, tst, m + 1, d, lsv);
            controller13_xzlascl_gc(3.02546243347603E-123, tst, m, e, lsv);
          }

          if (i >= 120) {
            if (e[0] != 0.0) {
              info = 1;
            }

            if (e[1] != 0.0) {
              info++;
            }

            if (e[2] != 0.0) {
              info++;
            }

            exitg1 = 1;
          }
        }
      }
    }
  } while (exitg1 == 0);

  return info;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_eig(const real_T A[16], creal_T V[16], creal_T D[4])
{
  __m128d tmp;
  real_T Q[16];
  real_T b_A[16];
  real_T a__4[4];
  real_T work[4];
  real_T e[3];
  real_T tau[3];
  real_T absx;
  real_T anrm;
  real_T tau_tmp;
  real_T temp1;
  real_T temp2;
  int32_T ai_tmp;
  int32_T b_ix;
  int32_T b_iy;
  int32_T b_iy_tmp;
  int32_T c_j;
  int32_T e_tmp_tmp;
  int32_T exitg1;
  int32_T ii;
  int32_T sgn;
  int32_T sgn_tmp;
  int32_T tau_tmp_tmp;
  boolean_T exitg2;
  boolean_T iscale;
  iscale = true;
  for (c_j = 0; c_j < 16; c_j++) {
    if (iscale) {
      anrm = A[c_j];
      if ((!rtIsInf(anrm)) && (!rtIsNaN(anrm))) {
      } else {
        iscale = false;
      }
    } else {
      iscale = false;
    }
  }

  if (!iscale) {
    for (b_ix = 0; b_ix < 16; b_ix++) {
      V[b_ix].re = (rtNaN);
      V[b_ix].im = 0.0;
    }

    D[0].re = (rtNaN);
    D[0].im = 0.0;
    D[1].re = (rtNaN);
    D[1].im = 0.0;
    D[2].re = (rtNaN);
    D[2].im = 0.0;
    D[3].re = (rtNaN);
    D[3].im = 0.0;
  } else {
    c_j = 0;
    exitg2 = false;
    while ((!exitg2) && (c_j < 4)) {
      sgn = 0;
      do {
        exitg1 = 0;
        if (sgn <= c_j) {
          if (!(A[(c_j << 2) + sgn] == A[(sgn << 2) + c_j])) {
            iscale = false;
            exitg1 = 1;
          } else {
            sgn++;
          }
        } else {
          c_j++;
          exitg1 = 2;
        }
      } while (exitg1 == 0);

      if (exitg1 == 1) {
        exitg2 = true;
      }
    }

    if (iscale) {
      memcpy(&b_A[0], &A[0], sizeof(real_T) << 4U);
      anrm = 0.0;
      c_j = 0;
      exitg2 = false;
      while ((!exitg2) && (c_j < 4)) {
        sgn = 0;
        do {
          exitg1 = 0;
          if (sgn <= c_j) {
            absx = fabs(A[(c_j << 2) + sgn]);
            if (rtIsNaN(absx)) {
              anrm = (rtNaN);
              exitg1 = 1;
            } else {
              if (absx > anrm) {
                anrm = absx;
              }

              sgn++;
            }
          } else {
            c_j++;
            exitg1 = 2;
          }
        } while (exitg1 == 0);

        if (exitg1 == 1) {
          exitg2 = true;
        }
      }

      if (rtIsInf(anrm) || rtIsNaN(anrm)) {
        a__4[0] = (rtNaN);
        a__4[1] = (rtNaN);
        a__4[2] = (rtNaN);
        a__4[3] = (rtNaN);
        for (b_ix = 0; b_ix < 16; b_ix++) {
          b_A[b_ix] = (rtNaN);
        }
      } else {
        iscale = false;
        if ((anrm > 0.0) && (anrm < 1.0010415475915505E-146)) {
          iscale = true;
          anrm = 1.0010415475915505E-146 / anrm;
          controller13_xzlascl(1.0, anrm, b_A);
        } else if (anrm > 9.9895953610111751E+145) {
          iscale = true;
          anrm = 9.9895953610111751E+145 / anrm;
          controller13_xzlascl(1.0, anrm, b_A);
        }

        for (c_j = 0; c_j < 3; c_j++) {
          ai_tmp = c_j << 2;
          e_tmp_tmp = ai_tmp + c_j;
          e[c_j] = b_A[e_tmp_tmp + 1];
          if (c_j + 3 <= 4) {
            b_ix = c_j + 3;
          } else {
            b_ix = 4;
          }

          absx = controller13_xzlarfg(3 - c_j, &e[c_j], b_A, ai_tmp + b_ix);
          if (absx != 0.0) {
            b_A[e_tmp_tmp + 1] = 1.0;
            for (sgn = c_j + 1; sgn < 4; sgn++) {
              tau[sgn - 1] = 0.0;
            }

            sgn_tmp = 2 - c_j;
            b_iy_tmp = 3 - c_j;
            for (b_ix = 0; b_ix <= sgn_tmp; b_ix++) {
              sgn = c_j + b_ix;
              temp1 = b_A[(sgn + ai_tmp) + 1] * absx;
              temp2 = 0.0;
              b_iy = ((sgn + 1) << 2) + c_j;
              tau[sgn] += b_A[(b_iy + b_ix) + 1] * temp1;
              for (ii = b_ix + 2; ii <= b_iy_tmp; ii++) {
                tau_tmp_tmp = c_j + ii;
                tau_tmp = b_A[b_iy + ii];
                tau[tau_tmp_tmp - 1] += tau_tmp * temp1;
                temp2 += b_A[tau_tmp_tmp + ai_tmp] * tau_tmp;
              }

              tau[sgn] += absx * temp2;
            }

            sgn = e_tmp_tmp + 1;
            b_iy = e_tmp_tmp + 1;
            temp1 = 0.0;
            for (ii = 0; ii <= sgn_tmp; ii++) {
              temp1 += tau[c_j + ii] * b_A[b_iy];
              b_iy++;
            }

            temp1 *= -0.5 * absx;
            if (!(temp1 == 0.0)) {
              for (ii = 0; ii <= sgn_tmp; ii++) {
                b_iy = c_j + ii;
                tau[b_iy] += temp1 * b_A[sgn];
                sgn++;
              }
            }

            for (b_ix = 0; b_ix <= sgn_tmp; b_ix++) {
              sgn = c_j + b_ix;
              temp1 = b_A[(sgn + ai_tmp) + 1];
              temp2 = tau[sgn];
              tau_tmp = temp2 * temp1;
              b_iy = (sgn + 1) << 2;
              tau_tmp_tmp = b_iy + c_j;
              b_A[(sgn + b_iy) + 1] = (b_A[(tau_tmp_tmp + b_ix) + 1] - tau_tmp)
                - tau_tmp;
              for (ii = b_ix + 2; ii <= b_iy_tmp; ii++) {
                sgn = c_j + ii;
                b_A[sgn + b_iy] = (b_A[tau_tmp_tmp + ii] - tau[sgn - 1] * temp1)
                  - b_A[sgn + ai_tmp] * temp2;
              }
            }
          }

          b_A[e_tmp_tmp + 1] = e[c_j];
          a__4[c_j] = b_A[e_tmp_tmp];
          tau[c_j] = absx;
        }

        a__4[3] = b_A[15];
        for (c_j = 2; c_j >= 0; c_j--) {
          b_iy = (c_j + 1) << 2;
          b_A[b_iy] = 0.0;
          for (sgn = c_j + 3; sgn < 5; sgn++) {
            b_A[(sgn + b_iy) - 1] = b_A[((c_j << 2) + sgn) - 1];
          }
        }

        b_A[0] = 1.0;
        b_A[1] = 0.0;
        b_A[2] = 0.0;
        b_A[3] = 0.0;
        work[0] = 0.0;
        work[1] = 0.0;
        work[2] = 0.0;
        work[3] = 0.0;
        for (sgn = 2; sgn >= 0; sgn--) {
          b_ix = ((sgn << 2) + sgn) + 5;
          if (sgn + 1 < 3) {
            b_A[b_ix] = 1.0;
            controller13_xzlarf(3 - sgn, 2 - sgn, b_ix + 1, tau[sgn], b_A, b_ix
                                + 5, work);
            b_iy = (b_ix - sgn) + 3;
            c_j = (((((b_iy - b_ix) - 1) / 2) << 1) + b_ix) + 2;
            ai_tmp = c_j - 2;
            for (ii = b_ix + 2; ii <= ai_tmp; ii += 2) {
              tmp = _mm_loadu_pd(&b_A[ii - 1]);
              _mm_storeu_pd(&b_A[ii - 1], _mm_mul_pd(tmp, _mm_set1_pd(-tau[sgn])));
            }

            for (ii = c_j; ii <= b_iy; ii++) {
              b_A[ii - 1] *= -tau[sgn];
            }
          }

          b_A[b_ix] = 1.0 - tau[sgn];
          for (ii = 0; ii < sgn; ii++) {
            b_A[(b_ix - ii) - 1] = 0.0;
          }
        }

        c_j = controller13_xzsteqr(a__4, e, b_A);
        if (c_j != 0) {
          a__4[0] = (rtNaN);
          a__4[1] = (rtNaN);
          a__4[2] = (rtNaN);
          a__4[3] = (rtNaN);
          for (b_ix = 0; b_ix < 16; b_ix++) {
            b_A[b_ix] = (rtNaN);
          }
        } else if (iscale) {
          anrm = 1.0 / anrm;
          a__4[0] *= anrm;
          a__4[1] *= anrm;
          a__4[2] *= anrm;
          a__4[3] *= anrm;
        }
      }

      D[0].re = a__4[0];
      D[0].im = 0.0;
      D[1].re = a__4[1];
      D[1].im = 0.0;
      D[2].re = a__4[2];
      D[2].im = 0.0;
      D[3].re = a__4[3];
      D[3].im = 0.0;
      for (b_ix = 0; b_ix < 16; b_ix++) {
        V[b_ix].re = b_A[b_ix];
        V[b_ix].im = 0.0;
      }
    } else {
      iscale = true;
      c_j = 0;
      exitg2 = false;
      while ((!exitg2) && (c_j < 4)) {
        sgn = 0;
        do {
          exitg1 = 0;
          if (sgn <= c_j) {
            if (!(A[(c_j << 2) + sgn] == -A[(sgn << 2) + c_j])) {
              iscale = false;
              exitg1 = 1;
            } else {
              sgn++;
            }
          } else {
            c_j++;
            exitg1 = 2;
          }
        } while (exitg1 == 0);

        if (exitg1 == 1) {
          exitg2 = true;
        }
      }

      if (iscale) {
        memcpy(&b_A[0], &A[0], sizeof(real_T) << 4U);
        controller13_xzgehrd(b_A, 1, 4, tau);
        memcpy(&Q[0], &b_A[0], sizeof(real_T) << 4U);
        controller13_xzunghr(1, 4, Q, tau);
        controller13_xdlahqr(1, 4, b_A, 1, 4, Q, &c_j, a__4, work);
        sgn = (uint8_T)c_j;
        for (b_ix = 0; b_ix < sgn; b_ix++) {
          D[b_ix].re = (rtNaN);
          D[b_ix].im = 0.0;
        }

        for (sgn = c_j + 1; sgn < 5; sgn++) {
          D[sgn - 1].re = 0.0;
          D[sgn - 1].im = work[sgn - 1];
        }

        if (c_j == 0) {
          for (b_ix = 0; b_ix < 16; b_ix++) {
            V[b_ix].re = Q[b_ix];
            V[b_ix].im = 0.0;
          }

          c_j = 1;
          do {
            exitg1 = 0;
            if (c_j <= 4) {
              if (c_j != 4) {
                b_ix = (c_j - 1) << 2;
                anrm = b_A[b_ix + c_j];
                if (anrm != 0.0) {
                  if (anrm < 0.0) {
                    sgn = 1;
                  } else {
                    sgn = -1;
                  }

                  anrm = V[b_ix].re;
                  ai_tmp = c_j << 2;
                  absx = V[ai_tmp].re * (real_T)sgn;
                  if (absx == 0.0) {
                    V[b_ix].re = anrm / 1.4142135623730951;
                    V[b_ix].im = 0.0;
                  } else if (anrm == 0.0) {
                    V[b_ix].re = 0.0;
                    V[b_ix].im = absx / 1.4142135623730951;
                  } else {
                    V[b_ix].re = anrm / 1.4142135623730951;
                    V[b_ix].im = absx / 1.4142135623730951;
                  }

                  V[ai_tmp].re = V[b_ix].re;
                  V[ai_tmp].im = -V[b_ix].im;
                  anrm = V[b_ix + 1].re;
                  absx = V[ai_tmp + 1].re * (real_T)sgn;
                  if (absx == 0.0) {
                    V[b_ix + 1].re = anrm / 1.4142135623730951;
                    V[b_ix + 1].im = 0.0;
                  } else if (anrm == 0.0) {
                    V[b_ix + 1].re = 0.0;
                    V[b_ix + 1].im = absx / 1.4142135623730951;
                  } else {
                    V[b_ix + 1].re = anrm / 1.4142135623730951;
                    V[b_ix + 1].im = absx / 1.4142135623730951;
                  }

                  V[ai_tmp + 1].re = V[b_ix + 1].re;
                  V[ai_tmp + 1].im = -V[b_ix + 1].im;
                  anrm = V[b_ix + 2].re;
                  absx = V[ai_tmp + 2].re * (real_T)sgn;
                  if (absx == 0.0) {
                    V[b_ix + 2].re = anrm / 1.4142135623730951;
                    V[b_ix + 2].im = 0.0;
                  } else if (anrm == 0.0) {
                    V[b_ix + 2].re = 0.0;
                    V[b_ix + 2].im = absx / 1.4142135623730951;
                  } else {
                    V[b_ix + 2].re = anrm / 1.4142135623730951;
                    V[b_ix + 2].im = absx / 1.4142135623730951;
                  }

                  V[ai_tmp + 2].re = V[b_ix + 2].re;
                  V[ai_tmp + 2].im = -V[b_ix + 2].im;
                  anrm = V[b_ix + 3].re;
                  absx = V[ai_tmp + 3].re * (real_T)sgn;
                  if (absx == 0.0) {
                    V[b_ix + 3].re = anrm / 1.4142135623730951;
                    V[b_ix + 3].im = 0.0;
                  } else if (anrm == 0.0) {
                    V[b_ix + 3].re = 0.0;
                    V[b_ix + 3].im = absx / 1.4142135623730951;
                  } else {
                    V[b_ix + 3].re = anrm / 1.4142135623730951;
                    V[b_ix + 3].im = absx / 1.4142135623730951;
                  }

                  V[ai_tmp + 3].re = V[b_ix + 3].re;
                  V[ai_tmp + 3].im = -V[b_ix + 3].im;
                  c_j += 2;
                } else {
                  c_j++;
                }
              } else {
                c_j++;
              }
            } else {
              exitg1 = 1;
            }
          } while (exitg1 == 0);
        } else {
          for (b_ix = 0; b_ix < 16; b_ix++) {
            V[b_ix].re = (rtNaN);
            V[b_ix].im = 0.0;
          }
        }
      } else {
        controller13_eigStandard(A, V, D);
      }
    }
  }
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static real_T controller13_norm_h(const real_T x[4])
{
  real_T absxk;
  real_T scale;
  real_T t;
  real_T y;
  scale = 3.3121686421112381E-170;
  absxk = fabs(x[0]);
  if (absxk > 3.3121686421112381E-170) {
    y = 1.0;
    scale = absxk;
  } else {
    t = absxk / 3.3121686421112381E-170;
    y = t * t;
  }

  absxk = fabs(x[1]);
  if (absxk > scale) {
    t = scale / absxk;
    y = y * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    y += t * t;
  }

  absxk = fabs(x[2]);
  if (absxk > scale) {
    t = scale / absxk;
    y = y * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    y += t * t;
  }

  absxk = fabs(x[3]);
  if (absxk > scale) {
    t = scale / absxk;
    y = y * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    y += t * t;
  }

  return scale * sqrt(y);
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_chol(real_T A[324])
{
  int32_T b_ix;
  int32_T b_j;
  int32_T b_k;
  int32_T idxA1j;
  int32_T idxAjj;
  int32_T info;
  boolean_T exitg1;
  info = 0;
  b_j = 0;
  exitg1 = false;
  while ((!exitg1) && (b_j < 18)) {
    real_T c;
    real_T ssq;
    idxA1j = b_j * 18;
    idxAjj = idxA1j + b_j;
    ssq = 0.0;
    if (b_j >= 1) {
      for (b_k = 0; b_k < b_j; b_k++) {
        c = A[idxA1j + b_k];
        ssq += c * c;
      }
    }

    ssq = A[idxAjj] - ssq;
    if (ssq > 0.0) {
      ssq = sqrt(ssq);
      A[idxAjj] = ssq;
      if (b_j + 1 < 18) {
        if (b_j != 0) {
          int32_T g;
          g = ((16 - b_j) * 18 + idxA1j) + 19;
          for (b_k = idxA1j + 19; b_k <= g; b_k += 18) {
            int32_T e;
            c = 0.0;
            e = (b_k + b_j) - 1;
            for (b_ix = b_k; b_ix <= e; b_ix++) {
              c += A[(idxA1j + b_ix) - b_k] * A[b_ix - 1];
            }

            b_ix = (div_nde_s32_floor((b_k - idxA1j) - 19, 18) * 18 + idxAjj) +
              18;
            A[b_ix] -= c;
          }
        }

        ssq = 1.0 / ssq;
        b_k = ((16 - b_j) * 18 + idxAjj) + 19;
        for (idxA1j = idxAjj + 19; idxA1j <= b_k; idxA1j += 18) {
          A[idxA1j - 1] *= ssq;
        }
      }

      b_j++;
    } else {
      A[idxAjj] = ssq;
      info = b_j + 1;
      exitg1 = true;
    }
  }

  if (info == 0) {
    b_ix = 17;
  } else {
    b_ix = info - 2;
  }

  idxAjj = b_ix - 1;
  for (info = 0; info <= idxAjj; info++) {
    for (b_j = info + 2; b_j <= idxAjj + 2; b_j++) {
      A[(b_j + 18 * info) - 1] = 0.0;
    }
  }
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_Quaternion_multiply(const real_T q_left[4], const
  real_T q_right[4], real_T q[4])
{
  real_T b_q[4];
  real_T tmp;
  real_T tmp_0;
  tmp = fabs(controller13_norm_h(q_left) - 1.0);
  if (tmp >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_left[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  tmp_0 = fabs(controller13_norm_h(q_right) - 1.0);
  if (tmp_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_right[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (tmp >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_left[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (tmp_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_right[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  q[0] = ((q_left[0] * q_right[0] - q_left[1] * q_right[1]) - q_left[2] *
          q_right[2]) - q_left[3] * q_right[3];
  q[1] = ((q_left[0] * q_right[1] + q_right[0] * q_left[1]) + q_left[2] *
          q_right[3]) - q_right[2] * q_left[3];
  q[2] = ((q_left[0] * q_right[2] - q_left[1] * q_right[3]) + q_right[0] *
          q_left[2]) + q_right[1] * q_left[3];
  q[3] = ((q_left[0] * q_right[3] + q_left[1] * q_right[2]) - q_right[1] *
          q_left[2]) + q_right[0] * q_left[3];
  tmp = controller13_norm_h(q);
  b_q[0] = q[0] / tmp;
  b_q[1] = q[1] / tmp;
  b_q[2] = q[2] / tmp;
  b_q[3] = q[3] / tmp;
  if (q[0] < 0.0) {
    b_q[0] = -b_q[0];
    b_q[1] = -b_q[1];
    b_q[2] = -b_q[2];
    b_q[3] = -b_q[3];
  }

  tmp = controller13_norm_h(b_q);
  if (fabs(tmp - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (b_q[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  q[0] = b_q[0] / tmp;
  q[1] = b_q[1] / tmp;
  q[2] = b_q[2] / tmp;
  q[3] = b_q[3] / tmp;
  if (b_q[0] < 0.0) {
    q[0] = -q[0];
    q[1] = -q[1];
    q[2] = -q[2];
    q[3] = -q[3];
  }

  if (fabs(controller13_norm_h(q) - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_UKF_dp_to_q(const real_T dp[3], const real_T q_ref[4],
  real_T q[4])
{
  real_T dq[4];
  real_T absxk;
  real_T norm_dp_squared;
  real_T scale;
  real_T t;
  scale = 3.3121686421112381E-170;
  absxk = fabs(dp[0]);
  if (absxk > 3.3121686421112381E-170) {
    norm_dp_squared = 1.0;
    scale = absxk;
  } else {
    t = absxk / 3.3121686421112381E-170;
    norm_dp_squared = t * t;
  }

  absxk = fabs(dp[1]);
  if (absxk > scale) {
    t = scale / absxk;
    norm_dp_squared = norm_dp_squared * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    norm_dp_squared += t * t;
  }

  absxk = fabs(dp[2]);
  if (absxk > scale) {
    t = scale / absxk;
    norm_dp_squared = norm_dp_squared * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    norm_dp_squared += t * t;
  }

  norm_dp_squared = scale * sqrt(norm_dp_squared);
  norm_dp_squared *= norm_dp_squared;
  norm_dp_squared = (sqrt(0.75 * norm_dp_squared + 9.0) * 3.0 + -0.5 *
                     norm_dp_squared) / (norm_dp_squared + 9.0);
  scale = (norm_dp_squared + 0.5) * 0.33333333333333331;
  q[0] = norm_dp_squared;
  q[1] = scale * dp[0];
  q[2] = scale * dp[1];
  q[3] = scale * dp[2];
  scale = controller13_norm_h(q);
  dq[0] = norm_dp_squared / scale;
  dq[1] = q[1] / scale;
  dq[2] = q[2] / scale;
  dq[3] = q[3] / scale;
  if (norm_dp_squared < 0.0) {
    dq[0] = -dq[0];
    dq[1] = -dq[1];
    dq[2] = -dq[2];
    dq[3] = -dq[3];
  }

  norm_dp_squared = controller13_norm_h(dq);
  if (fabs(norm_dp_squared - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (dq[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  q[0] = dq[0];
  scale = dq[0] / norm_dp_squared;
  dq[0] = scale;
  absxk = dq[1] / norm_dp_squared;
  dq[1] = absxk;
  t = dq[2] / norm_dp_squared;
  dq[2] = t;
  norm_dp_squared = dq[3] / norm_dp_squared;
  dq[3] = norm_dp_squared;
  if (q[0] < 0.0) {
    dq[0] = -scale;
    dq[1] = -absxk;
    dq[2] = -t;
    dq[3] = -norm_dp_squared;
  }

  if (fabs(controller13_norm_h(dq) - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (dq[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  controller13_Quaternion_multiply(dq, q_ref, q);
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_quat2rotm(real_T q_a, real_T q_b, real_T q_c, real_T
  q_d, real_T R[9])
{
  real_T tempR[9];
  real_T b_q_idx_0;
  real_T b_q_idx_1;
  real_T b_q_idx_2;
  real_T b_q_idx_3;
  real_T tempR_tmp;
  real_T tempR_tmp_0;
  real_T tempR_tmp_1;
  real_T tempR_tmp_2;
  real_T tempR_tmp_3;
  real_T tempR_tmp_4;
  int32_T c_k;
  b_q_idx_3 = 1.0 / sqrt(((q_a * q_a + q_b * q_b) + q_c * q_c) + q_d * q_d);
  b_q_idx_0 = q_a * b_q_idx_3;
  b_q_idx_1 = q_b * b_q_idx_3;
  b_q_idx_2 = q_c * b_q_idx_3;
  b_q_idx_3 *= q_d;
  tempR_tmp_1 = b_q_idx_3 * b_q_idx_3;
  tempR_tmp_4 = b_q_idx_2 * b_q_idx_2;
  tempR[0] = 1.0 - (tempR_tmp_4 + tempR_tmp_1) * 2.0;
  tempR_tmp = b_q_idx_1 * b_q_idx_2;
  tempR_tmp_0 = b_q_idx_0 * b_q_idx_3;
  tempR[1] = (tempR_tmp - tempR_tmp_0) * 2.0;
  tempR_tmp_2 = b_q_idx_1 * b_q_idx_3;
  tempR_tmp_3 = b_q_idx_0 * b_q_idx_2;
  tempR[2] = (tempR_tmp_2 + tempR_tmp_3) * 2.0;
  tempR[3] = (tempR_tmp + tempR_tmp_0) * 2.0;
  tempR_tmp = b_q_idx_1 * b_q_idx_1;
  tempR[4] = 1.0 - (tempR_tmp + tempR_tmp_1) * 2.0;
  tempR_tmp_1 = b_q_idx_2 * b_q_idx_3;
  tempR_tmp_0 = b_q_idx_0 * b_q_idx_1;
  tempR[5] = (tempR_tmp_1 - tempR_tmp_0) * 2.0;
  tempR[6] = (tempR_tmp_2 - tempR_tmp_3) * 2.0;
  tempR[7] = (tempR_tmp_1 + tempR_tmp_0) * 2.0;
  tempR[8] = 1.0 - (tempR_tmp + tempR_tmp_4) * 2.0;
  for (c_k = 0; c_k < 3; c_k++) {
    int32_T R_tmp;
    R_tmp = ((int8_T)(c_k + 1) - 1) * 3;
    R[(int8_T)(c_k + 1) - 1] = tempR[R_tmp];
    R[(int8_T)(c_k + 1) + 2] = tempR[R_tmp + 1];
    R[(int8_T)(c_k + 1) + 5] = tempR[R_tmp + 2];
  }
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_Dynamics_step(const real_T p_k[3], const real_T
  p_dot_k[3], const real_T q_k[4], const real_T omega_k[3], real_T f_cmd_k,
  real_T tau_cmd_x_k, real_T tau_cmd_y_k, const real_T F_ext_k[3], const real_T
  tau_ext_k[3], const real_T constants_J[9], real_T p_k_plus_1[3], real_T
  p_dot_k_plus_1[3], real_T q_k_plus_1[4], real_T omega_k_plus_1[3])
{
  real_T A[9];
  real_T q[4];
  real_T B[3];
  real_T b[3];
  int32_T r2;
  int32_T r3;
  int8_T b_I[16];
  static const real_T c[3] = { 0.0, 0.0, -70.607160000000007 };

  __m128d tmp;
  __m128d tmp_0;
  __m128d tmp_1;
  __m128d tmp_2;
  __m128d tmp_3;
  __m128d tmp_4;
  real_T b_I_0[16];
  real_T b_I_tmp;
  real_T b_I_tmp_0;
  real_T b_I_tmp_1;
  real_T omega_k_0;
  real_T p_dot_k_0;
  real_T p_dot_k_plus_1_0;
  static const real_T c_0[3] = { 0.0, 0.0, -70.607160000000007 };

  omega_k_0 = fabs(controller13_norm_h(q_k) - 1.0);
  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  controller13_quat2rotm(q_k[0], q_k[1], q_k[2], q_k[3], A);
  for (r2 = 0; r2 <= 0; r2 += 2) {
    tmp = _mm_loadu_pd(&A[r2 + 3]);
    tmp_4 = _mm_set1_pd(0.0);
    tmp_0 = _mm_loadu_pd(&A[r2]);
    tmp_1 = _mm_loadu_pd(&A[r2 + 6]);
    tmp_2 = _mm_loadu_pd(&p_dot_k[r2]);
    tmp_3 = _mm_loadu_pd(&F_ext_k[r2]);
    tmp = _mm_mul_pd(_mm_add_pd(_mm_add_pd(_mm_add_pd(_mm_add_pd(_mm_add_pd
      (_mm_mul_pd(tmp, tmp_4), _mm_mul_pd(tmp_0, tmp_4)), _mm_mul_pd(tmp_1,
      _mm_set1_pd(f_cmd_k))), _mm_loadu_pd(&c[r2])), _mm_mul_pd(_mm_set1_pd(-2.5),
      tmp_2)), tmp_3), _mm_set1_pd(1.3888888888888886));
    tmp_4 = _mm_set1_pd(0.001);
    _mm_storeu_pd(&p_k_plus_1[r2], _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4, tmp_2),
      _mm_loadu_pd(&p_k[r2])), _mm_mul_pd(_mm_set1_pd(5.0E-7), tmp)));
    _mm_storeu_pd(&p_dot_k_plus_1[r2], _mm_add_pd(_mm_mul_pd(tmp_4, tmp), tmp_2));
  }

  for (r2 = 2; r2 < 3; r2++) {
    p_dot_k_0 = p_dot_k[r2];
    p_dot_k_plus_1_0 = (((((A[r2 + 3] * 0.0 + A[r2] * 0.0) + A[r2 + 6] * f_cmd_k)
                          + c_0[r2]) + -2.5 * p_dot_k_0) + F_ext_k[r2]) *
      1.3888888888888886;
    p_k_plus_1[r2] = (0.001 * p_dot_k_0 + p_k[r2]) + 5.0E-7 * p_dot_k_plus_1_0;
    p_dot_k_plus_1[r2] = 0.001 * p_dot_k_plus_1_0 + p_dot_k_0;
  }

  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  for (r2 = 0; r2 < 16; r2++) {
    b_I[r2] = 0;
  }

  b_I_0[0] = 1.0;
  p_dot_k_0 = 0.5 * omega_k[0] * 0.001;
  b_I_0[1] = p_dot_k_0 + (real_T)b_I[1];
  p_dot_k_plus_1_0 = 0.5 * omega_k[1] * 0.001;
  b_I_0[2] = p_dot_k_plus_1_0 + (real_T)b_I[2];
  b_I_tmp = 0.5 * omega_k[2] * 0.001;
  b_I_0[3] = b_I_tmp + (real_T)b_I[3];
  b_I_tmp_0 = 0.5 * -omega_k[0] * 0.001;
  b_I_0[4] = b_I_tmp_0 + (real_T)b_I[4];
  b_I_0[5] = 1.0;
  b_I_tmp_1 = 0.5 * -omega_k[2] * 0.001;
  b_I_0[6] = b_I_tmp_1 + (real_T)b_I[6];
  b_I_0[7] = p_dot_k_plus_1_0 + (real_T)b_I[7];
  p_dot_k_plus_1_0 = 0.5 * -omega_k[1] * 0.001;
  b_I_0[8] = p_dot_k_plus_1_0 + (real_T)b_I[8];
  b_I_0[9] = b_I_tmp + (real_T)b_I[9];
  b_I_0[10] = 1.0;
  b_I_0[11] = b_I_tmp_0 + (real_T)b_I[11];
  b_I_0[12] = b_I_tmp_1 + (real_T)b_I[12];
  b_I_0[13] = p_dot_k_plus_1_0 + (real_T)b_I[13];
  b_I_0[14] = p_dot_k_0 + (real_T)b_I[14];
  b_I_0[15] = 1.0;
  p_dot_k_0 = q_k[1];
  p_dot_k_plus_1_0 = q_k[0];
  b_I_tmp = q_k[2];
  b_I_tmp_0 = q_k[3];
  for (r2 = 0; r2 <= 2; r2 += 2) {
    tmp = _mm_loadu_pd(&b_I_0[r2 + 4]);
    tmp_4 = _mm_loadu_pd(&b_I_0[r2]);
    tmp_0 = _mm_loadu_pd(&b_I_0[r2 + 8]);
    tmp_1 = _mm_loadu_pd(&b_I_0[r2 + 12]);
    _mm_storeu_pd(&q[r2], _mm_add_pd(_mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp,
      _mm_set1_pd(p_dot_k_0)), _mm_mul_pd(tmp_4, _mm_set1_pd(p_dot_k_plus_1_0))),
      _mm_mul_pd(tmp_0, _mm_set1_pd(b_I_tmp))), _mm_mul_pd(tmp_1, _mm_set1_pd
      (b_I_tmp_0))));
  }

  p_dot_k_0 = controller13_norm_h(q);
  q_k_plus_1[0] = q[0] / p_dot_k_0;
  q_k_plus_1[1] = q[1] / p_dot_k_0;
  q_k_plus_1[2] = q[2] / p_dot_k_0;
  q_k_plus_1[3] = q[3] / p_dot_k_0;
  if (q[0] < 0.0) {
    q_k_plus_1[0] = -q_k_plus_1[0];
    q_k_plus_1[1] = -q_k_plus_1[1];
    q_k_plus_1[2] = -q_k_plus_1[2];
    q_k_plus_1[3] = -q_k_plus_1[3];
  }

  if (omega_k_0 >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_k[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  omega_k_0 = omega_k[1];
  p_dot_k_0 = omega_k[0];
  p_dot_k_plus_1_0 = omega_k[2];
  for (r2 = 0; r2 <= 0; r2 += 2) {
    _mm_storeu_pd(&b[r2], _mm_add_pd(_mm_add_pd(_mm_mul_pd(_mm_loadu_pd
      (&constants_J[r2 + 3]), _mm_set1_pd(omega_k_0)), _mm_mul_pd(_mm_loadu_pd
      (&constants_J[r2]), _mm_set1_pd(p_dot_k_0))), _mm_mul_pd(_mm_loadu_pd
      (&constants_J[r2 + 6]), _mm_set1_pd(p_dot_k_plus_1_0))));
  }

  for (r2 = 2; r2 < 3; r2++) {
    b[r2] = (constants_J[r2 + 3] * omega_k_0 + constants_J[r2] * p_dot_k_0) +
      constants_J[r2 + 6] * p_dot_k_plus_1_0;
  }

  memcpy(&A[0], &constants_J[0], 9U * sizeof(real_T));
  B[0] = ((-(omega_k[1] * b[2] - b[1] * omega_k[2]) + tau_cmd_x_k) + -0.09 *
          omega_k[0]) + tau_ext_k[0];
  B[1] = ((-(b[0] * omega_k[2] - omega_k[0] * b[2]) + tau_cmd_y_k) + -0.09 *
          omega_k[1]) + tau_ext_k[1];
  B[2] = (-(omega_k[0] * b[1] - b[0] * omega_k[1]) + -0.09 * omega_k[2]) +
    tau_ext_k[2];
  r2 = 1;
  r3 = 2;
  A[1] = constants_J[1] / constants_J[0];
  A[2] = constants_J[2] / constants_J[0];
  A[4] = constants_J[4] - A[1] * constants_J[3];
  A[5] = constants_J[5] - A[2] * constants_J[3];
  A[7] = 0.0 - A[1] * constants_J[6];
  A[8] = constants_J[8] - A[2] * constants_J[6];
  if (fabs(A[5]) > fabs(A[4])) {
    r2 = 2;
    r3 = 1;
  }

  A[r3 + 3] /= A[r2 + 3];
  A[r3 + 6] -= A[r3 + 3] * A[r2 + 6];
  omega_k_plus_1[1] = B[r2] - B[0] * A[r2];
  omega_k_plus_1[2] = (B[r3] - B[0] * A[r3]) - A[r3 + 3] * omega_k_plus_1[1];
  omega_k_plus_1[2] /= A[r3 + 6];
  omega_k_plus_1[0] = B[0] - omega_k_plus_1[2] * A[6];
  omega_k_plus_1[1] -= A[r2 + 6] * omega_k_plus_1[2];
  omega_k_plus_1[1] /= A[r2 + 3];
  omega_k_plus_1[0] -= omega_k_plus_1[1] * A[3];
  omega_k_plus_1[0] /= A[0];
  omega_k_plus_1[0] = 0.001 * omega_k_plus_1[0] + omega_k[0];
  omega_k_plus_1[1] = 0.001 * omega_k_plus_1[1] + omega_k[1];
  omega_k_plus_1[2] = 0.001 * omega_k_plus_1[2] + omega_k[2];
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_UKF_q_to_dp(const real_T q[4], const real_T q_ref[4],
  real_T dp[3])
{
  real_T dq[4];
  real_T q_ref_inv[4];
  real_T b_a;
  b_a = controller13_norm_h(q_ref);
  if (fabs(b_a - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_ref[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  b_a *= b_a;
  q_ref_inv[0] = q_ref[0] / b_a;
  q_ref_inv[1] = -q_ref[1] / b_a;
  q_ref_inv[2] = -q_ref[2] / b_a;
  q_ref_inv[3] = -q_ref[3] / b_a;
  if (fabs(controller13_norm_h(q_ref_inv) - 1.0) >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (q_ref_inv[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  controller13_Quaternion_multiply(q, q_ref_inv, dq);
  b_a = fabs(controller13_norm_h(dq) - 1.0);
  if (b_a >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (dq[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (b_a >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (dq[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  if (b_a >= 1.0E-9) {
    printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
    fflush(stdout);
  }

  if (dq[0] < 0.0) {
    printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
    fflush(stdout);
  }

  dp[0] = 3.0 * dq[1] / (dq[0] + 0.5);
  dp[1] = 3.0 * dq[2] / (dq[0] + 0.5);
  dp[2] = 3.0 * dq[3] / (dq[0] + 0.5);
}

/* Function for MATLAB Function: '<S32>/UKF update then predict' */
static void controller13_mrdiv(const real_T A[108], const real_T B[36], real_T
  Y[108])
{
  __m128d tmp;
  real_T b_A[36];
  real_T smax;
  int32_T b_ix;
  int32_T d_j;
  int32_T e;
  int32_T ijA;
  int32_T ix;
  int32_T iy;
  int32_T jj;
  int32_T kBcol;
  int8_T ipiv[6];
  memcpy(&b_A[0], &B[0], 36U * sizeof(real_T));
  memcpy(&Y[0], &A[0], 108U * sizeof(real_T));
  for (b_ix = 0; b_ix < 6; b_ix++) {
    ipiv[b_ix] = (int8_T)(b_ix + 1);
  }

  for (d_j = 0; d_j < 5; d_j++) {
    jj = d_j * 7;
    iy = 6 - d_j;
    b_ix = 0;
    ix = jj;
    smax = fabs(b_A[jj]);
    for (kBcol = 2; kBcol <= iy; kBcol++) {
      real_T s;
      ix++;
      s = fabs(b_A[ix]);
      if (s > smax) {
        b_ix = kBcol - 1;
        smax = s;
      }
    }

    if (b_A[jj + b_ix] != 0.0) {
      if (b_ix != 0) {
        iy = d_j + b_ix;
        ipiv[d_j] = (int8_T)(iy + 1);
        for (ix = 0; ix < 6; ix++) {
          b_ix = ix * 6 + d_j;
          smax = b_A[b_ix];
          b_A[b_ix] = b_A[iy];
          b_A[iy] = smax;
          iy += 6;
        }
      }

      iy = (jj - d_j) + 6;
      ix = (((((iy - jj) - 1) / 2) << 1) + jj) + 2;
      kBcol = ix - 2;
      for (b_ix = jj + 2; b_ix <= kBcol; b_ix += 2) {
        tmp = _mm_loadu_pd(&b_A[b_ix - 1]);
        _mm_storeu_pd(&b_A[b_ix - 1], _mm_div_pd(tmp, _mm_set1_pd(b_A[jj])));
      }

      for (b_ix = ix; b_ix <= iy; b_ix++) {
        b_A[b_ix - 1] /= b_A[jj];
      }
    }

    iy = jj + 6;
    b_ix = jj + 8;
    ix = 4 - d_j;
    for (kBcol = 0; kBcol <= ix; kBcol++) {
      smax = b_A[iy];
      if (b_A[iy] != 0.0) {
        e = (b_ix - d_j) + 4;
        for (ijA = b_ix; ijA <= e; ijA++) {
          b_A[ijA - 1] += b_A[((jj + ijA) - b_ix) + 1] * -smax;
        }
      }

      iy += 6;
      b_ix += 6;
    }
  }

  for (d_j = 0; d_j < 6; d_j++) {
    jj = 18 * d_j;
    iy = 6 * d_j;
    for (ix = 0; ix < d_j; ix++) {
      kBcol = 18 * ix;
      smax = b_A[ix + iy];
      if (smax != 0.0) {
        for (b_ix = 0; b_ix < 18; b_ix++) {
          e = b_ix + jj;
          Y[e] -= Y[b_ix + kBcol] * smax;
        }
      }
    }

    smax = 1.0 / b_A[d_j + iy];
    for (iy = 0; iy <= 16; iy += 2) {
      b_ix = iy + jj;
      tmp = _mm_loadu_pd(&Y[b_ix]);
      _mm_storeu_pd(&Y[b_ix], _mm_mul_pd(tmp, _mm_set1_pd(smax)));
    }
  }

  for (d_j = 5; d_j >= 0; d_j--) {
    jj = 18 * d_j;
    iy = 6 * d_j - 1;
    for (b_ix = d_j + 2; b_ix < 7; b_ix++) {
      ix = (b_ix - 1) * 18;
      smax = b_A[b_ix + iy];
      if (smax != 0.0) {
        for (kBcol = 0; kBcol < 18; kBcol++) {
          e = kBcol + jj;
          Y[e] -= Y[kBcol + ix] * smax;
        }
      }
    }
  }

  for (d_j = 4; d_j >= 0; d_j--) {
    int8_T ipiv_0;
    ipiv_0 = ipiv[d_j];
    if (d_j + 1 != ipiv_0) {
      for (iy = 0; iy < 18; iy++) {
        b_ix = 18 * d_j + iy;
        smax = Y[b_ix];
        e = (ipiv_0 - 1) * 18 + iy;
        Y[b_ix] = Y[e];
        Y[e] = smax;
      }
    }
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_rotm2quat(const real_T R[9], real_T quat[4])
{
  creal_T eigVec[16];
  creal_T eigVal[4];
  real_T R_0[16];
  real_T x[4];
  real_T K12;
  real_T K13;
  real_T K14;
  real_T K23;
  real_T K24;
  real_T K34;
  int32_T b_k;
  int32_T idx;
  int32_T k;
  boolean_T exitg1;
  K12 = R[1] + R[3];
  K13 = R[2] + R[6];
  K14 = R[5] - R[7];
  K23 = R[5] + R[7];
  K24 = R[6] - R[2];
  K34 = R[1] - R[3];
  R_0[0] = ((R[0] - R[4]) - R[8]) / 3.0;
  R_0[4] = K12 / 3.0;
  R_0[8] = K13 / 3.0;
  R_0[12] = K14 / 3.0;
  R_0[1] = K12 / 3.0;
  R_0[5] = ((R[4] - R[0]) - R[8]) / 3.0;
  R_0[9] = K23 / 3.0;
  R_0[13] = K24 / 3.0;
  R_0[2] = K13 / 3.0;
  R_0[6] = K23 / 3.0;
  R_0[10] = ((R[8] - R[0]) - R[4]) / 3.0;
  R_0[14] = K34 / 3.0;
  R_0[3] = K14 / 3.0;
  R_0[7] = K24 / 3.0;
  R_0[11] = K34 / 3.0;
  R_0[15] = ((R[0] + R[4]) + R[8]) / 3.0;
  controller13_eig(R_0, eigVec, eigVal);
  x[0] = eigVal[0].re;
  x[1] = eigVal[1].re;
  x[2] = eigVal[2].re;
  x[3] = eigVal[3].re;
  if (!rtIsNaN(eigVal[0].re)) {
    idx = 0;
  } else {
    idx = -1;
    k = 2;
    exitg1 = false;
    while ((!exitg1) && (k < 5)) {
      if (!rtIsNaN(x[k - 1])) {
        idx = k - 1;
        exitg1 = true;
      } else {
        k++;
      }
    }
  }

  if (idx + 1 == 0) {
    k = 0;
  } else {
    K12 = x[idx];
    k = idx;
    for (b_k = idx + 2; b_k < 5; b_k++) {
      K13 = x[b_k - 1];
      if (K12 < K13) {
        K12 = K13;
        k = b_k - 1;
      }
    }
  }

  idx = k << 2;
  quat[0] = eigVec[idx + 3].re;
  quat[1] = eigVec[idx].re;
  quat[2] = eigVec[idx + 1].re;
  quat[3] = eigVec[idx + 2].re;
  if (quat[0] < 0.0) {
    quat[0] = -quat[0];
    quat[1] = -quat[1];
    quat[2] = -quat[2];
    quat[3] = -quat[3];
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_expand_atan2(const real_T a_data[], const int32_T
  a_size[3], const real_T b_data[], const int32_T b_size[3], real_T c_data[],
  int32_T c_size[3])
{
  int8_T tmp;
  c_size[0] = 1;
  c_size[1] = 1;
  if (b_size[2] == 1) {
    c_size[2] = (int8_T)a_size[2];
    tmp = (int8_T)a_size[2];
  } else {
    c_size[2] = 0;
    tmp = 0;
  }

  if (tmp != 0) {
    c_data[0] = rt_atan2d_snf(a_data[0], b_data[0]);
  }
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static void controller13_rotm2eul(const real_T R[9], real_T eul[3])
{
  cell_wrap_4_controller13_T reshapes[3];
  real_T cySq;
  real_T cySq_data;
  real_T varargin_1_data;
  real_T x_data;
  int32_T cySq_size[3];
  int32_T x_size[3];
  int32_T b_size_idx_0;
  int32_T i;
  int32_T partialTrueCount_tmp;
  int32_T trueCount;
  int8_T csz_idx_2;
  boolean_T singular;
  cySq = R[0] * R[0] + R[1] * R[1];
  singular = (cySq < 2.2204460492503131E-15);
  cySq = sqrt(cySq);
  eul[0] = rt_atan2d_snf(R[5], R[8]);
  eul[1] = rt_atan2d_snf(-R[2], cySq);
  eul[2] = rt_atan2d_snf(R[1], R[0]);
  if (singular) {
    trueCount = 0;
    for (i = 0; i < 1; i++) {
      trueCount++;
    }

    b_size_idx_0 = trueCount;
    trueCount = 0;
    partialTrueCount_tmp = 0;
    for (i = 0; i < 1; i++) {
      partialTrueCount_tmp = trueCount + 1;
      trueCount++;
    }

    if (partialTrueCount_tmp - 1 >= 0) {
      x_data = -R[7];
    }

    trueCount = 0;
    for (i = 0; i < 1; i++) {
      trueCount++;
    }

    if (partialTrueCount_tmp <= trueCount) {
      csz_idx_2 = (int8_T)partialTrueCount_tmp;
    } else {
      csz_idx_2 = 0;
    }

    if (csz_idx_2 - 1 >= 0) {
      varargin_1_data = rt_atan2d_snf(x_data, R[4]);
    }

    trueCount = 0;
    for (i = 0; i < 1; i++) {
      trueCount++;
    }

    x_size[0] = 1;
    x_size[1] = 1;
    x_size[2] = trueCount;
    if (trueCount - 1 >= 0) {
      x_data = -R[2];
    }

    if (b_size_idx_0 == trueCount) {
      reshapes[1].f1.size[2] = trueCount;
      if (trueCount - 1 >= 0) {
        reshapes[1].f1.data = rt_atan2d_snf(x_data, cySq);
      }
    } else {
      cySq_size[0] = 1;
      cySq_size[1] = 1;
      cySq_size[2] = b_size_idx_0;
      if (b_size_idx_0 - 1 >= 0) {
        cySq_data = cySq;
      }

      controller13_expand_atan2(&x_data, x_size, &cySq_data, cySq_size,
        &reshapes[1].f1.data, reshapes[1].f1.size);
    }

    if (csz_idx_2 - 1 >= 0) {
      eul[0] = varargin_1_data;
    }

    if (reshapes[1].f1.size[2] - 1 >= 0) {
      eul[1] = reshapes[1].f1.data;
    }

    eul[2] = 0.0;
  }

  cySq = eul[0];
  eul[0] = eul[2];
  eul[2] = cySq;
}

/* Function for MATLAB Function: '<S9>/Learned RTNMPC' */
static real_T controller13_norm(const real_T x[3])
{
  real_T absxk;
  real_T scale;
  real_T t;
  real_T y;
  scale = 3.3121686421112381E-170;
  absxk = fabs(x[0]);
  if (absxk > 3.3121686421112381E-170) {
    y = 1.0;
    scale = absxk;
  } else {
    t = absxk / 3.3121686421112381E-170;
    y = t * t;
  }

  absxk = fabs(x[1]);
  if (absxk > scale) {
    t = scale / absxk;
    y = y * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    y += t * t;
  }

  absxk = fabs(x[2]);
  if (absxk > scale) {
    t = scale / absxk;
    y = y * t * t + 1.0;
    scale = absxk;
  } else {
    t = absxk / scale;
    y += t * t;
  }

  return scale * sqrt(y);
}

/* Function for MATLAB Function: '<S9>/Geometric Attitude Controller' */
static void controller13_unflatten_rotm(const real_T R[9], real_T b_R[9])
{
  b_R[0] = R[0];
  b_R[1] = R[3];
  b_R[2] = R[6];
  b_R[3] = R[1];
  b_R[4] = R[4];
  b_R[5] = R[7];
  b_R[6] = R[2];
  b_R[7] = R[5];
  b_R[8] = R[8];
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_xnrm2_m(int32_T n, const real_T x[36], int32_T ix0)
{
  real_T y;
  int32_T k;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[ix0 - 1]);
    } else {
      real_T scale;
      int32_T kend;
      scale = 3.3121686421112381E-170;
      kend = (ix0 + n) - 1;
      for (k = ix0; k <= kend; k++) {
        real_T absxk;
        absxk = fabs(x[k - 1]);
        if (absxk > scale) {
          real_T t;
          t = scale / absxk;
          y = y * t * t + 1.0;
          scale = absxk;
        } else {
          real_T t;
          t = absxk / scale;
          y += t * t;
        }
      }

      y = scale * sqrt(y);
    }
  }

  return y;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_xzlarfg_ba(int32_T n, real_T *alpha1, real_T x[36],
  int32_T ix0)
{
  __m128d tmp;
  real_T a;
  real_T tau;
  real_T xnorm;
  int32_T c;
  int32_T knt;
  int32_T scalarLB;
  int32_T vectorUB;
  int32_T vectorUB_tmp;
  tau = 0.0;
  if (n > 0) {
    xnorm = controller13_xnrm2_m(n - 1, x, ix0);
    if (xnorm != 0.0) {
      xnorm = rt_hypotd_snf(*alpha1, xnorm);
      if (*alpha1 >= 0.0) {
        xnorm = -xnorm;
      }

      if (fabs(xnorm) < 1.0020841800044864E-292) {
        knt = 0;
        do {
          knt++;
          scalarLB = (ix0 + n) - 2;
          vectorUB = ((((scalarLB - ix0) + 1) / 2) << 1) + ix0;
          vectorUB_tmp = vectorUB - 2;
          for (c = ix0; c <= vectorUB_tmp; c += 2) {
            tmp = _mm_loadu_pd(&x[c - 1]);
            _mm_storeu_pd(&x[c - 1], _mm_mul_pd(tmp, _mm_set1_pd
              (9.9792015476736E+291)));
          }

          for (c = vectorUB; c <= scalarLB; c++) {
            x[c - 1] *= 9.9792015476736E+291;
          }

          xnorm *= 9.9792015476736E+291;
          *alpha1 *= 9.9792015476736E+291;
        } while ((fabs(xnorm) < 1.0020841800044864E-292) && (knt < 20));

        xnorm = rt_hypotd_snf(*alpha1, controller13_xnrm2_m(n - 1, x, ix0));
        if (*alpha1 >= 0.0) {
          xnorm = -xnorm;
        }

        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        for (c = ix0; c <= vectorUB_tmp; c += 2) {
          tmp = _mm_loadu_pd(&x[c - 1]);
          _mm_storeu_pd(&x[c - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (c = vectorUB; c <= scalarLB; c++) {
          x[c - 1] *= a;
        }

        for (c = 0; c < knt; c++) {
          xnorm *= 1.0020841800044864E-292;
        }

        *alpha1 = xnorm;
      } else {
        tau = (xnorm - *alpha1) / xnorm;
        a = 1.0 / (*alpha1 - xnorm);
        c = (ix0 + n) - 2;
        scalarLB = ((((c - ix0) + 1) / 2) << 1) + ix0;
        vectorUB = scalarLB - 2;
        for (knt = ix0; knt <= vectorUB; knt += 2) {
          tmp = _mm_loadu_pd(&x[knt - 1]);
          _mm_storeu_pd(&x[knt - 1], _mm_mul_pd(tmp, _mm_set1_pd(a)));
        }

        for (knt = scalarLB; knt <= c; knt++) {
          x[knt - 1] *= a;
        }

        *alpha1 = xnorm;
      }
    }
  }

  return tau;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_xzlarf_j(int32_T m, int32_T n, int32_T iv0, real_T tau,
  real_T C[36], int32_T ic0, real_T work[9])
{
  int32_T coltop;
  int32_T iyend;
  int32_T lastc;
  int32_T lastv;
  if (tau != 0.0) {
    boolean_T exitg2;
    lastv = m;
    lastc = iv0 + m;
    while ((lastv > 0) && (C[lastc - 2] == 0.0)) {
      lastv--;
      lastc--;
    }

    lastc = n - 1;
    exitg2 = false;
    while ((!exitg2) && (lastc + 1 > 0)) {
      int32_T exitg1;
      coltop = (lastc << 2) + ic0;
      iyend = coltop;
      do {
        exitg1 = 0;
        if (iyend <= (coltop + lastv) - 1) {
          if (C[iyend - 1] != 0.0) {
            exitg1 = 1;
          } else {
            iyend++;
          }
        } else {
          lastc--;
          exitg1 = 2;
        }
      } while (exitg1 == 0);

      if (exitg1 == 1) {
        exitg2 = true;
      }
    }
  } else {
    lastv = 0;
    lastc = -1;
  }

  if (lastv > 0) {
    real_T c;
    int32_T d;
    int32_T jy;
    if (lastc + 1 != 0) {
      if (lastc >= 0) {
        memset(&work[0], 0, (uint32_T)(lastc + 1) * sizeof(real_T));
      }

      jy = (lastc << 2) + ic0;
      for (coltop = ic0; coltop <= jy; coltop += 4) {
        c = 0.0;
        d = (coltop + lastv) - 1;
        for (iyend = coltop; iyend <= d; iyend++) {
          c += C[((iv0 + iyend) - coltop) - 1] * C[iyend - 1];
        }

        iyend = (coltop - ic0) >> 2;
        work[iyend] += c;
      }
    }

    if (!(-tau == 0.0)) {
      jy = ic0;
      for (coltop = 0; coltop <= lastc; coltop++) {
        c = work[coltop];
        if (c != 0.0) {
          c *= -tau;
          d = lastv + jy;
          for (iyend = jy; iyend < d; iyend++) {
            C[iyend - 1] += C[((iv0 + iyend) - jy) - 1] * c;
          }
        }

        jy += 4;
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_qrf(real_T A[36], int32_T m, int32_T n, int32_T nfxd,
  real_T tau[4])
{
  real_T work[9];
  real_T b_atmp;
  real_T tau_0;
  int32_T b;
  int32_T i;
  int32_T ii;
  int32_T mmi;
  memset(&work[0], 0, 9U * sizeof(real_T));
  b = (uint8_T)nfxd;
  for (i = 0; i < b; i++) {
    ii = (i << 2) + i;
    mmi = m - i;
    if (i + 1 < m) {
      b_atmp = A[ii];
      tau_0 = controller13_xzlarfg_ba(mmi, &b_atmp, A, ii + 2);
      tau[i] = tau_0;
      A[ii] = b_atmp;
    } else {
      tau_0 = 0.0;
      tau[i] = 0.0;
    }

    if (i + 1 < n) {
      b_atmp = A[ii];
      A[ii] = 1.0;
      controller13_xzlarf_j(mmi, (n - i) - 1, ii + 1, tau_0, A, ii + 5, work);
      A[ii] = b_atmp;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_factorQRE(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  int32_T mrows, int32_T ncols)
{
  real_T vn1[9];
  real_T vn2[9];
  real_T work[9];
  real_T s;
  real_T temp;
  real_T vn1_0;
  int32_T b_ix;
  int32_T i;
  int32_T itemp;
  int32_T ix;
  int32_T iy;
  int32_T j;
  int32_T mmi;
  int32_T nfxd;
  int32_T pvt;
  static const int32_T offsets[4] = { 0, 1, 2, 3 };

  int32_T ix_tmp;
  int32_T temp_tmp;
  int32_T tmp;
  if (mrows * ncols == 0) {
    obj->mrows = mrows;
    obj->ncols = ncols;
    obj->minRowCol = 0;
  } else {
    obj->usedPivoting = true;
    obj->mrows = mrows;
    obj->ncols = ncols;
    if (mrows <= ncols) {
      j = mrows;
    } else {
      j = ncols;
    }

    obj->minRowCol = j;
    obj->tau[0] = 0.0;
    obj->tau[1] = 0.0;
    obj->tau[2] = 0.0;
    obj->tau[3] = 0.0;
    if (j < 1) {
      nfxd = (ncols / 4) << 2;
      i = nfxd - 4;
      for (j = 0; j <= i; j += 4) {
        _mm_storeu_si128((__m128i *)&obj->jpvt[j], _mm_add_epi32(_mm_add_epi32
          (_mm_set1_epi32(j), _mm_loadu_si128((const __m128i *)&offsets[0])),
          _mm_set1_epi32(1)));
      }

      for (j = nfxd; j < ncols; j++) {
        obj->jpvt[j] = j + 1;
      }
    } else {
      nfxd = -1;
      for (i = 0; i < ncols; i++) {
        if (obj->jpvt[i] != 0) {
          nfxd++;
          if (i + 1 != nfxd + 1) {
            ix = i << 2;
            iy = nfxd << 2;
            for (mmi = 0; mmi < mrows; mmi++) {
              temp_tmp = ix + mmi;
              temp = obj->QR[temp_tmp];
              tmp = iy + mmi;
              obj->QR[temp_tmp] = obj->QR[tmp];
              obj->QR[tmp] = temp;
            }

            obj->jpvt[i] = obj->jpvt[nfxd];
            obj->jpvt[nfxd] = i + 1;
          } else {
            obj->jpvt[i] = i + 1;
          }
        } else {
          obj->jpvt[i] = i + 1;
        }
      }

      if (nfxd + 1 <= j) {
        nfxd++;
      } else {
        nfxd = j;
      }

      obj->tau[0] = 0.0;
      obj->tau[1] = 0.0;
      obj->tau[2] = 0.0;
      obj->tau[3] = 0.0;
      controller13_qrf(obj->QR, mrows, ncols, nfxd, obj->tau);
      if (nfxd < j) {
        memset(&work[0], 0, 9U * sizeof(real_T));
        memset(&vn1[0], 0, 9U * sizeof(real_T));
        memset(&vn2[0], 0, 9U * sizeof(real_T));
        for (i = nfxd + 1; i <= ncols; i++) {
          vn1_0 = controller13_xnrm2_m(mrows - nfxd, obj->QR, (((i - 1) << 2) +
            nfxd) + 1);
          vn1[i - 1] = vn1_0;
          vn2[i - 1] = vn1_0;
        }

        for (i = nfxd + 1; i <= j; i++) {
          ix_tmp = (i - 1) << 2;
          ix = (ix_tmp + i) - 1;
          iy = ncols - i;
          mmi = mrows - i;
          if (iy + 1 < 1) {
            itemp = -2;
          } else {
            itemp = -1;
            if (iy + 1 > 1) {
              temp = fabs(vn1[i - 1]);
              for (pvt = 2; pvt <= iy + 1; pvt++) {
                s = fabs(vn1[(i + pvt) - 2]);
                if (s > temp) {
                  itemp = pvt - 2;
                  temp = s;
                }
              }
            }
          }

          pvt = i + itemp;
          if (pvt + 1 != i) {
            b_ix = pvt << 2;
            for (itemp = 0; itemp < mrows; itemp++) {
              temp_tmp = b_ix + itemp;
              temp = obj->QR[temp_tmp];
              tmp = ix_tmp + itemp;
              obj->QR[temp_tmp] = obj->QR[tmp];
              obj->QR[tmp] = temp;
            }

            itemp = obj->jpvt[pvt];
            obj->jpvt[pvt] = obj->jpvt[i - 1];
            obj->jpvt[i - 1] = itemp;
            vn1[pvt] = vn1[i - 1];
            vn2[pvt] = vn2[i - 1];
          }

          if (i < mrows) {
            temp = obj->QR[ix];
            obj->tau[i - 1] = controller13_xzlarfg_ba(mmi + 1, &temp, obj->QR,
              ix + 2);
            obj->QR[ix] = temp;
          } else {
            obj->tau[i - 1] = 0.0;
          }

          if (i < ncols) {
            temp = obj->QR[ix];
            obj->QR[ix] = 1.0;
            controller13_xzlarf_j(mmi + 1, iy, ix + 1, obj->tau[i - 1], obj->QR,
                                  ix + 5, work);
            obj->QR[ix] = temp;
          }

          for (ix = i + 1; ix <= ncols; ix++) {
            iy = ((ix - 1) << 2) + i;
            vn1_0 = vn1[ix - 1];
            if (vn1_0 != 0.0) {
              temp = fabs(obj->QR[iy - 1]) / vn1_0;
              temp = 1.0 - temp * temp;
              if (temp < 0.0) {
                temp = 0.0;
              }

              s = vn1_0 / vn2[ix - 1];
              s = s * s * temp;
              if (s <= 1.4901161193847656E-8) {
                if (i < mrows) {
                  vn1_0 = controller13_xnrm2_m(mmi, obj->QR, iy + 1);
                  vn1[ix - 1] = vn1_0;
                  vn2[ix - 1] = vn1_0;
                } else {
                  vn1[ix - 1] = 0.0;
                  vn2[ix - 1] = 0.0;
                }
              } else {
                vn1[ix - 1] = vn1_0 * sqrt(temp);
              }
            }
          }
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_countsort(int32_T x[9], int32_T xLen, int32_T
  workspace[9], int32_T xMin, int32_T xMax)
{
  int32_T idxEnd_tmp;
  int32_T idxStart;
  int32_T maxOffset;
  if ((xLen > 1) && (xMax > xMin)) {
    int32_T idxEnd;
    int32_T maxOffset_tmp;
    idxEnd_tmp = xMax - xMin;
    if (idxEnd_tmp >= 0) {
      memset(&workspace[0], 0, (uint32_T)(idxEnd_tmp + 1) * sizeof(int32_T));
    }

    maxOffset_tmp = idxEnd_tmp - 1;
    for (idxStart = 0; idxStart < xLen; idxStart++) {
      idxEnd = x[idxStart] - xMin;
      workspace[idxEnd]++;
    }

    for (idxStart = 2; idxStart <= maxOffset_tmp + 2; idxStart++) {
      workspace[idxStart - 1] += workspace[idxStart - 2];
    }

    idxStart = 1;
    idxEnd = workspace[0];
    for (maxOffset = 0; maxOffset <= maxOffset_tmp; maxOffset++) {
      for (idxEnd_tmp = idxStart; idxEnd_tmp <= idxEnd; idxEnd_tmp++) {
        x[idxEnd_tmp - 1] = maxOffset + xMin;
      }

      idxStart = workspace[maxOffset] + 1;
      idxEnd = workspace[maxOffset + 1];
    }

    for (maxOffset = idxStart; maxOffset <= idxEnd; maxOffset++) {
      x[maxOffset - 1] = xMax;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_removeConstr(sawH9C58NaQx0EcT16OdroH_controller13_T
  *obj, int32_T idx_global)
{
  int32_T TYPE_tmp;
  int32_T b;
  int32_T idx;
  TYPE_tmp = obj->Wid[idx_global - 1] - 1;
  obj->isActiveConstr[(obj->isActiveIdx[TYPE_tmp] + obj->Wlocalidx[idx_global -
                       1]) - 2] = false;
  obj->Wid[idx_global - 1] = obj->Wid[obj->nActiveConstr - 1];
  obj->Wlocalidx[idx_global - 1] = obj->Wlocalidx[obj->nActiveConstr - 1];
  b = (uint8_T)obj->nVar;
  for (idx = 0; idx < b; idx++) {
    obj->ATwset[idx + ((idx_global - 1) << 2)] = obj->ATwset
      [((obj->nActiveConstr - 1) << 2) + idx];
  }

  obj->bwset[idx_global - 1] = obj->bwset[obj->nActiveConstr - 1];
  obj->nActiveConstr--;
  obj->nWConstr[TYPE_tmp]--;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_RemoveDependentIneq_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
   sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
   soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace, real_T tolfactor)
{
  real_T tol;
  int32_T iy0_tmp;
  int32_T nActiveConstr;
  int32_T nDepIneq;
  int32_T nFixedConstr;
  int32_T nVar;
  nActiveConstr = workingset->nActiveConstr;
  nFixedConstr = workingset->nWConstr[0] + workingset->nWConstr[1];
  nVar = workingset->nVar;
  if ((workingset->nWConstr[2] + workingset->nWConstr[3]) + workingset->
      nWConstr[4] > 0) {
    tol = tolfactor * (real_T)workingset->nVar * 2.2204460492503131E-16;
    for (nDepIneq = 0; nDepIneq < nFixedConstr; nDepIneq++) {
      qrmanager->jpvt[nDepIneq] = 1;
    }

    if (nFixedConstr + 1 <= workingset->nActiveConstr) {
      memset(&qrmanager->jpvt[nFixedConstr], 0, (uint32_T)
             (workingset->nActiveConstr - nFixedConstr) * sizeof(int32_T));
    }

    for (nDepIneq = 0; nDepIneq < nActiveConstr; nDepIneq++) {
      iy0_tmp = nDepIneq << 2;
      memcpy(&qrmanager->QR[iy0_tmp], &workingset->ATwset[iy0_tmp], (uint32_T)
             (((uint8_T)nVar + iy0_tmp) - iy0_tmp) * sizeof(real_T));
    }

    controller13_factorQRE(qrmanager, workingset->nVar,
      workingset->nActiveConstr);
    nDepIneq = 0;
    for (nActiveConstr = workingset->nActiveConstr - 1; nActiveConstr + 1 > nVar;
         nActiveConstr--) {
      nDepIneq++;
      memspace->workspace_int[nDepIneq - 1] = qrmanager->jpvt[nActiveConstr];
    }

    if (nActiveConstr + 1 <= workingset->nVar) {
      nVar = (nActiveConstr << 2) + nActiveConstr;
      while ((nActiveConstr + 1 > nFixedConstr) && (fabs(qrmanager->QR[nVar]) <
              tol)) {
        nDepIneq++;
        memspace->workspace_int[nDepIneq - 1] = qrmanager->jpvt[nActiveConstr];
        nActiveConstr--;
        nVar -= 5;
      }
    }

    controller13_countsort(memspace->workspace_int, nDepIneq,
      memspace->workspace_sort, nFixedConstr + 1, workingset->nActiveConstr);
    for (nFixedConstr = nDepIneq; nFixedConstr >= 1; nFixedConstr--) {
      controller13_removeConstr(workingset, memspace->workspace_int[nFixedConstr
        - 1]);
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_factorQR(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  const real_T A[36], int32_T mrows, int32_T ncols)
{
  int32_T b;
  int32_T idx;
  static const int32_T offsets[4] = { 0, 1, 2, 3 };

  int32_T ix0_tmp;
  boolean_T guard1;
  idx = mrows * ncols;
  guard1 = false;
  if (idx > 0) {
    for (idx = 0; idx < ncols; idx++) {
      ix0_tmp = idx << 2;
      memcpy(&obj->QR[ix0_tmp], &A[ix0_tmp], (uint32_T)(((uint8_T)mrows +
               ix0_tmp) - ix0_tmp) * sizeof(real_T));
    }

    guard1 = true;
  } else if (idx == 0) {
    obj->mrows = mrows;
    obj->ncols = ncols;
    obj->minRowCol = 0;
  } else {
    guard1 = true;
  }

  if (guard1) {
    obj->usedPivoting = false;
    obj->mrows = mrows;
    obj->ncols = ncols;
    b = (ncols / 4) << 2;
    ix0_tmp = b - 4;
    for (idx = 0; idx <= ix0_tmp; idx += 4) {
      _mm_storeu_si128((__m128i *)&obj->jpvt[idx], _mm_add_epi32(_mm_add_epi32
        (_mm_set1_epi32(idx), _mm_loadu_si128((const __m128i *)&offsets[0])),
        _mm_set1_epi32(1)));
    }

    for (idx = b; idx < ncols; idx++) {
      obj->jpvt[idx] = idx + 1;
    }

    if (mrows <= ncols) {
      idx = mrows;
    } else {
      idx = ncols;
    }

    obj->minRowCol = idx;
    obj->tau[0] = 0.0;
    obj->tau[1] = 0.0;
    obj->tau[2] = 0.0;
    obj->tau[3] = 0.0;
    if (idx >= 1) {
      obj->tau[0] = 0.0;
      obj->tau[1] = 0.0;
      obj->tau[2] = 0.0;
      obj->tau[3] = 0.0;
      controller13_qrf(obj->QR, mrows, ncols, idx, obj->tau);
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_computeQ_(sYbuiRVtE6jido5obBecKYC_controller13_T *obj,
  int32_T nrows)
{
  real_T work[4];
  int32_T coltop;
  int32_T i;
  int32_T iQR0;
  int32_T ia;
  int32_T idx;
  int32_T itau;
  int32_T iyend;
  coltop = obj->minRowCol;
  for (idx = 0; idx < coltop; idx++) {
    iQR0 = (idx << 2) + idx;
    ia = obj->mrows - idx;
    if (ia - 2 >= 0) {
      memcpy(&obj->Q[iQR0 + 1], &obj->QR[iQR0 + 1], (uint32_T)(((ia + iQR0) -
               iQR0) - 1) * sizeof(real_T));
    }
  }

  idx = obj->mrows;
  if (nrows >= 1) {
    for (itau = coltop; itau < nrows; itau++) {
      ia = itau << 2;
      memset(&obj->Q[ia], 0, (uint32_T)((idx + ia) - ia) * sizeof(real_T));
      obj->Q[ia + itau] = 1.0;
    }

    itau = obj->minRowCol - 1;
    work[0] = 0.0;
    work[1] = 0.0;
    work[2] = 0.0;
    work[3] = 0.0;
    for (i = obj->minRowCol; i >= 1; i--) {
      int32_T lastc;
      iQR0 = (((i - 1) << 2) + i) - 1;
      if (i < nrows) {
        obj->Q[iQR0] = 1.0;
        ia = idx - i;
        if (obj->tau[itau] != 0.0) {
          boolean_T exitg2;
          lastc = iQR0 + ia;
          while ((ia + 1 > 0) && (obj->Q[lastc] == 0.0)) {
            ia--;
            lastc--;
          }

          lastc = (nrows - i) - 1;
          exitg2 = false;
          while ((!exitg2) && (lastc + 1 > 0)) {
            int32_T exitg1;
            coltop = ((lastc << 2) + iQR0) + 5;
            iyend = coltop;
            do {
              exitg1 = 0;
              if (iyend <= coltop + ia) {
                if (obj->Q[iyend - 1] != 0.0) {
                  exitg1 = 1;
                } else {
                  iyend++;
                }
              } else {
                lastc--;
                exitg1 = 2;
              }
            } while (exitg1 == 0);

            if (exitg1 == 1) {
              exitg2 = true;
            }
          }
        } else {
          ia = -1;
          lastc = -1;
        }

        if (ia + 1 > 0) {
          real_T b_c;
          int32_T f;
          int32_T jy;
          if (lastc + 1 != 0) {
            if (lastc >= 0) {
              memset(&work[0], 0, (uint32_T)(lastc + 1) * sizeof(real_T));
            }

            jy = ((lastc << 2) + iQR0) + 5;
            for (coltop = iQR0 + 5; coltop <= jy; coltop += 4) {
              b_c = 0.0;
              f = coltop + ia;
              for (iyend = coltop; iyend <= f; iyend++) {
                b_c += obj->Q[(iQR0 + iyend) - coltop] * obj->Q[iyend - 1];
              }

              iyend = ((coltop - iQR0) - 5) >> 2;
              work[iyend] += b_c;
            }
          }

          if (!(-obj->tau[itau] == 0.0)) {
            jy = iQR0 + 5;
            for (coltop = 0; coltop <= lastc; coltop++) {
              b_c = work[coltop];
              if (b_c != 0.0) {
                b_c *= -obj->tau[itau];
                f = ia + jy;
                for (iyend = jy; iyend <= f; iyend++) {
                  obj->Q[iyend - 1] += obj->Q[(iQR0 + iyend) - jy] * b_c;
                }
              }

              jy += 4;
            }
          }
        }
      }

      if (i < idx) {
        lastc = ((iQR0 + idx) - i) + 1;
        for (ia = iQR0 + 2; ia <= lastc; ia++) {
          obj->Q[ia - 1] *= -obj->tau[itau];
        }
      }

      obj->Q[iQR0] = 1.0 - obj->tau[itau];
      for (ia = 0; ia <= i - 2; ia++) {
        obj->Q[(iQR0 - ia) - 1] = 0.0;
      }

      itau--;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static boolean_T controller13_feasibleX0ForWorkingSet(real_T workspace[36],
  real_T xCurrent[4], sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager)
{
  __m128d tmp;
  __m128d tmp_0;
  real_T B[36];
  real_T c;
  real_T c_c;
  real_T e_c;
  int32_T e;
  int32_T ia;
  int32_T ix;
  int32_T iy;
  int32_T jBcol;
  int32_T l;
  int32_T mWConstr;
  int32_T nVar;
  int32_T vectorUB;
  boolean_T nonDegenerateWset;
  static const int32_T offsets[4] = { 0, 1, 2, 3 };

  int32_T c_tmp;
  int32_T exitg1;
  int32_T nVar_tmp_tmp;
  mWConstr = workingset->nActiveConstr - 1;
  nVar_tmp_tmp = workingset->nVar;
  nonDegenerateWset = true;
  if (workingset->nActiveConstr != 0) {
    for (nVar = 0; nVar <= mWConstr; nVar++) {
      workspace[nVar] = workingset->bwset[nVar];
      workspace[nVar + 9] = workingset->bwset[nVar];
    }

    if (workingset->nActiveConstr != 0) {
      jBcol = ((workingset->nActiveConstr - 1) << 2) + 1;
      for (nVar = 1; nVar <= jBcol; nVar += 4) {
        c = 0.0;
        e = (nVar + nVar_tmp_tmp) - 1;
        for (ia = nVar; ia <= e; ia++) {
          c += workingset->ATwset[ia - 1] * xCurrent[ia - nVar];
        }

        c_tmp = (nVar - 1) >> 2;
        workspace[c_tmp] -= c;
      }
    }

    if (workingset->nActiveConstr >= workingset->nVar) {
      iy = (uint8_T)workingset->nVar;
      for (nVar = 0; nVar < iy; nVar++) {
        jBcol = nVar << 2;
        for (ia = 0; ia <= mWConstr; ia++) {
          qrmanager->QR[ia + jBcol] = workingset->ATwset[(ia << 2) + nVar];
        }
      }

      qrmanager->usedPivoting = false;
      qrmanager->mrows = workingset->nActiveConstr;
      qrmanager->ncols = workingset->nVar;
      c_tmp = ((uint8_T)workingset->nVar / 4) << 2;
      vectorUB = c_tmp - 4;
      for (nVar = 0; nVar <= vectorUB; nVar += 4) {
        _mm_storeu_si128((__m128i *)&qrmanager->jpvt[nVar], _mm_add_epi32
                         (_mm_add_epi32(_mm_set1_epi32(nVar), _mm_loadu_si128((
          const __m128i *)&offsets[0])), _mm_set1_epi32(1)));
      }

      for (nVar = c_tmp; nVar < iy; nVar++) {
        qrmanager->jpvt[nVar] = nVar + 1;
      }

      if (workingset->nActiveConstr <= workingset->nVar) {
        nVar = workingset->nActiveConstr;
      } else {
        nVar = workingset->nVar;
      }

      qrmanager->minRowCol = nVar;
      memcpy(&B[0], &qrmanager->QR[0], 36U * sizeof(real_T));
      qrmanager->tau[0] = 0.0;
      qrmanager->tau[1] = 0.0;
      qrmanager->tau[2] = 0.0;
      qrmanager->tau[3] = 0.0;
      if (nVar >= 1) {
        qrmanager->tau[0] = 0.0;
        qrmanager->tau[1] = 0.0;
        qrmanager->tau[2] = 0.0;
        qrmanager->tau[3] = 0.0;
        controller13_qrf(B, workingset->nActiveConstr, workingset->nVar, nVar,
                         qrmanager->tau);
      }

      memcpy(&qrmanager->QR[0], &B[0], 36U * sizeof(real_T));
      controller13_computeQ_(qrmanager, qrmanager->mrows);
      memcpy(&B[0], &workspace[0], 36U * sizeof(real_T));
      for (nVar = 0; nVar <= 9; nVar += 9) {
        iy = nVar + nVar_tmp_tmp;
        for (ia = nVar + 1; ia <= iy; ia++) {
          workspace[ia - 1] = 0.0;
        }
      }

      jBcol = -1;
      for (nVar = 0; nVar <= 9; nVar += 9) {
        ix = -1;
        e = nVar + nVar_tmp_tmp;
        for (ia = nVar + 1; ia <= e; ia++) {
          c = 0.0;
          for (iy = 0; iy <= mWConstr; iy++) {
            c += qrmanager->Q[(iy + ix) + 1] * B[(iy + jBcol) + 1];
          }

          workspace[ia - 1] += c;
          ix += 4;
        }

        jBcol += 9;
      }

      for (mWConstr = 0; mWConstr < 2; mWConstr++) {
        iy = 9 * mWConstr - 1;
        for (nVar = nVar_tmp_tmp; nVar >= 1; nVar--) {
          jBcol = (nVar - 1) << 2;
          c_tmp = nVar + iy;
          c = workspace[c_tmp];
          if (c != 0.0) {
            workspace[c_tmp] = c / qrmanager->QR[(nVar + jBcol) - 1];
            ix = (uint8_T)(nVar - 1);
            for (ia = 0; ia < ix; ia++) {
              vectorUB = (ia + iy) + 1;
              workspace[vectorUB] -= qrmanager->QR[ia + jBcol] * workspace[c_tmp];
            }
          }
        }
      }
    } else {
      controller13_factorQR(qrmanager, workingset->ATwset, workingset->nVar,
                            workingset->nActiveConstr);
      controller13_computeQ_(qrmanager, qrmanager->minRowCol);
      for (nVar = 0; nVar < 2; nVar++) {
        jBcol = 9 * nVar;
        for (ia = 0; ia <= mWConstr; ia++) {
          ix = ia << 2;
          c_tmp = ia + jBcol;
          c = workspace[c_tmp];
          e = (uint8_T)ia;
          for (iy = 0; iy < e; iy++) {
            c -= qrmanager->QR[iy + ix] * workspace[iy + jBcol];
          }

          workspace[c_tmp] = c / qrmanager->QR[ia + ix];
        }
      }

      memcpy(&B[0], &workspace[0], 36U * sizeof(real_T));
      for (nVar = 0; nVar <= 9; nVar += 9) {
        iy = nVar + nVar_tmp_tmp;
        for (ia = nVar + 1; ia <= iy; ia++) {
          workspace[ia - 1] = 0.0;
        }
      }

      jBcol = 1;
      for (nVar = 0; nVar <= 9; nVar += 9) {
        ix = -1;
        e = jBcol + mWConstr;
        for (ia = jBcol; ia <= e; ia++) {
          l = nVar + nVar_tmp_tmp;
          c_tmp = ((((l - nVar) / 2) << 1) + nVar) + 1;
          vectorUB = c_tmp - 2;
          for (iy = nVar + 1; iy <= vectorUB; iy += 2) {
            tmp = _mm_loadu_pd(&qrmanager->Q[(ix + iy) - nVar]);
            tmp_0 = _mm_loadu_pd(&workspace[iy - 1]);
            _mm_storeu_pd(&workspace[iy - 1], _mm_add_pd(_mm_mul_pd(tmp,
              _mm_set1_pd(B[ia - 1])), tmp_0));
          }

          for (iy = c_tmp; iy <= l; iy++) {
            workspace[iy - 1] += qrmanager->Q[(ix + iy) - nVar] * B[ia - 1];
          }

          ix += 4;
        }

        jBcol += 9;
      }
    }

    mWConstr = 0;
    do {
      exitg1 = 0;
      if (mWConstr <= (uint8_T)nVar_tmp_tmp - 1) {
        if (rtIsInf(workspace[mWConstr]) || rtIsNaN(workspace[mWConstr])) {
          nonDegenerateWset = false;
          exitg1 = 1;
        } else {
          c = workspace[mWConstr + 9];
          if (rtIsInf(c) || rtIsNaN(c)) {
            nonDegenerateWset = false;
            exitg1 = 1;
          } else {
            mWConstr++;
          }
        }
      } else {
        c_tmp = (nVar_tmp_tmp / 2) << 1;
        vectorUB = c_tmp - 2;
        for (mWConstr = 0; mWConstr <= vectorUB; mWConstr += 2) {
          tmp = _mm_loadu_pd(&workspace[mWConstr]);
          tmp_0 = _mm_loadu_pd(&xCurrent[mWConstr]);
          _mm_storeu_pd(&workspace[mWConstr], _mm_add_pd(tmp, tmp_0));
        }

        for (mWConstr = c_tmp; mWConstr < nVar_tmp_tmp; mWConstr++) {
          workspace[mWConstr] += xCurrent[mWConstr];
        }

        if (workingset->probType == 2) {
          c = 0.0;
          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            workingset->maxConstrWorkspace[mWConstr] = workingset->
              bineq[mWConstr];
            workingset->maxConstrWorkspace[mWConstr] =
              -workingset->maxConstrWorkspace[mWConstr];
          }

          for (mWConstr = 0; mWConstr <= 28; mWConstr += 4) {
            c_c = 0.0;
            for (nVar = mWConstr + 1; nVar <= mWConstr + 3; nVar++) {
              c_c += workspace[(nVar - mWConstr) - 1] * workingset->Aineq[nVar -
                1];
            }

            c_tmp = mWConstr >> 2;
            workingset->maxConstrWorkspace[c_tmp] += c_c;
          }

          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            e_c = workingset->maxConstrWorkspace[mWConstr] - workspace[mWConstr
              + 3];
            workingset->maxConstrWorkspace[mWConstr] = e_c;
            c = fmax(c, e_c);
          }
        } else {
          c = 0.0;
          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            workingset->maxConstrWorkspace[mWConstr] = workingset->
              bineq[mWConstr];
            workingset->maxConstrWorkspace[mWConstr] =
              -workingset->maxConstrWorkspace[mWConstr];
          }

          for (mWConstr = 0; mWConstr <= 28; mWConstr += 4) {
            c_c = 0.0;
            jBcol = mWConstr + workingset->nVar;
            for (nVar = mWConstr + 1; nVar <= jBcol; nVar++) {
              c_c += workspace[(nVar - mWConstr) - 1] * workingset->Aineq[nVar -
                1];
            }

            c_tmp = mWConstr >> 2;
            workingset->maxConstrWorkspace[c_tmp] += c_c;
          }

          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            c = fmax(c, workingset->maxConstrWorkspace[mWConstr]);
          }
        }

        if (workingset->sizes[3] > 0) {
          nVar = (uint8_T)workingset->sizes[3];
          for (mWConstr = 0; mWConstr < nVar; mWConstr++) {
            c = fmax(c, -workspace[workingset->indexLB[mWConstr] - 1]);
          }
        }

        if (workingset->probType == 2) {
          c_c = 0.0;
          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            workingset->maxConstrWorkspace[mWConstr] = workingset->
              bineq[mWConstr];
            workingset->maxConstrWorkspace[mWConstr] =
              -workingset->maxConstrWorkspace[mWConstr];
          }

          for (mWConstr = 0; mWConstr <= 28; mWConstr += 4) {
            e_c = 0.0;
            for (nVar = mWConstr + 1; nVar <= mWConstr + 3; nVar++) {
              e_c += workspace[(nVar - mWConstr) + 8] * workingset->Aineq[nVar -
                1];
            }

            c_tmp = mWConstr >> 2;
            workingset->maxConstrWorkspace[c_tmp] += e_c;
          }

          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            e_c = workingset->maxConstrWorkspace[mWConstr] - workspace[mWConstr
              + 12];
            workingset->maxConstrWorkspace[mWConstr] = e_c;
            c_c = fmax(c_c, e_c);
          }
        } else {
          c_c = 0.0;
          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            workingset->maxConstrWorkspace[mWConstr] = workingset->
              bineq[mWConstr];
            workingset->maxConstrWorkspace[mWConstr] =
              -workingset->maxConstrWorkspace[mWConstr];
          }

          for (mWConstr = 0; mWConstr <= 28; mWConstr += 4) {
            e_c = 0.0;
            jBcol = mWConstr + workingset->nVar;
            for (nVar = mWConstr + 1; nVar <= jBcol; nVar++) {
              e_c += workspace[(nVar - mWConstr) + 8] * workingset->Aineq[nVar -
                1];
            }

            c_tmp = mWConstr >> 2;
            workingset->maxConstrWorkspace[c_tmp] += e_c;
          }

          for (mWConstr = 0; mWConstr < 8; mWConstr++) {
            c_c = fmax(c_c, workingset->maxConstrWorkspace[mWConstr]);
          }
        }

        if (workingset->sizes[3] > 0) {
          nVar = (uint8_T)workingset->sizes[3];
          for (mWConstr = 0; mWConstr < nVar; mWConstr++) {
            c_c = fmax(c_c, -workspace[workingset->indexLB[mWConstr] + 8]);
          }
        }

        if ((c <= 2.2204460492503131E-16) || (c < c_c)) {
          memcpy(&xCurrent[0], &workspace[0], (uint8_T)nVar_tmp_tmp * sizeof
                 (real_T));
        } else {
          memcpy(&xCurrent[0], &workspace[9], (uint8_T)nVar_tmp_tmp * sizeof
                 (real_T));
        }

        exitg1 = 1;
      }
    } while (exitg1 == 0);
  }

  return nonDegenerateWset;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_maxConstraintViolation
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj, const real_T x[4])
{
  real_T v;
  int32_T ia;
  int32_T k;
  if (obj->probType == 2) {
    real_T c;
    v = 0.0;
    for (k = 0; k < 8; k++) {
      obj->maxConstrWorkspace[k] = obj->bineq[k];
      obj->maxConstrWorkspace[k] = -obj->maxConstrWorkspace[k];
    }

    for (k = 0; k <= 28; k += 4) {
      c = 0.0;
      for (ia = k + 1; ia <= k + 3; ia++) {
        c += x[(ia - k) - 1] * obj->Aineq[ia - 1];
      }

      ia = k >> 2;
      obj->maxConstrWorkspace[ia] += c;
    }

    for (k = 0; k < 8; k++) {
      c = obj->maxConstrWorkspace[k] - x[3];
      obj->maxConstrWorkspace[k] = c;
      v = fmax(v, c);
    }
  } else {
    v = 0.0;
    for (k = 0; k < 8; k++) {
      obj->maxConstrWorkspace[k] = obj->bineq[k];
      obj->maxConstrWorkspace[k] = -obj->maxConstrWorkspace[k];
    }

    for (k = 0; k <= 28; k += 4) {
      real_T c;
      int32_T d;
      c = 0.0;
      d = k + obj->nVar;
      for (ia = k + 1; ia <= d; ia++) {
        c += x[(ia - k) - 1] * obj->Aineq[ia - 1];
      }

      ia = k >> 2;
      obj->maxConstrWorkspace[ia] += c;
    }

    for (k = 0; k < 8; k++) {
      v = fmax(v, obj->maxConstrWorkspace[k]);
    }
  }

  if (obj->sizes[3] > 0) {
    ia = (uint8_T)obj->sizes[3];
    for (k = 0; k < ia; k++) {
      v = fmax(v, -x[obj->indexLB[k] - 1]);
    }
  }

  return v;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_modifyOverheadPhaseOne_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj)
{
  int32_T b;
  int32_T idx;
  int32_T idxStartIneq;
  for (idx = 0; idx < 8; idx++) {
    obj->Aineq[(idx << 2) + 3] = -1.0;
  }

  obj->indexLB[obj->sizes[3] - 1] = 4;
  obj->lb[3] = 0.0;
  idxStartIneq = obj->isActiveIdx[2];
  b = obj->nActiveConstr;
  for (idx = idxStartIneq; idx <= b; idx++) {
    obj->ATwset[((idx - 1) << 2) + 3] = -1.0;
  }

  if (obj->nWConstr[4] > 0) {
    obj->isActiveConstr[obj->isActiveIdx[4] - 1] = false;
  }

  obj->isActiveConstr[obj->isActiveIdx[4] - 2] = false;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_setProblemType(sawH9C58NaQx0EcT16OdroH_controller13_T
  *obj, int32_T PROBLEM_TYPE)
{
  int32_T colOffsetATw;
  int32_T colOffsetAineq;
  int32_T e_tmp;
  int32_T idx_col;
  int32_T idx_lb;
  switch (PROBLEM_TYPE) {
   case 3:
    obj->nVar = 3;
    obj->mConstr = 8;
    for (idx_col = 0; idx_col < 5; idx_col++) {
      obj->sizes[idx_col] = obj->sizesNormal[idx_col];
    }

    for (idx_col = 0; idx_col < 6; idx_col++) {
      obj->isActiveIdx[idx_col] = obj->isActiveIdxNormal[idx_col];
    }
    break;

   case 1:
    obj->nVar = 4;
    obj->mConstr = 9;
    for (idx_col = 0; idx_col < 5; idx_col++) {
      obj->sizes[idx_col] = obj->sizesPhaseOne[idx_col];
    }

    for (idx_col = 0; idx_col < 6; idx_col++) {
      obj->isActiveIdx[idx_col] = obj->isActiveIdxPhaseOne[idx_col];
    }

    controller13_modifyOverheadPhaseOne_(obj);
    break;

   case 2:
    obj->nVar = 3;
    obj->mConstr = 8;
    for (idx_col = 0; idx_col < 5; idx_col++) {
      obj->sizes[idx_col] = obj->sizesRegularized[idx_col];
    }

    if (obj->probType != 4) {
      for (idx_col = 0; idx_col < 8; idx_col++) {
        colOffsetAineq = idx_col << 2;
        for (idx_lb = 4; idx_lb <= idx_col + 3; idx_lb++) {
          obj->Aineq[(idx_lb + colOffsetAineq) - 1] = 0.0;
        }

        obj->Aineq[(idx_col + colOffsetAineq) + 3] = -1.0;
      }

      idx_lb = 3;
      for (idx_col = 0; idx_col < 8; idx_col++) {
        idx_lb++;
        obj->indexLB[idx_col] = idx_lb;
      }

      idx_lb = obj->isActiveIdx[4];
      colOffsetAineq = obj->isActiveIdxRegularized[4] - 1;
      if (idx_lb <= colOffsetAineq) {
        memset(&obj->isActiveConstr[idx_lb + -1], 0, (uint32_T)((colOffsetAineq
                 - idx_lb) + 1) * sizeof(boolean_T));
      }

      obj->lb[3] = 0.0;
      idx_lb = obj->isActiveIdx[2];
      colOffsetAineq = obj->nActiveConstr;
      for (idx_col = idx_lb; idx_col <= colOffsetAineq; idx_col++) {
        colOffsetATw = ((idx_col - 1) << 2) - 1;
        if (obj->Wid[idx_col - 1] == 3) {
          e_tmp = obj->Wlocalidx[idx_col - 1];
          if (e_tmp + 2 >= 4) {
            memset(&obj->ATwset[colOffsetATw + 4], 0, (uint32_T)((((e_tmp + 2) +
                      colOffsetATw) - colOffsetATw) - 3) * sizeof(real_T));
          }

          obj->ATwset[(e_tmp + colOffsetATw) + 3] = -1.0;
          if (e_tmp + 4 <= 3) {
            memset(&obj->ATwset[(e_tmp + 4) + colOffsetATw], 0, (uint32_T)
                   (((colOffsetATw - (e_tmp + 4)) - colOffsetATw) + 4) * sizeof
                   (real_T));
          }
        }
      }
    }

    for (idx_col = 0; idx_col < 6; idx_col++) {
      obj->isActiveIdx[idx_col] = obj->isActiveIdxRegularized[idx_col];
    }
    break;

   default:
    obj->nVar = 4;
    obj->mConstr = 9;
    for (idx_col = 0; idx_col < 5; idx_col++) {
      obj->sizes[idx_col] = obj->sizesRegPhaseOne[idx_col];
    }

    for (idx_col = 0; idx_col < 6; idx_col++) {
      obj->isActiveIdx[idx_col] = obj->isActiveIdxRegPhaseOne[idx_col];
    }

    controller13_modifyOverheadPhaseOne_(obj);
    break;
  }

  obj->probType = PROBLEM_TYPE;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_linearForm_(boolean_T obj_hasLinear, int32_T obj_nvar,
  real_T workspace[36], const real_T H[9], const real_T f[3], const real_T x[4])
{
  int32_T b;
  int32_T beta1;
  beta1 = 0;
  if (obj_hasLinear) {
    if ((uint8_T)obj_nvar - 1 >= 0) {
      memcpy(&workspace[0], &f[0], (uint8_T)obj_nvar * sizeof(real_T));
    }

    beta1 = 1;
  }

  if (obj_nvar != 0) {
    int32_T e;
    int32_T ix;
    if (beta1 != 1) {
      memset(&workspace[0], 0, (uint8_T)obj_nvar * sizeof(real_T));
    }

    ix = 0;
    e = (obj_nvar - 1) * obj_nvar + 1;
    for (beta1 = 1; obj_nvar < 0 ? beta1 >= e : beta1 <= e; beta1 += obj_nvar) {
      real_T c;
      int32_T g;
      c = 0.5 * x[ix];
      g = (beta1 + obj_nvar) - 1;
      for (b = beta1; b <= g; b++) {
        int32_T tmp;
        tmp = b - beta1;
        workspace[tmp] += H[b - 1] * c;
      }

      ix++;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_computeFval(const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, real_T workspace[36], const
  real_T H[9], const real_T f[3], const real_T x[4])
{
  real_T val;
  int32_T b;
  int32_T idx;
  int32_T scalarLB;
  int32_T vectorUB;
  switch (obj->objtype) {
   case 5:
    val = x[obj->nvar - 1] * obj->gammaScalar;
    break;

   case 3:
    controller13_linearForm_(obj->hasLinear, obj->nvar, workspace, H, f, x);
    val = 0.0;
    if (obj->nvar >= 1) {
      b = (uint8_T)obj->nvar;
      for (idx = 0; idx < b; idx++) {
        val += x[idx] * workspace[idx];
      }
    }
    break;

   default:
    controller13_linearForm_(obj->hasLinear, obj->nvar, workspace, H, f, x);
    b = obj->nvar + 1;
    scalarLB = ((((3 - obj->nvar) / 2) << 1) + obj->nvar) + 1;
    vectorUB = scalarLB - 2;
    for (idx = b; idx <= vectorUB; idx += 2) {
      _mm_storeu_pd(&workspace[idx - 1], _mm_mul_pd(_mm_loadu_pd(&x[idx - 1]),
        _mm_set1_pd(0.0)));
    }

    for (idx = scalarLB; idx < 4; idx++) {
      workspace[idx - 1] = x[idx - 1] * 0.0;
    }

    val = (x[0] * workspace[0] + x[1] * workspace[1]) + x[2] * workspace[2];
    break;
  }

  return val;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_xgemv_k(int32_T m, int32_T n, const real_T A[9],
  int32_T lda, const real_T x[4], real_T y[3])
{
  int32_T b;
  int32_T b_iy;
  if ((m != 0) && (n != 0)) {
    int32_T c;
    int32_T ix;
    memset(&y[0], 0, (uint8_T)m * sizeof(real_T));
    ix = 0;
    c = (n - 1) * lda + 1;
    for (b_iy = 1; lda < 0 ? b_iy >= c : b_iy <= c; b_iy += lda) {
      int32_T d;
      d = (b_iy + m) - 1;
      for (b = b_iy; b <= d; b++) {
        int32_T tmp;
        tmp = b - b_iy;
        y[tmp] += A[b - 1] * x[ix];
      }

      ix++;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_computeGrad_StoreHx
  (sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, const real_T H[9], const real_T
   f[3], const real_T x[4])
{
  __m128d tmp;
  int32_T b_ixlast;
  int32_T idx;
  int32_T scalarLB;
  int32_T vectorUB;
  switch (obj->objtype) {
   case 5:
    if (obj->nvar - 2 >= 0) {
      memset(&obj->grad[0], 0, (uint32_T)(obj->nvar - 1) * sizeof(real_T));
    }

    obj->grad[obj->nvar - 1] = obj->gammaScalar;
    break;

   case 3:
    controller13_xgemv_k(obj->nvar, obj->nvar, H, obj->nvar, x, obj->Hx);
    if ((uint8_T)obj->nvar - 1 >= 0) {
      memcpy(&obj->grad[0], &obj->Hx[0], (uint8_T)obj->nvar * sizeof(real_T));
    }

    if (obj->hasLinear && (obj->nvar >= 1)) {
      b_ixlast = obj->nvar - 1;
      scalarLB = (obj->nvar / 2) << 1;
      vectorUB = scalarLB - 2;
      for (idx = 0; idx <= vectorUB; idx += 2) {
        tmp = _mm_loadu_pd(&obj->grad[idx]);
        _mm_storeu_pd(&obj->grad[idx], _mm_add_pd(tmp, _mm_loadu_pd(&f[idx])));
      }

      for (idx = scalarLB; idx <= b_ixlast; idx++) {
        obj->grad[idx] += f[idx];
      }
    }
    break;

   default:
    controller13_xgemv_k(obj->nvar, obj->nvar, H, obj->nvar, x, obj->Hx);
    b_ixlast = obj->nvar + 1;
    scalarLB = ((((3 - obj->nvar) / 2) << 1) + obj->nvar) + 1;
    vectorUB = scalarLB - 2;
    for (idx = b_ixlast; idx <= vectorUB; idx += 2) {
      _mm_storeu_pd(&obj->Hx[idx - 1], _mm_mul_pd(_mm_loadu_pd(&x[idx - 1]),
        _mm_set1_pd(0.0)));
    }

    for (idx = scalarLB; idx < 4; idx++) {
      obj->Hx[idx - 1] = x[idx - 1] * 0.0;
    }

    obj->grad[0] = obj->Hx[0];
    obj->grad[1] = obj->Hx[1];
    obj->grad[2] = obj->Hx[2];
    if (obj->hasLinear && (obj->nvar >= 1)) {
      b_ixlast = obj->nvar - 1;
      scalarLB = (obj->nvar / 2) << 1;
      vectorUB = scalarLB - 2;
      for (idx = 0; idx <= vectorUB; idx += 2) {
        tmp = _mm_loadu_pd(&obj->grad[idx]);
        _mm_storeu_pd(&obj->grad[idx], _mm_add_pd(tmp, _mm_loadu_pd(&f[idx])));
      }

      for (idx = scalarLB; idx <= b_ixlast; idx++) {
        obj->grad[idx] += f[idx];
      }
    }
    break;
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_computeFval_ReuseHx(const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *obj, real_T workspace[36], const
  real_T f[3], const real_T x[4])
{
  real_T val;
  int32_T k;
  switch (obj->objtype) {
   case 5:
    val = x[obj->nvar - 1] * obj->gammaScalar;
    break;

   case 3:
    {
      if (obj->hasLinear) {
        int32_T e;
        int32_T scalarLB;
        int32_T vectorUB;
        e = (uint8_T)obj->nvar;
        scalarLB = ((uint8_T)obj->nvar / 2) << 1;
        vectorUB = scalarLB - 2;
        for (k = 0; k <= vectorUB; k += 2) {
          __m128d tmp;
          tmp = _mm_loadu_pd(&obj->Hx[k]);
          _mm_storeu_pd(&workspace[k], _mm_add_pd(_mm_mul_pd(_mm_set1_pd(0.5),
            tmp), _mm_loadu_pd(&f[k])));
        }

        for (k = scalarLB; k < e; k++) {
          workspace[k] = 0.5 * obj->Hx[k] + f[k];
        }

        val = 0.0;
        if (obj->nvar >= 1) {
          for (k = 0; k < e; k++) {
            val += x[k] * workspace[k];
          }
        }
      } else {
        val = 0.0;
        if (obj->nvar >= 1) {
          int32_T e;
          e = (uint8_T)obj->nvar;
          for (k = 0; k < e; k++) {
            val += x[k] * obj->Hx[k];
          }
        }

        val *= 0.5;
      }
    }
    break;

   default:
    {
      if (obj->hasLinear) {
        int32_T e;
        if ((uint8_T)obj->nvar - 1 >= 0) {
          memcpy(&workspace[0], &f[0], (uint8_T)obj->nvar * sizeof(real_T));
        }

        e = 2 - obj->nvar;
        for (k = 0; k <= e; k++) {
          workspace[obj->nvar + k] = 0.0;
        }

        workspace[0] += 0.5 * obj->Hx[0];
        workspace[1] += 0.5 * obj->Hx[1];
        workspace[2] += 0.5 * obj->Hx[2];
        val = (x[0] * workspace[0] + x[1] * workspace[1]) + x[2] * workspace[2];
      } else {
        int32_T e;
        val = ((x[0] * obj->Hx[0] + x[1] * obj->Hx[1]) + x[2] * obj->Hx[2]) *
          0.5;
        e = obj->nvar + 1;
        for (k = e; k < 4; k++) {
          val += x[k - 1] * 0.0;
        }
      }
    }
    break;
  }

  return val;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_xrotg(real_T *a, real_T *b, real_T *c, real_T *s)
{
  real_T absa;
  real_T absb;
  real_T roe;
  real_T scale;
  roe = *b;
  absa = fabs(*a);
  absb = fabs(*b);
  if (absa > absb) {
    roe = *a;
  }

  scale = absa + absb;
  if (scale == 0.0) {
    *s = 0.0;
    *c = 1.0;
    *a = 0.0;
    *b = 0.0;
  } else {
    real_T ads;
    real_T bds;
    ads = absa / scale;
    bds = absb / scale;
    scale *= sqrt(ads * ads + bds * bds);
    if (roe < 0.0) {
      scale = -scale;
    }

    *c = *a / scale;
    *s = *b / scale;
    if (absa > absb) {
      *b = *s;
    } else if (*c != 0.0) {
      *b = 1.0 / *c;
    } else {
      *b = 1.0;
    }

    *a = scale;
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_deleteColMoveEnd(sYbuiRVtE6jido5obBecKYC_controller13_T
  *obj, int32_T idx)
{
  real_T b_s;
  real_T b_temp;
  real_T b_temp_tmp_0;
  real_T c_c;
  int32_T QRk0;
  int32_T b_ix;
  int32_T b_n;
  int32_T b_temp_tmp;
  int32_T i;
  int32_T idxRotGCol;
  int32_T idxRotGCol_tmp;
  int32_T k;
  if (obj->usedPivoting) {
    i = 1;
    while ((i <= obj->ncols) && (obj->jpvt[i - 1] != idx)) {
      i++;
    }

    idx = i;
  }

  if (idx >= obj->ncols) {
    obj->ncols--;
  } else {
    obj->jpvt[idx - 1] = obj->jpvt[obj->ncols - 1];
    idxRotGCol = obj->minRowCol;
    for (i = 0; i < idxRotGCol; i++) {
      obj->QR[i + ((idx - 1) << 2)] = obj->QR[((obj->ncols - 1) << 2) + i];
    }

    obj->ncols--;
    if (obj->mrows <= obj->ncols) {
      obj->minRowCol = obj->mrows;
    } else {
      obj->minRowCol = obj->ncols;
    }

    if (idx < obj->mrows) {
      if (obj->mrows - 1 <= obj->ncols) {
        i = obj->mrows - 1;
      } else {
        i = obj->ncols;
      }

      k = i;
      idxRotGCol = (idx - 1) << 2;
      while (k >= idx) {
        b_temp_tmp = k + idxRotGCol;
        b_temp = obj->QR[b_temp_tmp];
        controller13_xrotg(&obj->QR[b_temp_tmp - 1], &b_temp, &c_c, &b_s);
        obj->QR[b_temp_tmp] = b_temp;
        idxRotGCol_tmp = (k - 1) << 2;
        obj->QR[k + idxRotGCol_tmp] = 0.0;
        QRk0 = (idx << 2) + k;
        b_ix = obj->ncols - idx;
        if (b_ix >= 1) {
          for (b_n = 0; b_n < b_ix; b_n++) {
            b_temp_tmp = (b_n << 2) + QRk0;
            b_temp_tmp_0 = obj->QR[b_temp_tmp - 1];
            b_temp = b_temp_tmp_0 * c_c + obj->QR[b_temp_tmp] * b_s;
            obj->QR[b_temp_tmp] = obj->QR[b_temp_tmp] * c_c - b_temp_tmp_0 * b_s;
            obj->QR[b_temp_tmp - 1] = b_temp;
          }
        }

        b_ix = obj->mrows;
        if (obj->mrows >= 1) {
          for (b_n = 0; b_n < b_ix; b_n++) {
            b_temp_tmp = idxRotGCol_tmp + b_n;
            b_temp_tmp_0 = obj->Q[b_temp_tmp + 4];
            b_temp = b_temp_tmp_0 * b_s + obj->Q[b_temp_tmp] * c_c;
            obj->Q[b_temp_tmp + 4] = b_temp_tmp_0 * c_c - obj->Q[b_temp_tmp] *
              b_s;
            obj->Q[b_temp_tmp] = b_temp;
          }
        }

        k--;
      }

      for (k = idx + 1; k <= i; k++) {
        idxRotGCol_tmp = (k - 1) << 2;
        b_temp_tmp = k + idxRotGCol_tmp;
        b_temp = obj->QR[b_temp_tmp];
        controller13_xrotg(&obj->QR[b_temp_tmp - 1], &b_temp, &c_c, &b_s);
        obj->QR[b_temp_tmp] = b_temp;
        QRk0 = k * 5;
        b_n = obj->ncols - k;
        if (b_n >= 1) {
          for (idxRotGCol = 0; idxRotGCol < b_n; idxRotGCol++) {
            b_temp_tmp = (idxRotGCol << 2) + QRk0;
            b_temp = obj->QR[b_temp_tmp - 1] * c_c + obj->QR[b_temp_tmp] * b_s;
            obj->QR[b_temp_tmp] = obj->QR[b_temp_tmp] * c_c - obj->QR[b_temp_tmp
              - 1] * b_s;
            obj->QR[b_temp_tmp - 1] = b_temp;
          }
        }

        b_n = obj->mrows;
        if (obj->mrows >= 1) {
          for (idxRotGCol = 0; idxRotGCol < b_n; idxRotGCol++) {
            b_temp_tmp = idxRotGCol_tmp + idxRotGCol;
            b_temp = obj->Q[b_temp_tmp + 4] * b_s + obj->Q[b_temp_tmp] * c_c;
            obj->Q[b_temp_tmp + 4] = obj->Q[b_temp_tmp + 4] * c_c - obj->
              Q[b_temp_tmp] * b_s;
            obj->Q[b_temp_tmp] = b_temp;
          }
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_fullColLDL2_(sh58oWPwY89XybeLiY7aWPG_controller13_T
  *obj, int32_T NColsRemain, real_T REG_PRIMAL)
{
  int32_T b_k;
  int32_T ijA;
  int32_T lastDiag;
  int32_T subMatrixDim;
  for (lastDiag = 0; lastDiag < NColsRemain; lastDiag++) {
    real_T alpha1;
    real_T temp;
    int32_T LD_diagOffset;
    int32_T jA;
    LD_diagOffset = 5 * lastDiag;
    temp = obj->FMat[LD_diagOffset];
    if (fabs(temp) <= obj->regTol_) {
      temp += REG_PRIMAL;
      obj->FMat[LD_diagOffset] = temp;
    }

    alpha1 = -1.0 / temp;
    subMatrixDim = (NColsRemain - lastDiag) - 2;
    for (b_k = 0; b_k <= subMatrixDim; b_k++) {
      obj->workspace_[b_k] = obj->FMat[(LD_diagOffset + b_k) + 1];
    }

    if (!(alpha1 == 0.0)) {
      jA = LD_diagOffset + 6;
      for (b_k = 0; b_k <= subMatrixDim; b_k++) {
        temp = obj->workspace_[b_k];
        if (temp != 0.0) {
          int32_T b;
          temp *= alpha1;
          b = subMatrixDim + jA;
          for (ijA = jA; ijA <= b; ijA++) {
            obj->FMat[ijA - 1] += obj->workspace_[ijA - jA] * temp;
          }
        }

        jA += 4;
      }
    }

    alpha1 = 1.0 / obj->FMat[LD_diagOffset];
    b_k = LD_diagOffset + subMatrixDim;
    ijA = (((((b_k - LD_diagOffset) + 1) / 2) << 1) + LD_diagOffset) + 2;
    jA = ijA - 2;
    for (subMatrixDim = LD_diagOffset + 2; subMatrixDim <= jA; subMatrixDim += 2)
    {
      __m128d tmp;
      tmp = _mm_loadu_pd(&obj->FMat[subMatrixDim - 1]);
      _mm_storeu_pd(&obj->FMat[subMatrixDim - 1], _mm_mul_pd(tmp, _mm_set1_pd
        (alpha1)));
    }

    for (subMatrixDim = ijA; subMatrixDim <= b_k + 2; subMatrixDim++) {
      obj->FMat[subMatrixDim - 1] *= alpha1;
    }
  }

  lastDiag = (NColsRemain - 1) * 5;
  if (fabs(obj->FMat[lastDiag]) <= obj->regTol_) {
    obj->FMat[lastDiag] += REG_PRIMAL;
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_xgemv_kl(int32_T m, int32_T n, const real_T A[16],
  int32_T ia0, const real_T x[36], real_T y[4])
{
  int32_T b_iy;
  int32_T iyend;
  if (m != 0) {
    int32_T b;
    int32_T ix;
    if (m - 1 >= 0) {
      memset(&y[0], 0, (uint32_T)m * sizeof(real_T));
    }

    ix = 0;
    b = ((n - 1) << 2) + ia0;
    for (b_iy = ia0; b_iy <= b; b_iy += 4) {
      int32_T c;
      c = (b_iy + m) - 1;
      for (iyend = b_iy; iyend <= c; iyend++) {
        int32_T tmp;
        tmp = iyend - b_iy;
        y[tmp] += A[iyend - 1] * x[ix];
      }

      ix++;
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_compute_deltax(const real_T H[9],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace, const
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager, const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective)
{
  __m128d tmp;
  real_T s;
  real_T smax;
  real_T temp;
  int32_T ar;
  int32_T b_jjA;
  int32_T b_mNull;
  int32_T br;
  int32_T exitg1;
  int32_T h;
  int32_T i;
  int32_T ix;
  int32_T lastColC;
  int32_T mNull_tmp;
  int32_T nVar;
  int32_T nVars;
  int32_T nullStart;
  int32_T nullStartIdx;
  int32_T nullStartIdx_tmp;
  int32_T vectorUB;
  nVar = qrmanager->mrows - 1;
  mNull_tmp = qrmanager->mrows - qrmanager->ncols;
  if (mNull_tmp <= 0) {
    if (qrmanager->mrows - 1 >= 0) {
      memset(&solution->searchDir[0], 0, (uint32_T)((qrmanager->mrows - 1) + 1) *
             sizeof(real_T));
    }
  } else {
    b_mNull = (qrmanager->mrows / 2) << 1;
    vectorUB = b_mNull - 2;
    for (nullStartIdx = 0; nullStartIdx <= vectorUB; nullStartIdx += 2) {
      tmp = _mm_loadu_pd(&objective->grad[nullStartIdx]);
      _mm_storeu_pd(&solution->searchDir[nullStartIdx], _mm_mul_pd(tmp,
        _mm_set1_pd(-1.0)));
    }

    for (nullStartIdx = b_mNull; nullStartIdx <= nVar; nullStartIdx++) {
      solution->searchDir[nullStartIdx] = -objective->grad[nullStartIdx];
    }

    if (qrmanager->ncols <= 0) {
      if (objective->objtype == 3) {
        temp = 1.4901161193847656E-6 * (real_T)qrmanager->mrows;
        cholmanager->ndims = qrmanager->mrows;
        for (b_jjA = 0; b_jjA <= nVar; b_jjA++) {
          nVars = (nVar + 1) * b_jjA;
          b_mNull = b_jjA << 2;
          for (nullStartIdx = 0; nullStartIdx <= nVar; nullStartIdx++) {
            cholmanager->FMat[b_mNull + nullStartIdx] = H[nullStartIdx + nVars];
          }
        }

        if (qrmanager->mrows < 1) {
          nullStartIdx = -1;
        } else {
          nullStartIdx = 0;
          if (qrmanager->mrows > 1) {
            smax = fabs(cholmanager->FMat[0]);
            for (b_jjA = 2; b_jjA <= nVar + 1; b_jjA++) {
              s = fabs(cholmanager->FMat[(b_jjA - 1) * 5]);
              if (s > smax) {
                nullStartIdx = b_jjA - 1;
                smax = s;
              }
            }
          }
        }

        cholmanager->regTol_ = fmax(fabs(cholmanager->FMat[(nullStartIdx << 2) +
          nullStartIdx]) * 2.2204460492503131E-16, fabs(temp));
        controller13_fullColLDL2_(cholmanager, qrmanager->mrows, temp);
        if (cholmanager->ConvexCheck) {
          b_jjA = 0;
          do {
            exitg1 = 0;
            if (b_jjA <= nVar) {
              if (cholmanager->FMat[(b_jjA << 2) + b_jjA] <= 0.0) {
                cholmanager->info = -b_jjA - 1;
                exitg1 = 1;
              } else {
                b_jjA++;
              }
            } else {
              cholmanager->ConvexCheck = false;
              exitg1 = 1;
            }
          } while (exitg1 == 0);
        }

        if (cholmanager->info != 0) {
          solution->state = -6;
        } else {
          nVar = cholmanager->ndims - 1;
          if (cholmanager->ndims != 0) {
            for (b_jjA = 0; b_jjA <= nVar; b_jjA++) {
              b_mNull = (b_jjA << 2) + b_jjA;
              nullStart = nVar - b_jjA;
              for (nullStartIdx = 0; nullStartIdx < nullStart; nullStartIdx++) {
                ix = (nullStartIdx + b_jjA) + 1;
                solution->searchDir[ix] -= cholmanager->FMat[(nullStartIdx +
                  b_mNull) + 1] * solution->searchDir[b_jjA];
              }
            }
          }

          nullStartIdx_tmp = cholmanager->ndims;
          for (b_jjA = 0; b_jjA < nullStartIdx_tmp; b_jjA++) {
            solution->searchDir[b_jjA] /= cholmanager->FMat[(b_jjA << 2) + b_jjA];
          }

          if (cholmanager->ndims != 0) {
            for (b_jjA = nullStartIdx_tmp; b_jjA >= 1; b_jjA--) {
              nVars = (b_jjA - 1) << 2;
              temp = solution->searchDir[b_jjA - 1];
              for (nullStartIdx = nullStartIdx_tmp; nullStartIdx >= b_jjA + 1;
                   nullStartIdx--) {
                temp -= cholmanager->FMat[(nVars + nullStartIdx) - 1] *
                  solution->searchDir[nullStartIdx - 1];
              }

              solution->searchDir[b_jjA - 1] = temp;
            }
          }
        }
      }
    } else {
      nullStartIdx_tmp = qrmanager->ncols << 2;
      nullStartIdx = nullStartIdx_tmp + 1;
      if (objective->objtype == 5) {
        for (nVars = 0; nVars < mNull_tmp; nVars++) {
          memspace->workspace_double[nVars] = -qrmanager->Q[((qrmanager->ncols +
            nVars) << 2) + nVar];
        }

        controller13_xgemv_kl(qrmanager->mrows, mNull_tmp, qrmanager->Q,
                              nullStartIdx_tmp + 1, memspace->workspace_double,
                              solution->searchDir);
      } else {
        if (objective->objtype == 3) {
          nVars = qrmanager->mrows;
          if ((qrmanager->mrows != 0) && (mNull_tmp != 0)) {
            br = nullStartIdx_tmp;
            lastColC = (mNull_tmp - 1) * 9;
            for (b_jjA = 0; b_jjA <= lastColC; b_jjA += 9) {
              nullStart = b_jjA + nVars;
              for (ix = b_jjA + 1; ix <= nullStart; ix++) {
                memspace->workspace_double[ix - 1] = 0.0;
              }
            }

            for (b_jjA = 0; b_jjA <= lastColC; b_jjA += 9) {
              ar = -1;
              h = br + nVars;
              for (ix = br + 1; ix <= h; ix++) {
                i = b_jjA + nVars;
                b_mNull = ((((i - b_jjA) / 2) << 1) + b_jjA) + 1;
                vectorUB = b_mNull - 2;
                for (nullStart = b_jjA + 1; nullStart <= vectorUB; nullStart +=
                     2) {
                  tmp = _mm_loadu_pd(&memspace->workspace_double[nullStart - 1]);
                  _mm_storeu_pd(&memspace->workspace_double[nullStart - 1],
                                _mm_add_pd(_mm_mul_pd(_mm_loadu_pd(&H[(ar +
                    nullStart) - b_jjA]), _mm_set1_pd(qrmanager->Q[ix - 1])),
                    tmp));
                }

                for (nullStart = b_mNull; nullStart <= i; nullStart++) {
                  memspace->workspace_double[nullStart - 1] += H[(ar + nullStart)
                    - b_jjA] * qrmanager->Q[ix - 1];
                }

                ar += nVars;
              }

              br += 4;
            }
          }

          if (mNull_tmp != 0) {
            br = (mNull_tmp - 1) << 2;
            for (b_jjA = 0; b_jjA <= br; b_jjA += 4) {
              nullStart = b_jjA + mNull_tmp;
              for (ix = b_jjA + 1; ix <= nullStart; ix++) {
                cholmanager->FMat[ix - 1] = 0.0;
              }
            }

            lastColC = -1;
            for (b_jjA = 0; b_jjA <= br; b_jjA += 4) {
              ar = nullStartIdx_tmp;
              h = b_jjA + mNull_tmp;
              for (ix = b_jjA + 1; ix <= h; ix++) {
                temp = 0.0;
                for (nullStart = 0; nullStart < nVars; nullStart++) {
                  temp += memspace->workspace_double[(nullStart + lastColC) + 1]
                    * qrmanager->Q[nullStart + ar];
                }

                cholmanager->FMat[ix - 1] += temp;
                ar += 4;
              }

              lastColC += 9;
            }
          }
        }

        temp = 1.4901161193847656E-6 * (real_T)mNull_tmp;
        cholmanager->ndims = mNull_tmp;
        b_mNull = 0;
        if (mNull_tmp > 1) {
          smax = fabs(cholmanager->FMat[0]);
          for (nVars = 2; nVars <= mNull_tmp; nVars++) {
            s = fabs(cholmanager->FMat[(nVars - 1) * 5]);
            if (s > smax) {
              b_mNull = nVars - 1;
              smax = s;
            }
          }
        }

        cholmanager->regTol_ = fmax(fabs(cholmanager->FMat[(b_mNull << 2) +
          b_mNull]) * 2.2204460492503131E-16, temp);
        controller13_fullColLDL2_(cholmanager, mNull_tmp, temp);
        if (cholmanager->ConvexCheck) {
          nVars = 0;
          do {
            exitg1 = 0;
            if (nVars <= mNull_tmp - 1) {
              if (cholmanager->FMat[(nVars << 2) + nVars] <= 0.0) {
                cholmanager->info = -nVars - 1;
                exitg1 = 1;
              } else {
                nVars++;
              }
            } else {
              cholmanager->ConvexCheck = false;
              exitg1 = 1;
            }
          } while (exitg1 == 0);
        }

        if (cholmanager->info != 0) {
          solution->state = -6;
        } else {
          if (qrmanager->mrows != 0) {
            memset(&memspace->workspace_double[0], 0, (uint32_T)mNull_tmp *
                   sizeof(real_T));
            b_jjA = (((mNull_tmp - 1) << 2) + nullStartIdx_tmp) + 1;
            for (nVars = nullStartIdx; nVars <= b_jjA; nVars += 4) {
              temp = 0.0;
              nullStart = nVars + nVar;
              for (b_mNull = nVars; b_mNull <= nullStart; b_mNull++) {
                temp += qrmanager->Q[b_mNull - 1] * objective->grad[b_mNull -
                  nVars];
              }

              ix = ((nVars - nullStartIdx_tmp) - 1) >> 2;
              memspace->workspace_double[ix] -= temp;
            }
          }

          b_mNull = cholmanager->ndims - 1;
          if (cholmanager->ndims != 0) {
            for (nVar = 0; nVar <= b_mNull; nVar++) {
              b_jjA = (nVar << 2) + nVar;
              ix = b_mNull - nVar;
              for (nVars = 0; nVars < ix; nVars++) {
                br = (nVars + nVar) + 1;
                memspace->workspace_double[br] -= cholmanager->FMat[(nVars +
                  b_jjA) + 1] * memspace->workspace_double[nVar];
              }
            }
          }

          nullStartIdx = cholmanager->ndims;
          for (nVar = 0; nVar < nullStartIdx; nVar++) {
            memspace->workspace_double[nVar] /= cholmanager->FMat[(nVar << 2) +
              nVar];
          }

          if (cholmanager->ndims != 0) {
            for (nVar = nullStartIdx; nVar >= 1; nVar--) {
              nullStart = (nVar - 1) << 2;
              temp = memspace->workspace_double[nVar - 1];
              for (nVars = nullStartIdx; nVars >= nVar + 1; nVars--) {
                temp -= cholmanager->FMat[(nullStart + nVars) - 1] *
                  memspace->workspace_double[nVars - 1];
              }

              memspace->workspace_double[nVar - 1] = temp;
            }
          }

          controller13_xgemv_kl(qrmanager->mrows, mNull_tmp, qrmanager->Q,
                                nullStartIdx_tmp + 1, memspace->workspace_double,
                                solution->searchDir);
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static real_T controller13_xnrm2_mx(int32_T n, const real_T x[4])
{
  real_T y;
  int32_T k;
  y = 0.0;
  if (n >= 1) {
    if (n == 1) {
      y = fabs(x[0]);
    } else {
      real_T scale;
      int32_T b;
      scale = 3.3121686421112381E-170;
      b = (uint8_T)n;
      for (k = 0; k < b; k++) {
        real_T absxk;
        absxk = fabs(x[k]);
        if (absxk > scale) {
          real_T t;
          t = scale / absxk;
          y = y * t * t + 1.0;
          scale = absxk;
        } else {
          real_T t;
          t = absxk / scale;
          y += t * t;
        }
      }

      y = scale * sqrt(y);
    }
  }

  return y;
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_xgemv_klw(int32_T m, const real_T A[32], const real_T
  x[4], real_T y[36])
{
  int32_T b_iy;
  int32_T ia;
  for (b_iy = 0; b_iy <= 6; b_iy += 2) {
    __m128d tmp;
    tmp = _mm_loadu_pd(&y[b_iy]);
    _mm_storeu_pd(&y[b_iy], _mm_mul_pd(tmp, _mm_set1_pd(-1.0)));
  }

  for (b_iy = 0; b_iy <= 28; b_iy += 4) {
    real_T c;
    int32_T b;
    c = 0.0;
    b = b_iy + m;
    for (ia = b_iy + 1; ia <= b; ia++) {
      c += x[(ia - b_iy) - 1] * A[ia - 1];
    }

    ia = b_iy >> 2;
    y[ia] += c;
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_ratiotest(const real_T solution_xstar[4], const real_T
  solution_searchDir[4], real_T workspace[36], int32_T workingset_nVar, const
  real_T workingset_Aineq[32], const real_T workingset_bineq[8], const int32_T
  workingset_indexLB[4], const int32_T workingset_sizes[5], const int32_T
  workingset_isActiveIdx[6], const boolean_T workingset_isActiveConstr[9], const
  int32_T workingset_nWConstr[5], real_T *toldelta, real_T *alpha, boolean_T
  *newBlocking, int32_T *constrType, int32_T *constrIdx)
{
  real_T alphaTemp;
  real_T c;
  real_T denomTol;
  real_T p_max;
  real_T phaseOneCorrectionP;
  real_T pk_corrected;
  real_T workspace_0;
  int32_T d;
  int32_T ia;
  int32_T k;
  *alpha = 1.0E+30;
  *newBlocking = false;
  *constrType = 0;
  *constrIdx = 0;
  p_max = 0.0;
  denomTol = 2.2204460492503131E-13 * controller13_xnrm2_mx(workingset_nVar,
    solution_searchDir);
  if (workingset_nWConstr[2] < 8) {
    memcpy(&workspace[0], &workingset_bineq[0], sizeof(real_T) << 3U);
    controller13_xgemv_klw(workingset_nVar, workingset_Aineq, solution_xstar,
      workspace);
    memset(&workspace[9], 0, sizeof(real_T) << 3U);
    for (k = 0; k <= 28; k += 4) {
      c = 0.0;
      d = k + workingset_nVar;
      for (ia = k + 1; ia <= d; ia++) {
        c += solution_searchDir[(ia - k) - 1] * workingset_Aineq[ia - 1];
      }

      ia = (k >> 2) + 9;
      workspace[ia] += c;
    }

    for (k = 0; k < 8; k++) {
      workspace_0 = workspace[k + 9];
      if ((workspace_0 > denomTol) && (!workingset_isActiveConstr
           [(workingset_isActiveIdx[2] + k) - 1])) {
        c = workspace[k];
        alphaTemp = fmin(fabs(c - *toldelta), (1.0E-9 - c) + *toldelta) /
          workspace_0;
        if ((alphaTemp <= *alpha) && (fabs(workspace_0) > p_max)) {
          *alpha = alphaTemp;
          *constrType = 3;
          *constrIdx = k + 1;
          *newBlocking = true;
        }

        alphaTemp = fmin(fabs(c), 1.0E-9 - c) / workspace_0;
        if (alphaTemp < *alpha) {
          *alpha = alphaTemp;
          *constrType = 3;
          *constrIdx = k + 1;
          *newBlocking = true;
          p_max = fabs(workspace_0);
        }
      }
    }
  }

  if (workingset_nWConstr[3] < workingset_sizes[3]) {
    c = solution_xstar[workingset_nVar - 1] * 0.0;
    phaseOneCorrectionP = solution_searchDir[workingset_nVar - 1] * 0.0;
    ia = workingset_sizes[3];
    for (k = 0; k <= ia - 2; k++) {
      d = workingset_indexLB[k];
      pk_corrected = -solution_searchDir[d - 1] - phaseOneCorrectionP;
      if ((pk_corrected > denomTol) && (!workingset_isActiveConstr
           [(workingset_isActiveIdx[3] + k) - 1])) {
        workspace_0 = -solution_xstar[d - 1];
        alphaTemp = (workspace_0 - *toldelta) - c;
        alphaTemp = fmin(fabs(alphaTemp), 1.0E-9 - alphaTemp) / pk_corrected;
        if ((alphaTemp <= *alpha) && (fabs(pk_corrected) > p_max)) {
          *alpha = alphaTemp;
          *constrType = 4;
          *constrIdx = k + 1;
          *newBlocking = true;
        }

        alphaTemp = workspace_0 - c;
        alphaTemp = fmin(fabs(alphaTemp), 1.0E-9 - alphaTemp) / pk_corrected;
        if (alphaTemp < *alpha) {
          *alpha = alphaTemp;
          *constrType = 4;
          *constrIdx = k + 1;
          *newBlocking = true;
          p_max = fabs(pk_corrected);
        }
      }
    }

    ia = workingset_indexLB[workingset_sizes[3] - 1] - 1;
    c = solution_searchDir[ia];
    if ((-c > denomTol) && (!workingset_isActiveConstr[(workingset_isActiveIdx[3]
          + workingset_sizes[3]) - 2])) {
      workspace_0 = -solution_xstar[ia];
      alphaTemp = workspace_0 - *toldelta;
      alphaTemp = fmin(fabs(alphaTemp), 1.0E-9 - alphaTemp) / -c;
      if ((alphaTemp <= *alpha) && (fabs(c) > p_max)) {
        *alpha = alphaTemp;
        *constrType = 4;
        *constrIdx = workingset_sizes[3];
        *newBlocking = true;
      }

      alphaTemp = fmin(fabs(workspace_0), 1.0E-9 - workspace_0) / -c;
      if (alphaTemp < *alpha) {
        *alpha = alphaTemp;
        *constrType = 4;
        *constrIdx = workingset_sizes[3];
        *newBlocking = true;
        p_max = fabs(c);
      }
    }
  }

  *toldelta += 6.608625846508183E-7;
  if (p_max > 0.0) {
    *alpha = fmax(*alpha, 6.608625846508183E-7 / p_max);
  }

  *newBlocking = (((!*newBlocking) || (!(*alpha > 1.0))) && (*newBlocking));
  *alpha = fmin(*alpha, 1.0);
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_feasibleratiotest(const real_T solution_xstar[4], const
  real_T solution_searchDir[4], real_T workspace[36], int32_T workingset_nVar,
  const real_T workingset_Aineq[32], const real_T workingset_bineq[8], const
  int32_T workingset_indexLB[4], const int32_T workingset_sizes[5], const
  int32_T workingset_isActiveIdx[6], const boolean_T workingset_isActiveConstr[9],
  const int32_T workingset_nWConstr[5], boolean_T isPhaseOne, real_T *alpha,
  boolean_T *newBlocking, int32_T *constrType, int32_T *constrIdx)
{
  real_T alphaTemp;
  real_T c;
  real_T denomTol;
  real_T phaseOneCorrectionP;
  real_T ratio;
  int32_T d;
  int32_T ia;
  int32_T k;
  *alpha = 1.0E+30;
  *newBlocking = false;
  *constrType = 0;
  *constrIdx = 0;
  denomTol = 2.2204460492503131E-13 * controller13_xnrm2_mx(workingset_nVar,
    solution_searchDir);
  if (workingset_nWConstr[2] < 8) {
    memcpy(&workspace[0], &workingset_bineq[0], sizeof(real_T) << 3U);
    controller13_xgemv_klw(workingset_nVar, workingset_Aineq, solution_xstar,
      workspace);
    memset(&workspace[9], 0, sizeof(real_T) << 3U);
    for (k = 0; k <= 28; k += 4) {
      c = 0.0;
      d = k + workingset_nVar;
      for (ia = k + 1; ia <= d; ia++) {
        c += solution_searchDir[(ia - k) - 1] * workingset_Aineq[ia - 1];
      }

      ia = (k >> 2) + 9;
      workspace[ia] += c;
    }

    for (k = 0; k < 8; k++) {
      c = workspace[k + 9];
      if ((c > denomTol) && (!workingset_isActiveConstr[(workingset_isActiveIdx
            [2] + k) - 1])) {
        alphaTemp = workspace[k];
        alphaTemp = fmin(fabs(alphaTemp), 1.0E-9 - alphaTemp) / c;
        if (alphaTemp < *alpha) {
          *alpha = alphaTemp;
          *constrType = 3;
          *constrIdx = k + 1;
          *newBlocking = true;
        }
      }
    }
  }

  if (workingset_nWConstr[3] < workingset_sizes[3]) {
    c = solution_xstar[workingset_nVar - 1] * (real_T)isPhaseOne;
    phaseOneCorrectionP = solution_searchDir[workingset_nVar - 1] * (real_T)
      isPhaseOne;
    ia = workingset_sizes[3];
    for (k = 0; k <= ia - 2; k++) {
      d = workingset_indexLB[k];
      alphaTemp = -solution_searchDir[d - 1] - phaseOneCorrectionP;
      if ((alphaTemp > denomTol) && (!workingset_isActiveConstr
           [(workingset_isActiveIdx[3] + k) - 1])) {
        ratio = -solution_xstar[d - 1] - c;
        alphaTemp = fmin(fabs(ratio), 1.0E-9 - ratio) / alphaTemp;
        if (alphaTemp < *alpha) {
          *alpha = alphaTemp;
          *constrType = 4;
          *constrIdx = k + 1;
          *newBlocking = true;
        }
      }
    }

    ia = workingset_indexLB[workingset_sizes[3] - 1] - 1;
    c = -solution_searchDir[ia];
    if ((c > denomTol) && (!workingset_isActiveConstr[(workingset_isActiveIdx[3]
          + workingset_sizes[3]) - 2])) {
      denomTol = -solution_xstar[ia];
      alphaTemp = fmin(fabs(denomTol), 1.0E-9 - denomTol) / c;
      if (alphaTemp < *alpha) {
        *alpha = alphaTemp;
        *constrType = 4;
        *constrIdx = workingset_sizes[3];
        *newBlocking = true;
      }
    }
  }

  if (!isPhaseOne) {
    *newBlocking = (((!*newBlocking) || (!(*alpha > 1.0))) && (*newBlocking));
    *alpha = fmin(*alpha, 1.0);
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_addBoundToActiveSetMatrix_
  (sawH9C58NaQx0EcT16OdroH_controller13_T *obj, int32_T TYPE, int32_T idx_local)
{
  int32_T colOffset;
  int32_T idx_bnd_local;
  obj->nWConstr[TYPE - 1]++;
  obj->isActiveConstr[(obj->isActiveIdx[TYPE - 1] + idx_local) - 2] = true;
  obj->nActiveConstr++;
  obj->Wid[obj->nActiveConstr - 1] = TYPE;
  obj->Wlocalidx[obj->nActiveConstr - 1] = idx_local;
  colOffset = ((obj->nActiveConstr - 1) << 2) - 1;
  if (TYPE == 5) {
    idx_bnd_local = 0;
    obj->bwset[obj->nActiveConstr - 1] = obj->ub[-1];
  } else {
    idx_bnd_local = obj->indexLB[idx_local - 1];
    obj->bwset[obj->nActiveConstr - 1] = 0.0;
  }

  if (idx_bnd_local - 2 >= 0) {
    memset(&obj->ATwset[colOffset + 1], 0, (uint32_T)(((idx_bnd_local +
              colOffset) - colOffset) - 1) * sizeof(real_T));
  }

  obj->ATwset[idx_bnd_local + colOffset] = (real_T)(TYPE == 5) * 2.0 - 1.0;
  if (idx_bnd_local + 1 <= obj->nVar) {
    memset(&obj->ATwset[(idx_bnd_local + colOffset) + 1], 0, (uint32_T)
           (((obj->nVar + colOffset) - idx_bnd_local) - colOffset) * sizeof
           (real_T));
  }

  switch (obj->probType) {
   case 3:
   case 2:
    break;

   default:
    obj->ATwset[obj->nVar + colOffset] = -1.0;
    break;
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_compute_lambda(real_T workspace[36],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution, const
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, const
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager)
{
  int32_T b_idx;
  int32_T idxQR;
  int32_T nActiveConstr_tmp_tmp;
  nActiveConstr_tmp_tmp = qrmanager->ncols;
  if (qrmanager->ncols > 0) {
    real_T c;
    boolean_T guard1;
    guard1 = false;
    if (objective->objtype != 4) {
      boolean_T nonDegenerate;
      c = 100.0 * (real_T)qrmanager->mrows * 2.2204460492503131E-16;
      nonDegenerate = ((qrmanager->mrows > 0) && (qrmanager->ncols > 0));
      if (nonDegenerate) {
        boolean_T guard2;
        b_idx = qrmanager->ncols;
        guard2 = false;
        if (qrmanager->mrows < qrmanager->ncols) {
          idxQR = ((qrmanager->ncols - 1) << 2) + qrmanager->mrows;
          while ((b_idx > qrmanager->mrows) && (fabs(qrmanager->QR[idxQR - 1]) >=
                  c)) {
            b_idx--;
            idxQR -= 4;
          }

          nonDegenerate = (b_idx == qrmanager->mrows);
          if (!nonDegenerate) {
          } else {
            guard2 = true;
          }
        } else {
          guard2 = true;
        }

        if (guard2) {
          idxQR = ((b_idx - 1) << 2) + b_idx;
          while ((b_idx >= 1) && (fabs(qrmanager->QR[idxQR - 1]) >= c)) {
            b_idx--;
            idxQR -= 5;
          }

          nonDegenerate = (b_idx == 0);
        }
      }

      if (!nonDegenerate) {
        solution->state = -7;
      } else {
        guard1 = true;
      }
    } else {
      guard1 = true;
    }

    if (guard1) {
      int32_T ix;
      int32_T jjA;
      if (qrmanager->mrows != 0) {
        memset(&workspace[0], 0, (uint32_T)qrmanager->ncols * sizeof(real_T));
        jjA = ((qrmanager->ncols - 1) << 2) + 1;
        for (b_idx = 1; b_idx <= jjA; b_idx += 4) {
          c = 0.0;
          ix = (b_idx + qrmanager->mrows) - 1;
          for (idxQR = b_idx; idxQR <= ix; idxQR++) {
            c += qrmanager->Q[idxQR - 1] * objective->grad[idxQR - b_idx];
          }

          idxQR = (b_idx - 1) >> 2;
          workspace[idxQR] += c;
        }
      }

      for (b_idx = nActiveConstr_tmp_tmp; b_idx >= 1; b_idx--) {
        jjA = (((b_idx - 1) << 2) + b_idx) - 2;
        workspace[b_idx - 1] /= qrmanager->QR[jjA + 1];
        for (idxQR = 0; idxQR <= b_idx - 2; idxQR++) {
          ix = (b_idx - idxQR) - 2;
          workspace[ix] -= workspace[b_idx - 1] * qrmanager->QR[jjA - idxQR];
        }
      }

      idxQR = (qrmanager->ncols / 2) << 1;
      jjA = idxQR - 2;
      for (b_idx = 0; b_idx <= jjA; b_idx += 2) {
        __m128d tmp;
        tmp = _mm_loadu_pd(&workspace[b_idx]);
        _mm_storeu_pd(&solution->lambda[b_idx], _mm_mul_pd(tmp, _mm_set1_pd(-1.0)));
      }

      for (b_idx = idxQR; b_idx < nActiveConstr_tmp_tmp; b_idx++) {
        solution->lambda[b_idx] = -workspace[b_idx];
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_iterate(const real_T H[9], const real_T f[3],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
  sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager,
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, real_T
  options_ObjectiveLimit, real_T options_StepTolerance, real_T
  runTimeOptions_ConstrRelTolFactor, real_T runTimeOptions_ProbRelTolFactor,
  boolean_T runTimeOptions_RemainFeasible)
{
  __m128d tmp;
  __m128d tmp_0;
  real_T normDelta;
  real_T s;
  real_T temp;
  real_T temp_tmp;
  real_T tolDelta;
  int32_T Qk0;
  int32_T TYPE;
  int32_T activeSetChangeID;
  int32_T b_iy;
  int32_T exitg1;
  int32_T globalActiveConstrIdx;
  int32_T idxRotGCol;
  int32_T iy;
  int32_T iyend;
  int32_T m;
  int32_T nVar;
  boolean_T guard1;
  boolean_T newBlocking;
  boolean_T subProblemChanged;
  boolean_T updateFval;
  subProblemChanged = true;
  updateFval = true;
  activeSetChangeID = 0;
  TYPE = objective->objtype;
  tolDelta = 6.7434957617430445E-7;
  nVar = workingset->nVar;
  globalActiveConstrIdx = 0;
  controller13_computeGrad_StoreHx(objective, H, f, solution->xstar);
  solution->fstar = controller13_computeFval_ReuseHx(objective,
    memspace->workspace_double, f, solution->xstar);
  if (solution->iterations < 220) {
    solution->state = -5;
  } else {
    solution->state = 0;
  }

  memset(&solution->lambda[0], 0, 9U * sizeof(real_T));
  do {
    exitg1 = 0;
    if (solution->state == -5) {
      guard1 = false;
      if (subProblemChanged) {
        switch (activeSetChangeID) {
         case 1:
          Qk0 = (workingset->nActiveConstr - 1) << 2;
          if (qrmanager->mrows <= qrmanager->ncols + 1) {
            qrmanager->minRowCol = qrmanager->mrows;
          } else {
            qrmanager->minRowCol = qrmanager->ncols + 1;
          }

          b_iy = qrmanager->ncols << 2;
          if (qrmanager->mrows != 0) {
            iyend = b_iy + qrmanager->mrows;
            if (b_iy + 1 <= iyend) {
              memset(&qrmanager->QR[b_iy], 0, (uint32_T)(iyend - b_iy) * sizeof
                     (real_T));
            }

            iy = ((qrmanager->mrows - 1) << 2) + 1;
            for (idxRotGCol = 1; idxRotGCol <= iy; idxRotGCol += 4) {
              normDelta = 0.0;
              m = (idxRotGCol + qrmanager->mrows) - 1;
              for (iyend = idxRotGCol; iyend <= m; iyend++) {
                normDelta += workingset->ATwset[(Qk0 + iyend) - idxRotGCol] *
                  qrmanager->Q[iyend - 1];
              }

              iyend = ((idxRotGCol - 1) >> 2) + b_iy;
              qrmanager->QR[iyend] += normDelta;
            }
          }

          qrmanager->ncols++;
          qrmanager->jpvt[qrmanager->ncols - 1] = qrmanager->ncols;
          for (iyend = qrmanager->mrows - 2; iyend + 2 > qrmanager->ncols; iyend
               --) {
            iy = ((qrmanager->ncols - 1) << 2) + iyend;
            temp = qrmanager->QR[iy + 1];
            controller13_xrotg(&qrmanager->QR[iy], &temp, &normDelta, &s);
            qrmanager->QR[iy + 1] = temp;
            Qk0 = iyend << 2;
            b_iy = qrmanager->mrows;
            if (qrmanager->mrows >= 1) {
              for (idxRotGCol = 0; idxRotGCol < b_iy; idxRotGCol++) {
                iy = Qk0 + idxRotGCol;
                temp_tmp = qrmanager->Q[iy + 4];
                temp = temp_tmp * s + qrmanager->Q[iy] * normDelta;
                qrmanager->Q[iy + 4] = temp_tmp * normDelta - qrmanager->Q[iy] *
                  s;
                qrmanager->Q[iy] = temp;
              }
            }
          }
          break;

         case -1:
          controller13_deleteColMoveEnd(qrmanager, globalActiveConstrIdx);
          break;

         default:
          controller13_factorQR(qrmanager, workingset->ATwset, nVar,
                                workingset->nActiveConstr);
          controller13_computeQ_(qrmanager, qrmanager->mrows);
          break;
        }

        controller13_compute_deltax(H, solution, memspace, qrmanager,
          cholmanager, objective);
        if (solution->state != -5) {
          exitg1 = 1;
        } else {
          normDelta = controller13_xnrm2_mx(nVar, solution->searchDir);
          guard1 = true;
        }
      } else {
        if (nVar - 1 >= 0) {
          memset(&solution->searchDir[0], 0, (uint32_T)nVar * sizeof(real_T));
        }

        normDelta = 0.0;
        guard1 = true;
      }

      if (guard1) {
        if ((!subProblemChanged) || (normDelta < options_StepTolerance) ||
            (workingset->nActiveConstr >= nVar)) {
          controller13_compute_lambda(memspace->workspace_double, solution,
            objective, qrmanager);
          if ((solution->state != -7) || (workingset->nActiveConstr > nVar)) {
            iyend = 0;
            normDelta = 0.0 * runTimeOptions_ProbRelTolFactor * (real_T)(TYPE !=
              5);
            Qk0 = (workingset->nWConstr[0] + workingset->nWConstr[1]) + 1;
            b_iy = workingset->nActiveConstr;
            for (idxRotGCol = Qk0; idxRotGCol <= b_iy; idxRotGCol++) {
              temp = solution->lambda[idxRotGCol - 1];
              if (temp < normDelta) {
                normDelta = temp;
                iyend = idxRotGCol;
              }
            }

            if (iyend == 0) {
              solution->state = 1;
            } else {
              activeSetChangeID = -1;
              globalActiveConstrIdx = iyend;
              subProblemChanged = true;
              controller13_removeConstr(workingset, iyend);
              solution->lambda[iyend - 1] = 0.0;
            }
          } else {
            iyend = workingset->nActiveConstr;
            activeSetChangeID = 0;
            globalActiveConstrIdx = workingset->nActiveConstr;
            subProblemChanged = true;
            controller13_removeConstr(workingset, workingset->nActiveConstr);
            solution->lambda[iyend - 1] = 0.0;
          }

          updateFval = false;
        } else {
          updateFval = (TYPE == 5);
          if (updateFval || runTimeOptions_RemainFeasible) {
            controller13_feasibleratiotest(solution->xstar, solution->searchDir,
              memspace->workspace_double, workingset->nVar, workingset->Aineq,
              workingset->bineq, workingset->indexLB, workingset->sizes,
              workingset->isActiveIdx, workingset->isActiveConstr,
              workingset->nWConstr, updateFval, &normDelta, &newBlocking, &iyend,
              &idxRotGCol);
          } else {
            controller13_ratiotest(solution->xstar, solution->searchDir,
              memspace->workspace_double, workingset->nVar, workingset->Aineq,
              workingset->bineq, workingset->indexLB, workingset->sizes,
              workingset->isActiveIdx, workingset->isActiveConstr,
              workingset->nWConstr, &tolDelta, &normDelta, &newBlocking, &iyend,
              &idxRotGCol);
          }

          if (newBlocking) {
            switch (iyend) {
             case 3:
              workingset->nWConstr[2]++;
              workingset->isActiveConstr[(workingset->isActiveIdx[2] +
                idxRotGCol) - 2] = true;
              workingset->nActiveConstr++;
              workingset->Wid[workingset->nActiveConstr - 1] = 3;
              workingset->Wlocalidx[workingset->nActiveConstr - 1] = idxRotGCol;
              iyend = (idxRotGCol - 1) << 2;
              Qk0 = (workingset->nActiveConstr - 1) << 2;
              b_iy = workingset->nVar - 1;
              for (activeSetChangeID = 0; activeSetChangeID <= b_iy;
                   activeSetChangeID++) {
                workingset->ATwset[Qk0 + activeSetChangeID] = workingset->
                  Aineq[iyend + activeSetChangeID];
              }

              workingset->bwset[workingset->nActiveConstr - 1] =
                workingset->bineq[idxRotGCol - 1];
              break;

             case 4:
              controller13_addBoundToActiveSetMatrix_(workingset, 4, idxRotGCol);
              break;

             default:
              controller13_addBoundToActiveSetMatrix_(workingset, 5, idxRotGCol);
              break;
            }

            activeSetChangeID = 1;
          } else {
            if (objective->objtype == 5) {
              if (controller13_xnrm2_mx(objective->nvar, solution->searchDir) >
                  100.0 * (real_T)objective->nvar * 1.4901161193847656E-8) {
                solution->state = 3;
              } else {
                solution->state = 4;
              }
            }

            subProblemChanged = false;
            if (workingset->nActiveConstr == 0) {
              solution->state = 1;
            }
          }

          if (!(normDelta == 0.0)) {
            iyend = (nVar / 2) << 1;
            Qk0 = iyend - 2;
            for (idxRotGCol = 0; idxRotGCol <= Qk0; idxRotGCol += 2) {
              tmp = _mm_loadu_pd(&solution->searchDir[idxRotGCol]);
              tmp_0 = _mm_loadu_pd(&solution->xstar[idxRotGCol]);
              _mm_storeu_pd(&solution->xstar[idxRotGCol], _mm_add_pd(_mm_mul_pd
                (_mm_set1_pd(normDelta), tmp), tmp_0));
            }

            for (idxRotGCol = iyend; idxRotGCol < nVar; idxRotGCol++) {
              solution->xstar[idxRotGCol] += normDelta * solution->
                searchDir[idxRotGCol];
            }
          }

          controller13_computeGrad_StoreHx(objective, H, f, solution->xstar);
          updateFval = true;
        }

        solution->iterations++;
        if ((solution->iterations >= 220) && ((solution->state != 1) ||
             (objective->objtype == 5))) {
          solution->state = 0;
        }

        if (solution->iterations - solution->iterations / 50 * 50 == 0) {
          solution->maxConstr = controller13_maxConstraintViolation(workingset,
            solution->xstar);
          normDelta = solution->maxConstr;
          if (objective->objtype == 5) {
            normDelta = solution->maxConstr - solution->xstar[objective->nvar -
              1];
          }

          if (normDelta > 1.0E-9 * runTimeOptions_ConstrRelTolFactor) {
            iyend = (uint8_T)objective->nvar;
            if ((uint8_T)objective->nvar - 1 >= 0) {
              memcpy(&solution->searchDir[0], &solution->xstar[0], (uint8_T)
                     objective->nvar * sizeof(real_T));
            }

            newBlocking = controller13_feasibleX0ForWorkingSet
              (memspace->workspace_double, solution->searchDir, workingset,
               qrmanager);
            if ((!newBlocking) && (solution->state != 0)) {
              solution->state = -2;
            }

            activeSetChangeID = 0;
            normDelta = controller13_maxConstraintViolation(workingset,
              solution->searchDir);
            if (normDelta < solution->maxConstr) {
              if ((uint8_T)objective->nvar - 1 >= 0) {
                memcpy(&solution->xstar[0], &solution->searchDir[0], (uint8_T)
                       objective->nvar * sizeof(real_T));
              }

              solution->maxConstr = normDelta;
            }
          }
        }

        if (updateFval && (options_ObjectiveLimit > (rtMinusInf))) {
          solution->fstar = controller13_computeFval_ReuseHx(objective,
            memspace->workspace_double, f, solution->xstar);
          if ((solution->fstar < options_ObjectiveLimit) && ((solution->state !=
                0) || (objective->objtype != 5))) {
            solution->state = 2;
          }
        }
      }
    } else {
      if (!updateFval) {
        solution->fstar = controller13_computeFval_ReuseHx(objective,
          memspace->workspace_double, f, solution->xstar);
      }

      exitg1 = 1;
    }
  } while (exitg1 == 0);
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_PresolveWorkingSet
  (seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
   soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
   sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
   sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager)
{
  real_T qtb;
  real_T tol;
  int32_T c;
  int32_T c_tmp_tmp;
  int32_T ix;
  int32_T mTotalWorkingEq_tmp;
  int32_T mWorkingFixed;
  int32_T totalRank;
  int32_T u1;
  boolean_T exitg1;
  boolean_T guard1;
  boolean_T okWorkingSet;
  solution->state = 82;
  mWorkingFixed = workingset->nWConstr[0];
  mTotalWorkingEq_tmp = workingset->nWConstr[0] + workingset->nWConstr[1];
  u1 = 0;
  if (mTotalWorkingEq_tmp > 0) {
    c_tmp_tmp = (uint8_T)workingset->nVar;
    for (u1 = 0; u1 < mTotalWorkingEq_tmp; u1++) {
      for (totalRank = 0; totalRank < c_tmp_tmp; totalRank++) {
        qrmanager->QR[u1 + (totalRank << 2)] = workingset->ATwset[(u1 << 2) +
          totalRank];
      }
    }

    u1 = mTotalWorkingEq_tmp - workingset->nVar;
    if (u1 <= 0) {
      u1 = 0;
    }

    memset(&qrmanager->jpvt[0], 0, (uint8_T)workingset->nVar * sizeof(int32_T));
    controller13_factorQRE(qrmanager, mTotalWorkingEq_tmp, workingset->nVar);
    tol = 100.0 * (real_T)workingset->nVar * 2.2204460492503131E-16;
    if (workingset->nVar <= mTotalWorkingEq_tmp) {
      totalRank = workingset->nVar;
    } else {
      totalRank = mTotalWorkingEq_tmp;
    }

    totalRank += (totalRank - 1) << 2;
    while ((totalRank > 0) && (fabs(qrmanager->QR[totalRank - 1]) < tol)) {
      totalRank -= 5;
      u1++;
    }

    if (u1 > 0) {
      controller13_computeQ_(qrmanager, qrmanager->mrows);
      c = 0;
      exitg1 = false;
      while ((!exitg1) && (c <= u1 - 1)) {
        ix = ((mTotalWorkingEq_tmp - c) - 1) << 2;
        qtb = 0.0;
        for (totalRank = 0; totalRank < mTotalWorkingEq_tmp; totalRank++) {
          qtb += qrmanager->Q[ix + totalRank] * workingset->bwset[totalRank];
        }

        if (fabs(qtb) >= tol) {
          u1 = -1;
          exitg1 = true;
        } else {
          c++;
        }
      }
    }

    if (u1 > 0) {
      for (totalRank = 0; totalRank < mTotalWorkingEq_tmp; totalRank++) {
        ix = totalRank << 2;
        memcpy(&qrmanager->QR[ix], &workingset->ATwset[ix], (uint32_T)
               ((c_tmp_tmp + ix) - ix) * sizeof(real_T));
      }

      for (totalRank = 0; totalRank < mWorkingFixed; totalRank++) {
        qrmanager->jpvt[totalRank] = 1;
      }

      totalRank = workingset->nWConstr[0] + 1;
      if (totalRank <= mTotalWorkingEq_tmp) {
        memset(&qrmanager->jpvt[totalRank + -1], 0, (uint32_T)
               ((mTotalWorkingEq_tmp - totalRank) + 1) * sizeof(int32_T));
      }

      controller13_factorQRE(qrmanager, workingset->nVar, mTotalWorkingEq_tmp);
      for (mWorkingFixed = 0; mWorkingFixed < u1; mWorkingFixed++) {
        memspace->workspace_int[mWorkingFixed] = qrmanager->jpvt
          [(mTotalWorkingEq_tmp - u1) + mWorkingFixed];
      }

      controller13_countsort(memspace->workspace_int, u1,
        memspace->workspace_sort, 1, mTotalWorkingEq_tmp);
      for (totalRank = u1; totalRank >= 1; totalRank--) {
        mTotalWorkingEq_tmp = workingset->nWConstr[0] + workingset->nWConstr[1];
        if (mTotalWorkingEq_tmp != 0) {
          ix = memspace->workspace_int[totalRank - 1];
          if (ix <= mTotalWorkingEq_tmp) {
            if ((mTotalWorkingEq_tmp == workingset->nActiveConstr) ||
                (mTotalWorkingEq_tmp == ix)) {
              workingset->mEqRemoved++;
              controller13_removeConstr(workingset, ix);
            } else {
              workingset->mEqRemoved++;
              c = workingset->Wid[ix - 1] - 1;
              workingset->isActiveConstr[(workingset->isActiveIdx[c] +
                workingset->Wlocalidx[ix - 1]) - 2] = false;
              workingset->Wid[ix - 1] = workingset->Wid[mTotalWorkingEq_tmp - 1];
              workingset->Wlocalidx[ix - 1] = workingset->
                Wlocalidx[mTotalWorkingEq_tmp - 1];
              for (mWorkingFixed = 0; mWorkingFixed < c_tmp_tmp; mWorkingFixed++)
              {
                workingset->ATwset[mWorkingFixed + ((ix - 1) << 2)] =
                  workingset->ATwset[((mTotalWorkingEq_tmp - 1) << 2) +
                  mWorkingFixed];
              }

              workingset->bwset[ix - 1] = workingset->bwset[mTotalWorkingEq_tmp
                - 1];
              workingset->Wid[mTotalWorkingEq_tmp - 1] = workingset->
                Wid[workingset->nActiveConstr - 1];
              workingset->Wlocalidx[mTotalWorkingEq_tmp - 1] =
                workingset->Wlocalidx[workingset->nActiveConstr - 1];
              for (mWorkingFixed = 0; mWorkingFixed < c_tmp_tmp; mWorkingFixed++)
              {
                workingset->ATwset[mWorkingFixed + ((mTotalWorkingEq_tmp - 1) <<
                  2)] = workingset->ATwset[((workingset->nActiveConstr - 1) << 2)
                  + mWorkingFixed];
              }

              workingset->bwset[mTotalWorkingEq_tmp - 1] = workingset->
                bwset[workingset->nActiveConstr - 1];
              workingset->nActiveConstr--;
              workingset->nWConstr[c]--;
            }
          }
        }
      }
    }
  }

  if ((u1 != -1) && (workingset->nActiveConstr <= 4)) {
    controller13_RemoveDependentIneq_(workingset, qrmanager, memspace, 100.0);
    okWorkingSet = controller13_feasibleX0ForWorkingSet
      (memspace->workspace_double, solution->xstar, workingset, qrmanager);
    guard1 = false;
    if (!okWorkingSet) {
      controller13_RemoveDependentIneq_(workingset, qrmanager, memspace, 1000.0);
      okWorkingSet = controller13_feasibleX0ForWorkingSet
        (memspace->workspace_double, solution->xstar, workingset, qrmanager);
      if (!okWorkingSet) {
        solution->state = -7;
      } else {
        guard1 = true;
      }
    } else {
      guard1 = true;
    }

    if (guard1) {
      if (workingset->nWConstr[0] + workingset->nWConstr[1] == workingset->nVar)
      {
        tol = controller13_maxConstraintViolation(workingset, solution->xstar);
        if (tol > 1.0E-9) {
          solution->state = -2;
        }
      }
    }
  } else {
    solution->state = -3;
    totalRank = (workingset->nWConstr[0] + workingset->nWConstr[1]) + 1;
    mWorkingFixed = workingset->nActiveConstr;
    for (u1 = totalRank; u1 <= mWorkingFixed; u1++) {
      workingset->isActiveConstr[(workingset->isActiveIdx[workingset->Wid[u1 - 1]
        - 1] + workingset->Wlocalidx[u1 - 1]) - 2] = false;
    }

    workingset->nWConstr[2] = 0;
    workingset->nWConstr[3] = 0;
    workingset->nWConstr[4] = 0;
    workingset->nActiveConstr = workingset->nWConstr[0] + workingset->nWConstr[1];
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_computeFirstOrderOpt
  (seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution, const
   sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective, int32_T workingset_nVar,
   const real_T workingset_ATwset[36], int32_T workingset_nActiveConstr, real_T
   workspace[36])
{
  real_T smax;
  int32_T idxmax;
  int32_T k;
  memcpy(&workspace[0], &objective->grad[0], (uint8_T)workingset_nVar * sizeof
         (real_T));
  if (workingset_nActiveConstr != 0) {
    int32_T c;
    int32_T ix;
    ix = 0;
    c = ((workingset_nActiveConstr - 1) << 2) + 1;
    for (k = 1; k <= c; k += 4) {
      int32_T d;
      d = (k + workingset_nVar) - 1;
      for (idxmax = k; idxmax <= d; idxmax++) {
        int32_T tmp;
        tmp = idxmax - k;
        workspace[tmp] += workingset_ATwset[idxmax - 1] * solution->lambda[ix];
      }

      ix++;
    }
  }

  idxmax = 1;
  smax = fabs(workspace[0]);
  for (k = 2; k <= workingset_nVar; k++) {
    real_T s;
    s = fabs(workspace[k - 1]);
    if (s > smax) {
      idxmax = k;
      smax = s;
    }
  }

  solution->firstorderopt = fabs(workspace[idxmax - 1]);
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_driver(const real_T H[9], const real_T f[3],
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T *solution,
  soJzDMqrGjM1lRoGlt35IJE_controller13_T *memspace,
  sawH9C58NaQx0EcT16OdroH_controller13_T *workingset,
  sh58oWPwY89XybeLiY7aWPG_controller13_T *cholmanager, real_T
  runTimeOptions_ConstrRelTolFactor, real_T runTimeOptions_ProbRelTolFactor,
  sYbuiRVtE6jido5obBecKYC_controller13_T *qrmanager,
  sBdQuBHm0kvJUraEqbpc91F_controller13_T *objective)
{
  sSOeZ9WO10chPn9Si6PKiCB_controller13_T options;
  real_T maxConstr_new;
  int32_T b_idxEndIneq;
  int32_T b_idxStartIneq;
  int32_T i;
  int32_T idxEndIneq;
  int32_T idxStartIneq;
  boolean_T okWorkingSet;
  static const char_T e_SolverName[8] = { 'q', 'u', 'a', 'd', 'p', 'r', 'o', 'g'
  };

  static const char_T g[128] = { '\x00', '\x01', '\x02', '\x03', '\x04', '\x05',
    '\x06', '\a', '\b', '\t', '\n', '\v', '\f', '\r', '\x0e', '\x0f', '\x10',
    '\x11', '\x12', '\x13', '\x14', '\x15', '\x16', '\x17', '\x18', '\x19',
    '\x1a', '\x1b', '\x1c', '\x1d', '\x1e', '\x1f', ' ', '!', '\"', '#', '$',
    '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'a', 'b',
    'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
    'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '[', '\\', ']', '^', '_', '`',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~',
    '\x7f' };

  int32_T exitg2;
  boolean_T exitg1;
  boolean_T guard1;
  objective->grad[0] = 0.0;
  objective->grad[1] = 0.0;
  objective->grad[2] = 0.0;
  objective->grad[3] = 0.0;
  objective->Hx[0] = 0.0;
  objective->Hx[1] = 0.0;
  objective->Hx[2] = 0.0;
  objective->hasLinear = true;
  objective->nvar = 3;
  objective->maxVar = 4;
  objective->beta = 0.0;
  objective->rho = 0.0;
  objective->objtype = 3;
  objective->prev_objtype = 3;
  objective->prev_nvar = 0;
  objective->prev_hasLinear = false;
  objective->gammaScalar = 0.0;
  solution->iterations = 0;
  solution->state = 82;
  qrmanager->ldq = 4;
  memset(&qrmanager->QR[0], 0, 36U * sizeof(real_T));
  memset(&qrmanager->Q[0], 0, sizeof(real_T) << 4U);
  for (i = 0; i < 9; i++) {
    qrmanager->jpvt[i] = 0;
  }

  qrmanager->mrows = 0;
  qrmanager->ncols = 0;
  qrmanager->tau[0] = 0.0;
  qrmanager->tau[1] = 0.0;
  qrmanager->tau[2] = 0.0;
  qrmanager->tau[3] = 0.0;
  qrmanager->minRowCol = 0;
  qrmanager->usedPivoting = false;
  controller13_RemoveDependentIneq_(workingset, qrmanager, memspace, 100.0);
  okWorkingSet = controller13_feasibleX0ForWorkingSet(memspace->workspace_double,
    solution->xstar, workingset, qrmanager);
  if (!okWorkingSet) {
    controller13_RemoveDependentIneq_(workingset, qrmanager, memspace, 1000.0);
    okWorkingSet = controller13_feasibleX0ForWorkingSet
      (memspace->workspace_double, solution->xstar, workingset, qrmanager);
    if (!okWorkingSet) {
      solution->state = -7;
    }
  }

  for (i = 0; i < 8; i++) {
    options.SolverName[i] = e_SolverName[i];
  }

  if (solution->state >= 0) {
    solution->iterations = 0;
    solution->maxConstr = controller13_maxConstraintViolation(workingset,
      solution->xstar);
    guard1 = false;
    if (solution->maxConstr > 1.0E-9 * runTimeOptions_ConstrRelTolFactor) {
      solution->xstar[3] = solution->maxConstr + 1.0;
      controller13_setProblemType(workingset, 1);
      b_idxStartIneq = workingset->nWConstr[0] + workingset->nWConstr[1];
      idxStartIneq = b_idxStartIneq + 1;
      idxEndIneq = workingset->nActiveConstr;
      for (i = idxStartIneq; i <= idxEndIneq; i++) {
        workingset->isActiveConstr[(workingset->isActiveIdx[workingset->Wid[i -
          1] - 1] + workingset->Wlocalidx[i - 1]) - 2] = false;
      }

      workingset->nWConstr[2] = 0;
      workingset->nWConstr[3] = 0;
      workingset->nWConstr[4] = 0;
      workingset->nActiveConstr = b_idxStartIneq;
      objective->prev_objtype = 3;
      objective->prev_nvar = 3;
      objective->prev_hasLinear = true;
      objective->objtype = 5;
      objective->nvar = 4;
      objective->gammaScalar = 1.0;
      objective->hasLinear = true;
      solution->fstar = controller13_computeFval(objective,
        memspace->workspace_double, H, f, solution->xstar);
      solution->state = 5;
      controller13_iterate(H, f, solution, memspace, workingset, qrmanager,
                           cholmanager, objective, 1.0E-9 *
                           runTimeOptions_ConstrRelTolFactor,
                           1.4901161193847657E-10,
                           runTimeOptions_ConstrRelTolFactor,
                           runTimeOptions_ProbRelTolFactor, true);
      if (workingset->isActiveConstr[(workingset->isActiveIdx[3] +
           workingset->sizes[3]) - 2]) {
        i = 1;
        exitg1 = false;
        while ((!exitg1) && (i <= workingset->nActiveConstr)) {
          if ((workingset->Wid[i - 1] == 4) && (workingset->Wlocalidx[i - 1] ==
               workingset->sizes[3])) {
            controller13_removeConstr(workingset, i);
            exitg1 = true;
          } else {
            i++;
          }
        }
      }

      for (i = workingset->nActiveConstr; i > 3; i--) {
        controller13_removeConstr(workingset, i);
      }

      solution->maxConstr = solution->xstar[3];
      controller13_setProblemType(workingset, 3);
      objective->objtype = objective->prev_objtype;
      objective->nvar = objective->prev_nvar;
      objective->hasLinear = objective->prev_hasLinear;
      if (solution->state == 0) {
      } else {
        solution->maxConstr = controller13_maxConstraintViolation(workingset,
          solution->xstar);
        if (solution->maxConstr > 1.0E-9 * runTimeOptions_ConstrRelTolFactor) {
          memset(&solution->lambda[0], 0, 9U * sizeof(real_T));
          solution->fstar = controller13_computeFval(objective,
            memspace->workspace_double, H, f, solution->xstar);
          solution->state = -2;
        } else {
          if (solution->maxConstr > 0.0) {
            solution->searchDir[0] = solution->xstar[0];
            solution->searchDir[1] = solution->xstar[1];
            solution->searchDir[2] = solution->xstar[2];
            controller13_PresolveWorkingSet(solution, memspace, workingset,
              qrmanager);
            maxConstr_new = controller13_maxConstraintViolation(workingset,
              solution->xstar);
            if (maxConstr_new >= solution->maxConstr) {
              solution->maxConstr = maxConstr_new;
              solution->xstar[0] = solution->searchDir[0];
              solution->xstar[1] = solution->searchDir[1];
              solution->xstar[2] = solution->searchDir[2];
            }
          }

          guard1 = true;
        }
      }
    } else {
      guard1 = true;
    }

    if (guard1) {
      controller13_iterate(H, f, solution, memspace, workingset, qrmanager,
                           cholmanager, objective, -1.0E+20, 1.0E-10,
                           runTimeOptions_ConstrRelTolFactor,
                           runTimeOptions_ProbRelTolFactor, true);
      okWorkingSet = false;
      i = 0;
      do {
        exitg2 = 0;
        if (i < 8) {
          if (g[(int32_T)options.SolverName[i]] != g[(int32_T)e_SolverName[i]])
          {
            exitg2 = 1;
          } else {
            i++;
          }
        } else {
          okWorkingSet = true;
          exitg2 = 1;
        }
      } while (exitg2 == 0);

      if (okWorkingSet && (solution->state != -6)) {
        solution->maxConstr = controller13_maxConstraintViolation(workingset,
          solution->xstar);
        controller13_computeFirstOrderOpt(solution, objective, workingset->nVar,
          workingset->ATwset, workingset->nActiveConstr,
          memspace->workspace_double);
        while ((solution->iterations < 220) && ((solution->state == -7) ||
                ((solution->state == 1) && ((solution->maxConstr > 1.0E-9 *
                   runTimeOptions_ConstrRelTolFactor) ||
                  (solution->firstorderopt > 1.0E-8 *
                   runTimeOptions_ProbRelTolFactor))))) {
          controller13_feasibleX0ForWorkingSet(memspace->workspace_double,
            solution->xstar, workingset, qrmanager);
          controller13_PresolveWorkingSet(solution, memspace, workingset,
            qrmanager);
          idxStartIneq = workingset->probType;
          idxEndIneq = workingset->nVar;
          solution->xstar[3] = solution->maxConstr + 1.0;
          if (workingset->probType == 3) {
            i = 1;
          } else {
            i = 4;
          }

          controller13_setProblemType(workingset, i);
          b_idxStartIneq = (workingset->nWConstr[0] + workingset->nWConstr[1]) +
            1;
          b_idxEndIneq = workingset->nActiveConstr;
          for (i = b_idxStartIneq; i <= b_idxEndIneq; i++) {
            workingset->isActiveConstr[(workingset->isActiveIdx[workingset->
              Wid[i - 1] - 1] + workingset->Wlocalidx[i - 1]) - 2] = false;
          }

          workingset->nWConstr[2] = 0;
          workingset->nWConstr[3] = 0;
          workingset->nWConstr[4] = 0;
          workingset->nActiveConstr = workingset->nWConstr[0] +
            workingset->nWConstr[1];
          objective->prev_objtype = objective->objtype;
          objective->prev_nvar = objective->nvar;
          objective->prev_hasLinear = objective->hasLinear;
          objective->objtype = 5;
          objective->nvar = 4;
          objective->gammaScalar = 1.0;
          objective->hasLinear = true;
          solution->fstar = controller13_computeFval(objective,
            memspace->workspace_double, H, f, solution->xstar);
          solution->state = 5;
          controller13_iterate(H, f, solution, memspace, workingset, qrmanager,
                               cholmanager, objective, 1.0E-9 *
                               runTimeOptions_ConstrRelTolFactor,
                               1.4901161193847657E-10,
                               runTimeOptions_ConstrRelTolFactor,
                               runTimeOptions_ProbRelTolFactor, false);
          if (workingset->isActiveConstr[(workingset->isActiveIdx[3] +
               workingset->sizes[3]) - 2]) {
            i = 1;
            exitg1 = false;
            while ((!exitg1) && (i <= workingset->nActiveConstr)) {
              if ((workingset->Wid[i - 1] == 4) && (workingset->Wlocalidx[i - 1]
                   == workingset->sizes[3])) {
                controller13_removeConstr(workingset, i);
                exitg1 = true;
              } else {
                i++;
              }
            }
          }

          i = workingset->nActiveConstr;
          while ((i > 0) && (i > idxEndIneq)) {
            controller13_removeConstr(workingset, i);
            i--;
          }

          solution->maxConstr = solution->xstar[3];
          controller13_setProblemType(workingset, idxStartIneq);
          objective->objtype = objective->prev_objtype;
          objective->nvar = objective->prev_nvar;
          objective->hasLinear = objective->prev_hasLinear;
          controller13_iterate(H, f, solution, memspace, workingset, qrmanager,
                               cholmanager, objective, -1.0E+20, 1.0E-10,
                               runTimeOptions_ConstrRelTolFactor,
                               runTimeOptions_ProbRelTolFactor, false);
          solution->maxConstr = controller13_maxConstraintViolation(workingset,
            solution->xstar);
          controller13_computeFirstOrderOpt(solution, objective,
            workingset->nVar, workingset->ATwset, workingset->nActiveConstr,
            memspace->workspace_double);
        }
      }
    }
  }
}

/* Function for MATLAB Function: '<S1>/saturation' */
static void controller13_linearForm__d(boolean_T obj_hasLinear, int32_T obj_nvar,
  real_T workspace[4], const real_T H[9], const real_T f[3], const real_T x[4])
{
  int32_T b;
  int32_T beta1;
  beta1 = 0;
  if (obj_hasLinear) {
    if ((uint8_T)obj_nvar - 1 >= 0) {
      memcpy(&workspace[0], &f[0], (uint8_T)obj_nvar * sizeof(real_T));
    }

    beta1 = 1;
  }

  if (obj_nvar != 0) {
    int32_T d;
    int32_T ix;
    if (beta1 != 1) {
      memset(&workspace[0], 0, (uint8_T)obj_nvar * sizeof(real_T));
    }

    ix = 0;
    d = (obj_nvar - 1) * obj_nvar + 1;
    for (beta1 = 1; obj_nvar < 0 ? beta1 >= d : beta1 <= d; beta1 += obj_nvar) {
      int32_T e;
      e = (beta1 + obj_nvar) - 1;
      for (b = beta1; b <= e; b++) {
        int32_T tmp;
        tmp = b - beta1;
        workspace[tmp] += H[b - 1] * x[ix];
      }

      ix++;
    }
  }
}

void rt_mrdivide_U1d1x3_U2d3x3_Yd1x3_snf(const real_T u0[3], const real_T u1[9],
  real_T y[3])
{
  real_T A[9];
  real_T a21;
  real_T maxval;
  int32_T r1;
  int32_T r2;
  int32_T r3;
  memcpy(&A[0], &u1[0], 9U * sizeof(real_T));
  r1 = 0;
  r2 = 1;
  r3 = 2;
  maxval = fabs(u1[0]);
  a21 = fabs(u1[1]);
  if (a21 > maxval) {
    maxval = a21;
    r1 = 1;
    r2 = 0;
  }

  if (fabs(u1[2]) > maxval) {
    r1 = 2;
    r2 = 1;
    r3 = 0;
  }

  A[r2] = u1[r2] / u1[r1];
  A[r3] /= A[r1];
  A[r2 + 3] -= A[r1 + 3] * A[r2];
  A[r3 + 3] -= A[r1 + 3] * A[r3];
  A[r2 + 6] -= A[r1 + 6] * A[r2];
  A[r3 + 6] -= A[r1 + 6] * A[r3];
  if (fabs(A[r3 + 3]) > fabs(A[r2 + 3])) {
    int32_T rtemp;
    rtemp = r2 + 1;
    r2 = r3;
    r3 = rtemp - 1;
  }

  A[r3 + 3] /= A[r2 + 3];
  A[r3 + 6] -= A[r3 + 3] * A[r2 + 6];
  y[r1] = u0[0] / A[r1];
  y[r2] = u0[1] - A[r1 + 3] * y[r1];
  y[r3] = u0[2] - A[r1 + 6] * y[r1];
  y[r2] /= A[r2 + 3];
  y[r3] -= A[r2 + 6] * y[r2];
  y[r3] /= A[r3 + 6];
  y[r2] -= A[r3 + 3] * y[r3];
  y[r1] -= y[r3] * A[r3];
  y[r1] -= y[r2] * A[r2];
}

/* Model output function */
void controller13_output(void)
{
  __m128d tmp_0;
  __m128d tmp_1;
  __m128d tmp_2;
  __m128d tmp_3;
  __m128d tmp_4;
  __m128d tmp_5;
  cell_wrap_7_controller13_T reshapes[3];
  sBdQuBHm0kvJUraEqbpc91F_controller13_T QPObjective;
  sYbuiRVtE6jido5obBecKYC_controller13_T QRManager;
  sawH9C58NaQx0EcT16OdroH_controller13_T WorkingSet;
  seaWRZTzRUQIpw8HWfb7Zg_controller13_T solution;
  sh58oWPwY89XybeLiY7aWPG_controller13_T CholRegManager;
  soJzDMqrGjM1lRoGlt35IJE_controller13_T memspace;
  creal_T eigVec[16];
  creal_T eigVal[4];
  real_T b_b[666];
  real_T next_s_dp_sigma_points[666];
  real_T s_dp_sigma_points[666];
  real_T I_minus_K_H[324];
  real_T I_minus_K_H_0[324];
  real_T K_0[324];
  real_T m[324];
  real_T residuals_i_tmp[324];
  real_T rtb_Delay_h[324];
  real_T K[108];
  real_T K_tmp_0[108];
  real_T residuals_i_tmp_0[108];
  real_T b_y[36];
  real_T Aineq[24];
  real_T fake_s_raw_bee[19];
  real_T rtb_Switch[19];
  real_T s_si[19];
  real_T next_s_dp[18];
  real_T rtb_VectorConcatenate_n[18];
  real_T s_dp[18];
  real_T R_0[16];
  real_T z_raw[13];
  real_T R[9];
  real_T R_WI[9];
  real_T Transpose_tmp[9];
  real_T rtb_VectorConcatenate[9];
  real_T ss[9];
  real_T ss_tmp[9];
  real_T tempR[9];
  real_T tmp[9];
  real_T b_x[8];
  real_T x_hat_next[6];
  real_T z_error[6];
  real_T next_q_mean[4];
  real_T q_sigma_i[4];
  real_T x_hat_pred[4];
  real_T iy[3];
  real_T next_omega_sigma_i[3];
  real_T next_p_dot_sigma_i[3];
  real_T next_p_sigma_i[3];
  real_T rtb_sincos_o1[3];
  real_T rtb_sincos_o2[3];
  real_T q_sigma_i_0[2];
  real_T K12;
  real_T K13;
  real_T K14;
  real_T K23;
  real_T q0_tmp;
  real_T q0_tmp_0;
  real_T rtb_Delay1;
  real_T rtb_Delay3_o;
  real_T rtb_Gain1;
  real_T rtb_RampUpOrDown;
  real_T rtb_RampUpOrDown_f;
  real_T rtb_RampUpOrDown_n;
  real_T rtb_RandomNumber1;
  real_T rtb_RandomNumber2;
  real_T rtb_VectorConcatenate_tmp;
  real_T rtb_VectorConcatenate_tmp_0;
  real_T rtb_VectorConcatenate_tmp_1;
  real_T rtb_VectorConcatenate_tmp_2;
  real_T rtb_ixj;
  real_T rtb_ixj_data;
  real_T rtb_ixk;
  real_T rtb_jxi_tmp;
  real_T rtb_kxj;
  real_T rtb_sincos_o1_0;
  real_T varargin_1_data;
  real_T varargin_2_data;
  real_T y_data;
  int32_T csz_idx_2;
  int32_T ibtile;
  int32_T idxFillStart;
  int32_T iy_tmp;
  int32_T iy_tmp_0;
  int32_T rtb_sincos_o2_tmp;
  real32_T d_b[64];
  real32_T e_b[32];
  real32_T n;
  int8_T K_tmp[108];
  int8_T nz[4];
  int8_T csz_idx_2_0;
  boolean_T b_p;
  boolean_T d_p;
  boolean_T singular;
  static const int8_T x2[7] = { 0, 0, 0, 1, 0, 0, 0 };

  static const real_T c_b[37] = { 0.1, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025,
    0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025,
    0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025,
    0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025, 0.025 };

  static const real_T f_J[9] = { 0.01152, 0.0, 0.0, 0.0, 0.0351, 0.0, 0.0, 0.0,
    0.0384 };

  static const real_T g[324] = { 0.00039999999999999996, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.00039999999999999996, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.00039999999999999996, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 4.0E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 4.0E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0E-5, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    3.9999999999999996E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.9999999999999996E-5, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    3.9999999999999996E-5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.2, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 400.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 400.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 400.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.04, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.04, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.04 };

  static const int8_T e[108] = { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  static const int8_T d[108] = { 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0,
    0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

  static const real_T c[36] = { 0.00030000000000000003, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.00030000000000000003, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.00030000000000000003, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0087266462599716477,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0087266462599716477, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0087266462599716477 };

  static const int8_T WorkingSet_tmp[5] = { 0, 0, 8, 0, 0 };

  static const int8_T c_0[5] = { 0, 0, 8, 1, 0 };

  static const int8_T g_0[6] = { 1, 0, 0, 8, 0, 0 };

  static const int8_T d_0[5] = { 0, 0, 8, 8, 0 };

  static const int8_T e_0[5] = { 0, 0, 8, 9, 0 };

  static const int8_T h[6] = { 1, 0, 0, 8, 1, 0 };

  static const int8_T i[6] = { 1, 0, 0, 8, 8, 0 };

  static const int8_T j[6] = { 1, 0, 0, 8, 9, 0 };

  real_T rtb_VectorConcatenate_tmp_tmp;
  real_T rtb_VectorConcatenate_tmp_tmp_0;
  real_T rtb_VectorConcatenate_tmp_tmp_1;
  int32_T rtb_ixj_size[3];
  int32_T varargin_2_size[3];
  int32_T y_size[3];
  int32_T b_size_idx_0;
  boolean_T exitg1;
  boolean_T guard1;
  if (rtmIsMajorTimeStep(controller13_M)) {
    /* set solver stop time */
    if (!(controller13_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&controller13_M->solverInfo,
                            ((controller13_M->Timing.clockTickH0 + 1) *
        controller13_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&controller13_M->solverInfo,
                            ((controller13_M->Timing.clockTick0 + 1) *
        controller13_M->Timing.stepSize0 + controller13_M->Timing.clockTickH0 *
        controller13_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(controller13_M)) {
    controller13_M->Timing.t[0] = rtsiGetT(&controller13_M->solverInfo);
  }

  /* Reset subsysRan breadcrumbs */
  srClearBC(controller13_DW.IfActionSubsystem_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(controller13_DW.IfActionSubsystem1_SubsysRanBC);

  /* Reset subsysRan breadcrumbs */
  srClearBC(controller13_DW.IfActionSubsystem2_SubsysRanBC);
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Product: '<S97>/Product' incorporates:
     *  Constant: '<Root>/safety voltage'
     *  DiscreteIntegrator: '<S97>/SaturatingRamp'
     */
    controller13_B.Product = controller13_DW.SaturatingRamp_DSTATE *
      controller13_P.safetyvoltage_Value;

    /* DiscreteIntegrator: '<S91>/RampUpOrDown' */
    rtb_RampUpOrDown = controller13_DW.RampUpOrDown_DSTATE;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Gain: '<S91>/Gain1' incorporates:
     *  Constant: '<S91>/phase offset'
     *  DiscreteIntegrator: '<S91>/omega*t'
     *  Gain: '<S91>/deg to rad'
     *  Sum: '<S91>/Add1'
     *  Trigonometry: '<S91>/first harmonic'
     */
    rtb_Gain1 = cos(controller13_P.degtorad_Gain *
                    controller13_P.phaseoffset_Value +
                    controller13_DW.omegat_DSTATE) * controller13_P.Gain1_Gain;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* Delay: '<S8>/Delay1' */
    rtb_Delay1 = controller13_DW.Delay1_DSTATE;
  }

  /* Integrator: '<S40>/xe,ye,ze' */
  controller13_B.xeyeze[0] = controller13_X.xeyeze_CSTATE[0];
  controller13_B.xeyeze[1] = controller13_X.xeyeze_CSTATE[1];
  controller13_B.xeyeze[2] = controller13_X.xeyeze_CSTATE[2];

  /* ZeroOrderHold: '<S2>/Zero-Order Hold7' */
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* ZeroOrderHold: '<S2>/Zero-Order Hold7' */
    controller13_B.Eul_XYZ[0] = controller13_B.xeyeze[0];
    controller13_B.Eul_XYZ[1] = controller13_B.xeyeze[1];
    controller13_B.Eul_XYZ[2] = controller13_B.xeyeze[2];
  }

  /* End of ZeroOrderHold: '<S2>/Zero-Order Hold7' */
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Gain: '<S52>/1//2' incorporates:
     *  Constant: '<S42>/Initial Euler Angles'
     */
    rtb_sincos_o1[0] = controller13_P.u2_Gain *
      controller13_P.uDOFQuaternion_eul_0[2];
    rtb_sincos_o1[1] = controller13_P.u2_Gain *
      controller13_P.uDOFQuaternion_eul_0[1];
    rtb_sincos_o1[2] = controller13_P.u2_Gain *
      controller13_P.uDOFQuaternion_eul_0[0];

    /* Trigonometry: '<S52>/sincos' */
    rtb_sincos_o2[0] = cos(rtb_sincos_o1[0]);
    rtb_ixj = sin(rtb_sincos_o1[0]);
    rtb_sincos_o2[1] = cos(rtb_sincos_o1[1]);
    rtb_kxj = sin(rtb_sincos_o1[1]);
    rtb_sincos_o2[2] = cos(rtb_sincos_o1[2]);
    rtb_sincos_o1_0 = sin(rtb_sincos_o1[2]);

    /* Fcn: '<S52>/q0' incorporates:
     *  Fcn: '<S52>/q1'
     *  Trigonometry: '<S52>/sincos'
     */
    q0_tmp = rtb_sincos_o2[0] * rtb_sincos_o2[1];
    q0_tmp_0 = rtb_ixj * rtb_kxj;

    /* Fcn: '<S52>/q0' incorporates:
     *  Trigonometry: '<S52>/sincos'
     */
    controller13_B.q0 = q0_tmp * rtb_sincos_o2[2] + q0_tmp_0 * rtb_sincos_o1_0;

    /* Fcn: '<S52>/q1' incorporates:
     *  Trigonometry: '<S52>/sincos'
     */
    controller13_B.q1 = q0_tmp * rtb_sincos_o1_0 - q0_tmp_0 * rtb_sincos_o2[2];

    /* Fcn: '<S52>/q2' incorporates:
     *  Fcn: '<S52>/q3'
     *  Trigonometry: '<S52>/sincos'
     */
    q0_tmp = rtb_ixj * rtb_sincos_o2[1];
    q0_tmp_0 = rtb_sincos_o2[0] * rtb_kxj;

    /* Fcn: '<S52>/q2' incorporates:
     *  Trigonometry: '<S52>/sincos'
     */
    controller13_B.q2 = q0_tmp_0 * rtb_sincos_o2[2] + q0_tmp * rtb_sincos_o1_0;

    /* Fcn: '<S52>/q3' incorporates:
     *  Trigonometry: '<S52>/sincos'
     */
    controller13_B.q3 = q0_tmp * rtb_sincos_o2[2] - q0_tmp_0 * rtb_sincos_o1_0;
  }

  /* SignalConversion generated from: '<S42>/q0 q1 q2 q3' */
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[0] = controller13_B.q0;
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[1] = controller13_B.q1;
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[2] = controller13_B.q2;
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[3] = controller13_B.q3;

  /* Integrator: '<S42>/q0 q1 q2 q3' */
  if (controller13_DW.q0q1q2q3_IWORK != 0) {
    controller13_X.q0q1q2q3_CSTATE[0] =
      controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[0];
    controller13_X.q0q1q2q3_CSTATE[1] =
      controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[1];
    controller13_X.q0q1q2q3_CSTATE[2] =
      controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[2];
    controller13_X.q0q1q2q3_CSTATE[3] =
      controller13_B.TmpSignalConversionAtq0q1q2q3Inport2[3];
  }

  /* Sqrt: '<S65>/sqrt' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Product: '<S66>/Product'
   *  Product: '<S66>/Product1'
   *  Product: '<S66>/Product2'
   *  Product: '<S66>/Product3'
   *  Sqrt: '<S73>/sqrt'
   *  Sum: '<S66>/Sum'
   */
  rtb_jxi_tmp = sqrt(((controller13_X.q0q1q2q3_CSTATE[0] *
                       controller13_X.q0q1q2q3_CSTATE[0] +
                       controller13_X.q0q1q2q3_CSTATE[1] *
                       controller13_X.q0q1q2q3_CSTATE[1]) +
                      controller13_X.q0q1q2q3_CSTATE[2] *
                      controller13_X.q0q1q2q3_CSTATE[2]) +
                     controller13_X.q0q1q2q3_CSTATE[3] *
                     controller13_X.q0q1q2q3_CSTATE[3]);

  /* Product: '<S64>/Product' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Sqrt: '<S65>/sqrt'
   */
  rtb_ixj = controller13_X.q0q1q2q3_CSTATE[0] / rtb_jxi_tmp;

  /* Product: '<S64>/Product1' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Sqrt: '<S65>/sqrt'
   */
  rtb_kxj = controller13_X.q0q1q2q3_CSTATE[1] / rtb_jxi_tmp;

  /* Product: '<S64>/Product2' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Product: '<S68>/Product2'
   *  Sqrt: '<S65>/sqrt'
   */
  q0_tmp = controller13_X.q0q1q2q3_CSTATE[2] / rtb_jxi_tmp;

  /* Product: '<S64>/Product3' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Product: '<S68>/Product3'
   *  Sqrt: '<S65>/sqrt'
   */
  q0_tmp_0 = controller13_X.q0q1q2q3_CSTATE[3] / rtb_jxi_tmp;

  /* Product: '<S54>/Product3' incorporates:
   *  Product: '<S58>/Product3'
   */
  rtb_sincos_o1_0 = rtb_ixj * rtb_ixj;

  /* Product: '<S54>/Product2' incorporates:
   *  Product: '<S58>/Product2'
   */
  rtb_ixk = rtb_kxj * rtb_kxj;

  /* Product: '<S54>/Product1' incorporates:
   *  Fcn: '<S51>/fcn2'
   *  Product: '<S64>/Product2'
   */
  rtb_VectorConcatenate_tmp_tmp = q0_tmp * q0_tmp;

  /* Product: '<S54>/Product' incorporates:
   *  Fcn: '<S51>/fcn2'
   *  Product: '<S64>/Product3'
   */
  rtb_VectorConcatenate_tmp_tmp_0 = q0_tmp_0 * q0_tmp_0;

  /* Sum: '<S54>/Sum' incorporates:
   *  Product: '<S54>/Product'
   *  Product: '<S54>/Product1'
   *  Product: '<S54>/Product2'
   *  Product: '<S54>/Product3'
   */
  rtb_VectorConcatenate[0] = ((rtb_sincos_o1_0 + rtb_ixk) -
    rtb_VectorConcatenate_tmp_tmp) - rtb_VectorConcatenate_tmp_tmp_0;

  /* Product: '<S57>/Product3' incorporates:
   *  Product: '<S55>/Product3'
   *  Product: '<S64>/Product3'
   */
  rtb_VectorConcatenate_tmp = q0_tmp_0 * rtb_ixj;

  /* Product: '<S57>/Product2' incorporates:
   *  Product: '<S55>/Product2'
   *  Product: '<S64>/Product2'
   */
  rtb_VectorConcatenate_tmp_0 = rtb_kxj * q0_tmp;

  /* Gain: '<S57>/Gain' incorporates:
   *  Product: '<S57>/Product2'
   *  Product: '<S57>/Product3'
   *  Sum: '<S57>/Sum'
   */
  rtb_VectorConcatenate[1] = (rtb_VectorConcatenate_tmp_0 -
    rtb_VectorConcatenate_tmp) * controller13_P.Gain_Gain;

  /* Product: '<S60>/Product2' incorporates:
   *  Product: '<S56>/Product2'
   *  Product: '<S64>/Product3'
   */
  rtb_VectorConcatenate_tmp_1 = rtb_kxj * q0_tmp_0;

  /* Product: '<S60>/Product1' incorporates:
   *  Product: '<S56>/Product1'
   *  Product: '<S64>/Product2'
   */
  rtb_VectorConcatenate_tmp_2 = rtb_ixj * q0_tmp;

  /* Gain: '<S60>/Gain' incorporates:
   *  Product: '<S60>/Product1'
   *  Product: '<S60>/Product2'
   *  Sum: '<S60>/Sum'
   */
  rtb_VectorConcatenate[2] = (rtb_VectorConcatenate_tmp_2 +
    rtb_VectorConcatenate_tmp_1) * controller13_P.Gain_Gain_l;

  /* Gain: '<S55>/Gain' incorporates:
   *  Sum: '<S55>/Sum'
   */
  rtb_VectorConcatenate[3] = (rtb_VectorConcatenate_tmp +
    rtb_VectorConcatenate_tmp_0) * controller13_P.Gain_Gain_h;

  /* Sum: '<S58>/Sum' incorporates:
   *  Product: '<S54>/Product'
   *  Product: '<S54>/Product1'
   *  Sum: '<S62>/Sum'
   */
  rtb_sincos_o1_0 -= rtb_ixk;
  rtb_VectorConcatenate[4] = (rtb_sincos_o1_0 + rtb_VectorConcatenate_tmp_tmp) -
    rtb_VectorConcatenate_tmp_tmp_0;

  /* Product: '<S61>/Product1' incorporates:
   *  Product: '<S59>/Product1'
   */
  rtb_ixk = rtb_ixj * rtb_kxj;

  /* Product: '<S61>/Product2' incorporates:
   *  Fcn: '<S51>/fcn4'
   *  Product: '<S64>/Product2'
   *  Product: '<S64>/Product3'
   */
  rtb_VectorConcatenate_tmp_tmp_1 = q0_tmp * q0_tmp_0;

  /* Gain: '<S61>/Gain' incorporates:
   *  Product: '<S61>/Product1'
   *  Product: '<S61>/Product2'
   *  Sum: '<S61>/Sum'
   */
  rtb_VectorConcatenate[5] = (rtb_VectorConcatenate_tmp_tmp_1 - rtb_ixk) *
    controller13_P.Gain_Gain_b;

  /* Gain: '<S56>/Gain' incorporates:
   *  Sum: '<S56>/Sum'
   */
  rtb_VectorConcatenate[6] = (rtb_VectorConcatenate_tmp_1 -
    rtb_VectorConcatenate_tmp_2) * controller13_P.Gain_Gain_e;

  /* Gain: '<S59>/Gain' incorporates:
   *  Product: '<S61>/Product2'
   *  Sum: '<S59>/Sum'
   */
  rtb_VectorConcatenate[7] = (rtb_ixk + rtb_VectorConcatenate_tmp_tmp_1) *
    controller13_P.Gain_Gain_eu;

  /* Sum: '<S62>/Sum' incorporates:
   *  Product: '<S54>/Product'
   *  Product: '<S54>/Product1'
   */
  rtb_VectorConcatenate[8] = (rtb_sincos_o1_0 - rtb_VectorConcatenate_tmp_tmp) +
    rtb_VectorConcatenate_tmp_tmp_0;
  for (ibtile = 0; ibtile < 3; ibtile++) {
    /* Math: '<S2>/Transpose' incorporates:
     *  Concatenate: '<S63>/Vector Concatenate'
     *  Math: '<S40>/Transpose'
     */
    Transpose_tmp[3 * ibtile] = rtb_VectorConcatenate[ibtile];
    Transpose_tmp[3 * ibtile + 1] = rtb_VectorConcatenate[ibtile + 3];
    Transpose_tmp[3 * ibtile + 2] = rtb_VectorConcatenate[ibtile + 6];
  }

  /* Math: '<S2>/Transpose' */
  memcpy(&controller13_B.Transpose[0], &Transpose_tmp[0], 9U * sizeof(real_T));

  /* MATLABSystem: '<S2>/Coordinate Transformation Conversion1' incorporates:
   *  Math: '<S2>/Transpose'
   */
  rtb_ixj = controller13_B.Transpose[8] * controller13_B.Transpose[8] +
    controller13_B.Transpose[7] * controller13_B.Transpose[7];
  singular = (rtb_ixj < 2.2204460492503131E-15);
  rtb_ixj = sqrt(rtb_ixj);
  rtb_sincos_o1[0] = rt_atan2d_snf(controller13_B.Transpose[3],
    controller13_B.Transpose[0]);
  rtb_sincos_o1[1] = rt_atan2d_snf(-controller13_B.Transpose[6], rtb_ixj);
  rtb_sincos_o1[2] = rt_atan2d_snf(controller13_B.Transpose[7],
    controller13_B.Transpose[8]);
  if (singular) {
    idxFillStart = 0;
    for (ibtile = 0; ibtile < 1; ibtile++) {
      idxFillStart++;
    }

    b_size_idx_0 = idxFillStart;
    idxFillStart = 0;
    csz_idx_2 = 0;
    for (ibtile = 0; ibtile < 1; ibtile++) {
      csz_idx_2 = idxFillStart + 1;
      idxFillStart++;
    }

    if (csz_idx_2 - 1 >= 0) {
      y_data = -controller13_B.Transpose[1];
    }

    idxFillStart = 0;
    for (ibtile = 0; ibtile < 1; ibtile++) {
      idxFillStart++;
    }

    if (csz_idx_2 <= idxFillStart) {
    } else {
      csz_idx_2 = 0;
    }

    if (csz_idx_2 - 1 >= 0) {
      varargin_1_data = rt_atan2d_snf(y_data, controller13_B.Transpose[4]);
    }

    idxFillStart = 0;
    for (ibtile = 0; ibtile < 1; ibtile++) {
      idxFillStart++;
    }

    y_size[0] = 1;
    y_size[1] = 1;
    y_size[2] = idxFillStart;
    if (idxFillStart - 1 >= 0) {
      y_data = -controller13_B.Transpose[6];
    }

    if (b_size_idx_0 == idxFillStart) {
      varargin_2_size[2] = idxFillStart;
      if (idxFillStart - 1 >= 0) {
        varargin_2_data = rt_atan2d_snf(y_data, rtb_ixj);
      }
    } else {
      rtb_ixj_size[0] = 1;
      rtb_ixj_size[1] = 1;
      rtb_ixj_size[2] = b_size_idx_0;
      if (b_size_idx_0 - 1 >= 0) {
        rtb_ixj_data = rtb_ixj;
      }

      controller13_expand_atan2_m(&y_data, y_size, &rtb_ixj_data, rtb_ixj_size,
        &varargin_2_data, varargin_2_size);
    }

    if (csz_idx_2 - 1 >= 0) {
      rtb_sincos_o1[0] = varargin_1_data;
    }

    if (varargin_2_size[2] - 1 >= 0) {
      rtb_sincos_o1[1] = varargin_2_data;
    }

    rtb_sincos_o1[2] = 0.0;
  }

  rtb_sincos_o1[0] = -rtb_sincos_o1[0];
  rtb_sincos_o1[1] = -rtb_sincos_o1[1];
  rtb_sincos_o1[2] = -rtb_sincos_o1[2];

  /* MATLABSystem: '<S2>/Coordinate Transformation Conversion1' */
  controller13_B.rotm[0] = rtb_sincos_o1[2];
  controller13_B.rotm[1] = rtb_sincos_o1[1];
  controller13_B.rotm[2] = rtb_sincos_o1[0];

  /* ZeroOrderHold: '<S2>/Zero-Order Hold6' */
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* ZeroOrderHold: '<S2>/Zero-Order Hold6' incorporates:
     *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
     */
    controller13_B.Eul_XYZ_j[0] = controller13_B.rotm[0];

    /* Switch: '<Root>/Switch' incorporates:
     *  Constant: '<Root>/Constant'
     */
    if (controller13_P.rsim.en > controller13_P.Switch_Threshold) {
      /* Switch: '<Root>/Switch' incorporates:
       *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
       */
      controller13_B.Switch[0] = controller13_B.Eul_XYZ[0];
      controller13_B.Switch[3] = controller13_B.rotm[0];
    } else {
      /* Switch: '<Root>/Switch' */
      controller13_B.Switch[0] = 0.0;
      controller13_B.Switch[3] = 0.0;
    }

    /* ZeroOrderHold: '<S2>/Zero-Order Hold6' incorporates:
     *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
     */
    controller13_B.Eul_XYZ_j[1] = controller13_B.rotm[1];

    /* Switch: '<Root>/Switch' incorporates:
     *  Constant: '<Root>/Constant'
     */
    if (controller13_P.rsim.en > controller13_P.Switch_Threshold) {
      /* Switch: '<Root>/Switch' incorporates:
       *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
       */
      controller13_B.Switch[1] = controller13_B.Eul_XYZ[1];
      controller13_B.Switch[4] = controller13_B.rotm[1];
    } else {
      /* Switch: '<Root>/Switch' */
      controller13_B.Switch[1] = 0.0;
      controller13_B.Switch[4] = 0.0;
    }

    /* ZeroOrderHold: '<S2>/Zero-Order Hold6' incorporates:
     *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
     */
    controller13_B.Eul_XYZ_j[2] = controller13_B.rotm[2];

    /* Switch: '<Root>/Switch' incorporates:
     *  Constant: '<Root>/Constant'
     */
    if (controller13_P.rsim.en > controller13_P.Switch_Threshold) {
      /* Switch: '<Root>/Switch' incorporates:
       *  MATLABSystem: '<S2>/Coordinate Transformation Conversion1'
       */
      controller13_B.Switch[2] = controller13_B.Eul_XYZ[2];
      controller13_B.Switch[5] = controller13_B.rotm[2];
    } else {
      /* Switch: '<Root>/Switch' */
      controller13_B.Switch[2] = 0.0;
      controller13_B.Switch[5] = 0.0;
    }

    /* Sum: '<S3>/ ' incorporates:
     *  Constant: '<S3>/x_offset'
     */
    controller13_B.u = controller13_B.Switch[3] - controller13_P.x_offset_Value;

    /* Sum: '<S3>/  ' incorporates:
     *  Constant: '<S3>/y_offset'
     */
    controller13_B.u_g = controller13_B.Switch[4] -
      controller13_P.y_offset_Value;
  }

  /* End of ZeroOrderHold: '<S2>/Zero-Order Hold6' */
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* MATLAB Function: '<S22>/Rotation Matrix' incorporates:
     *  MATLAB Function: '<S20>/eul to rotation matrix'
     *  ZeroOrderHold: '<Root>/Zero-Order Hold1'
     */
    controller13_DW.sfEvent_ks = controller13_CALL_EVENT_l;
    K12 = cos(controller13_B.u_g);
    K13 = sin(controller13_B.Switch[5]);
    K14 = cos(controller13_B.Switch[5]);
    K23 = cos(controller13_B.u);
    rtb_ixj = sin(controller13_B.u);
    rtb_sincos_o1_0 = sin(controller13_B.u_g);
    controller13_B.R_a[0] = K12 * K14;
    controller13_B.R_a[1] = -K12 * K13;
    controller13_B.R_a[2] = rtb_sincos_o1_0;
    controller13_B.R_a[3] = rtb_ixj * rtb_sincos_o1_0 * K14 + K23 * K13;
    controller13_B.R_a[4] = K23 * K14 - sin(controller13_B.u) * sin
      (controller13_B.u_g) * K13;
    controller13_B.R_a[5] = -rtb_ixj * K12;
    controller13_B.R_a[6] = rtb_ixj * K13 - K23 * rtb_sincos_o1_0 * K14;
    rtb_kxj = cos(controller13_B.u);
    controller13_B.R_a[7] = rtb_kxj * rtb_sincos_o1_0 * K13 + rtb_ixj * K14;
    controller13_B.R_a[8] = K23 * K12;

    /* MATLAB Function: '<S20>/eul to rotation matrix' */
    controller13_DW.sfEvent_d = controller13_CALL_EVENT_l;

    /* MATLAB Function: '<S29>/R_flat to quat' */
    controller13_DW.sfEvent_kk = controller13_CALL_EVENT_l;

    /* MATLAB Function: '<S20>/eul to rotation matrix' incorporates:
     *  ZeroOrderHold: '<Root>/Zero-Order Hold1'
     */
    K13 = cos(controller13_B.Switch[5]);
    K12 = cos(controller13_B.u_g);

    /* MATLAB Function: '<S29>/R_flat to quat' incorporates:
     *  MATLAB Function: '<S20>/eul to rotation matrix'
     */
    R[0] = K12 * K13;

    /* MATLAB Function: '<S20>/eul to rotation matrix' incorporates:
     *  ZeroOrderHold: '<Root>/Zero-Order Hold1'
     */
    K14 = sin(controller13_B.u);
    K23 = sin(controller13_B.Switch[5]);
    rtb_ixj = sin(controller13_B.u_g);
    rtb_ixk = K14 * rtb_ixj;

    /* MATLAB Function: '<S29>/R_flat to quat' incorporates:
     *  MATLAB Function: '<S20>/eul to rotation matrix'
     */
    R[1] = rtb_ixk * K13 + rtb_kxj * K23;

    /* MATLAB Function: '<S20>/eul to rotation matrix' */
    rtb_ixj *= rtb_kxj;

    /* MATLAB Function: '<S29>/R_flat to quat' incorporates:
     *  MATLAB Function: '<S20>/eul to rotation matrix'
     *  MATLAB Function: '<S22>/Rotation Matrix'
     */
    R[2] = K14 * K23 - rtb_ixj * K13;
    R[3] = -K12 * K23;
    R[4] = rtb_kxj * K13 - rtb_ixk * K23;
    R[5] = rtb_ixj * K23 + K14 * K13;
    R[7] = -K14 * K12;
    R[8] = rtb_kxj * K12;
    K12 = R[1] + R[3];
    K13 = R[2] + rtb_sincos_o1_0;
    K14 = R[5] - R[7];
    K23 = R[5] + R[7];
    rtb_ixj = rtb_sincos_o1_0 - R[2];
    rtb_kxj = R[1] - R[3];
    R_0[0] = ((R[0] - R[4]) - R[8]) / 3.0;
    R_0[4] = K12 / 3.0;
    R_0[8] = K13 / 3.0;
    R_0[12] = K14 / 3.0;
    R_0[1] = K12 / 3.0;
    R_0[5] = ((R[4] - R[0]) - R[8]) / 3.0;
    R_0[9] = K23 / 3.0;
    R_0[13] = rtb_ixj / 3.0;
    R_0[2] = K13 / 3.0;
    R_0[6] = K23 / 3.0;
    R_0[10] = ((R[8] - R[0]) - R[4]) / 3.0;
    R_0[14] = rtb_kxj / 3.0;
    R_0[3] = K14 / 3.0;
    R_0[7] = rtb_ixj / 3.0;
    R_0[11] = rtb_kxj / 3.0;
    R_0[15] = ((R[0] + R[4]) + R[8]) / 3.0;
    controller13_eig(R_0, eigVec, eigVal);
    next_q_mean[0] = eigVal[0].re;
    next_q_mean[1] = eigVal[1].re;
    next_q_mean[2] = eigVal[2].re;
    next_q_mean[3] = eigVal[3].re;
    if (!rtIsNaN(eigVal[0].re)) {
      ibtile = 0;
    } else {
      ibtile = -1;
      idxFillStart = 2;
      exitg1 = false;
      while ((!exitg1) && (idxFillStart < 5)) {
        if (!rtIsNaN(next_q_mean[idxFillStart - 1])) {
          ibtile = idxFillStart - 1;
          exitg1 = true;
        } else {
          idxFillStart++;
        }
      }
    }

    if (ibtile + 1 == 0) {
      idxFillStart = 0;
    } else {
      K12 = next_q_mean[ibtile];
      idxFillStart = ibtile;
      for (csz_idx_2 = ibtile + 2; csz_idx_2 < 5; csz_idx_2++) {
        K14 = next_q_mean[csz_idx_2 - 1];
        if (K12 < K14) {
          K12 = K14;
          idxFillStart = csz_idx_2 - 1;
        }
      }
    }

    ibtile = idxFillStart << 2;
    K13 = eigVec[ibtile + 3].re;
    K12 = eigVec[ibtile].re;
    K14 = eigVec[ibtile + 1].re;
    K23 = eigVec[ibtile + 2].re;
    if (K13 < 0.0) {
      K13 = -K13;
      K12 = -K12;
      K14 = -K14;
      K23 = -K23;
    }

    /* MATLAB Function: '<S29>/pack measurement vector' incorporates:
     *  ZeroOrderHold: '<Root>/Zero-Order Hold'
     */
    controller13_DW.sfEvent_hd = controller13_CALL_EVENT_l;
    controller13_B.z_raw[0] = controller13_B.Switch[0];
    controller13_B.z_raw[1] = controller13_B.Switch[1];
    controller13_B.z_raw[2] = controller13_B.Switch[2];
    controller13_B.z_raw[3] = K13;
    controller13_B.z_raw[4] = K12;
    controller13_B.z_raw[5] = K14;
    controller13_B.z_raw[6] = K23;
    for (ibtile = 0; ibtile < 6; ibtile++) {
      controller13_B.z_raw[ibtile + 7] = 0.0;
    }

    /* End of MATLAB Function: '<S29>/pack measurement vector' */

    /* DiscreteTransferFcn: '<S12>/low pass' */
    csz_idx_2 = 0;

    /* Switch: '<S1>/Switch' incorporates:
     *  Constant: '<S1>/Constant1'
     *  Delay: '<S1>/Delay'
     *  DiscreteIntegrator: '<S14>/time'
     *  Switch: '<S1>/Switch1'
     */
    if (controller13_DW.time_DSTATE > controller13_P.mdl.i_delay + 0.08) {
      rtb_sincos_o1_0 = controller13_DW.Delay_DSTATE;

      /* Switch: '<S1>/Switch1' incorporates:
       *  Delay: '<S1>/Delay'
       *  Delay: '<S1>/Delay1'
       */
      K12 = controller13_DW.Delay1_DSTATE_l;
    } else {
      rtb_sincos_o1_0 = controller13_P.mdl.g * controller13_P.rbt.m;

      /* Switch: '<S1>/Switch1' incorporates:
       *  Constant: '<S1>/Constant'
       *  Constant: '<S1>/Constant1'
       */
      K12 = controller13_P.Constant_Value_mk;
    }

    /* DiscreteTransferFcn: '<S12>/low pass' incorporates:
     *  Switch: '<S1>/Switch'
     */
    controller13_DW.lowpass_tmp = ((rtb_sincos_o1_0 -
      controller13_DW.lowpass_states[0] * controller13_P.ctr.ukf_act_delay.den[1])
      - controller13_DW.lowpass_states[1] *
      controller13_P.ctr.ukf_act_delay.den[2]) /
      controller13_P.ctr.ukf_act_delay.den[0];

    /* DiscreteTransferFcn: '<S12>/low pass' */
    controller13_B.lowpass = (controller13_P.ctr.ukf_act_delay.num[0] *
      controller13_DW.lowpass_tmp + controller13_DW.lowpass_states[0] *
      controller13_P.ctr.ukf_act_delay.num[1]) + controller13_DW.lowpass_states
      [1] * controller13_P.ctr.ukf_act_delay.num[2];

    /* DiscreteTransferFcn: '<S12>/low pass1' */
    controller13_DW.lowpass1_tmp = ((K12 - controller13_DW.lowpass1_states[0] *
      controller13_P.ctr.ukf_act_delay.den[1]) -
      controller13_DW.lowpass1_states[1] * controller13_P.ctr.ukf_act_delay.den
      [2]) / controller13_P.ctr.ukf_act_delay.den[0];

    /* DiscreteTransferFcn: '<S12>/low pass1' */
    controller13_B.lowpass1 = (controller13_P.ctr.ukf_act_delay.num[0] *
      controller13_DW.lowpass1_tmp + controller13_DW.lowpass1_states[0] *
      controller13_P.ctr.ukf_act_delay.num[1]) +
      controller13_DW.lowpass1_states[1] * controller13_P.ctr.ukf_act_delay.num
      [2];

    /* Switch: '<S1>/Switch2' incorporates:
     *  DiscreteIntegrator: '<S14>/time'
     */
    if (controller13_DW.time_DSTATE > controller13_P.mdl.i_delay + 0.08) {
      /* Switch: '<S1>/Switch2' incorporates:
       *  Delay: '<S1>/Delay2'
       */
      K13 = controller13_DW.Delay2_DSTATE_c;
    } else {
      /* Switch: '<S1>/Switch2' incorporates:
       *  Constant: '<S1>/Constant'
       */
      K13 = controller13_P.Constant_Value_mk;
    }

    /* End of Switch: '<S1>/Switch2' */

    /* DiscreteTransferFcn: '<S12>/low pass2' */
    controller13_DW.lowpass2_tmp = ((K13 - controller13_DW.lowpass2_states[0] *
      controller13_P.ctr.ukf_act_delay.den[1]) -
      controller13_DW.lowpass2_states[1] * controller13_P.ctr.ukf_act_delay.den
      [2]) / controller13_P.ctr.ukf_act_delay.den[0];

    /* DiscreteTransferFcn: '<S12>/low pass2' */
    controller13_B.lowpass2 = (controller13_P.ctr.ukf_act_delay.num[0] *
      controller13_DW.lowpass2_tmp + controller13_DW.lowpass2_states[0] *
      controller13_P.ctr.ukf_act_delay.num[1]) +
      controller13_DW.lowpass2_states[1] * controller13_P.ctr.ukf_act_delay.num
      [2];

    /* Delay: '<S32>/Delay' */
    memcpy(&rtb_Delay_h[0], &controller13_DW.Delay_DSTATE_l[0], 324U * sizeof
           (real_T));

    /* MATLAB Function: '<S32>/UKF update then predict' incorporates:
     *  Constant: '<S20>/ukf_prediction_time'
     *  Delay: '<S32>/Delay'
     *  Delay: '<S32>/Delay1'
     *  Delay: '<S32>/Delay3'
     */
    controller13_DW.sfEvent_m = controller13_CALL_EVENT_l;
    memcpy(&z_raw[0], &controller13_B.z_raw[0], 13U * sizeof(real_T));
    memcpy(&rtb_Switch[0], &controller13_DW.Delay1_DSTATE_i[0], 19U * sizeof
           (real_T));
    K14 = controller13_DW.Delay3_DSTATE;
    singular = false;
    b_p = true;
    idxFillStart = 0;
    exitg1 = false;
    while ((!exitg1) && (idxFillStart < 7)) {
      if (!(controller13_B.z_raw[idxFillStart] == x2[idxFillStart])) {
        b_p = false;
        exitg1 = true;
      } else {
        idxFillStart++;
      }
    }

    if (b_p) {
      singular = true;
    }

    singular = !singular;
    b_p = false;
    d_p = true;
    exitg1 = false;
    while ((!exitg1) && (csz_idx_2 < 7)) {
      if (!(controller13_B.z_raw[csz_idx_2] ==
            controller13_DW.Delay2_DSTATE[csz_idx_2])) {
        d_p = false;
        exitg1 = true;
      } else {
        csz_idx_2++;
      }
    }

    if (d_p) {
      b_p = true;
    }

    rtb_sincos_o1_0 = controller13_norm_h(&controller13_B.z_raw[3]);
    next_q_mean[0] = controller13_B.z_raw[3] / rtb_sincos_o1_0;
    next_q_mean[1] = controller13_B.z_raw[4] / rtb_sincos_o1_0;
    next_q_mean[2] = controller13_B.z_raw[5] / rtb_sincos_o1_0;
    next_q_mean[3] = controller13_B.z_raw[6] / rtb_sincos_o1_0;
    if (controller13_B.z_raw[3] < 0.0) {
      next_q_mean[0] = -next_q_mean[0];
      next_q_mean[1] = -next_q_mean[1];
      next_q_mean[2] = -next_q_mean[2];
      next_q_mean[3] = -next_q_mean[3];
    }

    z_raw[3] = next_q_mean[0];
    z_raw[4] = next_q_mean[1];
    z_raw[5] = next_q_mean[2];
    z_raw[6] = next_q_mean[3];
    memcpy(&s_si[0], &z_raw[0], 13U * sizeof(real_T));
    for (ibtile = 0; ibtile < 6; ibtile++) {
      s_si[ibtile + 13] = 0.0;
    }

    memcpy(&fake_s_raw_bee[0], &s_si[0], 19U * sizeof(real_T));
    fake_s_raw_bee[0] = s_si[0] * 10.0;
    fake_s_raw_bee[7] = s_si[7] * 10.0;
    fake_s_raw_bee[13] = s_si[13] * 10000.0;
    fake_s_raw_bee[16] = s_si[16] * 100000.0;
    fake_s_raw_bee[1] = s_si[1] * 10.0;
    fake_s_raw_bee[8] = s_si[8] * 10.0;
    fake_s_raw_bee[14] = s_si[14] * 10000.0;
    fake_s_raw_bee[17] = s_si[17] * 100000.0;
    fake_s_raw_bee[2] = s_si[2] * 10.0;
    fake_s_raw_bee[9] = s_si[9] * 10.0;
    fake_s_raw_bee[15] = s_si[15] * 10000.0;
    fake_s_raw_bee[18] = s_si[18] * 100000.0;
    guard1 = false;
    if (controller13_DW.Delay3_DSTATE == 0.0) {
      if (singular) {
        for (ibtile = 0; ibtile < 7; ibtile++) {
          rtb_Switch[ibtile] = fake_s_raw_bee[ibtile];
        }

        K14 = 1.0;
        guard1 = true;
      } else {
        memcpy(&controller13_B.s_out[0], &controller13_DW.Delay1_DSTATE_i[0],
               19U * sizeof(real_T));
        memcpy(&controller13_B.P_out_flat[0], &controller13_DW.Delay_DSTATE_l[0],
               324U * sizeof(real_T));
        controller13_B.is_init_out = controller13_DW.Delay3_DSTATE;
        memcpy(&controller13_B.s_prediction_out[0],
               &controller13_DW.Delay1_DSTATE_i[0], 19U * sizeof(real_T));
        controller13_B.md = -1.0;
      }
    } else {
      guard1 = true;
    }

    if (guard1) {
      K23 = controller13_B.lowpass * 10000.0;
      rtb_kxj = controller13_B.lowpass1 * 100000.0;
      rtb_ixk = controller13_B.lowpass2 * 100000.0;
      next_s_dp[0] = rtb_Switch[0];
      next_s_dp[3] = 0.0;
      next_s_dp[1] = rtb_Switch[1];
      next_s_dp[4] = 0.0;
      next_s_dp[2] = rtb_Switch[2];
      next_s_dp[5] = 0.0;
      memcpy(&next_s_dp[6], &rtb_Switch[7], 12U * sizeof(real_T));
      for (ibtile = 0; ibtile < 18; ibtile++) {
        for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
          m[idxFillStart + 18 * ibtile] = controller13_DW.Delay_DSTATE_l[18 *
            idxFillStart + ibtile] * 20.0;
        }
      }

      controller13_chol(m);
      for (ibtile = 0; ibtile < 18; ibtile++) {
        for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
          residuals_i_tmp[idxFillStart + 18 * ibtile] = m[18 * idxFillStart +
            ibtile];
        }
      }

      for (idxFillStart = 0; idxFillStart < 37; idxFillStart++) {
        memcpy(&b_b[idxFillStart * 18], &next_s_dp[0], 18U * sizeof(real_T));
      }

      for (ibtile = 0; ibtile < 18; ibtile++) {
        s_dp_sigma_points[ibtile] = b_b[ibtile];
        for (idxFillStart = 0; idxFillStart <= 16; idxFillStart += 2) {
          csz_idx_2 = (ibtile + 1) * 18 + idxFillStart;
          tmp_4 = _mm_loadu_pd(&b_b[csz_idx_2]);
          tmp_5 = _mm_loadu_pd(&residuals_i_tmp[18 * ibtile + idxFillStart]);
          _mm_storeu_pd(&s_dp_sigma_points[csz_idx_2], _mm_add_pd(tmp_4, tmp_5));
          csz_idx_2 = (ibtile + 19) * 18 + idxFillStart;
          tmp_4 = _mm_loadu_pd(&b_b[csz_idx_2]);
          _mm_storeu_pd(&s_dp_sigma_points[csz_idx_2], _mm_sub_pd(tmp_4, tmp_5));
        }
      }

      next_q_mean[0] = 1.0;
      next_q_mean[1] = 0.0;
      next_q_mean[2] = 0.0;
      next_q_mean[3] = 0.0;
      for (idxFillStart = 0; idxFillStart < 37; idxFillStart++) {
        controller13_UKF_dp_to_q(&(*(real_T (*)[18])&s_dp_sigma_points[18 *
          idxFillStart])[3], &rtb_Switch[3], q_sigma_i);
        ibtile = 18 * idxFillStart + 12;
        rtb_sincos_o2[0] = s_dp_sigma_points[ibtile];
        csz_idx_2 = 18 * idxFillStart + 15;
        iy[0] = s_dp_sigma_points[csz_idx_2];
        b_size_idx_0 = 18 * idxFillStart + 13;
        rtb_sincos_o2[1] = s_dp_sigma_points[b_size_idx_0];
        iy_tmp = 18 * idxFillStart + 16;
        iy[1] = s_dp_sigma_points[iy_tmp];
        rtb_sincos_o2_tmp = 18 * idxFillStart + 14;
        rtb_sincos_o2[2] = s_dp_sigma_points[rtb_sincos_o2_tmp];
        iy_tmp_0 = 18 * idxFillStart + 17;
        iy[2] = s_dp_sigma_points[iy_tmp_0];
        controller13_Dynamics_step(&(*(real_T (*)[18])&s_dp_sigma_points[18 *
          idxFillStart])[0], &(*(real_T (*)[18])&s_dp_sigma_points[18 *
          idxFillStart])[6], q_sigma_i, &(*(real_T (*)[18])&s_dp_sigma_points[18
          * idxFillStart])[9], K23, rtb_kxj, rtb_ixk, rtb_sincos_o2, iy, f_J,
          next_p_sigma_i, next_p_dot_sigma_i, x_hat_pred, next_omega_sigma_i);
        if (idxFillStart + 1 == 1) {
          next_q_mean[0] = x_hat_pred[0];
          next_q_mean[1] = x_hat_pred[1];
          next_q_mean[2] = x_hat_pred[2];
          next_q_mean[3] = x_hat_pred[3];
        }

        controller13_UKF_q_to_dp(x_hat_pred, next_q_mean, rtb_sincos_o1);
        next_s_dp_sigma_points[18 * idxFillStart] = next_p_sigma_i[0];
        next_s_dp_sigma_points[18 * idxFillStart + 3] = rtb_sincos_o1[0];
        next_s_dp_sigma_points[18 * idxFillStart + 6] = next_p_dot_sigma_i[0];
        next_s_dp_sigma_points[18 * idxFillStart + 9] = next_omega_sigma_i[0];
        next_s_dp_sigma_points[ibtile] = rtb_sincos_o2[0];
        next_s_dp_sigma_points[csz_idx_2] = iy[0];
        next_s_dp_sigma_points[18 * idxFillStart + 1] = next_p_sigma_i[1];
        next_s_dp_sigma_points[18 * idxFillStart + 4] = rtb_sincos_o1[1];
        next_s_dp_sigma_points[18 * idxFillStart + 7] = next_p_dot_sigma_i[1];
        next_s_dp_sigma_points[18 * idxFillStart + 10] = next_omega_sigma_i[1];
        next_s_dp_sigma_points[b_size_idx_0] = rtb_sincos_o2[1];
        next_s_dp_sigma_points[iy_tmp] = iy[1];
        next_s_dp_sigma_points[18 * idxFillStart + 2] = next_p_sigma_i[2];
        next_s_dp_sigma_points[18 * idxFillStart + 5] = rtb_sincos_o1[2];
        next_s_dp_sigma_points[18 * idxFillStart + 8] = next_p_dot_sigma_i[2];
        next_s_dp_sigma_points[18 * idxFillStart + 11] = next_omega_sigma_i[2];
        next_s_dp_sigma_points[rtb_sincos_o2_tmp] = rtb_sincos_o2[2];
        next_s_dp_sigma_points[iy_tmp_0] = iy[2];
      }

      for (ibtile = 0; ibtile < 18; ibtile++) {
        rtb_sincos_o1_0 = 0.0;
        for (idxFillStart = 0; idxFillStart < 37; idxFillStart++) {
          rtb_sincos_o1_0 += next_s_dp_sigma_points[18 * idxFillStart + ibtile] *
            c_b[idxFillStart];
        }

        next_s_dp[ibtile] = rtb_sincos_o1_0;
      }

      controller13_UKF_dp_to_q(&next_s_dp[3], next_q_mean, q_sigma_i);
      controller13_B.s_out[0] = next_s_dp[0];
      controller13_B.s_out[1] = next_s_dp[1];
      controller13_B.s_out[2] = next_s_dp[2];
      controller13_B.s_out[3] = q_sigma_i[0];
      controller13_B.s_out[4] = q_sigma_i[1];
      controller13_B.s_out[5] = q_sigma_i[2];
      controller13_B.s_out[6] = q_sigma_i[3];
      memcpy(&controller13_B.s_out[7], &next_s_dp[6], 12U * sizeof(real_T));
      for (idxFillStart = 0; idxFillStart < 37; idxFillStart++) {
        memcpy(&b_b[idxFillStart * 18], &next_s_dp[0], 18U * sizeof(real_T));
      }

      for (ibtile = 0; ibtile <= 664; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&next_s_dp_sigma_points[ibtile]);
        tmp_5 = _mm_loadu_pd(&b_b[ibtile]);
        _mm_storeu_pd(&next_s_dp_sigma_points[ibtile], _mm_sub_pd(tmp_4, tmp_5));
      }

      for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
        for (csz_idx_2 = 0; csz_idx_2 < 37; csz_idx_2++) {
          b_b[csz_idx_2 + 37 * idxFillStart] = next_s_dp_sigma_points[18 *
            csz_idx_2 + idxFillStart] * c_b[csz_idx_2];
        }
      }

      for (ibtile = 0; ibtile < 18; ibtile++) {
        for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
          rtb_sincos_o1_0 = 0.0;
          for (csz_idx_2 = 0; csz_idx_2 < 37; csz_idx_2++) {
            rtb_sincos_o1_0 += next_s_dp_sigma_points[18 * csz_idx_2 + ibtile] *
              b_b[37 * idxFillStart + csz_idx_2];
          }

          csz_idx_2 = 18 * idxFillStart + ibtile;
          residuals_i_tmp[csz_idx_2] = g[csz_idx_2] + rtb_sincos_o1_0;
        }
      }

      memcpy(&m[0], &residuals_i_tmp[0], 324U * sizeof(real_T));
      controller13_UKF_q_to_dp(&controller13_B.s_out[3], &z_raw[3],
        rtb_sincos_o1);
      z_error[0] = controller13_B.s_out[0] - z_raw[0];
      z_error[3] = rtb_sincos_o1[0];
      z_error[1] = controller13_B.s_out[1] - z_raw[1];
      z_error[4] = rtb_sincos_o1[1];
      z_error[2] = controller13_B.s_out[2] - z_raw[2];
      z_error[5] = rtb_sincos_o1[2];
      for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
        x_hat_next[idxFillStart] = 1.0 / residuals_i_tmp[18 * idxFillStart +
          idxFillStart];
      }

      memset(&b_y[0], 0, 36U * sizeof(real_T));
      for (ibtile = 0; ibtile < 6; ibtile++) {
        b_y[ibtile + 6 * ibtile] = x_hat_next[ibtile];
      }

      rtb_sincos_o1_0 = 0.0;
      for (ibtile = 0; ibtile < 6; ibtile++) {
        rtb_ixj = 0.0;
        for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
          rtb_ixj += b_y[6 * ibtile + idxFillStart] * z_error[idxFillStart];
        }

        rtb_sincos_o1_0 += rtb_ixj * z_error[ibtile];
      }

      controller13_B.md = sqrt(rtb_sincos_o1_0);
      if (singular && (!b_p)) {
        q_sigma_i[0] = fake_s_raw_bee[3];
        q_sigma_i[1] = fake_s_raw_bee[4];
        q_sigma_i[2] = fake_s_raw_bee[5];
        q_sigma_i[3] = fake_s_raw_bee[6];
        rtb_ixj = fabs(controller13_norm_h(q_sigma_i) - 1.0);
        if (rtb_ixj >= 1.0E-9) {
          printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
          fflush(stdout);
        }

        if (fake_s_raw_bee[3] < 0.0) {
          printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
          fflush(stdout);
        }

        for (ibtile = 0; ibtile < 108; ibtile++) {
          K[ibtile] = e[ibtile];
          K_tmp[ibtile] = d[ibtile];
        }

        for (ibtile = 0; ibtile < 18; ibtile++) {
          for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 18; csz_idx_2++) {
              rtb_sincos_o1_0 += (real_T)K_tmp[6 * csz_idx_2 + idxFillStart] *
                residuals_i_tmp[18 * ibtile + csz_idx_2];
            }

            K_tmp_0[idxFillStart + 6 * ibtile] = rtb_sincos_o1_0;
          }
        }

        for (ibtile = 0; ibtile < 6; ibtile++) {
          for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 18; csz_idx_2++) {
              rtb_sincos_o1_0 += residuals_i_tmp[18 * csz_idx_2 + idxFillStart] *
                K[18 * ibtile + csz_idx_2];
            }

            residuals_i_tmp_0[idxFillStart + 18 * ibtile] = rtb_sincos_o1_0;
          }

          for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 18; csz_idx_2++) {
              rtb_sincos_o1_0 += K_tmp_0[6 * csz_idx_2 + ibtile] * K[18 *
                idxFillStart + csz_idx_2];
            }

            csz_idx_2 = 6 * idxFillStart + ibtile;
            b_y[csz_idx_2] = c[csz_idx_2] + rtb_sincos_o1_0;
          }
        }

        controller13_mrdiv(residuals_i_tmp_0, b_y, K);
        q_sigma_i[0] = fake_s_raw_bee[3];
        q_sigma_i[1] = fake_s_raw_bee[4];
        q_sigma_i[2] = fake_s_raw_bee[5];
        q_sigma_i[3] = fake_s_raw_bee[6];
        controller13_UKF_q_to_dp(q_sigma_i, &controller13_B.s_out[3],
          rtb_sincos_o1);
        if (rtb_ixj >= 1.0E-9) {
          printf("%s\n", "[UKF] WARNING: QUATERNION NOT NORMALIZED");
          fflush(stdout);
        }

        if (fake_s_raw_bee[3] < 0.0) {
          printf("%s\n", "[UKF] WARNING: QUATERNION HAS NEGATIVE SCALAR");
          fflush(stdout);
        }

        s_dp[0] = controller13_B.s_out[0];
        s_dp[3] = 0.0;
        s_dp[1] = controller13_B.s_out[1];
        s_dp[4] = 0.0;
        s_dp[2] = controller13_B.s_out[2];
        s_dp[5] = 0.0;
        memcpy(&s_dp[6], &controller13_B.s_out[7], 12U * sizeof(real_T));
        z_error[0] = fake_s_raw_bee[0];
        z_error[3] = rtb_sincos_o1[0];
        z_error[1] = fake_s_raw_bee[1];
        z_error[4] = rtb_sincos_o1[1];
        z_error[2] = fake_s_raw_bee[2];
        z_error[5] = rtb_sincos_o1[2];
        for (ibtile = 0; ibtile < 6; ibtile++) {
          rtb_sincos_o1_0 = 0.0;
          for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
            rtb_sincos_o1_0 += (real_T)K_tmp[6 * idxFillStart + ibtile] *
              s_dp[idxFillStart];
          }

          x_hat_next[ibtile] = z_error[ibtile] - rtb_sincos_o1_0;
        }

        for (ibtile = 0; ibtile < 18; ibtile++) {
          rtb_sincos_o1_0 = 0.0;
          for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
            rtb_sincos_o1_0 += K[18 * idxFillStart + ibtile] *
              x_hat_next[idxFillStart];
          }

          next_s_dp[ibtile] = s_dp[ibtile] + rtb_sincos_o1_0;
        }

        controller13_UKF_dp_to_q(&next_s_dp[3], &controller13_B.s_out[3],
          next_q_mean);
        controller13_B.s_out[0] = next_s_dp[0];
        controller13_B.s_out[1] = next_s_dp[1];
        controller13_B.s_out[2] = next_s_dp[2];
        controller13_B.s_out[3] = next_q_mean[0];
        controller13_B.s_out[4] = next_q_mean[1];
        controller13_B.s_out[5] = next_q_mean[2];
        controller13_B.s_out[6] = next_q_mean[3];
        memcpy(&controller13_B.s_out[7], &next_s_dp[6], 12U * sizeof(real_T));
        memset(&m[0], 0, 324U * sizeof(real_T));
        for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
          m[idxFillStart + 18 * idxFillStart] = 1.0;
        }

        for (ibtile = 0; ibtile < 18; ibtile++) {
          for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 6; csz_idx_2++) {
              rtb_sincos_o1_0 += K[18 * csz_idx_2 + ibtile] * (real_T)K_tmp[6 *
                idxFillStart + csz_idx_2];
            }

            b_size_idx_0 = 18 * idxFillStart + ibtile;
            I_minus_K_H[b_size_idx_0] = m[b_size_idx_0] - rtb_sincos_o1_0;
          }

          for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 18; csz_idx_2++) {
              rtb_sincos_o1_0 += I_minus_K_H[18 * csz_idx_2 + ibtile] *
                residuals_i_tmp[18 * idxFillStart + csz_idx_2];
            }

            I_minus_K_H_0[ibtile + 18 * idxFillStart] = rtb_sincos_o1_0;
          }

          for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 6; csz_idx_2++) {
              rtb_sincos_o1_0 += K[18 * csz_idx_2 + ibtile] * c[6 * idxFillStart
                + csz_idx_2];
            }

            K_tmp_0[ibtile + 18 * idxFillStart] = rtb_sincos_o1_0;
          }
        }

        for (ibtile = 0; ibtile < 18; ibtile++) {
          for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 18; csz_idx_2++) {
              rtb_sincos_o1_0 += I_minus_K_H_0[18 * csz_idx_2 + ibtile] *
                I_minus_K_H[18 * csz_idx_2 + idxFillStart];
            }

            b_size_idx_0 = 18 * idxFillStart + ibtile;
            residuals_i_tmp[b_size_idx_0] = rtb_sincos_o1_0;
            rtb_sincos_o1_0 = 0.0;
            for (csz_idx_2 = 0; csz_idx_2 < 6; csz_idx_2++) {
              rtb_sincos_o1_0 += K_tmp_0[18 * csz_idx_2 + ibtile] * K[18 *
                csz_idx_2 + idxFillStart];
            }

            K_0[b_size_idx_0] = rtb_sincos_o1_0;
          }
        }

        for (ibtile = 0; ibtile <= 322; ibtile += 2) {
          tmp_4 = _mm_loadu_pd(&residuals_i_tmp[ibtile]);
          tmp_5 = _mm_loadu_pd(&K_0[ibtile]);
          _mm_storeu_pd(&m[ibtile], _mm_add_pd(tmp_4, tmp_5));
        }
      }

      memcpy(&controller13_B.s_prediction_out[0], &controller13_B.s_out[0], 19U *
             sizeof(real_T));
      idxFillStart = (int32_T)floor(controller13_P.ukf_prediction_time / 0.001);
      for (ibtile = 0; ibtile < idxFillStart; ibtile++) {
        rtb_sincos_o1[0] = controller13_B.s_prediction_out[13];
        rtb_sincos_o2[0] = controller13_B.s_prediction_out[16];
        rtb_sincos_o1[1] = controller13_B.s_prediction_out[14];
        rtb_sincos_o2[1] = controller13_B.s_prediction_out[17];
        rtb_sincos_o1[2] = controller13_B.s_prediction_out[15];
        rtb_sincos_o2[2] = controller13_B.s_prediction_out[18];
        controller13_Dynamics_step(&controller13_B.s_prediction_out[0],
          &controller13_B.s_prediction_out[7], &controller13_B.s_prediction_out
          [3], &controller13_B.s_prediction_out[10], K23, rtb_kxj, rtb_ixk,
          rtb_sincos_o1, rtb_sincos_o2, f_J, iy, next_p_sigma_i, q_sigma_i,
          next_p_dot_sigma_i);
        controller13_B.s_prediction_out[0] = iy[0];
        controller13_B.s_prediction_out[1] = iy[1];
        controller13_B.s_prediction_out[2] = iy[2];
        controller13_B.s_prediction_out[3] = q_sigma_i[0];
        controller13_B.s_prediction_out[4] = q_sigma_i[1];
        controller13_B.s_prediction_out[5] = q_sigma_i[2];
        controller13_B.s_prediction_out[6] = q_sigma_i[3];
        controller13_B.s_prediction_out[7] = next_p_sigma_i[0];
        controller13_B.s_prediction_out[10] = next_p_dot_sigma_i[0];
        controller13_B.s_prediction_out[8] = next_p_sigma_i[1];
        controller13_B.s_prediction_out[11] = next_p_dot_sigma_i[1];
        controller13_B.s_prediction_out[9] = next_p_sigma_i[2];
        controller13_B.s_prediction_out[12] = next_p_dot_sigma_i[2];
      }

      for (ibtile = 0; ibtile < 18; ibtile++) {
        for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
          controller13_B.P_out_flat[idxFillStart + 18 * ibtile] = m[18 *
            idxFillStart + ibtile];
        }
      }

      controller13_B.is_init_out = K14;
    }

    /* End of MATLAB Function: '<S32>/UKF update then predict' */

    /* MATLAB Function: '<S32>/bee units to SI1' */
    controller13_beeunitstoSI(controller13_B.s_prediction_out,
      &controller13_B.sf_beeunitstoSI1, &controller13_DW.sf_beeunitstoSI1);

    /* MATLAB Function: '<S32>/bee units to SI' */
    controller13_beeunitstoSI(controller13_B.s_out,
      &controller13_B.sf_beeunitstoSI, &controller13_DW.sf_beeunitstoSI);

    /* Switch: '<S29>/Switch' incorporates:
     *  Constant: '<S29>/use prediction'
     */
    if (controller13_P.ukf_use_prediction > controller13_P.Switch_Threshold_k) {
      memcpy(&rtb_Switch[0], &controller13_B.sf_beeunitstoSI1.s_si[0], 19U *
             sizeof(real_T));
    } else {
      memcpy(&rtb_Switch[0], &controller13_B.sf_beeunitstoSI.s_si[0], 19U *
             sizeof(real_T));
    }

    /* End of Switch: '<S29>/Switch' */

    /* MATLAB Function: '<S29>/unpack state' */
    controller13_DW.sfEvent_i = controller13_CALL_EVENT_l;
    controller13_B.r[0] = rtb_Switch[0];
    controller13_B.r_dot[0] = rtb_Switch[7];
    controller13_B.omega[0] = rtb_Switch[10];
    controller13_B.F_ext[0] = rtb_Switch[13];
    controller13_B.r[1] = rtb_Switch[1];
    controller13_B.r_dot[1] = rtb_Switch[8];
    controller13_B.omega[1] = rtb_Switch[11];
    controller13_B.F_ext[1] = rtb_Switch[14];
    controller13_B.r[2] = rtb_Switch[2];
    controller13_B.r_dot[2] = rtb_Switch[9];
    controller13_B.omega[2] = rtb_Switch[12];
    controller13_B.F_ext[2] = rtb_Switch[15];

    /* MATLAB Function: '<S29>/quaternion to rotation matrix' incorporates:
     *  MATLAB Function: '<S29>/unpack state'
     */
    controller13_DW.sfEvent_g = controller13_CALL_EVENT_l;
    K14 = 1.0 / sqrt(((rtb_Switch[3] * rtb_Switch[3] + rtb_Switch[4] *
                       rtb_Switch[4]) + rtb_Switch[5] * rtb_Switch[5]) +
                     rtb_Switch[6] * rtb_Switch[6]);
    q_sigma_i[0] = rtb_Switch[3] * K14;
    q_sigma_i[1] = rtb_Switch[4] * K14;
    q_sigma_i[2] = rtb_Switch[5] * K14;
    q_sigma_i[3] = rtb_Switch[6] * K14;
    K14 = q_sigma_i[3] * q_sigma_i[3];
    K23 = q_sigma_i[2] * q_sigma_i[2];
    tempR[0] = 1.0 - (K23 + K14) * 2.0;
    rtb_sincos_o1_0 = q_sigma_i[1] * q_sigma_i[2];
    rtb_kxj = q_sigma_i[0] * q_sigma_i[3];
    tempR[1] = (rtb_sincos_o1_0 - rtb_kxj) * 2.0;
    rtb_ixj = q_sigma_i[1] * q_sigma_i[3];
    rtb_ixk = q_sigma_i[0] * q_sigma_i[2];
    tempR[2] = (rtb_ixj + rtb_ixk) * 2.0;
    tempR[3] = (rtb_sincos_o1_0 + rtb_kxj) * 2.0;
    rtb_sincos_o1_0 = q_sigma_i[1] * q_sigma_i[1];
    tempR[4] = 1.0 - (rtb_sincos_o1_0 + K14) * 2.0;
    K14 = q_sigma_i[2] * q_sigma_i[3];
    rtb_kxj = q_sigma_i[0] * q_sigma_i[1];
    tempR[5] = (K14 - rtb_kxj) * 2.0;
    tempR[6] = (rtb_ixj - rtb_ixk) * 2.0;
    tempR[7] = (K14 + rtb_kxj) * 2.0;
    tempR[8] = 1.0 - (rtb_sincos_o1_0 + K23) * 2.0;
    for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
      ibtile = ((int8_T)(idxFillStart + 1) - 1) * 3;
      R[(int8_T)(idxFillStart + 1) - 1] = tempR[ibtile];
      R[(int8_T)(idxFillStart + 1) + 2] = tempR[ibtile + 1];
      R[(int8_T)(idxFillStart + 1) + 5] = tempR[ibtile + 2];
    }

    for (ibtile = 0; ibtile < 3; ibtile++) {
      controller13_B.R_flat[3 * ibtile] = R[ibtile];
      controller13_B.R_flat[3 * ibtile + 1] = R[ibtile + 3];
      controller13_B.R_flat[3 * ibtile + 2] = R[ibtile + 6];
    }

    /* End of MATLAB Function: '<S29>/quaternion to rotation matrix' */

    /* Switch: '<S12>/Switch4' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch4_Threshold) {
      /* Switch: '<S12>/Switch4' */
      memcpy(&controller13_B.Switch4[0], &controller13_B.R_a[0], 9U * sizeof
             (real_T));
    } else {
      /* Switch: '<S12>/Switch4' */
      memcpy(&controller13_B.Switch4[0], &controller13_B.R_flat[0], 9U * sizeof
             (real_T));
    }

    /* End of Switch: '<S12>/Switch4' */
    for (idxFillStart = 0; idxFillStart < 9; idxFillStart++) {
      /* DiscreteTransferFcn: '<S26>/low pass3' */
      controller13_B.lowpass3[idxFillStart] = controller13_P.mdl.vlp.n *
        controller13_DW.lowpass3_states[idxFillStart];
    }

    /* MATLAB Function: '<S22>/Rotation Matrix1' */
    controller13_DW.sfEvent_mr = controller13_CALL_EVENT_l;
    controller13_B.w[0] = (controller13_B.lowpass3[1] * controller13_B.R_a[2] +
      controller13_B.lowpass3[4] * controller13_B.R_a[5]) +
      controller13_B.lowpass3[7] * controller13_B.R_a[8];
    controller13_B.w[1] = (controller13_B.R_a[0] * controller13_B.lowpass3[2] +
      controller13_B.R_a[3] * controller13_B.lowpass3[5]) + controller13_B.R_a[6]
      * controller13_B.lowpass3[8];
    controller13_B.w[2] = (controller13_B.lowpass3[0] * controller13_B.R_a[1] +
      controller13_B.lowpass3[3] * controller13_B.R_a[4]) +
      controller13_B.lowpass3[6] * controller13_B.R_a[7];

    /* MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' incorporates:
     *  MATLAB Function: '<S9>/Learned RTNMPC'
     */
    controller13_DW.sfEvent_kn = controller13_CALL_EVENT_l;
    tmp[0] = controller13_B.R_a[0];
    tmp[1] = controller13_B.R_a[3];
    tmp[2] = controller13_B.R_a[6];
    tmp[3] = controller13_B.R_a[1];
    tmp[4] = controller13_B.R_a[4];
    tmp[5] = controller13_B.R_a[7];
    tmp[6] = controller13_B.R_a[2];
    tmp[7] = controller13_B.R_a[5];
    tmp[8] = controller13_B.R_a[8];
    iy[0] = 0.0;
    iy[1] = 0.0;
    rtb_sincos_o1_0 = controller13_P.rbt.m * controller13_P.mdl.g;
    iy[2] = rtb_sincos_o1_0;
    for (ibtile = 0; ibtile < 3; ibtile++) {
      /* Switch: '<S12>/Switch5' incorporates:
       *  Constant: '<S12>/Constant'
       */
      if (controller13_P.Constant_Value_e > controller13_P.Switch5_Threshold) {
        /* Switch: '<S12>/Switch5' */
        controller13_B.Switch5[ibtile] = controller13_B.w[ibtile];
      } else {
        /* Switch: '<S12>/Switch5' */
        controller13_B.Switch5[ibtile] = controller13_B.omega[ibtile];
      }

      /* End of Switch: '<S12>/Switch5' */

      /* MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' incorporates:
       *  Delay: '<S23>/Delay'
       *  Delay: '<S23>/Delay1'
       */
      rtb_sincos_o1[ibtile] = (((tmp[ibtile + 3] * 0.0 + tmp[ibtile] * 0.0) +
        tmp[ibtile + 6] * controller13_B.lowpass) - iy[ibtile]) /
        controller13_P.rbt.m;
      x_hat_next[ibtile] = controller13_DW.Delay1_DSTATE_j[ibtile];
      x_hat_next[ibtile + 3] = controller13_DW.Delay_DSTATE_f[ibtile];
    }

    /* MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' incorporates:
     *  ZeroOrderHold: '<Root>/Zero-Order Hold'
     */
    for (ibtile = 0; ibtile < 6; ibtile++) {
      rtb_kxj = 0.0;
      for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
        rtb_kxj += controller13_P.ctr.pos_vel_est.A[6 * idxFillStart + ibtile] *
          x_hat_next[idxFillStart];
      }

      z_error[ibtile] = ((controller13_P.ctr.pos_vel_est.B[ibtile + 6] *
                          rtb_sincos_o1[1] +
                          controller13_P.ctr.pos_vel_est.B[ibtile] *
                          rtb_sincos_o1[0]) +
                         controller13_P.ctr.pos_vel_est.B[ibtile + 12] *
                         rtb_sincos_o1[2]) + rtb_kxj;
    }

    for (ibtile = 0; ibtile < 3; ibtile++) {
      rtb_kxj = 0.0;
      for (idxFillStart = 0; idxFillStart < 6; idxFillStart++) {
        rtb_kxj += controller13_P.ctr.pos_vel_est.C[3 * idxFillStart + ibtile] *
          z_error[idxFillStart];
      }

      iy[ibtile] = controller13_B.Switch[ibtile] - rtb_kxj;
    }

    rtb_kxj = iy[1];
    rtb_ixj = iy[0];
    rtb_ixk = iy[2];
    for (ibtile = 0; ibtile <= 4; ibtile += 2) {
      /* MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
      tmp_4 = _mm_loadu_pd(&z_error[ibtile]);
      _mm_storeu_pd(&x_hat_next[ibtile], _mm_add_pd(_mm_add_pd(_mm_add_pd
        (_mm_mul_pd(_mm_loadu_pd(&controller13_P.ctr.pos_vel_est.L[ibtile + 6]),
                    _mm_set1_pd(rtb_kxj)), _mm_mul_pd(_mm_loadu_pd
        (&controller13_P.ctr.pos_vel_est.L[ibtile]), _mm_set1_pd(rtb_ixj))),
        _mm_mul_pd(_mm_loadu_pd(&controller13_P.ctr.pos_vel_est.L[ibtile + 12]),
                   _mm_set1_pd(rtb_ixk))), tmp_4));
    }

    /* MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' incorporates:
     *  Delay: '<S23>/Delay2'
     *  ZeroOrderHold: '<Root>/Zero-Order Hold'
     */
    controller13_B.pos_hat[0] = x_hat_next[0];
    controller13_B.vel_hat[0] = x_hat_next[3];
    controller13_B.pos_hat[1] = x_hat_next[1];
    controller13_B.vel_hat[1] = x_hat_next[4];
    controller13_B.pos_hat[2] = x_hat_next[2];
    controller13_B.vel_hat[2] = x_hat_next[5];
    if (controller13_DW.Delay2_DSTATE_j < 4.0) {
      controller13_B.pos_hat[0] = controller13_B.Switch[0];
      controller13_B.pos_hat[1] = controller13_B.Switch[1];
      controller13_B.pos_hat[2] = controller13_B.Switch[2];
    }

    controller13_B.id_out = controller13_DW.Delay2_DSTATE_j + 1.0;

    /* MATLAB Function: '<S1>/adaptive setpoint rd' */
    controller13_DW.sfEvent_gr = controller13_CALL_EVENT_l;
    controller13_B.rd[0] = controller13_P.ctr.setpoint.x;
    controller13_B.rd[1] = controller13_P.ctr.setpoint.y;
    controller13_B.rd[2] = controller13_P.ctr.setpoint.z;

    /* Switch: '<S12>/Switch' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch_Threshold_c) {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[0] = controller13_B.pos_hat[0];
    } else {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[0] = controller13_B.r[0];
    }

    /* Switch: '<S12>/Switch1' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch1_Threshold) {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[0] = controller13_B.vel_hat[0];
    } else {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[0] = controller13_B.r_dot[0];
    }

    /* Switch: '<S12>/Switch2' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch2_Threshold) {
      /* Switch: '<S12>/Switch2' */
      controller13_B.Switch2_k[0] = rtb_sincos_o1[0];
    } else {
      /* Switch: '<S12>/Switch2' incorporates:
       *  Constant: '<S20>/Constant'
       */
      controller13_B.Switch2_k[0] = controller13_P.Constant_Value[0];
    }

    /* MATLAB Function: '<S1>/adaptive setpoint rd' */
    controller13_B.rd_d[0] = 0.0;

    /* Switch: '<S12>/Switch' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch_Threshold_c) {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[1] = controller13_B.pos_hat[1];
    } else {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[1] = controller13_B.r[1];
    }

    /* Switch: '<S12>/Switch1' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch1_Threshold) {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[1] = controller13_B.vel_hat[1];
    } else {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[1] = controller13_B.r_dot[1];
    }

    /* Switch: '<S12>/Switch2' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch2_Threshold) {
      /* Switch: '<S12>/Switch2' */
      controller13_B.Switch2_k[1] = rtb_sincos_o1[1];
    } else {
      /* Switch: '<S12>/Switch2' incorporates:
       *  Constant: '<S20>/Constant'
       */
      controller13_B.Switch2_k[1] = controller13_P.Constant_Value[1];
    }

    /* MATLAB Function: '<S1>/adaptive setpoint rd' */
    controller13_B.rd_d[1] = 0.0;

    /* Switch: '<S12>/Switch' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch_Threshold_c) {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[2] = controller13_B.pos_hat[2];
    } else {
      /* Switch: '<S12>/Switch' */
      controller13_B.Switch_fc[2] = controller13_B.r[2];
    }

    /* Switch: '<S12>/Switch1' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch1_Threshold) {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[2] = controller13_B.vel_hat[2];
    } else {
      /* Switch: '<S12>/Switch1' */
      controller13_B.Switch1_g[2] = controller13_B.r_dot[2];
    }

    /* Switch: '<S12>/Switch2' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch2_Threshold) {
      /* Switch: '<S12>/Switch2' */
      controller13_B.Switch2_k[2] = rtb_sincos_o1[2];
    } else {
      /* Switch: '<S12>/Switch2' incorporates:
       *  Constant: '<S20>/Constant'
       */
      controller13_B.Switch2_k[2] = controller13_P.Constant_Value[2];
    }

    /* MATLAB Function: '<S1>/adaptive setpoint rd' incorporates:
     *  DiscreteIntegrator: '<S14>/time'
     */
    controller13_B.rd_d[2] = 0.0;
    if (controller13_DW.time_DSTATE <= controller13_P.mdl.i_delay) {
      controller13_B.rd[0] = controller13_P.ctr.setpoint.x;
      controller13_B.rd[1] = controller13_P.ctr.setpoint.y;
      controller13_B.rd[2] = 0.0;
    }

    if ((controller13_P.ctr.takeoff.en != 0.0) && (controller13_DW.time_DSTATE >
         controller13_P.mdl.i_delay) && (controller13_DW.time_DSTATE <
         controller13_P.mdl.i_delay + controller13_P.ctr.takeoff.time)) {
      K14 = (controller13_P.ctr.setpoint.z - controller13_P.ctr.takeoff.height) /
        controller13_P.ctr.takeoff.time * (controller13_DW.time_DSTATE -
        controller13_P.mdl.i_delay) + controller13_P.ctr.takeoff.height;
      if (K14 > controller13_P.ctr.setpoint.z) {
        K14 = controller13_P.ctr.setpoint.z;
      }

      controller13_B.rd[0] = controller13_P.ctr.setpoint.x;
      controller13_B.rd[1] = controller13_P.ctr.setpoint.y;
      controller13_B.rd[2] = K14;
    }

    if ((controller13_P.ctr.landing.en != 0.0) && (controller13_DW.time_DSTATE >
         controller13_P.mdl.rt - controller13_P.ctr.landing.time)) {
      K14 = controller13_P.ctr.setpoint.z - (controller13_P.ctr.setpoint.z -
        controller13_P.ctr.landing.height) / controller13_P.ctr.landing.time *
        ((controller13_DW.time_DSTATE - controller13_P.mdl.rt) +
         controller13_P.ctr.landing.time);
      if (K14 < controller13_P.ctr.landing.height) {
        K14 = controller13_P.ctr.landing.height;
      }

      controller13_B.rd[0] = controller13_P.ctr.setpoint.x;
      controller13_B.rd[1] = controller13_P.ctr.setpoint.y;
      controller13_B.rd[2] = K14;
    }

    /* Delay: '<S9>/Delay' */
    controller13_B.r_origin[0] = controller13_DW.Delay_DSTATE_k[0];
    controller13_B.r_origin[1] = controller13_DW.Delay_DSTATE_k[1];
    controller13_B.r_origin[2] = controller13_DW.Delay_DSTATE_k[2];

    /* Delay: '<S9>/Delay2' */
    controller13_B.time = controller13_DW.Delay2_DSTATE_o;

    /* MATLAB Function: '<S9>/Learned RTNMPC' incorporates:
     *  Delay: '<S9>/Delay1'
     */
    controller13_DW.sfEvent_i4 = controller13_CALL_EVENT_l;
    R[0] = controller13_B.Switch4[0];
    R[1] = controller13_B.Switch4[3];
    R[2] = controller13_B.Switch4[6];
    R[3] = controller13_B.Switch4[1];
    R[4] = controller13_B.Switch4[4];
    R[5] = controller13_B.Switch4[7];
    R[6] = controller13_B.Switch4[2];
    R[7] = controller13_B.Switch4[5];
    R[8] = controller13_B.Switch4[8];
    memset(&tempR[0], 0, 9U * sizeof(real_T));
    tempR[0] = 1.0;
    tempR[4] = 1.0;
    tempR[8] = 1.0;
    if (controller13_P.ctr.rtnmpc.yaw_fixed_frame.en) {
      if (controller13_P.ctr.rtnmpc.yaw_fixed_framw.align_on_x) {
        K23 = controller13_B.Switch4[5] * 0.0 - controller13_B.Switch4[8] * 0.0;
        rtb_sincos_o1[0] = K23;
        K14 = controller13_B.Switch4[8] - controller13_B.Switch4[2] * 0.0;
        rtb_sincos_o1[1] = K14;
        rtb_ixj = controller13_B.Switch4[2] * 0.0 - controller13_B.Switch4[5];
        rtb_sincos_o1[2] = rtb_ixj;
        rtb_kxj = controller13_norm(rtb_sincos_o1);
        iy[0] = K23 / rtb_kxj;
        iy[1] = K14 / rtb_kxj;
        iy[2] = rtb_ixj / rtb_kxj;
        rtb_sincos_o2[0] = iy[1] * controller13_B.Switch4[8] - iy[2] *
          controller13_B.Switch4[5];
        rtb_sincos_o2[1] = iy[2] * controller13_B.Switch4[2] - iy[0] *
          controller13_B.Switch4[8];
        rtb_sincos_o2[2] = iy[0] * controller13_B.Switch4[5] - iy[1] *
          controller13_B.Switch4[2];
      } else {
        K23 = controller13_B.Switch4[8] - 0.0 * controller13_B.Switch4[5];
        rtb_sincos_o1[0] = K23;
        K14 = 0.0 * controller13_B.Switch4[2] - 0.0 * controller13_B.Switch4[8];
        rtb_sincos_o1[1] = K14;
        rtb_ixj = 0.0 * controller13_B.Switch4[5] - controller13_B.Switch4[2];
        rtb_sincos_o1[2] = rtb_ixj;
        rtb_kxj = controller13_norm(rtb_sincos_o1);
        rtb_sincos_o2[0] = K23 / rtb_kxj;
        rtb_sincos_o2[1] = K14 / rtb_kxj;
        rtb_sincos_o2[2] = rtb_ixj / rtb_kxj;
        iy[0] = rtb_sincos_o2[2] * controller13_B.Switch4[5] - rtb_sincos_o2[1] *
          controller13_B.Switch4[8];
        iy[1] = rtb_sincos_o2[0] * controller13_B.Switch4[8] - rtb_sincos_o2[2] *
          controller13_B.Switch4[2];
        iy[2] = rtb_sincos_o2[1] * controller13_B.Switch4[2] - rtb_sincos_o2[0] *
          controller13_B.Switch4[5];
      }

      R_WI[0] = rtb_sincos_o2[0];
      R_WI[3] = iy[0];
      R_WI[6] = controller13_B.Switch4[2];
      R_WI[1] = rtb_sincos_o2[1];
      R_WI[4] = iy[1];
      R_WI[7] = controller13_B.Switch4[5];
      R_WI[2] = rtb_sincos_o2[2];
      R_WI[5] = iy[2];
      R_WI[8] = controller13_B.Switch4[8];
      for (ibtile = 0; ibtile < 3; ibtile++) {
        K14 = R_WI[3 * ibtile + 1];
        K23 = R_WI[3 * ibtile];
        rtb_kxj = R_WI[3 * ibtile + 2];
        for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
          tempR[ibtile + 3 * idxFillStart] = (R[3 * idxFillStart + 1] * K14 + R
            [3 * idxFillStart] * K23) + R[3 * idxFillStart + 2] * rtb_kxj;
        }
      }

      controller13_rotm2quat(R_WI, next_q_mean);
      controller13_B.q_b[0] = next_q_mean[1];
      controller13_B.q_b[1] = next_q_mean[2];
      controller13_B.q_b[2] = next_q_mean[3];
      controller13_B.q_b[3] = next_q_mean[0];
      controller13_rotm2eul(R_WI, controller13_B.ypr_WI);
      controller13_rotm2eul(tempR, controller13_B.ypr_IB);
      controller13_rotm2eul(R, controller13_B.ypr_WB);
    } else {
      controller13_rotm2quat(R, next_q_mean);
      controller13_B.q_b[3] = next_q_mean[0];
      controller13_B.q_b[0] = next_q_mean[1];
      controller13_B.ypr_WI[0] = 0.0;
      controller13_B.ypr_IB[0] = 0.0;
      controller13_B.q_b[1] = next_q_mean[2];
      controller13_B.ypr_WI[1] = 0.0;
      controller13_B.ypr_IB[1] = 0.0;
      controller13_B.q_b[2] = next_q_mean[3];
      controller13_B.ypr_WI[2] = 0.0;
      controller13_B.ypr_IB[2] = 0.0;
      controller13_rotm2eul(R, controller13_B.ypr_WB);
    }

    K14 = ((controller13_B.q_b[0] * controller13_DW.Delay1_DSTATE_p[0] +
            controller13_B.q_b[1] * controller13_DW.Delay1_DSTATE_p[1]) +
           controller13_B.q_b[2] * controller13_DW.Delay1_DSTATE_p[2]) +
      controller13_B.q_b[3] * controller13_DW.Delay1_DSTATE_p[3];
    if (rtIsNaN(K14)) {
      K14 = (rtNaN);
    } else if (K14 < 0.0) {
      K14 = -1.0;
    } else {
      K14 = (K14 > 0.0);
    }

    controller13_B.q_b[0] *= K14;
    controller13_B.q_b[1] *= K14;
    controller13_B.q_b[2] *= K14;
    controller13_B.q_b[3] *= K14;
    if (controller13_B.time < 0.0) {
      controller13_B.r_origin[0] = controller13_B.Switch_fc[0];
      controller13_B.r_origin[1] = controller13_B.Switch_fc[1];
      controller13_B.r_origin[2] = controller13_B.Switch_fc[2];
    }

    controller13_B.x_in[0] = (((controller13_B.Switch_fc[0] +
      controller13_P.ctr.rtnmpc.r0_policy[0]) - controller13_B.r_origin[0]) -
      controller13_P.ctr.rtmpc.r_origin_offset[0]) *
      controller13_P.ctr.rtmpc.in_scaling[0];
    controller13_B.x_in[3] = controller13_B.Switch1_g[0] *
      controller13_P.ctr.rtmpc.in_scaling[3];
    controller13_B.x_in[1] = (((controller13_B.Switch_fc[1] +
      controller13_P.ctr.rtnmpc.r0_policy[1]) - controller13_B.r_origin[1]) -
      controller13_P.ctr.rtmpc.r_origin_offset[1]) *
      controller13_P.ctr.rtmpc.in_scaling[1];
    controller13_B.x_in[4] = controller13_B.Switch1_g[1] *
      controller13_P.ctr.rtmpc.in_scaling[4];
    controller13_B.x_in[2] = (((controller13_B.Switch_fc[2] +
      controller13_P.ctr.rtnmpc.r0_policy[2]) - controller13_B.r_origin[2]) -
      controller13_P.ctr.rtmpc.r_origin_offset[2]) *
      controller13_P.ctr.rtmpc.in_scaling[2];
    controller13_B.x_in[5] = controller13_B.Switch1_g[2] *
      controller13_P.ctr.rtmpc.in_scaling[5];
    controller13_B.x_in[6] = controller13_B.q_b[0] *
      controller13_P.ctr.rtmpc.in_scaling[6];
    controller13_B.x_in[7] = controller13_B.q_b[1] *
      controller13_P.ctr.rtmpc.in_scaling[7];
    controller13_B.x_in[8] = controller13_B.q_b[2] *
      controller13_P.ctr.rtmpc.in_scaling[8];
    controller13_B.x_in[9] = controller13_B.q_b[3] *
      controller13_P.ctr.rtmpc.in_scaling[9];
    for (ibtile = 0; ibtile <= 8; ibtile += 2) {
      /* MATLAB Function: '<S9>/Learned RTNMPC' */
      tmp_4 = _mm_loadu_pd(&controller13_B.x_in[ibtile]);
      _mm_storeu_pd(&controller13_B.obs[ibtile], _mm_div_pd(tmp_4, _mm_set1_pd
        (controller13_P.ctr.rtmpc.max_obs)));
    }

    /* MATLAB Function: '<S9>/Learned RTNMPC' */
    K14 = 0.0 / controller13_P.ctr.rtmpc.max_obs;
    controller13_B.obs[10] = K14;
    controller13_B.obs[11] = K14;
    controller13_B.obs[12] = K14;
    controller13_B.obs[13] = fmax(controller13_B.time, 0.0) /
      controller13_P.ctr.rtmpc.max_obs;
    for (csz_idx_2 = 0; csz_idx_2 < 64; csz_idx_2++) {
      n = 0.0F;
      for (ibtile = 0; ibtile < 14; ibtile++) {
        n += controller13_P.ctr.rtmpc.nnparam.IW1_1[(ibtile << 6) + csz_idx_2] *
          (real32_T)controller13_B.obs[ibtile];
      }

      n += controller13_P.ctr.rtmpc.nnparam.b1[csz_idx_2];
      d_b[csz_idx_2] = fmaxf(0.0F, n);
      if (rtIsNaNF(n)) {
        d_b[csz_idx_2] = (rtNaNF);
      }
    }

    for (csz_idx_2 = 0; csz_idx_2 < 32; csz_idx_2++) {
      n = 0.0F;
      for (ibtile = 0; ibtile < 64; ibtile++) {
        n += controller13_P.ctr.rtmpc.nnparam.LW2_1[(ibtile << 5) + csz_idx_2] *
          d_b[ibtile];
      }

      n += controller13_P.ctr.rtmpc.nnparam.b2[csz_idx_2];
      e_b[csz_idx_2] = fmaxf(0.0F, n);
      if (rtIsNaNF(n)) {
        e_b[csz_idx_2] = (rtNaNF);
      }
    }

    controller13_B.time = fmin(controller13_B.time + controller13_P.mdl.T,
      controller13_P.ctr.rtmpc.t_max);
    q_sigma_i[0] = controller13_P.ctr.rtmpc.lim.omega;
    q_sigma_i[1] = controller13_P.ctr.rtmpc.lim.omega;
    q_sigma_i[2] = controller13_P.ctr.rtmpc.lim.omega;
    q_sigma_i[3] = controller13_P.ctr.rtmpc.lim.f_cmd_norm;
    for (idxFillStart = 0; idxFillStart < 4; idxFillStart++) {
      n = 0.0F;
      for (ibtile = 0; ibtile < 32; ibtile++) {
        n += controller13_P.ctr.rtmpc.nnparam.LW3_2[(ibtile << 2) + idxFillStart]
          * e_b[ibtile];
      }

      K14 = q_sigma_i[idxFillStart];
      q_sigma_i[idxFillStart] = -K14;
      controller13_B.u_h[idxFillStart] = fmax(fmin((real32_T)
        (controller13_P.ctr.rtmpc.max_act *
         controller13_P.ctr.rtmpc.out_scaling[idxFillStart]) *
        (controller13_P.ctr.rtmpc.nnparam.b3[idxFillStart] + n), K14), -K14);
    }

    if (controller13_P.ctr.rtnmpc.yaw_fixed_frame.en) {
      K14 = controller13_B.u_h[1];
      K23 = controller13_B.u_h[0];
      rtb_kxj = controller13_B.u_h[2];
      for (ibtile = 0; ibtile < 3; ibtile++) {
        controller13_B.B_omega_d[ibtile] = (tempR[3 * ibtile + 1] * K14 + tempR
          [3 * ibtile] * K23) + tempR[3 * ibtile + 2] * rtb_kxj;
      }
    } else {
      controller13_B.B_omega_d[0] = controller13_B.u_h[0];
      controller13_B.B_omega_d[1] = controller13_B.u_h[1];
    }

    controller13_B.B_omega_d[2] = 0.0;
    controller13_B.f_cmd = (controller13_B.u_h[3] + 1.0) * rtb_sincos_o1_0;

    /* DiscreteTransferFcn: '<S9>/low pass' incorporates:
     *  DiscreteIntegrator: '<S9>/v integrator'
     */
    rtb_sincos_o1_0 = controller13_P.ctr.rtnmpc_ang_acc_lp.den[1];
    K14 = controller13_P.ctr.rtnmpc_ang_acc_lp.den[2];
    K23 = controller13_P.ctr.rtnmpc_ang_acc_lp.den[0];
    rtb_kxj = controller13_P.ctr.rtnmpc_ang_acc_lp.num[0];
    rtb_ixj = controller13_P.ctr.rtnmpc_ang_acc_lp.num[1];
    rtb_ixk = controller13_P.ctr.rtnmpc_ang_acc_lp.num[2];
    for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
      csz_idx_2 = idxFillStart << 1;
      rtb_VectorConcatenate_tmp_0 = controller13_DW.lowpass_states_m[csz_idx_2];
      rtb_VectorConcatenate_tmp_1 = controller13_DW.lowpass_states_m[csz_idx_2 +
        1];
      rtb_VectorConcatenate_tmp =
        ((controller13_DW.vintegrator_DSTATE[idxFillStart] - rtb_sincos_o1_0 *
          rtb_VectorConcatenate_tmp_0) - rtb_VectorConcatenate_tmp_1 * K14) /
        K23;
      controller13_DW.lowpass_tmp_c[idxFillStart] = rtb_VectorConcatenate_tmp;
      controller13_B.lowpass_h[idxFillStart] = (rtb_kxj *
        rtb_VectorConcatenate_tmp + rtb_ixj * rtb_VectorConcatenate_tmp_0) +
        rtb_VectorConcatenate_tmp_1 * rtb_ixk;

      /* Delay: '<S12>/Delay' incorporates:
       *  DiscreteIntegrator: '<S9>/v integrator'
       *  DiscreteTransferFcn: '<S9>/low pass'
       */
      rtb_sincos_o1[idxFillStart] = controller13_DW.Delay_DSTATE_a[idxFillStart];
    }

    /* End of DiscreteTransferFcn: '<S9>/low pass' */

    /* Delay: '<S12>/Delay1' */
    controller13_B.omega_hat[0] = controller13_DW.Delay1_DSTATE_jf[0];
    controller13_B.omega_hat[1] = controller13_DW.Delay1_DSTATE_jf[1];

    /* MATLAB Function: '<S12>/External Torque Observer' incorporates:
     *  Delay: '<S12>/Delay'
     *  DiscreteIntegrator: '<S21>/time'
     */
    controller13_DW.sfEvent_jf = controller13_CALL_EVENT_l;
    if (controller13_DW.time_DSTATE_o > controller13_P.mdl.i_delay) {
      memset(&R[0], 0, 9U * sizeof(real_T));
      R[0] = controller13_P.rbt.ixx;
      R[4] = controller13_P.rbt.iyy;
      R[8] = controller13_P.rbt.izz;
      K14 = controller13_B.w[1];
      K23 = controller13_B.w[0];
      rtb_sincos_o1_0 = controller13_B.w[2];
      for (ibtile = 0; ibtile <= 0; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&R[ibtile + 3]);
        tmp_5 = _mm_loadu_pd(&R[ibtile]);
        tmp_3 = _mm_loadu_pd(&R[ibtile + 6]);
        _mm_storeu_pd(&rtb_sincos_o1[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd
          (tmp_4, _mm_set1_pd(K14)), _mm_mul_pd(tmp_5, _mm_set1_pd(K23))),
          _mm_mul_pd(tmp_3, _mm_set1_pd(rtb_sincos_o1_0))));
      }

      for (ibtile = 2; ibtile < 3; ibtile++) {
        rtb_sincos_o1[ibtile] = (R[ibtile + 3] * K14 + R[ibtile] * K23) +
          R[ibtile + 6] * rtb_sincos_o1_0;
      }

      memset(&R_0[0], 0, sizeof(real_T) << 4U);
      R_0[0] = controller13_P.ctr.torque_obs.state_scaling[0];
      R_0[5] = controller13_P.ctr.torque_obs.state_scaling[1];
      R_0[10] = controller13_P.ctr.torque_obs.state_scaling[2];
      R_0[15] = controller13_P.ctr.torque_obs.state_scaling[3];
      q_sigma_i[1] = 0.0;
      q_sigma_i[2] = 0.0;
      q_sigma_i[0] = controller13_P.ctr.torque_obs.meas_scaling[0];
      K14 = controller13_B.omega_hat[0];
      K23 = controller13_DW.Delay_DSTATE_a[0];
      q_sigma_i[3] = controller13_P.ctr.torque_obs.meas_scaling[1];
      rtb_sincos_o1_0 = controller13_B.omega_hat[1];
      rtb_kxj = controller13_DW.Delay_DSTATE_a[1];
      for (ibtile = 0; ibtile <= 2; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&R_0[ibtile + 4]);
        tmp_5 = _mm_loadu_pd(&R_0[ibtile]);
        tmp_3 = _mm_loadu_pd(&R_0[ibtile + 8]);
        tmp_2 = _mm_loadu_pd(&R_0[ibtile + 12]);
        _mm_storeu_pd(&x_hat_pred[ibtile], _mm_add_pd(_mm_add_pd(_mm_add_pd
          (_mm_mul_pd(tmp_4, _mm_set1_pd(rtb_sincos_o1_0)), _mm_mul_pd(tmp_5,
          _mm_set1_pd(K14))), _mm_mul_pd(tmp_3, _mm_set1_pd(K23))), _mm_mul_pd
          (tmp_2, _mm_set1_pd(rtb_kxj))));
      }

      K12 -= controller13_B.w[1] * rtb_sincos_o1[2] - rtb_sincos_o1[1] *
        controller13_B.w[2];
      K13 -= rtb_sincos_o1[0] * controller13_B.w[2] - controller13_B.w[0] *
        rtb_sincos_o1[2];
      K14 = controller13_P.ctr.torque_obs.input_scaling[0] * K12 + 0.0 * K13;
      K13 = 0.0 * K12 + controller13_P.ctr.torque_obs.input_scaling[1] * K13;
      K12 = x_hat_pred[1];
      K23 = x_hat_pred[0];
      rtb_sincos_o1_0 = x_hat_pred[2];
      rtb_kxj = x_hat_pred[3];
      for (ibtile = 0; ibtile <= 2; ibtile += 2) {
        _mm_storeu_pd(&x_hat_pred[ibtile], _mm_add_pd(_mm_add_pd(_mm_add_pd
          (_mm_add_pd(_mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.A[ibtile + 4]), _mm_set1_pd(K12)),
                      _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.A[ibtile]), _mm_set1_pd(K23))),
           _mm_mul_pd(_mm_loadu_pd(&controller13_P.ctr.torque_obs.A[ibtile + 8]),
                      _mm_set1_pd(rtb_sincos_o1_0))), _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.A[ibtile + 12]), _mm_set1_pd(rtb_kxj))),
          _mm_add_pd(_mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.B[ibtile + 4]), _mm_set1_pd(K13)),
                     _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.B[ibtile]), _mm_set1_pd(K14)))));
      }

      memset(&R_0[0], 0, sizeof(real_T) << 4U);
      R_0[0] = controller13_P.ctr.torque_obs.out_scaling[0];
      R_0[5] = controller13_P.ctr.torque_obs.out_scaling[1];
      R_0[10] = controller13_P.ctr.torque_obs.out_scaling[2];
      R_0[15] = controller13_P.ctr.torque_obs.out_scaling[3];
      K14 = controller13_B.w[1];
      K23 = controller13_B.w[0];
      K13 = x_hat_pred[1];
      K12 = x_hat_pred[0];
      rtb_sincos_o1_0 = x_hat_pred[2];
      rtb_kxj = x_hat_pred[3];
      for (ibtile = 0; ibtile <= 0; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&q_sigma_i[ibtile + 2]);
        tmp_5 = _mm_loadu_pd(&q_sigma_i[ibtile]);
        _mm_storeu_pd(&q_sigma_i_0[ibtile], _mm_sub_pd(_mm_add_pd(_mm_mul_pd
          (tmp_4, _mm_set1_pd(K14)), _mm_mul_pd(tmp_5, _mm_set1_pd(K23))),
          _mm_add_pd(_mm_add_pd(_mm_add_pd(_mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.C[ibtile + 2]), _mm_set1_pd(K13)),
          _mm_mul_pd(_mm_loadu_pd(&controller13_P.ctr.torque_obs.C[ibtile]),
                     _mm_set1_pd(K12))), _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.C[ibtile + 4]), _mm_set1_pd
          (rtb_sincos_o1_0))), _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.C[ibtile + 6]), _mm_set1_pd(rtb_kxj)))));
      }

      K14 = q_sigma_i_0[1];
      K13 = q_sigma_i_0[0];
      for (ibtile = 0; ibtile <= 2; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&x_hat_pred[ibtile]);
        _mm_storeu_pd(&q_sigma_i[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd
          (_mm_loadu_pd(&controller13_P.ctr.torque_obs.L[ibtile + 4]),
           _mm_set1_pd(K14)), _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.ctr.torque_obs.L[ibtile]), _mm_set1_pd(K13))), tmp_4));
      }

      K13 = q_sigma_i[1];
      K12 = q_sigma_i[0];
      rtb_sincos_o1_0 = q_sigma_i[2];
      rtb_kxj = q_sigma_i[3];
      for (ibtile = 0; ibtile <= 2; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&R_0[ibtile + 4]);
        tmp_5 = _mm_loadu_pd(&R_0[ibtile]);
        tmp_3 = _mm_loadu_pd(&R_0[ibtile + 8]);
        tmp_2 = _mm_loadu_pd(&R_0[ibtile + 12]);
        _mm_storeu_pd(&next_q_mean[ibtile], _mm_add_pd(_mm_add_pd(_mm_add_pd
          (_mm_mul_pd(tmp_4, _mm_set1_pd(K13)), _mm_mul_pd(tmp_5, _mm_set1_pd
          (K12))), _mm_mul_pd(tmp_3, _mm_set1_pd(rtb_sincos_o1_0))), _mm_mul_pd
          (tmp_2, _mm_set1_pd(rtb_kxj))));
      }

      controller13_B.omega_hat[0] = next_q_mean[0];
      rtb_sincos_o1[0] = next_q_mean[2];
      controller13_B.omega_hat[1] = next_q_mean[1];
      rtb_sincos_o1[1] = next_q_mean[3];
      rtb_sincos_o1[2] = 0.0;
    }

    /* End of MATLAB Function: '<S12>/External Torque Observer' */

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    controller13_DW.sfEvent_e = controller13_CALL_EVENT_l;

    /* Saturate: '<S12>/Saturation' */
    if (rtb_sincos_o1[0] > controller13_P.Saturation_UpperSat[0]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat[0];
    } else if (rtb_sincos_o1[0] < controller13_P.Saturation_LowerSat[0]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat[0];
    } else {
      rtb_sincos_o1_0 = rtb_sincos_o1[0];
    }

    /* Gain: '<S12>/Multiply' incorporates:
     *  Saturate: '<S12>/Saturation'
     */
    controller13_B.Multiply[0] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* Switch: '<S12>/Switch3' incorporates:
     *  Constant: '<S12>/Constant'
     *  MATLAB Function: '<S29>/unpack state'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch3_Threshold_g) {
      rtb_sincos_o1_0 = controller13_B.Multiply[0];
    } else {
      rtb_sincos_o1_0 = rtb_Switch[16];
    }

    /* Saturate: '<S12>/Saturation1' */
    if (rtb_sincos_o1_0 > controller13_P.Saturation1_UpperSat[0]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_UpperSat[0];
    } else if (rtb_sincos_o1_0 < controller13_P.Saturation1_LowerSat[0]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_LowerSat[0];
    }

    /* Gain: '<S12>/Multiply1' incorporates:
     *  Saturate: '<S12>/Saturation1'
     */
    controller13_B.Multiply1[0] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* Saturate: '<S12>/Saturation' */
    if (rtb_sincos_o1[1] > controller13_P.Saturation_UpperSat[1]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat[1];
    } else if (rtb_sincos_o1[1] < controller13_P.Saturation_LowerSat[1]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat[1];
    } else {
      rtb_sincos_o1_0 = rtb_sincos_o1[1];
    }

    /* Gain: '<S12>/Multiply' incorporates:
     *  Saturate: '<S12>/Saturation'
     */
    controller13_B.Multiply[1] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* Switch: '<S12>/Switch3' incorporates:
     *  Constant: '<S12>/Constant'
     *  MATLAB Function: '<S29>/unpack state'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch3_Threshold_g) {
      rtb_sincos_o1_0 = controller13_B.Multiply[1];
    } else {
      rtb_sincos_o1_0 = rtb_Switch[17];
    }

    /* Saturate: '<S12>/Saturation1' */
    if (rtb_sincos_o1_0 > controller13_P.Saturation1_UpperSat[1]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_UpperSat[1];
    } else if (rtb_sincos_o1_0 < controller13_P.Saturation1_LowerSat[1]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_LowerSat[1];
    }

    /* Gain: '<S12>/Multiply1' incorporates:
     *  Saturate: '<S12>/Saturation1'
     */
    controller13_B.Multiply1[1] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    rtb_sincos_o2[1] = controller13_B.B_omega_d[1];

    /* Saturate: '<S12>/Saturation' */
    if (rtb_sincos_o1[2] > controller13_P.Saturation_UpperSat[2]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat[2];
    } else if (rtb_sincos_o1[2] < controller13_P.Saturation_LowerSat[2]) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat[2];
    } else {
      rtb_sincos_o1_0 = rtb_sincos_o1[2];
    }

    /* Gain: '<S12>/Multiply' incorporates:
     *  Saturate: '<S12>/Saturation'
     */
    controller13_B.Multiply[2] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* Switch: '<S12>/Switch3' incorporates:
     *  Constant: '<S12>/Constant'
     *  MATLAB Function: '<S29>/unpack state'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch3_Threshold_g) {
      rtb_sincos_o1_0 = controller13_B.Multiply[2];
    } else {
      rtb_sincos_o1_0 = rtb_Switch[18];
    }

    /* Saturate: '<S12>/Saturation1' */
    if (rtb_sincos_o1_0 > controller13_P.Saturation1_UpperSat[2]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_UpperSat[2];
    } else if (rtb_sincos_o1_0 < controller13_P.Saturation1_LowerSat[2]) {
      rtb_sincos_o1_0 = controller13_P.Saturation1_LowerSat[2];
    }

    /* Gain: '<S12>/Multiply1' incorporates:
     *  Saturate: '<S12>/Saturation1'
     */
    controller13_B.Multiply1[2] = controller13_P.ctr.torque_obs.enable *
      rtb_sincos_o1_0;

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    controller13_unflatten_rotm(controller13_B.Switch4, R);
    if (controller13_P.ctr.rtnmpc.set_cmd_omega_y_to_zero) {
      rtb_sincos_o2[1] = 0.0;
    }

    rtb_sincos_o1[0] = controller13_P.ctr.lee.ixx;
    rtb_sincos_o1[1] = controller13_P.ctr.lee.iyy;
    rtb_sincos_o1[2] = controller13_P.ctr.lee.izz;
    memset(&tempR[0], 0, 9U * sizeof(real_T));
    for (ibtile = 0; ibtile < 3; ibtile++) {
      tempR[ibtile + 3 * ibtile] = rtb_sincos_o1[ibtile];
      R_WI[3 * ibtile] = R[ibtile];
      R_WI[3 * ibtile + 1] = R[ibtile + 3];
      R_WI[3 * ibtile + 2] = R[ibtile + 6];
    }

    for (ibtile = 0; ibtile < 3; ibtile++) {
      K14 = R_WI[ibtile + 3];
      K23 = R_WI[ibtile];
      rtb_kxj = R_WI[ibtile + 6];
      for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
        K13 = R[3 * idxFillStart + 1];
        K12 = R[3 * idxFillStart];
        rtb_sincos_o1_0 = R[3 * idxFillStart + 2];
        rtb_ixj = (K13 * K14 + K12 * K23) + rtb_sincos_o1_0 * rtb_kxj;
        csz_idx_2 = 3 * idxFillStart + ibtile;
        ss_tmp[csz_idx_2] = rtb_ixj;
        ss[csz_idx_2] = ((R[3 * ibtile + 1] * K13 + R[3 * ibtile] * K12) + R[3 *
                         ibtile + 2] * rtb_sincos_o1_0) - rtb_ixj;
      }
    }

    for (ibtile = 0; ibtile <= 6; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      _mm_storeu_pd(&tmp[ibtile], _mm_mul_pd(_mm_loadu_pd
        (&controller13_P.ctr.lee.kR[ibtile]), _mm_set1_pd(-1.0)));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 8; ibtile < 9; ibtile++) {
      tmp[ibtile] = -controller13_P.ctr.lee.kR[ibtile];
    }

    K14 = 0.5 * ss[5];
    rtb_sincos_o1_0 = 0.5 * ss[6];
    K23 = 0.5 * ss[1];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&tmp[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&tmp[ibtile]);
      tmp_3 = _mm_loadu_pd(&tmp[ibtile + 6]);
      _mm_storeu_pd(&controller13_B.M_e_att[ibtile], _mm_add_pd(_mm_add_pd
        (_mm_mul_pd(tmp_4, _mm_set1_pd(rtb_sincos_o1_0)), _mm_mul_pd(tmp_5,
        _mm_set1_pd(K14))), _mm_mul_pd(tmp_3, _mm_set1_pd(K23))));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      controller13_B.M_e_att[ibtile] = (tmp[ibtile + 3] * rtb_sincos_o1_0 +
        tmp[ibtile] * K14) + tmp[ibtile + 6] * K23;
    }

    for (ibtile = 0; ibtile <= 6; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      _mm_storeu_pd(&tmp[ibtile], _mm_mul_pd(_mm_loadu_pd
        (&controller13_P.ctr.lee.kOmega[ibtile]), _mm_set1_pd(-1.0)));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 8; ibtile < 9; ibtile++) {
      tmp[ibtile] = -controller13_P.ctr.lee.kOmega[ibtile];
    }

    K13 = rtb_sincos_o2[1];
    K12 = controller13_B.B_omega_d[0];
    K14 = controller13_B.B_omega_d[2];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&ss_tmp[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&ss_tmp[ibtile]);
      tmp_3 = _mm_loadu_pd(&ss_tmp[ibtile + 6]);
      tmp_2 = _mm_loadu_pd(&controller13_B.Switch5[ibtile]);
      _mm_storeu_pd(&iy[ibtile], _mm_sub_pd(tmp_2, _mm_add_pd(_mm_add_pd
        (_mm_mul_pd(tmp_4, _mm_set1_pd(K13)), _mm_mul_pd(tmp_5, _mm_set1_pd(K12))),
        _mm_mul_pd(tmp_3, _mm_set1_pd(K14)))));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      iy[ibtile] = controller13_B.Switch5[ibtile] - ((ss_tmp[ibtile + 3] * K13 +
        ss_tmp[ibtile] * K12) + ss_tmp[ibtile + 6] * K14);
    }

    K13 = controller13_B.Switch5[1];
    K12 = controller13_B.Switch5[0];
    K14 = controller13_B.Switch5[2];
    rtb_sincos_o1_0 = iy[1];
    rtb_kxj = iy[0];
    rtb_ixj = iy[2];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&tempR[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&tempR[ibtile]);
      tmp_3 = _mm_loadu_pd(&tempR[ibtile + 6]);
      _mm_storeu_pd(&rtb_sincos_o1[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd
        (tmp_4, _mm_set1_pd(K13)), _mm_mul_pd(tmp_5, _mm_set1_pd(K12))),
        _mm_mul_pd(tmp_3, _mm_set1_pd(K14))));
      tmp_4 = _mm_loadu_pd(&tmp[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&tmp[ibtile]);
      tmp_3 = _mm_loadu_pd(&tmp[ibtile + 6]);
      _mm_storeu_pd(&controller13_B.M_e_angv[ibtile], _mm_add_pd(_mm_add_pd
        (_mm_mul_pd(tmp_4, _mm_set1_pd(rtb_sincos_o1_0)), _mm_mul_pd(tmp_5,
        _mm_set1_pd(rtb_kxj))), _mm_mul_pd(tmp_3, _mm_set1_pd(rtb_ixj))));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      rtb_sincos_o1[ibtile] = (tempR[ibtile + 3] * K13 + tempR[ibtile] * K12) +
        tempR[ibtile + 6] * K14;
      controller13_B.M_e_angv[ibtile] = (tmp[ibtile + 3] * rtb_sincos_o1_0 +
        tmp[ibtile] * rtb_kxj) + tmp[ibtile + 6] * rtb_ixj;
    }

    controller13_B.M_e_cross[0] = controller13_B.Switch5[1] * rtb_sincos_o1[2] -
      rtb_sincos_o1[1] * controller13_B.Switch5[2];
    controller13_B.M_e_cross[1] = rtb_sincos_o1[0] * controller13_B.Switch5[2] -
      controller13_B.Switch5[0] * rtb_sincos_o1[2];
    controller13_B.M_e_cross[2] = controller13_B.Switch5[0] * rtb_sincos_o1[1] -
      rtb_sincos_o1[0] * controller13_B.Switch5[1];
    tmp[0] = 0.0;
    tmp[3] = -controller13_B.Switch5[2];
    tmp[6] = controller13_B.Switch5[1];
    tmp[1] = controller13_B.Switch5[2];
    tmp[4] = 0.0;
    tmp[7] = -controller13_B.Switch5[0];
    tmp[2] = -controller13_B.Switch5[1];
    tmp[5] = controller13_B.Switch5[0];
    tmp[8] = 0.0;
    for (ibtile = 0; ibtile < 3; ibtile++) {
      rtb_sincos_o1_0 = tmp[ibtile + 3];
      rtb_kxj = tmp[ibtile];
      rtb_ixj = tmp[ibtile + 6];
      for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
        ss[ibtile + 3 * idxFillStart] = (R_WI[3 * idxFillStart + 1] *
          rtb_sincos_o1_0 + R_WI[3 * idxFillStart] * rtb_kxj) + R_WI[3 *
          idxFillStart + 2] * rtb_ixj;
      }

      rtb_sincos_o1_0 = ss[ibtile + 3];
      rtb_kxj = ss[ibtile];
      rtb_ixj = ss[ibtile + 6];
      for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
        ss_tmp[ibtile + 3 * idxFillStart] = (R[3 * idxFillStart + 1] *
          rtb_sincos_o1_0 + R[3 * idxFillStart] * rtb_kxj) + R[3 * idxFillStart
          + 2] * rtb_ixj;
      }
    }

    for (ibtile = 0; ibtile <= 6; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&tempR[ibtile]);
      _mm_storeu_pd(&R[ibtile], _mm_mul_pd(tmp_4, _mm_set1_pd(-1.0)));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 8; ibtile < 9; ibtile++) {
      R[ibtile] = -tempR[ibtile];
    }

    K13 = rtb_sincos_o2[1];
    K12 = controller13_B.B_omega_d[0];
    K14 = controller13_B.B_omega_d[2];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&ss_tmp[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&ss_tmp[ibtile]);
      tmp_3 = _mm_loadu_pd(&ss_tmp[ibtile + 6]);
      _mm_storeu_pd(&iy[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4,
        _mm_set1_pd(K13)), _mm_mul_pd(tmp_5, _mm_set1_pd(K12))), _mm_mul_pd
        (tmp_3, _mm_set1_pd(K14))));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      iy[ibtile] = (ss_tmp[ibtile + 3] * K13 + ss_tmp[ibtile] * K12) +
        ss_tmp[ibtile + 6] * K14;
    }

    rtb_sincos_o1_0 = iy[1];
    rtb_kxj = iy[0];
    rtb_ixj = iy[2];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
      tmp_4 = _mm_loadu_pd(&R[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&R[ibtile]);
      tmp_3 = _mm_loadu_pd(&R[ibtile + 6]);
      _mm_storeu_pd(&controller13_B.M_e_ang_acc[ibtile], _mm_add_pd(_mm_add_pd
        (_mm_mul_pd(tmp_4, _mm_set1_pd(rtb_sincos_o1_0)), _mm_mul_pd(tmp_5,
        _mm_set1_pd(rtb_kxj))), _mm_mul_pd(tmp_3, _mm_set1_pd(rtb_ixj))));
    }

    /* MATLAB Function: '<S9>/Geometric Attitude Controller' */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      controller13_B.M_e_ang_acc[ibtile] = (R[ibtile + 3] * rtb_sincos_o1_0 +
        R[ibtile] * rtb_kxj) + R[ibtile + 6] * rtb_ixj;
    }

    if (controller13_P.ctr.lee.ang_acc_ff != 0.0) {
      K13 = controller13_B.lowpass_h[1];
      K12 = controller13_B.lowpass_h[0];
      K14 = controller13_B.lowpass_h[2];
      for (ibtile = 0; ibtile <= 0; ibtile += 2) {
        tmp_4 = _mm_loadu_pd(&tempR[ibtile + 3]);
        tmp_5 = _mm_loadu_pd(&tempR[ibtile]);
        tmp_3 = _mm_loadu_pd(&tempR[ibtile + 6]);
        tmp_2 = _mm_loadu_pd(&controller13_B.M_e_ang_acc[ibtile]);
        _mm_storeu_pd(&controller13_B.M_e_ang_acc[ibtile], _mm_add_pd(_mm_add_pd
          (_mm_add_pd(_mm_mul_pd(tmp_4, _mm_set1_pd(K13)), _mm_mul_pd(tmp_5,
          _mm_set1_pd(K12))), _mm_mul_pd(tmp_3, _mm_set1_pd(K14))), tmp_2));
      }

      for (ibtile = 2; ibtile < 3; ibtile++) {
        controller13_B.M_e_ang_acc[ibtile] += (tempR[ibtile + 3] * K13 +
          tempR[ibtile] * K12) + tempR[ibtile + 6] * K14;
      }
    }

    controller13_B.M_e_ext_tau[0] = -controller13_B.Multiply1[0];
    controller13_B.M_e_ext_tau[1] = -controller13_B.Multiply1[1];
    controller13_B.M_e_ext_tau[2] = -0.0;
    if (controller13_B.time > 1.3) {
      controller13_B.M_e_ext_tau[1] *= 0.1;
    }

    controller13_B.cmd_B_torque[0] = fmax(fmin((((controller13_B.M_e_att[0] +
      controller13_B.M_e_angv[0]) + controller13_B.M_e_cross[0]) +
      controller13_B.M_e_ang_acc[0]) + controller13_B.M_e_ext_tau[0],
      controller13_P.ctr.rtmpc.lim.torque_x),
      -controller13_P.ctr.rtmpc.lim.torque_x);
    controller13_B.cmd_B_torque[1] = fmax(fmin((((controller13_B.M_e_att[1] +
      controller13_B.M_e_angv[1]) + controller13_B.M_e_cross[1]) +
      controller13_B.M_e_ang_acc[1]) + controller13_B.M_e_ext_tau[1],
      controller13_P.ctr.rtmpc.lim.torque_y),
      -controller13_P.ctr.rtmpc.lim.torque_y);
    controller13_B.cmd_B_torque[2] = fmax(fmin(0.0,
      controller13_P.ctr.rtmpc.lim.torque_z),
      -controller13_P.ctr.rtmpc.lim.torque_z);

    /* Gain: '<S9>/Gain1' */
    controller13_B.NMPCF = 1.0 / controller13_P.rbt.m * controller13_B.f_cmd;

    /* MATLAB Function: '<S1>/saturation' */
    controller13_DW.sfEvent_h = controller13_CALL_EVENT_l;
    if (!(controller13_P.ctr.adaptive_saturation.enable != 0.0)) {
      controller13_B.X_roll = fmax(fmin(controller13_B.cmd_B_torque[0],
        controller13_P.ctr.lim.taux), -controller13_P.ctr.lim.taux);
      controller13_B.Y_pitch = fmax(fmin(controller13_B.cmd_B_torque[1],
        controller13_P.ctr.lim.tauy), -controller13_P.ctr.lim.tauy);
      controller13_B.Force = controller13_B.NMPCF * controller13_P.rbt.m;
      controller13_B.exitflag = 0.0;
    } else {
      K23 = controller13_P.rbt.m * 9.80655;
      rtb_sincos_o1[0] = controller13_B.NMPCF * controller13_P.rbt.m - K23;
      K14 = 0.5 * controller13_P.rbt.m * 9.80655;
      for (ibtile = 0; ibtile < 3; ibtile++) {
        tmp[3 * ibtile] = -controller13_P.ctr.adaptive_saturation.Q[ibtile];
        tmp[3 * ibtile + 1] = -controller13_P.ctr.adaptive_saturation.Q[ibtile +
          3];
        tmp[3 * ibtile + 2] = -controller13_P.ctr.adaptive_saturation.Q[ibtile +
          6];
      }

      rtb_ixj = controller13_B.cmd_B_torque[0];
      rtb_kxj = rtb_sincos_o1[0];
      rtb_sincos_o1_0 = controller13_B.cmd_B_torque[1];
      for (ibtile = 0; ibtile < 3; ibtile++) {
        rtb_sincos_o2[ibtile] = (tmp[ibtile + 3] * rtb_ixj + tmp[ibtile] *
          rtb_kxj) + tmp[ibtile + 6] * rtb_sincos_o1_0;
        idxFillStart = ibtile << 2;
        K13 = controller13_P.rbt.Apinv[idxFillStart];
        csz_idx_2 = ibtile << 3;
        Aineq[csz_idx_2] = K13;
        Aineq[csz_idx_2 + 4] = -K13;
        K13 = controller13_P.rbt.Apinv[idxFillStart + 1];
        Aineq[csz_idx_2 + 1] = K13;
        Aineq[csz_idx_2 + 5] = -K13;
        K13 = controller13_P.rbt.Apinv[idxFillStart + 2];
        Aineq[csz_idx_2 + 2] = K13;
        Aineq[csz_idx_2 + 6] = -K13;
        K13 = controller13_P.rbt.Apinv[idxFillStart + 3];
        Aineq[csz_idx_2 + 3] = K13;
        Aineq[csz_idx_2 + 7] = -K13;
      }

      K12 = -(0.0 * controller13_P.rbt.m * 9.80655);
      for (ibtile = 0; ibtile <= 2; ibtile += 2) {
        tmp_4 = _mm_set1_pd(0.0);
        tmp_4 = _mm_add_pd(_mm_add_pd(_mm_mul_pd(_mm_loadu_pd
          (&controller13_P.rbt.Apinv[ibtile + 4]), tmp_4), _mm_mul_pd
          (_mm_loadu_pd(&controller13_P.rbt.Apinv[ibtile]), _mm_set1_pd(K23))),
                           _mm_mul_pd(_mm_loadu_pd
          (&controller13_P.rbt.Apinv[ibtile + 8]), tmp_4));
        _mm_storeu_pd(&b_x[ibtile], _mm_sub_pd(_mm_set1_pd(K14), tmp_4));
        _mm_storeu_pd(&b_x[ibtile + 4], _mm_add_pd(_mm_set1_pd(K12), tmp_4));
      }

      solution.fstar = 0.0;
      solution.firstorderopt = 0.0;
      memset(&solution.lambda[0], 0, 9U * sizeof(real_T));
      solution.state = 0;
      solution.maxConstr = 0.0;
      solution.iterations = 0;
      solution.searchDir[0] = 0.0;
      solution.searchDir[1] = 0.0;
      solution.searchDir[2] = 0.0;
      solution.searchDir[3] = 0.0;
      solution.xstar[0] = rtb_sincos_o1[0];
      solution.xstar[1] = controller13_B.cmd_B_torque[0];
      solution.xstar[2] = controller13_B.cmd_B_torque[1];
      CholRegManager.ldm = 4;
      CholRegManager.ndims = 0;
      CholRegManager.info = 0;
      CholRegManager.ConvexCheck = true;
      CholRegManager.regTol_ = 0.0;
      CholRegManager.scaleFactor = 100.0;
      WorkingSet.nVarOrig = 3;
      WorkingSet.nVarMax = 4;
      WorkingSet.ldA = 4;
      memset(&WorkingSet.Aineq[0], 0, sizeof(real_T) << 5U);
      memset(&WorkingSet.bineq[0], 0, sizeof(real_T) << 3U);
      WorkingSet.lb[0] = 0.0;
      WorkingSet.ub[0] = 0.0;
      WorkingSet.indexLB[0] = 0;
      WorkingSet.indexUB[0] = 0;
      WorkingSet.indexFixed[0] = 0;
      WorkingSet.lb[1] = 0.0;
      WorkingSet.ub[1] = 0.0;
      WorkingSet.indexLB[1] = 0;
      WorkingSet.indexUB[1] = 0;
      WorkingSet.indexFixed[1] = 0;
      WorkingSet.lb[2] = 0.0;
      WorkingSet.ub[2] = 0.0;
      WorkingSet.indexLB[2] = 0;
      WorkingSet.indexUB[2] = 0;
      WorkingSet.indexFixed[2] = 0;
      WorkingSet.lb[3] = 0.0;
      WorkingSet.ub[3] = 0.0;
      WorkingSet.indexLB[3] = 0;
      WorkingSet.indexUB[3] = 0;
      WorkingSet.indexFixed[3] = 0;
      WorkingSet.mEqRemoved = 0;
      memset(&WorkingSet.ATwset[0], 0, 36U * sizeof(real_T));
      memset(&WorkingSet.bwset[0], 0, 9U * sizeof(real_T));
      memset(&WorkingSet.maxConstrWorkspace[0], 0, 9U * sizeof(real_T));
      for (ibtile = 0; ibtile < 9; ibtile++) {
        WorkingSet.isActiveConstr[ibtile] = false;
        WorkingSet.Wid[ibtile] = 0;
        WorkingSet.Wlocalidx[ibtile] = 0;
      }

      WorkingSet.mConstrOrig = 8;
      WorkingSet.mConstrMax = 9;
      for (ibtile = 0; ibtile < 5; ibtile++) {
        WorkingSet.sizesNormal[ibtile] = WorkingSet_tmp[ibtile];
        WorkingSet.sizesPhaseOne[ibtile] = c_0[ibtile];
        WorkingSet.sizesRegularized[ibtile] = d_0[ibtile];
        WorkingSet.sizesRegPhaseOne[ibtile] = e_0[ibtile];
      }

      for (ibtile = 0; ibtile < 6; ibtile++) {
        WorkingSet.isActiveIdxRegPhaseOne[ibtile] = g_0[ibtile];
      }

      for (csz_idx_2 = 0; csz_idx_2 < 5; csz_idx_2++) {
        WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2 + 1] +=
          WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2];
      }

      for (ibtile = 0; ibtile < 6; ibtile++) {
        WorkingSet.isActiveIdxNormal[ibtile] =
          WorkingSet.isActiveIdxRegPhaseOne[ibtile];
        WorkingSet.isActiveIdxRegPhaseOne[ibtile] = h[ibtile];
      }

      for (csz_idx_2 = 0; csz_idx_2 < 5; csz_idx_2++) {
        WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2 + 1] +=
          WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2];
      }

      for (ibtile = 0; ibtile < 6; ibtile++) {
        WorkingSet.isActiveIdxPhaseOne[ibtile] =
          WorkingSet.isActiveIdxRegPhaseOne[ibtile];
        WorkingSet.isActiveIdxRegPhaseOne[ibtile] = i[ibtile];
      }

      for (csz_idx_2 = 0; csz_idx_2 < 5; csz_idx_2++) {
        WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2 + 1] +=
          WorkingSet.isActiveIdxRegPhaseOne[csz_idx_2];
      }

      for (ibtile = 0; ibtile < 6; ibtile++) {
        WorkingSet.isActiveIdxRegularized[ibtile] =
          WorkingSet.isActiveIdxRegPhaseOne[ibtile];
        WorkingSet.isActiveIdxRegPhaseOne[ibtile] = j[ibtile];
      }

      for (idxFillStart = 0; idxFillStart < 5; idxFillStart++) {
        WorkingSet.isActiveIdxRegPhaseOne[idxFillStart + 1] +=
          WorkingSet.isActiveIdxRegPhaseOne[idxFillStart];
      }

      for (idxFillStart = 0; idxFillStart < 8; idxFillStart++) {
        ibtile = idxFillStart << 2;
        WorkingSet.Aineq[ibtile] = Aineq[idxFillStart];
        WorkingSet.Aineq[ibtile + 1] = Aineq[idxFillStart + 8];
        WorkingSet.Aineq[ibtile + 2] = Aineq[idxFillStart + 16];
        WorkingSet.bineq[idxFillStart] = b_x[idxFillStart];
      }

      WorkingSet.nVar = 3;
      WorkingSet.mConstr = 8;
      for (ibtile = 0; ibtile < 5; ibtile++) {
        WorkingSet.sizes[ibtile] = WorkingSet.sizesNormal[ibtile];
      }

      for (ibtile = 0; ibtile < 6; ibtile++) {
        WorkingSet.isActiveIdx[ibtile] = WorkingSet.isActiveIdxNormal[ibtile];
      }

      WorkingSet.probType = 3;
      idxFillStart = WorkingSet.isActiveIdx[2];
      for (ibtile = idxFillStart; ibtile < 10; ibtile++) {
        WorkingSet.isActiveConstr[ibtile - 1] = false;
      }

      WorkingSet.nWConstr[0] = 0;
      WorkingSet.nWConstr[1] = 0;
      WorkingSet.nWConstr[2] = 0;
      WorkingSet.nWConstr[3] = 0;
      WorkingSet.nWConstr[4] = 0;
      WorkingSet.nActiveConstr = 0;
      WorkingSet.SLACK0 = 0.0;
      K12 = 1.0;
      for (idxFillStart = 0; idxFillStart < 8; idxFillStart++) {
        ibtile = idxFillStart << 2;
        K12 = fmax(K12, (fabs(WorkingSet.Aineq[ibtile + 1]) + fabs
                         (WorkingSet.Aineq[ibtile])) + fabs
                   (WorkingSet.Aineq[ibtile + 2]));
      }

      K13 = 0.0;
      K14 = 0.0;
      for (idxFillStart = 0; idxFillStart < 3; idxFillStart++) {
        K13 = fmax(K13, (fabs(controller13_P.ctr.adaptive_saturation.Q[3 *
                              idxFillStart + 1]) + fabs
                         (controller13_P.ctr.adaptive_saturation.Q[3 *
                          idxFillStart])) + fabs
                   (controller13_P.ctr.adaptive_saturation.Q[3 * idxFillStart +
                    2]));
        K14 = fmax(K14, fabs(rtb_sincos_o2[idxFillStart]));
      }

      controller13_driver(controller13_P.ctr.adaptive_saturation.Q,
                          rtb_sincos_o2, &solution, &memspace, &WorkingSet,
                          &CholRegManager, K12, fmax(fmax(K12, K14), K13),
                          &QRManager, &QPObjective);
      if (solution.state <= 0) {
        controller13_computeFval(&QPObjective, memspace.workspace_double,
          controller13_P.ctr.adaptive_saturation.Q, rtb_sincos_o2,
          solution.xstar);
      }

      switch (solution.state) {
       case 2:
        solution.state = -3;
        break;

       case -3:
        solution.state = -2;
        break;

       case 4:
        solution.state = -2;
        break;
      }

      controller13_B.exitflag = solution.state;
      if ((solution.state != -2) && (solution.state <= 0)) {
        solution.maxConstr = controller13_maxConstraintViolation(&WorkingSet,
          solution.xstar);
        if (solution.maxConstr <= 1.0E-9 * K12) {
          switch (QPObjective.objtype) {
           case 5:
            break;

           case 3:
            controller13_linearForm__d(QPObjective.hasLinear, QPObjective.nvar,
              QPObjective.grad, controller13_P.ctr.adaptive_saturation.Q,
              rtb_sincos_o2, solution.xstar);
            break;

           default:
            controller13_linearForm__d(QPObjective.hasLinear, QPObjective.nvar,
              QPObjective.grad, controller13_P.ctr.adaptive_saturation.Q,
              rtb_sincos_o2, solution.xstar);
            break;
          }
        }
      }

      controller13_B.Force = K23 + solution.xstar[0];
      controller13_B.X_roll = solution.xstar[1];
      controller13_B.Y_pitch = solution.xstar[2];
    }

    /* End of MATLAB Function: '<S1>/saturation' */

    /* MATLAB Function: '<S1>/correct force' */
    controller13_DW.sfEvent_lw = controller13_CALL_EVENT_l;
    K12 = ((controller13_B.Force / controller13_P.rbt.m / 9.81 - 1.0) *
           controller13_P.rbt.thrust_error_poly_fit[0] +
           controller13_P.rbt.thrust_error_poly_fit[1]) * controller13_P.rbt.m *
      9.81 + controller13_B.Force;

    /* MATLAB Function: '<Root>/motor thrust mapping' incorporates:
     *  SignalConversion generated from: '<S5>/ SFunction '
     */
    controller13_DW.sfEvent = controller13_CALL_EVENT_l;
    K13 = controller13_B.X_roll / controller13_P.rbt.lt / 2.0;
    K14 = controller13_B.Y_pitch / controller13_P.rbt.ld / 2.0;
    next_q_mean[0] = -K13 - K14;
    next_q_mean[1] = K13 - K14;
    next_q_mean[2] = K13 + K14;
    next_q_mean[3] = -K13 + K14;
    if (!rtIsNaN(next_q_mean[0])) {
      ibtile = 1;
    } else {
      ibtile = 0;
      idxFillStart = 2;
      exitg1 = false;
      while ((!exitg1) && (idxFillStart < 5)) {
        if (!rtIsNaN(next_q_mean[idxFillStart - 1])) {
          ibtile = idxFillStart;
          exitg1 = true;
        } else {
          idxFillStart++;
        }
      }
    }

    if (ibtile == 0) {
      K13 = next_q_mean[0];
    } else {
      K13 = next_q_mean[ibtile - 1];
      for (csz_idx_2 = ibtile + 1; csz_idx_2 < 5; csz_idx_2++) {
        K14 = next_q_mean[csz_idx_2 - 1];
        if (K13 > K14) {
          K13 = K14;
        }
      }
    }

    if (K12 < -K13) {
      K12 = -K13;
    }

    controller13_B.motors_thrust[0] = K12 + next_q_mean[0];
    controller13_B.motors_thrust[1] = K12 + next_q_mean[1];
    controller13_B.motors_thrust[2] = K12 + next_q_mean[2];
    controller13_B.motors_thrust[3] = K12 + next_q_mean[3];

    /* End of MATLAB Function: '<Root>/motor thrust mapping' */

    /* Saturate: '<Root>/Saturation' */
    if (controller13_B.motors_thrust[0] > controller13_P.Saturation_UpperSat_d)
    {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat_d;
    } else if (controller13_B.motors_thrust[0] <
               controller13_P.Saturation_LowerSat_m) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat_m;
    } else {
      rtb_sincos_o1_0 = controller13_B.motors_thrust[0];
    }

    /* Lookup_n-D: '<Root>/Nemo Bee 12' incorporates:
     *  Constant: '<Root>/Constant13'
     *  Saturate: '<Root>/Saturation'
     *  Sum: '<Root>/Add2'
     */
    K23 = look1_binlxpw(rtb_sincos_o1_0 + controller13_P.Constant13_Value,
                        controller13_P.lut.T1, controller13_P.lut.v1, 1100U);

    /* Saturate: '<Root>/Saturation1' */
    if (K23 > controller13_P.Saturation1_UpperSat_c) {
      /* Saturate: '<Root>/Saturation1' */
      controller13_B.Saturation1 = controller13_P.Saturation1_UpperSat_c;
    } else if (K23 < controller13_P.Saturation1_LowerSat_c) {
      /* Saturate: '<Root>/Saturation1' */
      controller13_B.Saturation1 = controller13_P.Saturation1_LowerSat_c;
    } else {
      /* Saturate: '<Root>/Saturation1' */
      controller13_B.Saturation1 = K23;
    }

    /* End of Saturate: '<Root>/Saturation1' */

    /* Switch: '<S8>/Switch17' incorporates:
     *  RelationalOperator: '<S8>/IsNaN'
     */
    if (rtIsNaN(controller13_B.Saturation1)) {
      /* Switch: '<S8>/Switch17' */
      controller13_B.Switch17 = rtb_Delay1;
    } else {
      /* Switch: '<S8>/Switch17' */
      controller13_B.Switch17 = controller13_B.Saturation1;
    }

    /* End of Switch: '<S8>/Switch17' */

    /* ComplexToRealImag: '<S8>/Complex to Real-Imag' */
    K12 = controller13_B.Switch17;

    /* Saturate: '<Root>/Saturation' */
    if (controller13_B.motors_thrust[1] > controller13_P.Saturation_UpperSat_d)
    {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat_d;
    } else if (controller13_B.motors_thrust[1] <
               controller13_P.Saturation_LowerSat_m) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat_m;
    } else {
      rtb_sincos_o1_0 = controller13_B.motors_thrust[1];
    }

    /* Lookup_n-D: '<Root>/Nemo Bee 6' incorporates:
     *  Constant: '<Root>/Constant14'
     *  Saturate: '<Root>/Saturation'
     *  Sum: '<Root>/Add3'
     */
    K23 = look1_binlxpw(rtb_sincos_o1_0 + controller13_P.Constant14_Value,
                        controller13_P.lut.T2, controller13_P.lut.v2, 1250U);

    /* Saturate: '<Root>/Saturation2' */
    if (K23 > controller13_P.Saturation2_UpperSat) {
      /* Saturate: '<Root>/Saturation2' */
      controller13_B.Saturation2 = controller13_P.Saturation2_UpperSat;
    } else if (K23 < controller13_P.Saturation2_LowerSat) {
      /* Saturate: '<Root>/Saturation2' */
      controller13_B.Saturation2 = controller13_P.Saturation2_LowerSat;
    } else {
      /* Saturate: '<Root>/Saturation2' */
      controller13_B.Saturation2 = K23;
    }

    /* End of Saturate: '<Root>/Saturation2' */

    /* Switch: '<S8>/Switch1' incorporates:
     *  RelationalOperator: '<S8>/IsNaN1'
     */
    if (rtIsNaN(controller13_B.Saturation2)) {
      /* Switch: '<S8>/Switch1' incorporates:
       *  Delay: '<S8>/Delay'
       */
      controller13_B.Switch1_p = controller13_DW.Delay_DSTATE_at;
    } else {
      /* Switch: '<S8>/Switch1' */
      controller13_B.Switch1_p = controller13_B.Saturation2;
    }

    /* End of Switch: '<S8>/Switch1' */

    /* ComplexToRealImag: '<S8>/Complex to Real-Imag1' */
    K13 = controller13_B.Switch1_p;

    /* Saturate: '<Root>/Saturation' */
    if (controller13_B.motors_thrust[2] > controller13_P.Saturation_UpperSat_d)
    {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat_d;
    } else if (controller13_B.motors_thrust[2] <
               controller13_P.Saturation_LowerSat_m) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat_m;
    } else {
      rtb_sincos_o1_0 = controller13_B.motors_thrust[2];
    }

    /* Lookup_n-D: '<Root>/Nemo Bee 14' incorporates:
     *  Constant: '<Root>/Constant15'
     *  Saturate: '<Root>/Saturation'
     *  Sum: '<Root>/Add4'
     */
    K23 = look1_binlxpw(rtb_sincos_o1_0 + controller13_P.Constant15_Value,
                        controller13_P.lut.T3, controller13_P.lut.v3, 1100U);

    /* Saturate: '<Root>/Saturation3' */
    if (K23 > controller13_P.Saturation3_UpperSat) {
      /* Saturate: '<Root>/Saturation3' */
      controller13_B.Saturation3 = controller13_P.Saturation3_UpperSat;
    } else if (K23 < controller13_P.Saturation3_LowerSat) {
      /* Saturate: '<Root>/Saturation3' */
      controller13_B.Saturation3 = controller13_P.Saturation3_LowerSat;
    } else {
      /* Saturate: '<Root>/Saturation3' */
      controller13_B.Saturation3 = K23;
    }

    /* End of Saturate: '<Root>/Saturation3' */

    /* Switch: '<S8>/Switch2' incorporates:
     *  RelationalOperator: '<S8>/IsNaN2'
     */
    if (rtIsNaN(controller13_B.Saturation3)) {
      /* Switch: '<S8>/Switch2' incorporates:
       *  Delay: '<S8>/Delay2'
       */
      controller13_B.Switch2_h = controller13_DW.Delay2_DSTATE_k;
    } else {
      /* Switch: '<S8>/Switch2' */
      controller13_B.Switch2_h = controller13_B.Saturation3;
    }

    /* End of Switch: '<S8>/Switch2' */

    /* ComplexToRealImag: '<S8>/Complex to Real-Imag2' */
    K14 = controller13_B.Switch2_h;

    /* Saturate: '<Root>/Saturation' */
    if (controller13_B.motors_thrust[3] > controller13_P.Saturation_UpperSat_d)
    {
      rtb_sincos_o1_0 = controller13_P.Saturation_UpperSat_d;
    } else if (controller13_B.motors_thrust[3] <
               controller13_P.Saturation_LowerSat_m) {
      rtb_sincos_o1_0 = controller13_P.Saturation_LowerSat_m;
    } else {
      rtb_sincos_o1_0 = controller13_B.motors_thrust[3];
    }

    /* Lookup_n-D: '<Root>/Nemo Bee 10' incorporates:
     *  Constant: '<Root>/Constant16'
     *  Saturate: '<Root>/Saturation'
     *  Sum: '<Root>/Add5'
     */
    K23 = look1_binlxpw(rtb_sincos_o1_0 + controller13_P.Constant16_Value,
                        controller13_P.lut.T4, controller13_P.lut.v4, 1200U);

    /* Saturate: '<Root>/Saturation4' */
    if (K23 > controller13_P.Saturation4_UpperSat) {
      /* Saturate: '<Root>/Saturation4' */
      controller13_B.Saturation4 = controller13_P.Saturation4_UpperSat;
    } else if (K23 < controller13_P.Saturation4_LowerSat) {
      /* Saturate: '<Root>/Saturation4' */
      controller13_B.Saturation4 = controller13_P.Saturation4_LowerSat;
    } else {
      /* Saturate: '<Root>/Saturation4' */
      controller13_B.Saturation4 = K23;
    }

    /* End of Saturate: '<Root>/Saturation4' */

    /* Switch: '<S8>/Switch3' incorporates:
     *  RelationalOperator: '<S8>/IsNaN3'
     */
    if (rtIsNaN(controller13_B.Saturation4)) {
      /* Switch: '<S8>/Switch3' incorporates:
       *  Delay: '<S8>/Delay3'
       */
      controller13_B.Switch3 = controller13_DW.Delay3_DSTATE_j;
    } else {
      /* Switch: '<S8>/Switch3' */
      controller13_B.Switch3 = controller13_B.Saturation4;
    }

    /* End of Switch: '<S8>/Switch3' */

    /* ComplexToRealImag: '<S8>/Complex to Real-Imag3' */
    K23 = controller13_B.Switch3;

    /* SignalConversion generated from: '<S4>/Delay' incorporates:
     *  ComplexToRealImag: '<S8>/Complex to Real-Imag'
     *  ComplexToRealImag: '<S8>/Complex to Real-Imag1'
     *  ComplexToRealImag: '<S8>/Complex to Real-Imag2'
     *  ComplexToRealImag: '<S8>/Complex to Real-Imag3'
     */
    controller13_B.TmpSignalConversionAtDelayInport1[0] =
      controller13_B.Switch17;
    controller13_B.TmpSignalConversionAtDelayInport1[1] =
      controller13_B.Switch1_p;
    controller13_B.TmpSignalConversionAtDelayInport1[2] =
      controller13_B.Switch2_h;
    controller13_B.TmpSignalConversionAtDelayInport1[3] = controller13_B.Switch3;

    /* Gain: '<S6>/half1' */
    controller13_B.half1[0] = controller13_P.half1_Gain *
      controller13_B.TmpSignalConversionAtDelayInport1[0];
    controller13_B.half1[1] = controller13_P.half1_Gain *
      controller13_B.TmpSignalConversionAtDelayInport1[1];
    controller13_B.half1[2] = controller13_P.half1_Gain *
      controller13_B.TmpSignalConversionAtDelayInport1[2];
    controller13_B.half1[3] = controller13_P.half1_Gain *
      controller13_B.TmpSignalConversionAtDelayInport1[3];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Sum: '<S91>/Add2' incorporates:
     *  Product: '<S91>/signal with gain1'
     *  ZeroOrderHold: '<S91>/Zero-Order Hold'
     */
    controller13_B.Add2 = rtb_Gain1 * controller13_B.half1[0] +
      controller13_B.half1[0];

    /* Sum: '<S92>/Add2' incorporates:
     *  Constant: '<S92>/phase offset'
     *  DiscreteIntegrator: '<S92>/omega*t'
     *  Gain: '<S92>/Gain1'
     *  Gain: '<S92>/deg to rad'
     *  Product: '<S92>/signal with gain1'
     *  Sum: '<S92>/Add1'
     *  Trigonometry: '<S92>/first harmonic'
     *  ZeroOrderHold: '<S92>/Zero-Order Hold'
     */
    controller13_B.Add2_n = cos(controller13_P.degtorad_Gain_i *
      controller13_P.phaseoffset_Value_l + controller13_DW.omegat_DSTATE_p) *
      controller13_P.Gain1_Gain_g * controller13_B.half1[1] +
      controller13_B.half1[1];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Product: '<S91>/OutputWithRamping' */
    controller13_B.OutputWithRamping = rtb_RampUpOrDown * controller13_B.Add2;

    /* Gain: '<S6>/Gain4' incorporates:
     *  Constant: '<S96>/ground'
     *  MinMax: '<S96>/MaxOf'
     *  MinMax: '<S96>/MinOf'
     */
    controller13_B.Gain4 = controller13_P.Gain4_Gain * fmax(fmin
      (controller13_B.Product, controller13_B.OutputWithRamping),
      controller13_P.ground_Value);

    /* Product: '<S103>/Product' incorporates:
     *  Constant: '<Root>/safety voltage'
     *  DiscreteIntegrator: '<S103>/SaturatingRamp'
     */
    rtb_RandomNumber2 = controller13_DW.SaturatingRamp_DSTATE_n *
      controller13_P.safetyvoltage_Value;

    /* DiscreteIntegrator: '<S92>/RampUpOrDown' */
    rtb_RampUpOrDown_f = controller13_DW.RampUpOrDown_DSTATE_a;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Sum: '<S93>/Add2' incorporates:
     *  Constant: '<S93>/phase offset'
     *  DiscreteIntegrator: '<S93>/omega*t'
     *  Gain: '<S93>/Gain1'
     *  Gain: '<S93>/deg to rad'
     *  Product: '<S93>/signal with gain1'
     *  Sum: '<S93>/Add1'
     *  Trigonometry: '<S93>/first harmonic'
     *  ZeroOrderHold: '<S93>/Zero-Order Hold'
     */
    controller13_B.Add2_c = cos(controller13_P.degtorad_Gain_k *
      controller13_P.phaseoffset_Value_j + controller13_DW.omegat_DSTATE_l) *
      controller13_P.Gain1_Gain_dj * controller13_B.half1[2] +
      controller13_B.half1[2];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Gain: '<S6>/Gain1' incorporates:
     *  Constant: '<S102>/ground'
     *  MinMax: '<S102>/MaxOf'
     *  MinMax: '<S102>/MinOf'
     *  Product: '<S92>/OutputWithRamping'
     */
    controller13_B.Gain1 = fmax(fmin(rtb_RandomNumber2, rtb_RampUpOrDown_f *
      controller13_B.Add2_n), controller13_P.ground_Value_a) *
      controller13_P.Gain1_Gain_d;

    /* Product: '<S109>/Product' incorporates:
     *  Constant: '<Root>/safety voltage'
     *  DiscreteIntegrator: '<S109>/SaturatingRamp'
     */
    rtb_RandomNumber1 = controller13_DW.SaturatingRamp_DSTATE_o *
      controller13_P.safetyvoltage_Value;

    /* DiscreteIntegrator: '<S93>/RampUpOrDown' */
    rtb_RampUpOrDown_n = controller13_DW.RampUpOrDown_DSTATE_j;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Sum: '<S94>/Add2' incorporates:
     *  Constant: '<S94>/phase offset'
     *  DiscreteIntegrator: '<S94>/omega*t'
     *  Gain: '<S94>/Gain1'
     *  Gain: '<S94>/deg to rad'
     *  Product: '<S94>/signal with gain1'
     *  Sum: '<S94>/Add1'
     *  Trigonometry: '<S94>/first harmonic'
     *  ZeroOrderHold: '<S94>/Zero-Order Hold'
     */
    controller13_B.Add2_l = cos(controller13_P.degtorad_Gain_f *
      controller13_P.phaseoffset_Value_k + controller13_DW.omegat_DSTATE_d) *
      controller13_P.Gain1_Gain_do * controller13_B.half1[3] +
      controller13_B.half1[3];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Gain: '<S6>/Gain2' incorporates:
     *  Constant: '<S108>/ground'
     *  MinMax: '<S108>/MaxOf'
     *  MinMax: '<S108>/MinOf'
     *  Product: '<S93>/OutputWithRamping'
     */
    controller13_B.Gain2 = fmax(fmin(rtb_RandomNumber1, rtb_RampUpOrDown_n *
      controller13_B.Add2_c), controller13_P.ground_Value_b) *
      controller13_P.Gain2_Gain;

    /* Gain: '<S6>/Gain3' incorporates:
     *  Constant: '<Root>/safety voltage'
     *  Constant: '<S114>/ground'
     *  DiscreteIntegrator: '<S115>/SaturatingRamp'
     *  DiscreteIntegrator: '<S94>/RampUpOrDown'
     *  MinMax: '<S114>/MaxOf'
     *  MinMax: '<S114>/MinOf'
     *  Product: '<S115>/Product'
     *  Product: '<S94>/OutputWithRamping'
     */
    controller13_B.Gain3 = fmax(fmin(controller13_DW.SaturatingRamp_DSTATE_e *
      controller13_P.safetyvoltage_Value, controller13_DW.RampUpOrDown_DSTATE_d *
      controller13_B.Add2_l), controller13_P.ground_Value_l) *
      controller13_P.Gain3_Gain;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* ToAsyncQueueBlock generated from: '<S1>/Mux1' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.exitflag;
        int32_T size = 1*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(2071098479U, time, pData, size);
      }
    }

    /* SignalConversion generated from: '<S1>/Mux' */
    controller13_B.raw_tf[0] = controller13_B.cmd_B_torque[0];
    controller13_B.raw_tf[1] = controller13_B.cmd_B_torque[1];
    controller13_B.raw_tf[2] = controller13_B.cmd_B_torque[2];
    controller13_B.raw_tf[3] = controller13_B.NMPCF;

    /* ToAsyncQueueBlock generated from: '<S1>/Mux' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.raw_tf[0];
        int32_T size = 4*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(2760311770U, time, pData, size);
      }
    }

    /* Switch: '<S12>/Switch7' incorporates:
     *  Constant: '<S12>/Constant'
     */
    if (controller13_P.Constant_Value_e > controller13_P.Switch7_Threshold) {
      /* Switch: '<S12>/Switch7' incorporates:
       *  Constant: '<S12>/F_ext_const'
       */
      controller13_B.Switch7[0] = controller13_P.F_ext_const_Value[0];
      controller13_B.Switch7[1] = controller13_P.F_ext_const_Value[1];
      controller13_B.Switch7[2] = controller13_P.F_ext_const_Value[2];
    } else {
      /* Switch: '<S12>/Switch7' */
      controller13_B.Switch7[0] = controller13_B.F_ext[0];
      controller13_B.Switch7[1] = controller13_B.F_ext[1];
      controller13_B.Switch7[2] = controller13_B.F_ext[2];
    }

    /* End of Switch: '<S12>/Switch7' */

    /* ToAsyncQueueBlock generated from: '<S1>/observer' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.Switch7[0];
        int32_T size = 3*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(1177430705U, time, pData, size);
      }
    }

    /* ToAsyncQueueBlock generated from: '<S1>/observer' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.Multiply1[0];
        int32_T size = 3*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(2531034977U, time, pData, size);
      }
    }

    /* SignalConversion generated from: '<S1>/observer_mux' */
    controller13_B.observer[0] = controller13_B.Switch_fc[0];
    controller13_B.observer[3] = controller13_B.Switch1_g[0];
    controller13_B.observer[6] = controller13_B.Switch2_k[0];
    controller13_B.observer[1] = controller13_B.Switch_fc[1];
    controller13_B.observer[4] = controller13_B.Switch1_g[1];
    controller13_B.observer[7] = controller13_B.Switch2_k[1];
    controller13_B.observer[2] = controller13_B.Switch_fc[2];
    controller13_B.observer[5] = controller13_B.Switch1_g[2];
    controller13_B.observer[8] = controller13_B.Switch2_k[2];
    memcpy(&controller13_B.observer[9], &controller13_B.Switch4[0], 9U * sizeof
           (real_T));
    controller13_B.observer[18] = controller13_B.Switch5[0];
    controller13_B.observer[19] = controller13_B.Switch5[1];
    controller13_B.observer[20] = controller13_B.Switch5[2];

    /* ToAsyncQueueBlock generated from: '<S1>/observer_mux' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.observer[0];
        int32_T size = 21*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(1636836953U, time, pData, size);
      }
    }

    /* ToAsyncQueueBlock generated from: '<S9>/Learned RTNMPC' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.B_omega_d[0];
        int32_T size = 3*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(4201628703U, time, pData, size);
      }
    }

    /* ToAsyncQueueBlock generated from: '<S9>/Learned RTNMPC' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.f_cmd;
        int32_T size = 1*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(2232818515U, time, pData, size);
      }
    }

    /* Constant: '<S9>/Constant3' */
    controller13_B.Constant3[0] = controller13_P.Constant3_Value[0];
    controller13_B.Constant3[1] = controller13_P.Constant3_Value[1];
    controller13_B.Constant3[2] = controller13_P.Constant3_Value[2];

    /* Gain: '<S26>/att_s' */
    rtb_RampUpOrDown = controller13_P.mdl.f1;

    /* Gain: '<S27>/GainPole' */
    rtb_Gain1 = controller13_P.mdl.zf1;
    for (ibtile = 0; ibtile <= 6; ibtile += 2) {
      /* Gain: '<S26>/att_s' */
      tmp_4 = _mm_loadu_pd(&controller13_B.R_a[ibtile]);
      tmp_4 = _mm_mul_pd(_mm_set1_pd(rtb_RampUpOrDown), tmp_4);

      /* Gain: '<S26>/att_s' */
      _mm_storeu_pd(&controller13_B.att_s[ibtile], tmp_4);

      /* UnitDelay: '<S27>/Delay Input' incorporates:
       *  Gain: '<S26>/att_s'
       */
      tmp_5 = _mm_loadu_pd(&controller13_DW.DelayInput_DSTATE[ibtile]);

      /* UnitDelay: '<S27>/Delay Output' incorporates:
       *  Gain: '<S26>/att_s'
       */
      tmp_3 = _mm_loadu_pd(&controller13_DW.DelayOutput_DSTATE[ibtile]);

      /* Sum: '<S27>/Sum' incorporates:
       *  Gain: '<S26>/att_s'
       *  Gain: '<S27>/GainPole'
       *  Gain: '<S27>/GainZero'
       */
      _mm_storeu_pd(&controller13_B.PoleYk1UkZeroUk1[ibtile], _mm_add_pd
                    (_mm_sub_pd(tmp_4, _mm_mul_pd(_mm_set1_pd
        (controller13_P.filteredderivative_ZeroZ), tmp_5)), _mm_mul_pd
                     (_mm_set1_pd(rtb_Gain1), tmp_3)));
    }

    for (ibtile = 8; ibtile < 9; ibtile++) {
      /* Gain: '<S26>/att_s' */
      rtb_Delay1 = rtb_RampUpOrDown * controller13_B.R_a[ibtile];
      controller13_B.att_s[ibtile] = rtb_Delay1;

      /* Sum: '<S27>/Sum' incorporates:
       *  Gain: '<S27>/GainPole'
       *  Gain: '<S27>/GainZero'
       *  UnitDelay: '<S27>/Delay Input'
       *  UnitDelay: '<S27>/Delay Output'
       */
      controller13_B.PoleYk1UkZeroUk1[ibtile] = (rtb_Delay1 -
        controller13_P.filteredderivative_ZeroZ *
        controller13_DW.DelayInput_DSTATE[ibtile]) + rtb_Gain1 *
        controller13_DW.DelayOutput_DSTATE[ibtile];
    }

    /* MATLAB Function: '<S12>/Rotm2rpy1' */
    controller13_DW.sfEvent_ls = controller13_CALL_EVENT_l;
    rtb_ixj = controller13_B.Switch4[8] * controller13_B.Switch4[8] +
      controller13_B.Switch4[5] * controller13_B.Switch4[5];
    singular = (rtb_ixj < 2.2204460492503131E-15);
    rtb_ixj = sqrt(rtb_ixj);
    controller13_B.rpy[0] = rt_atan2d_snf(controller13_B.Switch4[1],
      controller13_B.Switch4[0]);
    controller13_B.rpy[1] = rt_atan2d_snf(-controller13_B.Switch4[2], rtb_ixj);
    controller13_B.rpy[2] = rt_atan2d_snf(controller13_B.Switch4[5],
      controller13_B.Switch4[8]);
    if (singular) {
      idxFillStart = 0;
      for (ibtile = 0; ibtile < 1; ibtile++) {
        idxFillStart++;
      }

      b_size_idx_0 = idxFillStart;
      idxFillStart = 0;
      csz_idx_2 = 0;
      for (ibtile = 0; ibtile < 1; ibtile++) {
        csz_idx_2 = idxFillStart + 1;
        idxFillStart++;
      }

      if (csz_idx_2 - 1 >= 0) {
        y_data = -controller13_B.Switch4[3];
      }

      idxFillStart = 0;
      for (ibtile = 0; ibtile < 1; ibtile++) {
        idxFillStart++;
      }

      if (csz_idx_2 <= idxFillStart) {
        csz_idx_2_0 = (int8_T)csz_idx_2;
      } else {
        csz_idx_2_0 = 0;
      }

      if (csz_idx_2_0 - 1 >= 0) {
        varargin_1_data = rt_atan2d_snf(y_data, controller13_B.Switch4[4]);
      }

      idxFillStart = 0;
      for (ibtile = 0; ibtile < 1; ibtile++) {
        idxFillStart++;
      }

      y_size[0] = 1;
      y_size[1] = 1;
      y_size[2] = idxFillStart;
      if (idxFillStart - 1 >= 0) {
        y_data = -controller13_B.Switch4[2];
      }

      if (b_size_idx_0 == idxFillStart) {
        reshapes[1].f1.size[2] = idxFillStart;
        if (idxFillStart - 1 >= 0) {
          reshapes[1].f1.data = rt_atan2d_snf(y_data, rtb_ixj);
        }
      } else {
        rtb_ixj_size[0] = 1;
        rtb_ixj_size[1] = 1;
        rtb_ixj_size[2] = b_size_idx_0;
        if (b_size_idx_0 - 1 >= 0) {
          rtb_ixj_data = rtb_ixj;
        }

        controller13_expand_atan2(&y_data, y_size, &rtb_ixj_data, rtb_ixj_size,
          &reshapes[1].f1.data, reshapes[1].f1.size);
      }

      if (csz_idx_2_0 - 1 >= 0) {
        controller13_B.rpy[0] = varargin_1_data;
      }

      if (reshapes[1].f1.size[2] - 1 >= 0) {
        controller13_B.rpy[1] = reshapes[1].f1.data;
      }

      controller13_B.rpy[2] = 0.0;
    }

    controller13_B.rpy[0] = -controller13_B.rpy[0];
    controller13_B.rpy[1] = -controller13_B.rpy[1];
    controller13_B.rpy[2] = -controller13_B.rpy[2];
    rtb_sincos_o1_0 = controller13_B.rpy[0];
    controller13_B.rpy[0] = controller13_B.rpy[2];
    controller13_B.rpy[2] = rtb_sincos_o1_0;

    /* End of MATLAB Function: '<S12>/Rotm2rpy1' */
    /* ToAsyncQueueBlock generated from: '<S32>/bee units to SI1' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.sf_beeunitstoSI1.s_si[0];
        int32_T size = 19*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(815409451U, time, pData, size);
      }
    }

    /* ToAsyncQueueBlock generated from: '<S32>/bee units to SI' */
    if (rtmIsMajorTimeStep(controller13_M)) {
      {
        double time = controller13_M->Timing.t[2];
        void *pData = (void *)&controller13_B.sf_beeunitstoSI.s_si[0];
        int32_T size = 19*sizeof(real_T);
        sendToAsyncQueueTgtAppSvc(2745473061U, time, pData, size);
      }
    }

    /* MATLAB Function: '<S32>/bee cov to SI cov' */
    controller13_DW.sfEvent_lp = controller13_CALL_EVENT_l;
    for (ibtile = 0; ibtile < 18; ibtile++) {
      for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
        m[idxFillStart + 18 * ibtile] = rtb_Delay_h[18 * idxFillStart + ibtile];
      }
    }

    for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
      rtb_sincos_o1_0 = m[18 * idxFillStart + idxFillStart];
      next_s_dp[idxFillStart] = rtb_sincos_o1_0;
      s_dp[idxFillStart] = rtb_sincos_o1_0;
    }

    s_dp[0] = next_s_dp[0] / 100.0;
    s_dp[6] = next_s_dp[6] / 100.0;
    s_dp[12] = next_s_dp[12] / 1.0E+8;
    s_dp[15] = next_s_dp[15] / 1.0E+10;
    s_dp[1] = next_s_dp[1] / 100.0;
    s_dp[7] = next_s_dp[7] / 100.0;
    s_dp[13] = next_s_dp[13] / 1.0E+8;
    s_dp[16] = next_s_dp[16] / 1.0E+10;
    s_dp[2] = next_s_dp[2] / 100.0;
    s_dp[8] = next_s_dp[8] / 100.0;
    s_dp[14] = next_s_dp[14] / 1.0E+8;
    s_dp[17] = next_s_dp[17] / 1.0E+10;
    memset(&m[0], 0, 324U * sizeof(real_T));
    for (ibtile = 0; ibtile < 18; ibtile++) {
      m[ibtile + 18 * ibtile] = s_dp[ibtile];
    }

    for (ibtile = 0; ibtile < 18; ibtile++) {
      for (idxFillStart = 0; idxFillStart < 18; idxFillStart++) {
        controller13_B.P_flat_si[idxFillStart + 18 * ibtile] = m[18 *
          idxFillStart + ibtile];
      }
    }

    /* End of MATLAB Function: '<S32>/bee cov to SI cov' */
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Delay: '<Root>/Delay3' */
    rtb_Delay3_o = controller13_DW.Delay3_DSTATE_f[0];
  }

  /* Integrator: '<S40>/ub,vb,wb' incorporates:
   *  Math: '<S40>/Transpose'
   */
  /* Unit Conversion - from: m/s to: m/s
     Expression: output = (1*input) + (0) */
  rtb_RampUpOrDown = controller13_X.ubvbwb_CSTATE[1];
  rtb_Gain1 = controller13_X.ubvbwb_CSTATE[0];
  rtb_Delay1 = controller13_X.ubvbwb_CSTATE[2];
  for (ibtile = 0; ibtile <= 0; ibtile += 2) {
    /* Math: '<S40>/Transpose' */
    tmp_4 = _mm_loadu_pd(&Transpose_tmp[ibtile + 3]);
    tmp_5 = _mm_loadu_pd(&Transpose_tmp[ibtile]);
    tmp_3 = _mm_loadu_pd(&Transpose_tmp[ibtile + 6]);

    /* Integrator: '<S40>/ub,vb,wb' */
    tmp_4 = _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4, _mm_set1_pd(rtb_RampUpOrDown)),
      _mm_mul_pd(tmp_5, _mm_set1_pd(rtb_Gain1))), _mm_mul_pd(tmp_3, _mm_set1_pd
      (rtb_Delay1)));

    /* Product: '<S49>/Product' incorporates:
     *  Math: '<S40>/Transpose'
     */
    _mm_storeu_pd(&controller13_B.Product_f[ibtile], tmp_4);

    /* UnitConversion: '<S47>/Unit Conversion' incorporates:
     *  Math: '<S40>/Transpose'
     */
    _mm_storeu_pd(&controller13_B.UnitConversion[ibtile], tmp_4);
  }

  for (ibtile = 2; ibtile < 3; ibtile++) {
    /* Product: '<S49>/Product' incorporates:
     *  Integrator: '<S40>/ub,vb,wb'
     *  Math: '<S40>/Transpose'
     */
    rtb_RandomNumber2 = (Transpose_tmp[ibtile + 3] * rtb_RampUpOrDown +
                         Transpose_tmp[ibtile] * rtb_Gain1) +
      Transpose_tmp[ibtile + 6] * rtb_Delay1;
    controller13_B.Product_f[ibtile] = rtb_RandomNumber2;

    /* UnitConversion: '<S47>/Unit Conversion' incorporates:
     *  Product: '<S49>/Product'
     */
    controller13_B.UnitConversion[ibtile] = rtb_RandomNumber2;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Lookup_n-D: '<S2>/Nemo Bee 2' */
    rtb_sincos_o1_0 = look1_binlxpw(0.0, controller13_P.lut.v1,
      controller13_P.lut.T1, 1100U);

    /* Saturate: '<S2>/Saturation5' */
    if (rtb_sincos_o1_0 > controller13_P.Saturation5_UpperSat) {
      rtb_sincos_o1_0 = controller13_P.Saturation5_UpperSat;
    } else if (rtb_sincos_o1_0 < controller13_P.Saturation5_LowerSat) {
      rtb_sincos_o1_0 = controller13_P.Saturation5_LowerSat;
    }

    /* Lookup_n-D: '<S2>/Nemo Bee 4' */
    rtb_kxj = look1_binlxpw(0.0, controller13_P.lut.v2, controller13_P.lut.T2,
      1250U);

    /* Saturate: '<S2>/Saturation6' */
    if (rtb_kxj > controller13_P.Saturation6_UpperSat) {
      rtb_kxj = controller13_P.Saturation6_UpperSat;
    } else if (rtb_kxj < controller13_P.Saturation6_LowerSat) {
      rtb_kxj = controller13_P.Saturation6_LowerSat;
    }

    /* Lookup_n-D: '<S2>/Nemo Bee 3' */
    rtb_ixj = look1_binlxpw(0.0, controller13_P.lut.v3, controller13_P.lut.T3,
      1100U);

    /* Saturate: '<S2>/Saturation7' */
    if (rtb_ixj > controller13_P.Saturation7_UpperSat) {
      rtb_ixj = controller13_P.Saturation7_UpperSat;
    } else if (rtb_ixj < controller13_P.Saturation7_LowerSat) {
      rtb_ixj = controller13_P.Saturation7_LowerSat;
    }

    /* Lookup_n-D: '<S2>/Nemo Bee 1' */
    rtb_ixk = look1_binlxpw(0.0, controller13_P.lut.v4, controller13_P.lut.T4,
      1200U);

    /* Saturate: '<S2>/Saturation8' */
    if (rtb_ixk > controller13_P.Saturation8_UpperSat) {
      rtb_ixk = controller13_P.Saturation8_UpperSat;
    } else if (rtb_ixk < controller13_P.Saturation8_LowerSat) {
      rtb_ixk = controller13_P.Saturation8_LowerSat;
    }

    /* MATLAB Function: '<S2>/power_distribution_1' incorporates:
     *  Saturate: '<S2>/Saturation5'
     *  Saturate: '<S2>/Saturation6'
     *  Saturate: '<S2>/Saturation7'
     *  Saturate: '<S2>/Saturation8'
     */
    controller13_DW.sfEvent_j = controller13_CALL_EVENT_l;
    controller13_B.torque[0] = (((-rtb_sincos_o1_0 + rtb_kxj) + rtb_ixj) -
      rtb_ixk) * controller13_P.rbt.lt * 9.81E-6;
    controller13_B.torque[1] = (((-rtb_sincos_o1_0 - rtb_kxj) + rtb_ixj) +
      rtb_ixk) * controller13_P.rbt.ld * 9.81E-6;
    controller13_B.torque[2] = 0.0;
    controller13_B.thrust = (((rtb_sincos_o1_0 + rtb_kxj) + rtb_ixj) + rtb_ixk) *
      9.81E-6;
  }

  /* Product: '<S68>/Product' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   */
  rtb_kxj = controller13_X.q0q1q2q3_CSTATE[0] / rtb_jxi_tmp;

  /* Product: '<S68>/Product1' incorporates:
   *  Integrator: '<S42>/q0 q1 q2 q3'
   */
  rtb_ixk = controller13_X.q0q1q2q3_CSTATE[1] / rtb_jxi_tmp;

  /* Fcn: '<S51>/fcn2' incorporates:
   *  Fcn: '<S51>/fcn5'
   */
  rtb_jxi_tmp = rtb_kxj * rtb_kxj;
  rtb_Gain1 = rtb_ixk * rtb_ixk;

  /* Trigonometry: '<S67>/Trigonometric Function1' incorporates:
   *  Concatenate: '<S67>/Vector Concatenate'
   *  Fcn: '<S51>/fcn1'
   *  Fcn: '<S51>/fcn2'
   */
  controller13_B.VectorConcatenate[0] = rt_atan2d_snf((rtb_ixk * q0_tmp +
    rtb_kxj * q0_tmp_0) * 2.0, ((rtb_jxi_tmp + rtb_Gain1) -
    rtb_VectorConcatenate_tmp_tmp) - rtb_VectorConcatenate_tmp_tmp_0);

  /* Fcn: '<S51>/fcn3' */
  rtb_RampUpOrDown = (rtb_ixk * q0_tmp_0 - rtb_kxj * q0_tmp) * -2.0;

  /* If: '<S69>/If' */
  if (rtsiIsModeUpdateTimeStep(&controller13_M->solverInfo)) {
    if (rtb_RampUpOrDown > 1.0) {
      csz_idx_2_0 = 0;
    } else if (rtb_RampUpOrDown < -1.0) {
      csz_idx_2_0 = 1;
    } else {
      csz_idx_2_0 = 2;
    }

    controller13_DW.If_ActiveSubsystem = csz_idx_2_0;
  } else {
    csz_idx_2_0 = controller13_DW.If_ActiveSubsystem;
  }

  switch (csz_idx_2_0) {
   case 0:
    /* Outputs for IfAction SubSystem: '<S69>/If Action Subsystem' incorporates:
     *  ActionPort: '<S70>/Action Port'
     */
    if (rtmIsMajorTimeStep(controller13_M) &&
        controller13_M->Timing.TaskCounters.TID[1] == 0) {
      /* Merge: '<S69>/Merge' incorporates:
       *  Constant: '<S70>/Constant'
       */
      controller13_B.Merge = controller13_P.Constant_Value_d;
    }

    if (rtsiIsModeUpdateTimeStep(&controller13_M->solverInfo)) {
      srUpdateBC(controller13_DW.IfActionSubsystem_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S69>/If Action Subsystem' */
    break;

   case 1:
    /* Outputs for IfAction SubSystem: '<S69>/If Action Subsystem1' incorporates:
     *  ActionPort: '<S71>/Action Port'
     */
    if (rtmIsMajorTimeStep(controller13_M) &&
        controller13_M->Timing.TaskCounters.TID[1] == 0) {
      /* Merge: '<S69>/Merge' incorporates:
       *  Constant: '<S71>/Constant'
       */
      controller13_B.Merge = controller13_P.Constant_Value_b;
    }

    if (rtsiIsModeUpdateTimeStep(&controller13_M->solverInfo)) {
      srUpdateBC(controller13_DW.IfActionSubsystem1_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S69>/If Action Subsystem1' */
    break;

   default:
    /* Outputs for IfAction SubSystem: '<S69>/If Action Subsystem2' incorporates:
     *  ActionPort: '<S72>/Action Port'
     */
    /* Merge: '<S69>/Merge' incorporates:
     *  SignalConversion generated from: '<S72>/In'
     */
    controller13_B.Merge = rtb_RampUpOrDown;
    if (rtsiIsModeUpdateTimeStep(&controller13_M->solverInfo)) {
      srUpdateBC(controller13_DW.IfActionSubsystem2_SubsysRanBC);
    }

    /* End of Outputs for SubSystem: '<S69>/If Action Subsystem2' */
    break;
  }

  /* End of If: '<S69>/If' */

  /* Trigonometry: '<S67>/trigFcn' incorporates:
   *  Concatenate: '<S67>/Vector Concatenate'
   */
  if (controller13_B.Merge > 1.0) {
    rtb_sincos_o1_0 = 1.0;
  } else if (controller13_B.Merge < -1.0) {
    rtb_sincos_o1_0 = -1.0;
  } else {
    rtb_sincos_o1_0 = controller13_B.Merge;
  }

  controller13_B.VectorConcatenate[1] = asin(rtb_sincos_o1_0);

  /* End of Trigonometry: '<S67>/trigFcn' */

  /* Trigonometry: '<S67>/Trigonometric Function3' incorporates:
   *  Concatenate: '<S67>/Vector Concatenate'
   *  Fcn: '<S51>/fcn4'
   *  Fcn: '<S51>/fcn5'
   */
  controller13_B.VectorConcatenate[2] = rt_atan2d_snf((rtb_kxj * rtb_ixk +
    rtb_VectorConcatenate_tmp_tmp_1) * 2.0, ((rtb_jxi_tmp - rtb_Gain1) -
    rtb_VectorConcatenate_tmp_tmp) + rtb_VectorConcatenate_tmp_tmp_0);
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
  }

  /* Integrator: '<S40>/p,q,r ' */
  controller13_B.pqr[0] = controller13_X.pqr_CSTATE[0];
  controller13_B.pqr[1] = controller13_X.pqr_CSTATE[1];
  controller13_B.pqr[2] = controller13_X.pqr_CSTATE[2];
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* DigitalClock: '<S2>/Digital Clock4' */
    controller13_B.DigitalClock4 = controller13_M->Timing.t[1];

    /* Switch: '<S2>/Switch17' */
    if (controller13_B.DigitalClock4 > controller13_P.Switch17_Threshold) {
      /* Switch: '<S2>/Switch3' incorporates:
       *  Constant: '<S2>/Constant11'
       *  Constant: '<S2>/disturbance enable'
       *  RandomNumber: '<S2>/Random Number3'
       */
      if (controller13_P.disturbanceenable_Value >=
          controller13_P.Switch3_Threshold) {
        rtb_sincos_o1_0 = controller13_DW.NextOutput;
      } else {
        rtb_sincos_o1_0 = controller13_P.Constant11_Value[0];
      }

      /* Switch: '<S2>/Switch17' incorporates:
       *  Sum: '<S2>/Add1'
       *  Switch: '<S2>/Switch3'
       */
      controller13_B.Switch17_h[0] = controller13_B.torque[0] + rtb_sincos_o1_0;

      /* Switch: '<S2>/Switch3' incorporates:
       *  Constant: '<S2>/Constant11'
       *  Constant: '<S2>/disturbance enable'
       *  RandomNumber: '<S2>/Random Number4'
       */
      if (controller13_P.disturbanceenable_Value >=
          controller13_P.Switch3_Threshold) {
        rtb_sincos_o1_0 = controller13_DW.NextOutput_e;
      } else {
        rtb_sincos_o1_0 = controller13_P.Constant11_Value[1];
      }

      /* Switch: '<S2>/Switch17' incorporates:
       *  Sum: '<S2>/Add1'
       *  Switch: '<S2>/Switch3'
       */
      controller13_B.Switch17_h[1] = controller13_B.torque[1] + rtb_sincos_o1_0;

      /* Switch: '<S2>/Switch3' incorporates:
       *  Constant: '<S2>/Constant11'
       *  Constant: '<S2>/disturbance enable'
       *  RandomNumber: '<S2>/Random Number5'
       */
      if (controller13_P.disturbanceenable_Value >=
          controller13_P.Switch3_Threshold) {
        rtb_sincos_o1_0 = controller13_DW.NextOutput_h;
      } else {
        rtb_sincos_o1_0 = controller13_P.Constant11_Value[2];
      }

      /* Switch: '<S2>/Switch17' incorporates:
       *  Sum: '<S2>/Add1'
       *  Switch: '<S2>/Switch3'
       */
      controller13_B.Switch17_h[2] = controller13_B.torque[2] + rtb_sincos_o1_0;
    } else {
      /* Switch: '<S2>/Switch17' incorporates:
       *  Constant: '<S2>/Constant10'
       */
      controller13_B.Switch17_h[0] = controller13_P.Constant10_Value[0];
      controller13_B.Switch17_h[1] = controller13_P.Constant10_Value[1];
      controller13_B.Switch17_h[2] = controller13_P.Constant10_Value[2];
    }

    /* End of Switch: '<S2>/Switch17' */
    for (ibtile = 0; ibtile < 3; ibtile++) {
      /* Concatenate: '<S44>/Vector Concatenate' incorporates:
       *  Constant: '<S44>/Constant1'
       *  Constant: '<S44>/Constant2'
       */
      q0_tmp = controller13_P.uDOFQuaternion_inertia[3 * ibtile];
      rtb_VectorConcatenate_n[6 * ibtile] = q0_tmp;
      q0_tmp_0 = controller13_P.Constant2_Value_n[3 * ibtile];
      rtb_VectorConcatenate_n[6 * ibtile + 3] = q0_tmp_0;

      /* Selector: '<S43>/Selector1' */
      controller13_B.Selector1[3 * ibtile] = q0_tmp_0;

      /* Selector: '<S43>/Selector' */
      controller13_B.Selector[3 * ibtile] = q0_tmp;

      /* Concatenate: '<S44>/Vector Concatenate' incorporates:
       *  Constant: '<S44>/Constant1'
       *  Constant: '<S44>/Constant2'
       *  Selector: '<S43>/Selector'
       *  Selector: '<S43>/Selector1'
       */
      idxFillStart = 3 * ibtile + 1;
      q0_tmp = controller13_P.uDOFQuaternion_inertia[idxFillStart];
      rtb_VectorConcatenate_n[6 * ibtile + 1] = q0_tmp;
      q0_tmp_0 = controller13_P.Constant2_Value_n[idxFillStart];
      rtb_VectorConcatenate_n[6 * ibtile + 4] = q0_tmp_0;

      /* Selector: '<S43>/Selector1' */
      controller13_B.Selector1[idxFillStart] = q0_tmp_0;

      /* Selector: '<S43>/Selector' */
      controller13_B.Selector[idxFillStart] = q0_tmp;

      /* Concatenate: '<S44>/Vector Concatenate' incorporates:
       *  Constant: '<S44>/Constant1'
       *  Constant: '<S44>/Constant2'
       *  Selector: '<S43>/Selector'
       *  Selector: '<S43>/Selector1'
       */
      idxFillStart = 3 * ibtile + 2;
      q0_tmp = controller13_P.uDOFQuaternion_inertia[idxFillStart];
      rtb_VectorConcatenate_n[6 * ibtile + 2] = q0_tmp;
      q0_tmp_0 = controller13_P.Constant2_Value_n[idxFillStart];
      rtb_VectorConcatenate_n[6 * ibtile + 5] = q0_tmp_0;

      /* Selector: '<S43>/Selector1' */
      controller13_B.Selector1[idxFillStart] = q0_tmp_0;

      /* Selector: '<S43>/Selector' */
      controller13_B.Selector[idxFillStart] = q0_tmp;
    }
  }

  /* Product: '<S76>/Product' incorporates:
   *  Integrator: '<S40>/p,q,r '
   */
  q0_tmp = controller13_B.pqr[1];
  q0_tmp_0 = controller13_B.pqr[0];
  rtb_RampUpOrDown = controller13_B.pqr[2];
  for (ibtile = 0; ibtile <= 0; ibtile += 2) {
    /* Product: '<S76>/Product' incorporates:
     *  Integrator: '<S40>/p,q,r '
     *  Selector: '<S43>/Selector'
     *  Sum: '<S45>/Sum'
     */
    tmp_4 = _mm_loadu_pd(&controller13_B.Selector[ibtile + 3]);
    tmp_5 = _mm_loadu_pd(&controller13_B.Selector[ibtile]);
    tmp_3 = _mm_loadu_pd(&controller13_B.Selector[ibtile + 6]);
    _mm_storeu_pd(&rtb_sincos_o1[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4,
      _mm_set1_pd(q0_tmp)), _mm_mul_pd(tmp_5, _mm_set1_pd(q0_tmp_0))),
      _mm_mul_pd(tmp_3, _mm_set1_pd(rtb_RampUpOrDown))));
  }

  /* Product: '<S76>/Product' */
  for (ibtile = 2; ibtile < 3; ibtile++) {
    /* Sum: '<S45>/Sum' incorporates:
     *  Integrator: '<S40>/p,q,r '
     *  Selector: '<S43>/Selector'
     */
    rtb_sincos_o1[ibtile] = (controller13_B.Selector[ibtile + 3] * q0_tmp +
      controller13_B.Selector[ibtile] * q0_tmp_0) +
      controller13_B.Selector[ibtile + 6] * rtb_RampUpOrDown;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    for (ibtile = 0; ibtile < 3; ibtile++) {
      /* Selector: '<S43>/Selector2' incorporates:
       *  Concatenate: '<S44>/Vector Concatenate'
       */
      controller13_B.Selector2[3 * ibtile] = rtb_VectorConcatenate_n[6 * ibtile];
      controller13_B.Selector2[3 * ibtile + 1] = rtb_VectorConcatenate_n[6 *
        ibtile + 1];
      controller13_B.Selector2[3 * ibtile + 2] = rtb_VectorConcatenate_n[6 *
        ibtile + 2];
    }
  }

  /* Sum: '<S75>/Sum' incorporates:
   *  Product: '<S78>/i x j'
   *  Product: '<S78>/j x k'
   *  Product: '<S78>/k x i'
   *  Product: '<S79>/i x k'
   *  Product: '<S79>/j x i'
   *  Product: '<S79>/k x j'
   */
  iy[0] = controller13_B.pqr[1] * rtb_sincos_o1[2];
  iy[1] = rtb_sincos_o1[0] * controller13_B.pqr[2];
  iy[2] = controller13_B.pqr[0] * rtb_sincos_o1[1];
  rtb_sincos_o2[0] = rtb_sincos_o1[1] * controller13_B.pqr[2];
  rtb_sincos_o2[1] = controller13_B.pqr[0] * rtb_sincos_o1[2];
  rtb_sincos_o2[2] = rtb_sincos_o1[0] * controller13_B.pqr[1];

  /* Product: '<S77>/Product' incorporates:
   *  Integrator: '<S40>/p,q,r '
   */
  q0_tmp = controller13_B.pqr[1];
  q0_tmp_0 = controller13_B.pqr[0];
  rtb_RampUpOrDown = controller13_B.pqr[2];
  for (ibtile = 0; ibtile <= 0; ibtile += 2) {
    /* Product: '<S77>/Product' incorporates:
     *  Selector: '<S43>/Selector1'
     *  Sum: '<S43>/Sum2'
     */
    tmp_4 = _mm_loadu_pd(&controller13_B.Selector1[ibtile + 3]);
    tmp_5 = _mm_loadu_pd(&controller13_B.Selector1[ibtile]);
    tmp_3 = _mm_loadu_pd(&controller13_B.Selector1[ibtile + 6]);

    /* Sum: '<S43>/Sum2' */
    tmp_2 = _mm_loadu_pd(&controller13_B.Switch17_h[ibtile]);

    /* Sum: '<S75>/Sum' incorporates:
     *  Sum: '<S43>/Sum2'
     */
    tmp_0 = _mm_loadu_pd(&iy[ibtile]);
    tmp_1 = _mm_loadu_pd(&rtb_sincos_o2[ibtile]);

    /* Sum: '<S43>/Sum2' incorporates:
     *  Integrator: '<S40>/p,q,r '
     *  Product: '<S77>/Product'
     */
    _mm_storeu_pd(&next_p_sigma_i[ibtile], _mm_sub_pd(_mm_sub_pd(tmp_2,
      _mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4, _mm_set1_pd(q0_tmp)), _mm_mul_pd
      (tmp_5, _mm_set1_pd(q0_tmp_0))), _mm_mul_pd(tmp_3, _mm_set1_pd
      (rtb_RampUpOrDown)))), _mm_sub_pd(tmp_0, tmp_1)));
  }

  for (ibtile = 2; ibtile < 3; ibtile++) {
    /* Sum: '<S43>/Sum2' incorporates:
     *  Integrator: '<S40>/p,q,r '
     *  Product: '<S77>/Product'
     *  Selector: '<S43>/Selector1'
     *  Sum: '<S75>/Sum'
     */
    next_p_sigma_i[ibtile] = (controller13_B.Switch17_h[ibtile] -
      ((controller13_B.Selector1[ibtile + 3] * q0_tmp +
        controller13_B.Selector1[ibtile] * q0_tmp_0) +
       controller13_B.Selector1[ibtile + 6] * rtb_RampUpOrDown)) - (iy[ibtile] -
      rtb_sincos_o2[ibtile]);
  }

  /* Product: '<S43>/Product2' incorporates:
   *  Reshape: '<S43>/Reshape'
   *  Selector: '<S43>/Selector2'
   */
  rt_mrdivide_U1d1x3_U2d3x3_Yd1x3_snf(next_p_sigma_i, controller13_B.Selector2,
    controller13_B.Reshape);
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Switch: '<S2>/Switch4' incorporates:
     *  Constant: '<S2>/disturbance enable1'
     */
    if (controller13_P.disturbanceenable1_Value >=
        controller13_P.Switch4_Threshold_p) {
      /* Switch: '<S2>/Switch4' incorporates:
       *  RandomNumber: '<S2>/Random Number1'
       *  RandomNumber: '<S2>/Random Number2'
       *  RandomNumber: '<S2>/Random Number6'
       */
      controller13_B.Switch4_o[0] = controller13_DW.NextOutput_o;
      controller13_B.Switch4_o[1] = controller13_DW.NextOutput_c;
      controller13_B.Switch4_o[2] = controller13_DW.NextOutput_b;
    } else {
      /* Switch: '<S2>/Switch4' incorporates:
       *  Constant: '<S2>/Constant9'
       */
      controller13_B.Switch4_o[0] = controller13_P.Constant9_Value[0];
      controller13_B.Switch4_o[1] = controller13_P.Constant9_Value[1];
      controller13_B.Switch4_o[2] = controller13_P.Constant9_Value[2];
    }

    /* End of Switch: '<S2>/Switch4' */

    /* Product: '<S2>/Product1' incorporates:
     *  Constant: '<S2>/Constant2'
     */
    controller13_B.Product1[0] = controller13_B.thrust *
      controller13_P.Constant2_Value_c[0];
    controller13_B.Product1[1] = controller13_B.thrust *
      controller13_P.Constant2_Value_c[1];
    controller13_B.Product1[2] = controller13_B.thrust *
      controller13_P.Constant2_Value_c[2];
  }

  /* Gain: '<S53>/High Gain Quaternion Normalization' incorporates:
   *  Constant: '<S53>/Constant'
   *  DotProduct: '<S53>/Dot Product'
   *  Integrator: '<S42>/q0 q1 q2 q3'
   *  Sum: '<S53>/Sum'
   */
  rtb_RampUpOrDown = (controller13_P.Constant_Value_cc -
                      (((controller13_X.q0q1q2q3_CSTATE[0] *
    controller13_X.q0q1q2q3_CSTATE[0] + controller13_X.q0q1q2q3_CSTATE[1] *
    controller13_X.q0q1q2q3_CSTATE[1]) + controller13_X.q0q1q2q3_CSTATE[2] *
                        controller13_X.q0q1q2q3_CSTATE[2]) +
                       controller13_X.q0q1q2q3_CSTATE[3] *
                       controller13_X.q0q1q2q3_CSTATE[3])) *
    controller13_P.uDOFQuaternion_k_quat;

  /* SignalConversion generated from: '<S42>/q0 q1 q2 q3' incorporates:
   *  Fcn: '<S53>/q0dot'
   *  Fcn: '<S53>/q1dot'
   *  Fcn: '<S53>/q2dot'
   *  Fcn: '<S53>/q3dot'
   *  Integrator: '<S42>/q0 q1 q2 q3'
   */
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[0] = ((controller13_B.pqr
    [0] * controller13_X.q0q1q2q3_CSTATE[1] + controller13_B.pqr[1] *
    controller13_X.q0q1q2q3_CSTATE[2]) + controller13_B.pqr[2] *
    controller13_X.q0q1q2q3_CSTATE[3]) * -0.5 + rtb_RampUpOrDown *
    controller13_X.q0q1q2q3_CSTATE[0];
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[1] =
    ((controller13_X.q0q1q2q3_CSTATE[0] * controller13_B.pqr[0] +
      controller13_X.q0q1q2q3_CSTATE[2] * controller13_B.pqr[2]) -
     controller13_B.pqr[1] * controller13_X.q0q1q2q3_CSTATE[3]) * 0.5 +
    rtb_RampUpOrDown * controller13_X.q0q1q2q3_CSTATE[1];
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[2] =
    ((controller13_X.q0q1q2q3_CSTATE[0] * controller13_B.pqr[1] +
      controller13_B.pqr[0] * controller13_X.q0q1q2q3_CSTATE[3]) -
     controller13_X.q0q1q2q3_CSTATE[1] * controller13_B.pqr[2]) * 0.5 +
    rtb_RampUpOrDown * controller13_X.q0q1q2q3_CSTATE[2];
  controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[3] =
    ((controller13_X.q0q1q2q3_CSTATE[0] * controller13_B.pqr[2] +
      controller13_X.q0q1q2q3_CSTATE[1] * controller13_B.pqr[1]) -
     controller13_B.pqr[0] * controller13_X.q0q1q2q3_CSTATE[2]) * 0.5 +
    rtb_RampUpOrDown * controller13_X.q0q1q2q3_CSTATE[3];

  /* Switch: '<S2>/Switch6' incorporates:
   *  Constant: '<S2>/Constant10'
   */
  if (controller13_B.DigitalClock4 > controller13_P.Switch6_Threshold) {
    /* Gain: '<S2>/Gain10' */
    rtb_ixj = -controller13_P.rsim.rbt.m * controller13_P.mdl.g;

    /* Product: '<S2>/Matrix Multiply1' incorporates:
     *  Constant: '<S2>/Constant1'
     */
    q0_tmp = controller13_P.Constant1_Value[1];
    q0_tmp_0 = controller13_P.Constant1_Value[0];
    rtb_RampUpOrDown = controller13_P.Constant1_Value[2];
    for (ibtile = 0; ibtile <= 0; ibtile += 2) {
      tmp_4 = _mm_loadu_pd(&rtb_VectorConcatenate[ibtile + 3]);
      tmp_5 = _mm_loadu_pd(&rtb_VectorConcatenate[ibtile]);
      tmp_3 = _mm_loadu_pd(&rtb_VectorConcatenate[ibtile + 6]);
      tmp_2 = _mm_loadu_pd(&controller13_B.Switch4_o[ibtile]);
      tmp_0 = _mm_loadu_pd(&controller13_B.Product1[ibtile]);
      _mm_storeu_pd(&rtb_sincos_o1[ibtile], _mm_add_pd(_mm_add_pd(_mm_mul_pd
        (_mm_add_pd(_mm_add_pd(_mm_mul_pd(tmp_4, _mm_set1_pd(q0_tmp)),
        _mm_mul_pd(tmp_5, _mm_set1_pd(q0_tmp_0))), _mm_mul_pd(tmp_3, _mm_set1_pd
        (rtb_RampUpOrDown))), _mm_set1_pd(rtb_ixj)), tmp_2), tmp_0));
    }

    /* Product: '<S2>/Matrix Multiply1' incorporates:
     *  Concatenate: '<S63>/Vector Concatenate'
     *  Constant: '<S2>/Constant1'
     *  Gain: '<S2>/Gain10'
     *  Sum: '<S2>/Sum'
     *  Sum: '<S2>/Sum1'
     */
    for (ibtile = 2; ibtile < 3; ibtile++) {
      rtb_sincos_o1[ibtile] = (((rtb_VectorConcatenate[ibtile + 3] * q0_tmp +
        rtb_VectorConcatenate[ibtile] * q0_tmp_0) + rtb_VectorConcatenate[ibtile
        + 6] * rtb_RampUpOrDown) * rtb_ixj + controller13_B.Switch4_o[ibtile]) +
        controller13_B.Product1[ibtile];
    }
  } else {
    rtb_sincos_o1[0] = controller13_P.Constant10_Value[0];
    rtb_sincos_o1[1] = controller13_P.Constant10_Value[1];
    rtb_sincos_o1[2] = controller13_P.Constant10_Value[2];
  }

  /* End of Switch: '<S2>/Switch6' */

  /* Sum: '<S40>/Sum' incorporates:
   *  Constant: '<S44>/Constant'
   *  Integrator: '<S40>/ub,vb,wb'
   *  Product: '<S40>/Product'
   *  Product: '<S80>/i x j'
   *  Product: '<S80>/j x k'
   *  Product: '<S80>/k x i'
   *  Product: '<S81>/i x k'
   *  Product: '<S81>/j x i'
   *  Product: '<S81>/k x j'
   *  Sum: '<S45>/Sum'
   */
  controller13_B.Sum[0] = (controller13_X.ubvbwb_CSTATE[1] * controller13_B.pqr
    [2] - controller13_B.pqr[1] * controller13_X.ubvbwb_CSTATE[2]) +
    rtb_sincos_o1[0] / controller13_P.uDOFQuaternion_mass_0;
  controller13_B.Sum[1] = (controller13_B.pqr[0] * controller13_X.ubvbwb_CSTATE
    [2] - controller13_X.ubvbwb_CSTATE[0] * controller13_B.pqr[2]) +
    rtb_sincos_o1[1] / controller13_P.uDOFQuaternion_mass_0;
  controller13_B.Sum[2] = (controller13_X.ubvbwb_CSTATE[0] * controller13_B.pqr
    [1] - controller13_B.pqr[0] * controller13_X.ubvbwb_CSTATE[1]) +
    rtb_sincos_o1[2] / controller13_P.uDOFQuaternion_mass_0;
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* MATLAB Function: '<S82>/envelope check' */
    controller13_DW.sfEvent_k = controller13_CALL_EVENT_l;
    if ((fabs(controller13_B.Switch[0]) >
         controller13_P.ctr.safety.enableZone.xmax) || (fabs
         (controller13_B.Switch[1]) > controller13_P.ctr.safety.enableZone.ymax)
        || (fabs(controller13_B.Switch[2]) >
            controller13_P.ctr.safety.enableZone.zmax)) {
      controller13_B.en_o = 0.0;
    } else {
      controller13_B.en_o = 1.0;
    }

    /* End of MATLAB Function: '<S82>/envelope check' */

    /* DataTypeConversion: '<S82>/Data Type Conversion' */
    controller13_B.DataTypeConversion = (uint8_T)(int32_T)controller13_B.en_o;

    /* RelationalOperator: '<S84>/Compare' incorporates:
     *  Constant: '<S84>/Constant'
     */
    controller13_B.Compare = (uint8_T)(controller13_B.Switch[2] >=
      controller13_P.CompareToConstant1_const);

    /* RelationalOperator: '<S86>/Compare' incorporates:
     *  Constant: '<S86>/Constant'
     *  Sum: '<S82>/total'
     */
    controller13_B.Compare_b = (uint8_T)(((((controller13_B.Switch[0] +
      controller13_B.Switch[1]) + controller13_B.Switch[2]) +
      controller13_B.Switch[3]) + controller13_B.Switch[4]) +
      controller13_B.Switch[5] != controller13_P.Constant_Value_a);

    /* RelationalOperator: '<S83>/Compare' incorporates:
     *  Constant: '<S83>/Constant'
     *  Product: '<S82>/times'
     *  Trigonometry: '<S82>/c_x'
     *  Trigonometry: '<S82>/c_y'
     */
    controller13_B.Compare_d = (uint8_T)(cos(controller13_B.Switch[3]) * cos
      (controller13_B.Switch[4]) > controller13_P.CompareToConstant_const);
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* MATLAB Function: '<S88>/landing_cond' */
    controller13_DW.sfEvent_c = controller13_CALL_EVENT_l;
    controller13_B.en_e = 1.0;

    /* DataTypeConversion: '<S82>/Data Type Conversion4' */
    controller13_B.DataTypeConversion4 = 1U;

    /* MATLAB Function: '<S82>/voltage check' incorporates:
     *  SignalConversion generated from: '<S89>/ SFunction '
     */
    controller13_DW.sfEvent_l = controller13_CALL_EVENT_l;
    for (ibtile = 0; ibtile < 4; ibtile++) {
      rtb_sincos_o1_0 = controller13_P.ctr.safety.volt[ibtile];
      nz[ibtile] = (int8_T)((((K13 > rtb_sincos_o1_0) + (K12 > rtb_sincos_o1_0))
        + (K14 > rtb_sincos_o1_0)) + (K23 > rtb_sincos_o1_0));
    }

    singular = true;
    csz_idx_2 = 0;
    exitg1 = false;
    while ((!exitg1) && (csz_idx_2 < 4)) {
      if (nz[csz_idx_2] <= 0) {
        singular = false;
        exitg1 = true;
      } else {
        csz_idx_2++;
      }
    }

    controller13_B.en = !singular;

    /* End of MATLAB Function: '<S82>/voltage check' */

    /* DataTypeConversion: '<S82>/Data Type Conversion1' */
    controller13_B.DataTypeConversion1 = (uint8_T)(int32_T)controller13_B.en;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* MATLAB Function: '<S82>/MATLAB Function' incorporates:
     *  Delay: '<S82>/Delay'
     *  Delay: '<S82>/Delay1'
     *  Product: '<S82>/OutputWithRamping1'
     */
    controller13_DW.sfEvent_f = controller13_CALL_EVENT_l;
    if (controller13_B.en_o * controller13_B.en_e * (real_T)
        controller13_B.Compare * (real_T)controller13_B.Compare_b * (real_T)
        controller13_B.Compare_d * controller13_B.en == 0.0) {
      rtb_RampUpOrDown = controller13_DW.Delay_DSTATE_j + controller13_P.mdl.T;
    } else {
      rtb_RampUpOrDown = 0.0;
    }

    controller13_B.en_out = ((!(rtb_RampUpOrDown > controller13_P.ctr.safety.T))
      && (!(controller13_DW.Delay1_DSTATE_a == 0.0)));
    controller13_B.cum_out = rtb_RampUpOrDown;

    /* End of MATLAB Function: '<S82>/MATLAB Function' */
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* Switch: '<S4>/height to enable control1' incorporates:
     *  DiscreteIntegrator: '<S4>/Discrete-Time Integrator1'
     */
    if (controller13_DW.DiscreteTimeIntegrator1_DSTATE >
        controller13_P.heighttoenablecontrol1_Threshold) {
      /* Switch: '<S4>/height to enable control1' incorporates:
       *  Constant: '<S4>/Constant34'
       */
      controller13_B.heighttoenablecontrol1 = controller13_P.Constant34_Value;
    } else {
      /* Switch: '<S4>/height to enable control1' incorporates:
       *  Constant: '<S4>/Constant35'
       */
      controller13_B.heighttoenablecontrol1 = controller13_P.Constant35_Value;
    }

    /* End of Switch: '<S4>/height to enable control1' */

    /* Switch: '<S4>/Switch9' incorporates:
     *  Constant: '<S4>/Constant21'
     *  Constant: '<S4>/Constant22'
     *  DiscreteIntegrator: '<S4>/Discrete-Time Integrator'
     */
    if (controller13_DW.DiscreteTimeIntegrator_DSTATE >
        controller13_P.mdl.flight_time - 0.01) {
      singular = controller13_P.Constant22_Value;
    } else {
      singular = controller13_P.Constant21_Value;
    }

    /* Product: '<S4>/Product' incorporates:
     *  Switch: '<S4>/Switch9'
     */
    controller13_B.jumpingcontrolenable = controller13_B.heighttoenablecontrol1 *
      (real_T)singular;

    /* Sum: '<S4>/Sum of Elements' incorporates:
     *  Delay: '<S4>/Delay'
     *  RelationalOperator: '<S4>/Relational Operator1'
     */
    controller13_B.SumofElements = (((real_T)
      (controller13_B.TmpSignalConversionAtDelayInport1[0] >
       controller13_DW.Delay_DSTATE_g[0]) + (real_T)
      (controller13_B.TmpSignalConversionAtDelayInport1[1] >
       controller13_DW.Delay_DSTATE_g[1])) + (real_T)
      (controller13_B.TmpSignalConversionAtDelayInport1[2] >
       controller13_DW.Delay_DSTATE_g[2])) + (real_T)
      (controller13_B.TmpSignalConversionAtDelayInport1[3] >
       controller13_DW.Delay_DSTATE_g[3]);
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Product: '<Root>/times1' */
    controller13_B.times1 = controller13_B.en_out *
      controller13_B.jumpingcontrolenable * rtb_Delay3_o;

    /* Sum: '<S95>/Add' incorporates:
     *  Constant: '<S95>/Constant'
     *  Constant: '<S98>/Constant'
     *  DataTypeConversion: '<S95>/Data Type Conversion'
     *  Gain: '<S95>/Gain'
     *  RelationalOperator: '<S98>/Compare'
     */
    controller13_B.Add = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_l) * controller13_P.Gain_Gain_m -
      controller13_P.Constant_Value_j;

    /* Sum: '<S99>/Add' incorporates:
     *  Constant: '<S100>/Constant'
     *  Constant: '<S99>/Constant'
     *  DataTypeConversion: '<S99>/Data Type Conversion'
     *  Gain: '<S99>/Gain'
     *  RelationalOperator: '<S100>/Compare'
     */
    controller13_B.Add_i = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_k) * controller13_P.Gain_Gain_k -
      controller13_P.Constant_Value_o;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Gain: '<S91>/2pi' incorporates:
     *  Constant: '<Root>/Flapping Freq (Hz)'
     */
    controller13_B.upi = controller13_P.upi_Gain * controller13_P.ctr.freq_vec[0];

    /* Gain: '<S92>/2pi' incorporates:
     *  Constant: '<Root>/Flapping Freq (Hz)'
     */
    controller13_B.upi_i = controller13_P.upi_Gain_o *
      controller13_P.ctr.freq_vec[1];

    /* Gain: '<S93>/2pi' incorporates:
     *  Constant: '<Root>/Flapping Freq (Hz)'
     */
    controller13_B.upi_k = controller13_P.upi_Gain_b *
      controller13_P.ctr.freq_vec[2];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Sum: '<S101>/Add' incorporates:
     *  Constant: '<S101>/Constant'
     *  Constant: '<S104>/Constant'
     *  DataTypeConversion: '<S101>/Data Type Conversion'
     *  Gain: '<S101>/Gain'
     *  RelationalOperator: '<S104>/Compare'
     */
    controller13_B.Add_l = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_m) * controller13_P.Gain_Gain_j -
      controller13_P.Constant_Value_kj2;

    /* Sum: '<S105>/Add' incorporates:
     *  Constant: '<S105>/Constant'
     *  Constant: '<S106>/Constant'
     *  DataTypeConversion: '<S105>/Data Type Conversion'
     *  Gain: '<S105>/Gain'
     *  RelationalOperator: '<S106>/Compare'
     */
    controller13_B.Add_a = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_p) * controller13_P.Gain_Gain_h3 -
      controller13_P.Constant_Value_jy;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Gain: '<S94>/2pi' incorporates:
     *  Constant: '<Root>/Flapping Freq (Hz)'
     */
    controller13_B.upi_m = controller13_P.upi_Gain_e *
      controller13_P.ctr.freq_vec[3];
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Sum: '<S107>/Add' incorporates:
     *  Constant: '<S107>/Constant'
     *  Constant: '<S110>/Constant'
     *  DataTypeConversion: '<S107>/Data Type Conversion'
     *  Gain: '<S107>/Gain'
     *  RelationalOperator: '<S110>/Compare'
     */
    controller13_B.Add_m = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_c) * controller13_P.Gain_Gain_o -
      controller13_P.Constant_Value_mx;

    /* Sum: '<S111>/Add' incorporates:
     *  Constant: '<S111>/Constant'
     *  Constant: '<S112>/Constant'
     *  DataTypeConversion: '<S111>/Data Type Conversion'
     *  Gain: '<S111>/Gain'
     *  RelationalOperator: '<S112>/Compare'
     */
    controller13_B.Add_f = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_h) * controller13_P.Gain_Gain_o0 -
      controller13_P.Constant_Value_lu;

    /* Sum: '<S113>/Add' incorporates:
     *  Constant: '<S113>/Constant'
     *  Constant: '<S116>/Constant'
     *  DataTypeConversion: '<S113>/Data Type Conversion'
     *  Gain: '<S113>/Gain'
     *  RelationalOperator: '<S116>/Compare'
     */
    controller13_B.Add_p = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_g) * controller13_P.Gain_Gain_ks -
      controller13_P.Constant_Value_mky;

    /* Sum: '<S117>/Add' incorporates:
     *  Constant: '<S117>/Constant'
     *  Constant: '<S118>/Constant'
     *  DataTypeConversion: '<S117>/Data Type Conversion'
     *  Gain: '<S117>/Gain'
     *  RelationalOperator: '<S118>/Compare'
     */
    controller13_B.Add_mt = (real_T)(controller13_B.times1 >
      controller13_P.Constant_Value_kj) * controller13_P.Gain_Gain_p -
      controller13_P.Constant_Value_kv;

    /* S-Function (sldrttet): '<Root>/Execution Time' */
    /* S-Function Block: <Root>/Execution Time */
    {
      RTBIO_DriverIO(INTERNALIO, (IODEVICE) RTBIOTOTALEXECUTIONTIME, IOREAD, 0,
                     0, &controller13_B.ExecutionTime, 0);
    }
  }
}

/* Model update function */
void controller13_update(void)
{
  __m128d tmp;
  __m128d tmp_0;
  real_T mdl;
  int32_T i;
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for DiscreteIntegrator: '<S97>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE +=
      controller13_P.SaturatingRamp_gainval * controller13_B.Add_i;
    if (controller13_DW.SaturatingRamp_DSTATE >=
        controller13_P.SaturatingRamp_UpperSat) {
      controller13_DW.SaturatingRamp_DSTATE =
        controller13_P.SaturatingRamp_UpperSat;
    } else if (controller13_DW.SaturatingRamp_DSTATE <=
               controller13_P.SaturatingRamp_LowerSat) {
      controller13_DW.SaturatingRamp_DSTATE =
        controller13_P.SaturatingRamp_LowerSat;
    }

    /* End of Update for DiscreteIntegrator: '<S97>/SaturatingRamp' */

    /* Update for DiscreteIntegrator: '<S91>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE += controller13_P.RampUpOrDown_gainval *
      controller13_B.Add;
    if (controller13_DW.RampUpOrDown_DSTATE >=
        controller13_P.RampUpOrDown_UpperSat) {
      controller13_DW.RampUpOrDown_DSTATE = controller13_P.RampUpOrDown_UpperSat;
    } else if (controller13_DW.RampUpOrDown_DSTATE <=
               controller13_P.RampUpOrDown_LowerSat) {
      controller13_DW.RampUpOrDown_DSTATE = controller13_P.RampUpOrDown_LowerSat;
    }

    /* End of Update for DiscreteIntegrator: '<S91>/RampUpOrDown' */
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Update for DiscreteIntegrator: '<S91>/omega*t' */
    controller13_DW.omegat_DSTATE += controller13_P.omegat_gainval *
      controller13_B.upi;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* Update for Delay: '<S8>/Delay1' */
    controller13_DW.Delay1_DSTATE = controller13_B.Switch17;

    /* Update for Delay: '<S32>/Delay2' */
    memcpy(&controller13_DW.Delay2_DSTATE[0], &controller13_B.z_raw[0], 13U *
           sizeof(real_T));

    /* Update for Delay: '<S1>/Delay' */
    controller13_DW.Delay_DSTATE = controller13_B.Force;

    /* Update for DiscreteIntegrator: '<S14>/time' incorporates:
     *  Constant: '<S14>/constant'
     */
    controller13_DW.time_DSTATE += controller13_P.time_gainval *
      controller13_P.constant_Value_k;

    /* Update for DiscreteTransferFcn: '<S12>/low pass' */
    controller13_DW.lowpass_states[1] = controller13_DW.lowpass_states[0];
    controller13_DW.lowpass_states[0] = controller13_DW.lowpass_tmp;

    /* Update for Delay: '<S1>/Delay1' */
    controller13_DW.Delay1_DSTATE_l = controller13_B.X_roll;

    /* Update for DiscreteTransferFcn: '<S12>/low pass1' */
    controller13_DW.lowpass1_states[1] = controller13_DW.lowpass1_states[0];
    controller13_DW.lowpass1_states[0] = controller13_DW.lowpass1_tmp;

    /* Update for Delay: '<S1>/Delay2' */
    controller13_DW.Delay2_DSTATE_c = controller13_B.Y_pitch;

    /* Update for DiscreteTransferFcn: '<S12>/low pass2' */
    controller13_DW.lowpass2_states[1] = controller13_DW.lowpass2_states[0];
    controller13_DW.lowpass2_states[0] = controller13_DW.lowpass2_tmp;

    /* Update for Delay: '<S32>/Delay1' */
    memcpy(&controller13_DW.Delay1_DSTATE_i[0], &controller13_B.s_out[0], 19U *
           sizeof(real_T));

    /* Update for Delay: '<S32>/Delay' */
    memcpy(&controller13_DW.Delay_DSTATE_l[0], &controller13_B.P_out_flat[0],
           324U * sizeof(real_T));

    /* Update for Delay: '<S32>/Delay3' */
    controller13_DW.Delay3_DSTATE = controller13_B.is_init_out;

    /* Update for DiscreteTransferFcn: '<S26>/low pass3' */
    mdl = controller13_P.mdl.vlp.d[0];
    for (i = 0; i <= 6; i += 2) {
      /* Update for DiscreteTransferFcn: '<S26>/low pass3' */
      tmp = _mm_loadu_pd(&controller13_DW.lowpass3_states[i]);
      tmp_0 = _mm_loadu_pd(&controller13_B.PoleYk1UkZeroUk1[i]);
      _mm_storeu_pd(&controller13_DW.lowpass3_states[i], _mm_div_pd(_mm_sub_pd
        (tmp_0, _mm_mul_pd(_mm_set1_pd(controller13_P.mdl.vlp.d[1]), tmp)),
        _mm_set1_pd(mdl)));
    }

    /* Update for DiscreteTransferFcn: '<S26>/low pass3' */
    for (i = 8; i < 9; i++) {
      controller13_DW.lowpass3_states[i] = (controller13_B.PoleYk1UkZeroUk1[i] -
        controller13_P.mdl.vlp.d[1] * controller13_DW.lowpass3_states[i]) / mdl;
    }

    /* Update for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[0] = controller13_B.pos_hat[0];

    /* Update for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[0] = controller13_B.vel_hat[0];

    /* Update for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[1] = controller13_B.pos_hat[1];

    /* Update for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[1] = controller13_B.vel_hat[1];

    /* Update for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[2] = controller13_B.pos_hat[2];

    /* Update for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[2] = controller13_B.vel_hat[2];

    /* Update for Delay: '<S23>/Delay2' */
    controller13_DW.Delay2_DSTATE_j = controller13_B.id_out;

    /* Update for Delay: '<S9>/Delay1' */
    controller13_DW.Delay1_DSTATE_p[0] = controller13_B.q_b[0];
    controller13_DW.Delay1_DSTATE_p[1] = controller13_B.q_b[1];
    controller13_DW.Delay1_DSTATE_p[2] = controller13_B.q_b[2];
    controller13_DW.Delay1_DSTATE_p[3] = controller13_B.q_b[3];

    /* Update for Delay: '<S9>/Delay2' */
    controller13_DW.Delay2_DSTATE_o = controller13_B.time;

    /* Update for DiscreteIntegrator: '<S21>/time' incorporates:
     *  Constant: '<S21>/constant'
     */
    controller13_DW.time_DSTATE_o += controller13_P.time_gainval_c *
      controller13_P.constant_Value;

    /* Update for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[0] = controller13_B.r_origin[0];

    /* Update for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[0] += controller13_P.vintegrator_gainval *
      controller13_B.B_omega_d[0];

    /* Update for DiscreteTransferFcn: '<S9>/low pass' */
    controller13_DW.lowpass_states_m[1] = controller13_DW.lowpass_states_m[0];
    controller13_DW.lowpass_states_m[0] = controller13_DW.lowpass_tmp_c[0];

    /* Update for Delay: '<S12>/Delay' */
    controller13_DW.Delay_DSTATE_a[0] = controller13_B.Multiply[0];

    /* Update for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[1] = controller13_B.r_origin[1];

    /* Update for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[1] += controller13_P.vintegrator_gainval *
      controller13_B.B_omega_d[1];

    /* Update for DiscreteTransferFcn: '<S9>/low pass' */
    controller13_DW.lowpass_states_m[3] = controller13_DW.lowpass_states_m[2];
    controller13_DW.lowpass_states_m[2] = controller13_DW.lowpass_tmp_c[1];

    /* Update for Delay: '<S12>/Delay' */
    controller13_DW.Delay_DSTATE_a[1] = controller13_B.Multiply[1];

    /* Update for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[2] = controller13_B.r_origin[2];

    /* Update for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[2] += controller13_P.vintegrator_gainval *
      controller13_B.B_omega_d[2];

    /* Update for DiscreteTransferFcn: '<S9>/low pass' */
    controller13_DW.lowpass_states_m[5] = controller13_DW.lowpass_states_m[4];
    controller13_DW.lowpass_states_m[4] = controller13_DW.lowpass_tmp_c[2];

    /* Update for Delay: '<S12>/Delay' */
    controller13_DW.Delay_DSTATE_a[2] = controller13_B.Multiply[2];

    /* Update for Delay: '<S12>/Delay1' */
    controller13_DW.Delay1_DSTATE_jf[0] = controller13_B.omega_hat[0];
    controller13_DW.Delay1_DSTATE_jf[1] = controller13_B.omega_hat[1];

    /* Update for Delay: '<S8>/Delay' */
    controller13_DW.Delay_DSTATE_at = controller13_B.Switch1_p;

    /* Update for Delay: '<S8>/Delay2' */
    controller13_DW.Delay2_DSTATE_k = controller13_B.Switch2_h;

    /* Update for Delay: '<S8>/Delay3' */
    controller13_DW.Delay3_DSTATE_j = controller13_B.Switch3;
  }

  /* Update for Integrator: '<S42>/q0 q1 q2 q3' */
  controller13_DW.q0q1q2q3_IWORK = 0;
  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for DiscreteIntegrator: '<S103>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_n +=
      controller13_P.SaturatingRamp_gainval_a * controller13_B.Add_a;
    if (controller13_DW.SaturatingRamp_DSTATE_n >=
        controller13_P.SaturatingRamp_UpperSat_e) {
      controller13_DW.SaturatingRamp_DSTATE_n =
        controller13_P.SaturatingRamp_UpperSat_e;
    } else if (controller13_DW.SaturatingRamp_DSTATE_n <=
               controller13_P.SaturatingRamp_LowerSat_p) {
      controller13_DW.SaturatingRamp_DSTATE_n =
        controller13_P.SaturatingRamp_LowerSat_p;
    }

    /* End of Update for DiscreteIntegrator: '<S103>/SaturatingRamp' */

    /* Update for DiscreteIntegrator: '<S92>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_a +=
      controller13_P.RampUpOrDown_gainval_e * controller13_B.Add_l;
    if (controller13_DW.RampUpOrDown_DSTATE_a >=
        controller13_P.RampUpOrDown_UpperSat_o) {
      controller13_DW.RampUpOrDown_DSTATE_a =
        controller13_P.RampUpOrDown_UpperSat_o;
    } else if (controller13_DW.RampUpOrDown_DSTATE_a <=
               controller13_P.RampUpOrDown_LowerSat_k) {
      controller13_DW.RampUpOrDown_DSTATE_a =
        controller13_P.RampUpOrDown_LowerSat_k;
    }

    /* End of Update for DiscreteIntegrator: '<S92>/RampUpOrDown' */

    /* Update for DiscreteIntegrator: '<S109>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_o +=
      controller13_P.SaturatingRamp_gainval_j * controller13_B.Add_f;
    if (controller13_DW.SaturatingRamp_DSTATE_o >=
        controller13_P.SaturatingRamp_UpperSat_k) {
      controller13_DW.SaturatingRamp_DSTATE_o =
        controller13_P.SaturatingRamp_UpperSat_k;
    } else if (controller13_DW.SaturatingRamp_DSTATE_o <=
               controller13_P.SaturatingRamp_LowerSat_o) {
      controller13_DW.SaturatingRamp_DSTATE_o =
        controller13_P.SaturatingRamp_LowerSat_o;
    }

    /* End of Update for DiscreteIntegrator: '<S109>/SaturatingRamp' */

    /* Update for DiscreteIntegrator: '<S93>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_j +=
      controller13_P.RampUpOrDown_gainval_c * controller13_B.Add_m;
    if (controller13_DW.RampUpOrDown_DSTATE_j >=
        controller13_P.RampUpOrDown_UpperSat_e) {
      controller13_DW.RampUpOrDown_DSTATE_j =
        controller13_P.RampUpOrDown_UpperSat_e;
    } else if (controller13_DW.RampUpOrDown_DSTATE_j <=
               controller13_P.RampUpOrDown_LowerSat_h) {
      controller13_DW.RampUpOrDown_DSTATE_j =
        controller13_P.RampUpOrDown_LowerSat_h;
    }

    /* End of Update for DiscreteIntegrator: '<S93>/RampUpOrDown' */
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Update for DiscreteIntegrator: '<S92>/omega*t' */
    controller13_DW.omegat_DSTATE_p += controller13_P.omegat_gainval_l *
      controller13_B.upi_i;

    /* Update for DiscreteIntegrator: '<S93>/omega*t' */
    controller13_DW.omegat_DSTATE_l += controller13_P.omegat_gainval_d *
      controller13_B.upi_k;

    /* Update for DiscreteIntegrator: '<S94>/omega*t' */
    controller13_DW.omegat_DSTATE_d += controller13_P.omegat_gainval_e *
      controller13_B.upi_m;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for DiscreteIntegrator: '<S115>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_e +=
      controller13_P.SaturatingRamp_gainval_g * controller13_B.Add_mt;
    if (controller13_DW.SaturatingRamp_DSTATE_e >=
        controller13_P.SaturatingRamp_UpperSat_i) {
      controller13_DW.SaturatingRamp_DSTATE_e =
        controller13_P.SaturatingRamp_UpperSat_i;
    } else if (controller13_DW.SaturatingRamp_DSTATE_e <=
               controller13_P.SaturatingRamp_LowerSat_e) {
      controller13_DW.SaturatingRamp_DSTATE_e =
        controller13_P.SaturatingRamp_LowerSat_e;
    }

    /* End of Update for DiscreteIntegrator: '<S115>/SaturatingRamp' */

    /* Update for DiscreteIntegrator: '<S94>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_d +=
      controller13_P.RampUpOrDown_gainval_e1 * controller13_B.Add_p;
    if (controller13_DW.RampUpOrDown_DSTATE_d >=
        controller13_P.RampUpOrDown_UpperSat_c) {
      controller13_DW.RampUpOrDown_DSTATE_d =
        controller13_P.RampUpOrDown_UpperSat_c;
    } else if (controller13_DW.RampUpOrDown_DSTATE_d <=
               controller13_P.RampUpOrDown_LowerSat_c) {
      controller13_DW.RampUpOrDown_DSTATE_d =
        controller13_P.RampUpOrDown_LowerSat_c;
    }

    /* End of Update for DiscreteIntegrator: '<S94>/RampUpOrDown' */

    /* Update for Delay: '<Root>/Delay3' incorporates:
     *  Constant: '<S6>/Constant1'
     */
    controller13_DW.Delay3_DSTATE_f[0] = controller13_DW.Delay3_DSTATE_f[1];
    controller13_DW.Delay3_DSTATE_f[1] = controller13_P.Constant1_Value_e;

    /* Update for RandomNumber: '<S2>/Random Number3' */
    controller13_DW.NextOutput = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed) * sqrt(controller13_P.rsim.dist.wx.var) +
      controller13_P.rsim.dist.wx.mean;

    /* Update for RandomNumber: '<S2>/Random Number4' */
    controller13_DW.NextOutput_e = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_c) * sqrt(controller13_P.rsim.dist.wy.var) +
      controller13_P.rsim.dist.wy.mean;

    /* Update for RandomNumber: '<S2>/Random Number5' */
    controller13_DW.NextOutput_h = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_d) * sqrt(controller13_P.rsim.dist.wz.var) +
      controller13_P.rsim.dist.wz.mean;

    /* Update for RandomNumber: '<S2>/Random Number1' */
    controller13_DW.NextOutput_o = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_k) * sqrt(controller13_P.rsim.dist.y.mean) +
      controller13_P.rsim.dist.x.mean;

    /* Update for RandomNumber: '<S2>/Random Number2' */
    controller13_DW.NextOutput_c = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_n) * sqrt(controller13_P.rsim.dist.y.var) +
      controller13_P.rsim.dist.y.mean;

    /* Update for RandomNumber: '<S2>/Random Number6' */
    controller13_DW.NextOutput_b = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_j) * sqrt(controller13_P.rsim.dist.z.var) +
      controller13_P.rsim.dist.z.mean;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* Update for UnitDelay: '<S27>/Delay Input' */
    memcpy(&controller13_DW.DelayInput_DSTATE[0], &controller13_B.att_s[0], 9U *
           sizeof(real_T));

    /* Update for UnitDelay: '<S27>/Delay Output' */
    memcpy(&controller13_DW.DelayOutput_DSTATE[0],
           &controller13_B.PoleYk1UkZeroUk1[0], 9U * sizeof(real_T));

    /* Update for DiscreteIntegrator: '<S88>/SaturatingRamp1' incorporates:
     *  Constant: '<S88>/constant'
     */
    controller13_DW.SaturatingRamp1_DSTATE +=
      controller13_P.SaturatingRamp1_gainval * controller13_P.constant_Value_m;

    /* Update for Delay: '<S4>/Delay' */
    controller13_DW.Delay_DSTATE_g[0] =
      controller13_B.TmpSignalConversionAtDelayInport1[0];
    controller13_DW.Delay_DSTATE_g[1] =
      controller13_B.TmpSignalConversionAtDelayInport1[1];
    controller13_DW.Delay_DSTATE_g[2] =
      controller13_B.TmpSignalConversionAtDelayInport1[2];
    controller13_DW.Delay_DSTATE_g[3] =
      controller13_B.TmpSignalConversionAtDelayInport1[3];

    /* Update for DiscreteIntegrator: '<S4>/Discrete-Time Integrator' */
    controller13_DW.DiscreteTimeIntegrator_DSTATE +=
      controller13_P.DiscreteTimeIntegrator_gainval *
      controller13_B.heighttoenablecontrol1;

    /* Update for DiscreteIntegrator: '<S4>/Discrete-Time Integrator1' */
    controller13_DW.DiscreteTimeIntegrator1_DSTATE +=
      controller13_P.DiscreteTimeIntegrator1_gainval *
      controller13_B.SumofElements;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[1] == 0) {
    /* Update for Delay: '<S82>/Delay' */
    controller13_DW.Delay_DSTATE_j = controller13_B.cum_out;

    /* Update for Delay: '<S82>/Delay1' */
    controller13_DW.Delay1_DSTATE_a = controller13_B.en_out;
  }

  if (rtmIsMajorTimeStep(controller13_M)) {
    rt_ertODEUpdateContinuousStates(&controller13_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++controller13_M->Timing.clockTick0)) {
    ++controller13_M->Timing.clockTickH0;
  }

  controller13_M->Timing.t[0] = rtsiGetSolverStopTime
    (&controller13_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.0005s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++controller13_M->Timing.clockTick1)) {
      ++controller13_M->Timing.clockTickH1;
    }

    controller13_M->Timing.t[1] = controller13_M->Timing.clockTick1 *
      controller13_M->Timing.stepSize1 + controller13_M->Timing.clockTickH1 *
      controller13_M->Timing.stepSize1 * 4294967296.0;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[2] == 0) {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick2" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick2"
     * and "Timing.stepSize2". Size of "clockTick2" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick2 and the high bits
     * Timing.clockTickH2. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++controller13_M->Timing.clockTick2)) {
      ++controller13_M->Timing.clockTickH2;
    }

    controller13_M->Timing.t[2] = controller13_M->Timing.clockTick2 *
      controller13_M->Timing.stepSize2 + controller13_M->Timing.clockTickH2 *
      controller13_M->Timing.stepSize2 * 4294967296.0;
  }

  if (rtmIsMajorTimeStep(controller13_M) &&
      controller13_M->Timing.TaskCounters.TID[3] == 0) {
    /* Update absolute timer for sample time: [0.0025s, 0.0s] */
    /* The "clockTick3" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick3"
     * and "Timing.stepSize3". Size of "clockTick3" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick3 and the high bits
     * Timing.clockTickH3. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++controller13_M->Timing.clockTick3)) {
      ++controller13_M->Timing.clockTickH3;
    }

    controller13_M->Timing.t[3] = controller13_M->Timing.clockTick3 *
      controller13_M->Timing.stepSize3 + controller13_M->Timing.clockTickH3 *
      controller13_M->Timing.stepSize3 * 4294967296.0;
  }

  rate_scheduler();
}

/* Derivatives for root system: '<Root>' */
void controller13_derivatives(void)
{
  XDot_controller13_T *_rtXdot;
  _rtXdot = ((XDot_controller13_T *) controller13_M->derivs);

  /* Derivatives for Integrator: '<S40>/xe,ye,ze' */
  _rtXdot->xeyeze_CSTATE[0] = controller13_B.Product_f[0];
  _rtXdot->xeyeze_CSTATE[1] = controller13_B.Product_f[1];
  _rtXdot->xeyeze_CSTATE[2] = controller13_B.Product_f[2];

  /* Derivatives for Integrator: '<S42>/q0 q1 q2 q3' */
  _rtXdot->q0q1q2q3_CSTATE[0] =
    controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[0];
  _rtXdot->q0q1q2q3_CSTATE[1] =
    controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[1];
  _rtXdot->q0q1q2q3_CSTATE[2] =
    controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[2];
  _rtXdot->q0q1q2q3_CSTATE[3] =
    controller13_B.TmpSignalConversionAtq0q1q2q3Inport1[3];

  /* Derivatives for Integrator: '<S40>/ub,vb,wb' */
  _rtXdot->ubvbwb_CSTATE[0] = controller13_B.Sum[0];

  /* Derivatives for Integrator: '<S40>/p,q,r ' */
  _rtXdot->pqr_CSTATE[0] = controller13_B.Reshape[0];

  /* Derivatives for Integrator: '<S40>/ub,vb,wb' */
  _rtXdot->ubvbwb_CSTATE[1] = controller13_B.Sum[1];

  /* Derivatives for Integrator: '<S40>/p,q,r ' */
  _rtXdot->pqr_CSTATE[1] = controller13_B.Reshape[1];

  /* Derivatives for Integrator: '<S40>/ub,vb,wb' */
  _rtXdot->ubvbwb_CSTATE[2] = controller13_B.Sum[2];

  /* Derivatives for Integrator: '<S40>/p,q,r ' */
  _rtXdot->pqr_CSTATE[2] = controller13_B.Reshape[2];
}

/* Model initialize function */
void controller13_initialize(void)
{
  /* Start for MATLABSystem: '<S2>/Coordinate Transformation Conversion1' */
  controller13_DW.objisempty = true;
  controller13_DW.obj.isInitialized = 1;

  /* Start for If: '<S69>/If' */
  controller13_DW.If_ActiveSubsystem = -1;

  {
    real_T tmp;
    int32_T i;
    int32_T t;
    uint32_T tseed;

    /* InitializeConditions for DiscreteIntegrator: '<S97>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE = controller13_P.SaturatingRamp_IC;

    /* InitializeConditions for DiscreteIntegrator: '<S91>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE = controller13_P.RampUpOrDown_IC;

    /* InitializeConditions for DiscreteIntegrator: '<S91>/omega*t' */
    controller13_DW.omegat_DSTATE = controller13_P.omegat_IC;

    /* InitializeConditions for Delay: '<S8>/Delay1' */
    controller13_DW.Delay1_DSTATE = controller13_P.Delay1_InitialCondition;

    /* InitializeConditions for Integrator: '<S40>/xe,ye,ze' */
    controller13_X.xeyeze_CSTATE[0] = controller13_P.uDOFQuaternion_xme_0[0];
    controller13_X.xeyeze_CSTATE[1] = controller13_P.uDOFQuaternion_xme_0[1];
    controller13_X.xeyeze_CSTATE[2] = controller13_P.uDOFQuaternion_xme_0[2];

    /* InitializeConditions for Integrator: '<S42>/q0 q1 q2 q3' */
    if (rtmIsFirstInitCond(controller13_M)) {
      controller13_X.q0q1q2q3_CSTATE[0] = 0.0;
      controller13_X.q0q1q2q3_CSTATE[1] = 0.0;
      controller13_X.q0q1q2q3_CSTATE[2] = 0.0;
      controller13_X.q0q1q2q3_CSTATE[3] = 0.0;
    }

    controller13_DW.q0q1q2q3_IWORK = 1;

    /* End of InitializeConditions for Integrator: '<S42>/q0 q1 q2 q3' */

    /* InitializeConditions for Delay: '<S32>/Delay2' */
    memcpy(&controller13_DW.Delay2_DSTATE[0],
           &controller13_P.Delay2_InitialCondition[0], 13U * sizeof(real_T));

    /* InitializeConditions for Delay: '<S1>/Delay' */
    controller13_DW.Delay_DSTATE = controller13_P.Delay_InitialCondition;

    /* InitializeConditions for DiscreteIntegrator: '<S14>/time' */
    controller13_DW.time_DSTATE = controller13_P.time_IC;

    /* InitializeConditions for Delay: '<S1>/Delay1' */
    controller13_DW.Delay1_DSTATE_l = controller13_P.Delay1_InitialCondition_e;

    /* InitializeConditions for Delay: '<S1>/Delay2' */
    controller13_DW.Delay2_DSTATE_c = controller13_P.Delay2_InitialCondition_g;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass' */
    controller13_DW.lowpass_states[0] = controller13_P.lowpass_InitialStates;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass1' */
    controller13_DW.lowpass1_states[0] = controller13_P.lowpass1_InitialStates;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass2' */
    controller13_DW.lowpass2_states[0] = controller13_P.lowpass2_InitialStates;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass' */
    controller13_DW.lowpass_states[1] = controller13_P.lowpass_InitialStates;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass1' */
    controller13_DW.lowpass1_states[1] = controller13_P.lowpass1_InitialStates;

    /* InitializeConditions for DiscreteTransferFcn: '<S12>/low pass2' */
    controller13_DW.lowpass2_states[1] = controller13_P.lowpass2_InitialStates;

    /* InitializeConditions for Delay: '<S32>/Delay1' */
    memcpy(&controller13_DW.Delay1_DSTATE_i[0], &controller13_P.ukf_s0[0], 19U *
           sizeof(real_T));

    /* InitializeConditions for Delay: '<S32>/Delay' */
    memcpy(&controller13_DW.Delay_DSTATE_l[0], &controller13_P.ukf_P0_flat[0],
           324U * sizeof(real_T));

    /* InitializeConditions for Delay: '<S32>/Delay3' */
    controller13_DW.Delay3_DSTATE = controller13_P.Delay3_InitialCondition;

    /* InitializeConditions for DiscreteTransferFcn: '<S26>/low pass3' */
    for (i = 0; i < 9; i++) {
      controller13_DW.lowpass3_states[i] = controller13_P.lowpass3_InitialStates;
    }

    /* End of InitializeConditions for DiscreteTransferFcn: '<S26>/low pass3' */

    /* InitializeConditions for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[0] =
      controller13_P.Delay1_InitialCondition_d[0];

    /* InitializeConditions for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[0] = controller13_P.Delay_InitialCondition_j
      [0];

    /* InitializeConditions for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[1] =
      controller13_P.Delay1_InitialCondition_d[1];

    /* InitializeConditions for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[1] = controller13_P.Delay_InitialCondition_j
      [1];

    /* InitializeConditions for Delay: '<S23>/Delay1' */
    controller13_DW.Delay1_DSTATE_j[2] =
      controller13_P.Delay1_InitialCondition_d[2];

    /* InitializeConditions for Delay: '<S23>/Delay' */
    controller13_DW.Delay_DSTATE_f[2] = controller13_P.Delay_InitialCondition_j
      [2];

    /* InitializeConditions for Delay: '<S23>/Delay2' */
    controller13_DW.Delay2_DSTATE_j = controller13_P.Delay2_InitialCondition_l;

    /* InitializeConditions for Delay: '<S9>/Delay1' */
    controller13_DW.Delay1_DSTATE_p[0] =
      controller13_P.Delay1_InitialCondition_m[0];
    controller13_DW.Delay1_DSTATE_p[1] =
      controller13_P.Delay1_InitialCondition_m[1];
    controller13_DW.Delay1_DSTATE_p[2] =
      controller13_P.Delay1_InitialCondition_m[2];
    controller13_DW.Delay1_DSTATE_p[3] =
      controller13_P.Delay1_InitialCondition_m[3];

    /* InitializeConditions for Delay: '<S9>/Delay2' */
    controller13_DW.Delay2_DSTATE_o = -controller13_P.mdl.i_delay;

    /* InitializeConditions for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[0] = controller13_P.Delay_InitialCondition_o
      [0];

    /* InitializeConditions for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[0] = controller13_P.vintegrator_IC;

    /* InitializeConditions for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[1] = controller13_P.Delay_InitialCondition_o
      [1];

    /* InitializeConditions for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[1] = controller13_P.vintegrator_IC;

    /* InitializeConditions for Delay: '<S9>/Delay' */
    controller13_DW.Delay_DSTATE_k[2] = controller13_P.Delay_InitialCondition_o
      [2];

    /* InitializeConditions for DiscreteIntegrator: '<S9>/v integrator' */
    controller13_DW.vintegrator_DSTATE[2] = controller13_P.vintegrator_IC;

    /* InitializeConditions for DiscreteTransferFcn: '<S9>/low pass' */
    for (i = 0; i < 6; i++) {
      controller13_DW.lowpass_states_m[i] =
        controller13_P.lowpass_InitialStates_k;
    }

    /* End of InitializeConditions for DiscreteTransferFcn: '<S9>/low pass' */

    /* InitializeConditions for DiscreteIntegrator: '<S21>/time' */
    controller13_DW.time_DSTATE_o = controller13_P.time_IC_g;

    /* InitializeConditions for Delay: '<S12>/Delay' */
    controller13_DW.Delay_DSTATE_a[0] = controller13_P.Delay_InitialCondition_g
      [0];
    controller13_DW.Delay_DSTATE_a[1] = controller13_P.Delay_InitialCondition_g
      [1];
    controller13_DW.Delay_DSTATE_a[2] = controller13_P.Delay_InitialCondition_g
      [2];

    /* InitializeConditions for Delay: '<S12>/Delay1' */
    controller13_DW.Delay1_DSTATE_jf[0] =
      controller13_P.Delay1_InitialCondition_n[0];
    controller13_DW.Delay1_DSTATE_jf[1] =
      controller13_P.Delay1_InitialCondition_n[1];

    /* InitializeConditions for Delay: '<S8>/Delay' */
    controller13_DW.Delay_DSTATE_at = controller13_P.Delay_InitialCondition_a;

    /* InitializeConditions for Delay: '<S8>/Delay2' */
    controller13_DW.Delay2_DSTATE_k = controller13_P.Delay2_InitialCondition_o;

    /* InitializeConditions for Delay: '<S8>/Delay3' */
    controller13_DW.Delay3_DSTATE_j = controller13_P.Delay3_InitialCondition_c;

    /* InitializeConditions for DiscreteIntegrator: '<S103>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_n = controller13_P.SaturatingRamp_IC_d;

    /* InitializeConditions for DiscreteIntegrator: '<S92>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_a = controller13_P.RampUpOrDown_IC_c;

    /* InitializeConditions for DiscreteIntegrator: '<S92>/omega*t' */
    controller13_DW.omegat_DSTATE_p = controller13_P.omegat_IC_g;

    /* InitializeConditions for DiscreteIntegrator: '<S109>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_o = controller13_P.SaturatingRamp_IC_g;

    /* InitializeConditions for DiscreteIntegrator: '<S93>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_j = controller13_P.RampUpOrDown_IC_b;

    /* InitializeConditions for DiscreteIntegrator: '<S93>/omega*t' */
    controller13_DW.omegat_DSTATE_l = controller13_P.omegat_IC_o;

    /* InitializeConditions for DiscreteIntegrator: '<S115>/SaturatingRamp' */
    controller13_DW.SaturatingRamp_DSTATE_e = controller13_P.SaturatingRamp_IC_p;

    /* InitializeConditions for DiscreteIntegrator: '<S94>/RampUpOrDown' */
    controller13_DW.RampUpOrDown_DSTATE_d = controller13_P.RampUpOrDown_IC_j;

    /* InitializeConditions for DiscreteIntegrator: '<S94>/omega*t' */
    controller13_DW.omegat_DSTATE_d = controller13_P.omegat_IC_i;
    for (i = 0; i < 9; i++) {
      /* InitializeConditions for UnitDelay: '<S27>/Delay Input' */
      controller13_DW.DelayInput_DSTATE[i] =
        controller13_P.filteredderivative_ICPrevInput;

      /* InitializeConditions for UnitDelay: '<S27>/Delay Output' */
      controller13_DW.DelayOutput_DSTATE[i] =
        controller13_P.filteredderivative_ICPrevOutput;
    }

    /* InitializeConditions for Delay: '<Root>/Delay3' */
    controller13_DW.Delay3_DSTATE_f[0] =
      controller13_P.Delay3_InitialCondition_e;
    controller13_DW.Delay3_DSTATE_f[1] =
      controller13_P.Delay3_InitialCondition_e;

    /* InitializeConditions for Integrator: '<S40>/ub,vb,wb' */
    controller13_X.ubvbwb_CSTATE[0] = controller13_P.uDOFQuaternion_Vm_0[0];

    /* InitializeConditions for Integrator: '<S40>/p,q,r ' */
    controller13_X.pqr_CSTATE[0] = controller13_P.uDOFQuaternion_pm_0[0];

    /* InitializeConditions for Integrator: '<S40>/ub,vb,wb' */
    controller13_X.ubvbwb_CSTATE[1] = controller13_P.uDOFQuaternion_Vm_0[1];

    /* InitializeConditions for Integrator: '<S40>/p,q,r ' */
    controller13_X.pqr_CSTATE[1] = controller13_P.uDOFQuaternion_pm_0[1];

    /* InitializeConditions for Integrator: '<S40>/ub,vb,wb' */
    controller13_X.ubvbwb_CSTATE[2] = controller13_P.uDOFQuaternion_Vm_0[2];

    /* InitializeConditions for Integrator: '<S40>/p,q,r ' */
    controller13_X.pqr_CSTATE[2] = controller13_P.uDOFQuaternion_pm_0[2];

    /* InitializeConditions for RandomNumber: '<S2>/Random Number3' */
    tmp = floor(controller13_P.rsim.dist.wx.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed = tseed;
    controller13_DW.NextOutput = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed) * sqrt(controller13_P.rsim.dist.wx.var) +
      controller13_P.rsim.dist.wx.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number3' */

    /* InitializeConditions for RandomNumber: '<S2>/Random Number4' */
    tmp = floor(controller13_P.rsim.dist.wy.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed_c = tseed;
    controller13_DW.NextOutput_e = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_c) * sqrt(controller13_P.rsim.dist.wy.var) +
      controller13_P.rsim.dist.wy.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number4' */

    /* InitializeConditions for RandomNumber: '<S2>/Random Number5' */
    tmp = floor(controller13_P.rsim.dist.wz.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed_d = tseed;
    controller13_DW.NextOutput_h = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_d) * sqrt(controller13_P.rsim.dist.wz.var) +
      controller13_P.rsim.dist.wz.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number5' */

    /* InitializeConditions for RandomNumber: '<S2>/Random Number1' */
    tmp = floor(controller13_P.rsim.dist.x.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed_k = tseed;
    controller13_DW.NextOutput_o = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_k) * sqrt(controller13_P.rsim.dist.y.mean) +
      controller13_P.rsim.dist.x.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number1' */

    /* InitializeConditions for RandomNumber: '<S2>/Random Number2' */
    tmp = floor(controller13_P.rsim.dist.y.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed_n = tseed;
    controller13_DW.NextOutput_c = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_n) * sqrt(controller13_P.rsim.dist.y.var) +
      controller13_P.rsim.dist.y.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number2' */

    /* InitializeConditions for RandomNumber: '<S2>/Random Number6' */
    tmp = floor(controller13_P.rsim.dist.z.seed);
    if (rtIsNaN(tmp) || rtIsInf(tmp)) {
      tmp = 0.0;
    } else {
      tmp = fmod(tmp, 4.294967296E+9);
    }

    tseed = tmp < 0.0 ? (uint32_T)-(int32_T)(uint32_T)-tmp : (uint32_T)tmp;
    i = (int32_T)(tseed >> 16U);
    t = (int32_T)(tseed & 32768U);
    tseed = ((((tseed - ((uint32_T)i << 16U)) + (uint32_T)t) << 16U) + (uint32_T)
             t) + (uint32_T)i;
    if (tseed < 1U) {
      tseed = 1144108930U;
    } else if (tseed > 2147483646U) {
      tseed = 2147483646U;
    }

    controller13_DW.RandSeed_j = tseed;
    controller13_DW.NextOutput_b = rt_nrand_Upu32_Yd_f_pw_snf
      (&controller13_DW.RandSeed_j) * sqrt(controller13_P.rsim.dist.z.var) +
      controller13_P.rsim.dist.z.mean;

    /* End of InitializeConditions for RandomNumber: '<S2>/Random Number6' */

    /* InitializeConditions for DiscreteIntegrator: '<S88>/SaturatingRamp1' */
    controller13_DW.SaturatingRamp1_DSTATE = controller13_P.SaturatingRamp1_IC;

    /* InitializeConditions for Delay: '<S82>/Delay' */
    controller13_DW.Delay_DSTATE_j = controller13_P.Delay_InitialCondition_gt;

    /* InitializeConditions for Delay: '<S82>/Delay1' */
    controller13_DW.Delay1_DSTATE_a = controller13_P.Delay1_InitialCondition_p;

    /* InitializeConditions for Delay: '<S4>/Delay' */
    controller13_DW.Delay_DSTATE_g[0] = controller13_P.Delay_InitialCondition_l
      [0];
    controller13_DW.Delay_DSTATE_g[1] = controller13_P.Delay_InitialCondition_l
      [1];
    controller13_DW.Delay_DSTATE_g[2] = controller13_P.Delay_InitialCondition_l
      [2];
    controller13_DW.Delay_DSTATE_g[3] = controller13_P.Delay_InitialCondition_l
      [3];

    /* InitializeConditions for DiscreteIntegrator: '<S4>/Discrete-Time Integrator' */
    controller13_DW.DiscreteTimeIntegrator_DSTATE =
      controller13_P.DiscreteTimeIntegrator_IC;

    /* InitializeConditions for DiscreteIntegrator: '<S4>/Discrete-Time Integrator1' */
    controller13_DW.DiscreteTimeIntegrator1_DSTATE =
      controller13_P.DiscreteTimeIntegrator1_IC;

    /* SystemInitialize for MATLAB Function: '<S22>/Rotation Matrix' */
    controller13_DW.sfEvent_ks = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c10_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S20>/eul to rotation matrix' */
    controller13_DW.sfEvent_d = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c62_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S29>/R_flat to quat' */
    controller13_DW.sfEvent_kk = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c37_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S29>/pack measurement vector' */
    controller13_DW.sfEvent_hd = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c42_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S32>/UKF update then predict' */
    controller13_DW.sfEvent_m = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c38_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S32>/bee units to SI1' */
    controller13_beeunitstoSI_Init(&controller13_DW.sf_beeunitstoSI1);

    /* SystemInitialize for MATLAB Function: '<S32>/bee units to SI' */
    controller13_beeunitstoSI_Init(&controller13_DW.sf_beeunitstoSI);

    /* SystemInitialize for MATLAB Function: '<S29>/unpack state' */
    controller13_DW.sfEvent_i = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c56_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S29>/quaternion to rotation matrix' */
    controller13_DW.sfEvent_g = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c43_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S22>/Rotation Matrix1' */
    controller13_DW.sfEvent_mr = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c11_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
    controller13_DW.sfEvent_kn = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c36_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S1>/adaptive setpoint rd' */
    controller13_DW.sfEvent_gr = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c6_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S9>/Learned RTNMPC' */
    controller13_DW.sfEvent_i4 = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c66_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S12>/External Torque Observer' */
    controller13_DW.sfEvent_jf = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c14_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S9>/Geometric Attitude Controller' */
    controller13_DW.sfEvent_e = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c68_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S1>/saturation' */
    controller13_DW.sfEvent_h = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c16_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S1>/correct force' */
    controller13_DW.sfEvent_lw = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c70_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<Root>/motor thrust mapping' */
    controller13_DW.sfEvent = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c31_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S12>/Rotm2rpy1' */
    controller13_DW.sfEvent_ls = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c65_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S32>/bee cov to SI cov' */
    controller13_DW.sfEvent_lp = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c54_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S2>/power_distribution_1' */
    controller13_DW.sfEvent_j = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c17_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S82>/envelope check' */
    controller13_DW.sfEvent_k = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c49_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S88>/landing_cond' */
    controller13_DW.sfEvent_c = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c50_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S82>/voltage check' */
    controller13_DW.sfEvent_l = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c51_controller13 = 0U;

    /* SystemInitialize for MATLAB Function: '<S82>/MATLAB Function' */
    controller13_DW.sfEvent_f = controller13_CALL_EVENT_l;
    controller13_DW.is_active_c48_controller13 = 0U;

    /* set "at time zero" to false */
    if (rtmIsFirstInitCond(controller13_M)) {
      rtmSetFirstInitCond(controller13_M, 0);
    }
  }
}

/* Model terminate function */
void controller13_terminate(void)
{
  /* (no terminate code required) */
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  controller13_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  controller13_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  controller13_initialize();
}

void MdlTerminate(void)
{
  controller13_terminate();
}

/* Registration function */
RT_MODEL_controller13_T *controller13(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)controller13_M, 0,
                sizeof(RT_MODEL_controller13_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&controller13_M->solverInfo,
                          &controller13_M->Timing.simTimeStep);
    rtsiSetTPtr(&controller13_M->solverInfo, &rtmGetTPtr(controller13_M));
    rtsiSetStepSizePtr(&controller13_M->solverInfo,
                       &controller13_M->Timing.stepSize0);
    rtsiSetdXPtr(&controller13_M->solverInfo, &controller13_M->derivs);
    rtsiSetContStatesPtr(&controller13_M->solverInfo, (real_T **)
                         &controller13_M->contStates);
    rtsiSetNumContStatesPtr(&controller13_M->solverInfo,
      &controller13_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&controller13_M->solverInfo,
      &controller13_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&controller13_M->solverInfo,
      &controller13_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&controller13_M->solverInfo,
      &controller13_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&controller13_M->solverInfo, (&rtmGetErrorStatus
      (controller13_M)));
    rtsiSetRTModelPtr(&controller13_M->solverInfo, controller13_M);
  }

  rtsiSetSimTimeStep(&controller13_M->solverInfo, MAJOR_TIME_STEP);
  controller13_M->intgData.y = controller13_M->odeY;
  controller13_M->intgData.f[0] = controller13_M->odeF[0];
  controller13_M->intgData.f[1] = controller13_M->odeF[1];
  controller13_M->intgData.f[2] = controller13_M->odeF[2];
  controller13_M->contStates = ((real_T *) &controller13_X);
  rtsiSetSolverData(&controller13_M->solverInfo, (void *)
                    &controller13_M->intgData);
  rtsiSetIsMinorTimeStepWithModeChange(&controller13_M->solverInfo, false);
  rtsiSetSolverName(&controller13_M->solverInfo,"ode3");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = controller13_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    mdlTsMap[2] = 2;
    mdlTsMap[3] = 3;

    /* polyspace +2 MISRA2012:D4.1 [Justified:Low] "controller13_M points to
       static memory which is guaranteed to be non-NULL" */
    controller13_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    controller13_M->Timing.sampleTimes =
      (&controller13_M->Timing.sampleTimesArray[0]);
    controller13_M->Timing.offsetTimes =
      (&controller13_M->Timing.offsetTimesArray[0]);

    /* task periods */
    controller13_M->Timing.sampleTimes[0] = (0.0);
    controller13_M->Timing.sampleTimes[1] = (0.0005);
    controller13_M->Timing.sampleTimes[2] = (0.001);
    controller13_M->Timing.sampleTimes[3] = (0.0025);

    /* task offsets */
    controller13_M->Timing.offsetTimes[0] = (0.0);
    controller13_M->Timing.offsetTimes[1] = (0.0);
    controller13_M->Timing.offsetTimes[2] = (0.0);
    controller13_M->Timing.offsetTimes[3] = (0.0);
  }

  rtmSetTPtr(controller13_M, &controller13_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = controller13_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    mdlSampleHits[2] = 1;
    mdlSampleHits[3] = 1;
    controller13_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(controller13_M, 11.0);
  controller13_M->Timing.stepSize0 = 0.0005;
  controller13_M->Timing.stepSize1 = 0.0005;
  controller13_M->Timing.stepSize2 = 0.001;
  controller13_M->Timing.stepSize3 = 0.0025;
  rtmSetFirstInitCond(controller13_M, 1);

  /* External mode info */
  controller13_M->Sizes.checksums[0] = (3140997605U);
  controller13_M->Sizes.checksums[1] = (4165915892U);
  controller13_M->Sizes.checksums[2] = (105004128U);
  controller13_M->Sizes.checksums[3] = (3950719655U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[41];
    controller13_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = &rtAlwaysEnabled;
    systemRan[7] = &rtAlwaysEnabled;
    systemRan[8] = &rtAlwaysEnabled;
    systemRan[9] = &rtAlwaysEnabled;
    systemRan[10] = &rtAlwaysEnabled;
    systemRan[11] = &rtAlwaysEnabled;
    systemRan[12] = &rtAlwaysEnabled;
    systemRan[13] = &rtAlwaysEnabled;
    systemRan[14] = &rtAlwaysEnabled;
    systemRan[15] = &rtAlwaysEnabled;
    systemRan[16] = &rtAlwaysEnabled;
    systemRan[17] = &rtAlwaysEnabled;
    systemRan[18] = &rtAlwaysEnabled;
    systemRan[19] = &rtAlwaysEnabled;
    systemRan[20] = &rtAlwaysEnabled;
    systemRan[21] = &rtAlwaysEnabled;
    systemRan[22] = &rtAlwaysEnabled;
    systemRan[23] = (sysRanDType *)
      &controller13_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[24] = (sysRanDType *)
      &controller13_DW.IfActionSubsystem1_SubsysRanBC;
    systemRan[25] = (sysRanDType *)
      &controller13_DW.IfActionSubsystem2_SubsysRanBC;
    systemRan[26] = &rtAlwaysEnabled;
    systemRan[27] = &rtAlwaysEnabled;
    systemRan[28] = &rtAlwaysEnabled;
    systemRan[29] = &rtAlwaysEnabled;
    systemRan[30] = &rtAlwaysEnabled;
    systemRan[31] = &rtAlwaysEnabled;
    systemRan[32] = &rtAlwaysEnabled;
    systemRan[33] = &rtAlwaysEnabled;
    systemRan[34] = &rtAlwaysEnabled;
    systemRan[35] = &rtAlwaysEnabled;
    systemRan[36] = &rtAlwaysEnabled;
    systemRan[37] = &rtAlwaysEnabled;
    systemRan[38] = &rtAlwaysEnabled;
    systemRan[39] = &rtAlwaysEnabled;
    systemRan[40] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(controller13_M->extModeInfo,
      &controller13_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(controller13_M->extModeInfo,
                        controller13_M->Sizes.checksums);
    rteiSetTPtr(controller13_M->extModeInfo, rtmGetTPtr(controller13_M));
  }

  controller13_M->solverInfoPtr = (&controller13_M->solverInfo);
  controller13_M->Timing.stepSize = (0.0005);
  rtsiSetFixedStepSize(&controller13_M->solverInfo, 0.0005);
  rtsiSetSolverMode(&controller13_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  controller13_M->blockIO = ((void *) &controller13_B);
  (void) memset(((void *) &controller13_B), 0,
                sizeof(B_controller13_T));

  /* parameters */
  controller13_M->defaultParam = ((real_T *)&controller13_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &controller13_X;
    controller13_M->contStates = (x);
    (void) memset((void *)&controller13_X, 0,
                  sizeof(X_controller13_T));
  }

  /* states (dwork) */
  controller13_M->dwork = ((void *) &controller13_DW);
  (void) memset((void *)&controller13_DW, 0,
                sizeof(DW_controller13_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    controller13_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 75;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  controller13_M->Sizes.numContStates = (13);/* Number of continuous states */
  controller13_M->Sizes.numPeriodicContStates = (0);
                                      /* Number of periodic continuous states */
  controller13_M->Sizes.numY = (0);    /* Number of model outputs */
  controller13_M->Sizes.numU = (0);    /* Number of model inputs */
  controller13_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  controller13_M->Sizes.numSampTimes = (4);/* Number of sample times */
  controller13_M->Sizes.numBlocks = (525);/* Number of blocks */
  controller13_M->Sizes.numBlockIO = (158);/* Number of block outputs */
  controller13_M->Sizes.numBlockPrms = (641);/* Sum of parameter "widths" */
  return controller13_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
