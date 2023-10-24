/*
 * controller13_types.h
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

#ifndef RTW_HEADER_controller13_types_h_
#define RTW_HEADER_controller13_types_h_
#include "rtwtypes.h"
#ifndef DEFINED_TYPEDEF_FOR_struct_ZkbZOHZIQ12OrHsHSZ9BxE_
#define DEFINED_TYPEDEF_FOR_struct_ZkbZOHZIQ12OrHsHSZ9BxE_

typedef struct {
  real_T linear;
} struct_ZkbZOHZIQ12OrHsHSZ9BxE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_zWQ2UeKRPJXs0YiBnSx2iG_
#define DEFINED_TYPEDEF_FOR_struct_zWQ2UeKRPJXs0YiBnSx2iG_

typedef struct {
  real_T n;
  real_T d[2];
  real_T n2;
  real_T d2[2];
} struct_zWQ2UeKRPJXs0YiBnSx2iG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_swDfGweWqG74EXQcL13RhH_
#define DEFINED_TYPEDEF_FOR_struct_swDfGweWqG74EXQcL13RhH_

typedef struct {
  real_T flight_time;
  real_T exe_time;
  real_T f;
  real_T f_high;
  real_T T;
  real_T T_high;
  real_T i_delay;
  real_T s_delay;
  real_T rt;
  real_T g;
  struct_ZkbZOHZIQ12OrHsHSZ9BxE drag_force;
  struct_zWQ2UeKRPJXs0YiBnSx2iG vlp;
  real_T f1;
  real_T zf1;
  real_T f2;
  real_T zf2;
  real_T fd_lim;
  real_T max_v_vec[4];
  real_T hovering_vec[4];
  real_T max_v;
  real_T freq_vec[4];
} struct_swDfGweWqG74EXQcL13RhH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_p3zOljnrL2X4Qf74Xm0EnB_
#define DEFINED_TYPEDEF_FOR_struct_p3zOljnrL2X4Qf74Xm0EnB_

typedef struct {
  real_T m;
  real_T g;
  real_T J[9];
  real_T c_dv;
  real_T c_domega;
  real_T T_s;
  real_T mrp_a;
  real_T lambda;
  real_T max_P_val;
} struct_p3zOljnrL2X4Qf74Xm0EnB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_UpQiVKryEBqs2KRn8vEU2D_
#define DEFINED_TYPEDEF_FOR_struct_UpQiVKryEBqs2KRn8vEU2D_

typedef struct {
  real_T s0[19];
  real_T P0[324];
  real_T Q[324];
  real_T H[108];
  real_T R[36];
  struct_p3zOljnrL2X4Qf74Xm0EnB constants;
} struct_UpQiVKryEBqs2KRn8vEU2D;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_2KYTscT7yaKYRdkMxD6U9E_
#define DEFINED_TYPEDEF_FOR_struct_2KYTscT7yaKYRdkMxD6U9E_

typedef struct {
  real_T th;
  real_T xt;
  real_T yt;
  real_T zt;
} struct_2KYTscT7yaKYRdkMxD6U9E;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_HhckT6rntEraqECYVIDvCC_
#define DEFINED_TYPEDEF_FOR_struct_HhckT6rntEraqECYVIDvCC_

typedef struct {
  real_T x;
  real_T y;
} struct_HhckT6rntEraqECYVIDvCC;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Wa8sJQmUGLqlUCHjNRY8jH_
#define DEFINED_TYPEDEF_FOR_struct_Wa8sJQmUGLqlUCHjNRY8jH_

typedef struct {
  real_T m;
  struct_2KYTscT7yaKYRdkMxD6U9E base;
  struct_HhckT6rntEraqECYVIDvCC offset;
  real_T ixx;
  real_T iyy;
  real_T izz;
  real_T ld;
  real_T lw;
  real_T lt;
  real_T til;
  real_T A[12];
  real_T Apinv[12];
  real_T A2[16];
  real_T A2inv[16];
  real_T VM_robot_1[2];
  real_T VM_robot_2[2];
  real_T VM_robot_3[2];
  real_T VM_robot_4[2];
  real_T VM_input1[4];
  real_T VM_input2[4];
  real_T VM2;
  real_T DV_flip[4];
  real_T thrust_to_voltage_polyfit[6];
  real_T thrust_error_poly_fit[2];
  real_T time[11001];
} struct_Wa8sJQmUGLqlUCHjNRY8jH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_wpXnDpHRbNQy93v0PODtoB_
#define DEFINED_TYPEDEF_FOR_struct_wpXnDpHRbNQy93v0PODtoB_

typedef struct {
  real_T en;
  real_T angle[5];
  real_T duration[5];
  real_T trans[4];
} struct_wpXnDpHRbNQy93v0PODtoB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_0yAgXIcEc7Qfnq3WyOOAEE_
#define DEFINED_TYPEDEF_FOR_struct_0yAgXIcEc7Qfnq3WyOOAEE_

typedef struct {
  real_T en;
  struct_wpXnDpHRbNQy93v0PODtoB dy;
} struct_0yAgXIcEc7Qfnq3WyOOAEE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Lgc9AULsY4Mx15GiYQzZ5D_
#define DEFINED_TYPEDEF_FOR_struct_Lgc9AULsY4Mx15GiYQzZ5D_

typedef struct {
  real_T upper[4];
  real_T lower[4];
} struct_Lgc9AULsY4Mx15GiYQzZ5D;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_kSQgeIWP8CJFyhJa3BCkKH_
#define DEFINED_TYPEDEF_FOR_struct_kSQgeIWP8CJFyhJa3BCkKH_

typedef struct {
  real_T upper;
  real_T lower;
} struct_kSQgeIWP8CJFyhJa3BCkKH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_RR1HfhpOgJkNft4L0oceKG_
#define DEFINED_TYPEDEF_FOR_struct_RR1HfhpOgJkNft4L0oceKG_

typedef struct {
  real_T en;
  struct_Lgc9AULsY4Mx15GiYQzZ5D lim;
  struct_kSQgeIWP8CJFyhJa3BCkKH yaw;
} struct_RR1HfhpOgJkNft4L0oceKG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_BMPh5m1Di0rqBrJELygvTF_
#define DEFINED_TYPEDEF_FOR_struct_BMPh5m1Di0rqBrJELygvTF_

typedef struct {
  real_T fw;
  real_T p;
  real_T d;
  real_T i;
} struct_BMPh5m1Di0rqBrJELygvTF;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_US0zWSxBeiGO76BJVagXU_
#define DEFINED_TYPEDEF_FOR_struct_US0zWSxBeiGO76BJVagXU_

typedef struct {
  real_T at3;
  real_T at2;
  real_T at1;
  real_T at0;
  real_T ati;
  real_T al0;
  real_T al1;
  real_T ali;
  struct_BMPh5m1Di0rqBrJELygvTF yaw;
} struct_US0zWSxBeiGO76BJVagXU;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Mm8baDtvJ6F1HwYR9vQKoB_
#define DEFINED_TYPEDEF_FOR_struct_Mm8baDtvJ6F1HwYR9vQKoB_

typedef struct {
  real_T taux;
  real_T tauy;
  real_T tauz;
  real_T att;
} struct_Mm8baDtvJ6F1HwYR9vQKoB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_xYWfUN9SkUJsVTws5uSKmG_
#define DEFINED_TYPEDEF_FOR_struct_xYWfUN9SkUJsVTws5uSKmG_

typedef struct {
  real_T xmax;
  real_T ymax;
  real_T zmax;
} struct_xYWfUN9SkUJsVTws5uSKmG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_OVnAWbOGG6051k5E2XFKrF_
#define DEFINED_TYPEDEF_FOR_struct_OVnAWbOGG6051k5E2XFKrF_

typedef struct {
  real_T xmax;
  real_T ymax;
  real_T zmax;
  real_T volt;
  real_T T;
} struct_OVnAWbOGG6051k5E2XFKrF;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Jr4MvxEGd3eYSWnINMGRAH_
#define DEFINED_TYPEDEF_FOR_struct_Jr4MvxEGd3eYSWnINMGRAH_

typedef struct {
  real_T T;
  real_T count;
} struct_Jr4MvxEGd3eYSWnINMGRAH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_gdZsCdVYjdZks1rrDmq8jC_
#define DEFINED_TYPEDEF_FOR_struct_gdZsCdVYjdZks1rrDmq8jC_

typedef struct {
  real_T T;
  struct_xYWfUN9SkUJsVTws5uSKmG enableZone;
  real_T volt[4];
  struct_OVnAWbOGG6051k5E2XFKrF land;
  real_T min_cos_roll_pitch;
  struct_Jr4MvxEGd3eYSWnINMGRAH overload;
} struct_gdZsCdVYjdZks1rrDmq8jC;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_xe46UU7ReCQJsoezraLOuF_
#define DEFINED_TYPEDEF_FOR_struct_xe46UU7ReCQJsoezraLOuF_

typedef struct {
  real_T x;
  real_T y;
  real_T z;
  real_T yaw;
} struct_xe46UU7ReCQJsoezraLOuF;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_B1Vk66atRZ2ph9uociFBiB_
#define DEFINED_TYPEDEF_FOR_struct_B1Vk66atRZ2ph9uociFBiB_

typedef struct {
  real_T en;
  real_T height;
  real_T time;
} struct_B1Vk66atRZ2ph9uociFBiB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_v7QRUNg0bRzIKbxTGkLU5G_
#define DEFINED_TYPEDEF_FOR_struct_v7QRUNg0bRzIKbxTGkLU5G_

typedef struct {
  real_T enable;
  real_T Q[9];
} struct_v7QRUNg0bRzIKbxTGkLU5G;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_ni8MyV2eSea2CB8OwzYye_
#define DEFINED_TYPEDEF_FOR_struct_ni8MyV2eSea2CB8OwzYye_

typedef struct {
  real_T ixx;
  real_T iyy;
  real_T izz;
  real_T ang_acc_ff;
  real_T kR[9];
  real_T kOmega[9];
} struct_ni8MyV2eSea2CB8OwzYye;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_g1w3fqsCwWkKPZWZIBXZBB_
#define DEFINED_TYPEDEF_FOR_struct_g1w3fqsCwWkKPZWZIBXZBB_

typedef struct {
  real_T att;
  real_T omega;
  real_T f_cmd_norm;
  real_T torque_x;
  real_T torque_y;
  real_T torque_z;
} struct_g1w3fqsCwWkKPZWZIBXZBB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_noVORLylIAY3lMNihjoU5G_
#define DEFINED_TYPEDEF_FOR_struct_noVORLylIAY3lMNihjoU5G_

typedef struct {
  real32_T b1[64];
  real32_T IW1_1[896];
  real32_T b2[32];
  real32_T LW2_1[2048];
  real32_T b3[4];
  real32_T LW3_2[128];
} struct_noVORLylIAY3lMNihjoU5G;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_zS9ZPv1VboOoAtSuxv7pSB_
#define DEFINED_TYPEDEF_FOR_struct_zS9ZPv1VboOoAtSuxv7pSB_

typedef struct {
  struct_g1w3fqsCwWkKPZWZIBXZBB lim;
  real_T max_obs;
  real_T max_act;
  real_T in_scaling[17];
  real_T out_scaling[4];
  real_T t_max;
  real_T r_origin_offset[3];
  struct_noVORLylIAY3lMNihjoU5G nnparam;
} struct_zS9ZPv1VboOoAtSuxv7pSB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_htaV0FftsCH0OM1YQj23kC_
#define DEFINED_TYPEDEF_FOR_struct_htaV0FftsCH0OM1YQj23kC_

typedef struct {
  boolean_T en;
} struct_htaV0FftsCH0OM1YQj23kC;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_f1GAQCuR5iH3zg1HgRGwdH_
#define DEFINED_TYPEDEF_FOR_struct_f1GAQCuR5iH3zg1HgRGwdH_

typedef struct {
  boolean_T align_on_x;
} struct_f1GAQCuR5iH3zg1HgRGwdH;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_u2xjbNN0BtlKoljw3A6ZWB_
#define DEFINED_TYPEDEF_FOR_struct_u2xjbNN0BtlKoljw3A6ZWB_

typedef struct {
  real_T r0_policy[3];
  struct_htaV0FftsCH0OM1YQj23kC yaw_fixed_frame;
  struct_f1GAQCuR5iH3zg1HgRGwdH yaw_fixed_framw;
  boolean_T set_cmd_omega_y_to_zero;
} struct_u2xjbNN0BtlKoljw3A6ZWB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_za6Z1msdjv4nO78vSPS3MB_
#define DEFINED_TYPEDEF_FOR_struct_za6Z1msdjv4nO78vSPS3MB_

typedef struct {
  real_T num[3];
  real_T den[3];
} struct_za6Z1msdjv4nO78vSPS3MB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_k0moZOrCNzzUVH6dO9P6gC_
#define DEFINED_TYPEDEF_FOR_struct_k0moZOrCNzzUVH6dO9P6gC_

typedef struct {
  real_T torque_x;
  real_T torque_y;
  real_T omega;
} struct_k0moZOrCNzzUVH6dO9P6gC;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_5L5BeC6jiZn5OLuHBViB8_
#define DEFINED_TYPEDEF_FOR_struct_5L5BeC6jiZn5OLuHBViB8_

typedef struct {
  struct_k0moZOrCNzzUVH6dO9P6gC process;
  real_T meas;
} struct_5L5BeC6jiZn5OLuHBViB8;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_RrLi2swEfwBt8aIms8AxPE_
#define DEFINED_TYPEDEF_FOR_struct_RrLi2swEfwBt8aIms8AxPE_

typedef struct {
  real_T enable;
  struct_5L5BeC6jiZn5OLuHBViB8 noise;
  real_T factor;
  struct_HhckT6rntEraqECYVIDvCC initial_torque;
  real_T Q[16];
  real_T R[4];
  real_T A[16];
  real_T B[24];
  real_T C[8];
  real_T D[12];
  real_T L[8];
  real_T state_scaling[4];
  real_T input_scaling[2];
  real_T meas_scaling[2];
  real_T out_scaling[4];
} struct_RrLi2swEfwBt8aIms8AxPE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_w9plDi2yBqPkIcn1td2FHG_
#define DEFINED_TYPEDEF_FOR_struct_w9plDi2yBqPkIcn1td2FHG_

typedef struct {
  real_T vel;
} struct_w9plDi2yBqPkIcn1td2FHG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Xhks7ZntxlOipz1r1axNSG_
#define DEFINED_TYPEDEF_FOR_struct_Xhks7ZntxlOipz1r1axNSG_

typedef struct {
  real_T pos;
} struct_Xhks7ZntxlOipz1r1axNSG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_xCxkVOM47tJqjufwphtwGG_
#define DEFINED_TYPEDEF_FOR_struct_xCxkVOM47tJqjufwphtwGG_

typedef struct {
  struct_w9plDi2yBqPkIcn1td2FHG process;
  struct_Xhks7ZntxlOipz1r1axNSG meas;
} struct_xCxkVOM47tJqjufwphtwGG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_5p9bYaTTEhTX8feCDegopB_
#define DEFINED_TYPEDEF_FOR_struct_5p9bYaTTEhTX8feCDegopB_

typedef struct {
  struct_xCxkVOM47tJqjufwphtwGG noise;
  real_T Q[9];
  real_T R[9];
  real_T A[36];
  real_T B[36];
  real_T C[18];
  real_T D[18];
  real_T L[18];
} struct_5p9bYaTTEhTX8feCDegopB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_qT6B9pjYW863D2bpz1kcaE_
#define DEFINED_TYPEDEF_FOR_struct_qT6B9pjYW863D2bpz1kcaE_

typedef struct {
  real_T en;
  real_T freq_vec[4];
  struct_0yAgXIcEc7Qfnq3WyOOAEE yaw;
  struct_RR1HfhpOgJkNft4L0oceKG integral;
  struct_US0zWSxBeiGO76BJVagXU gain;
  struct_Mm8baDtvJ6F1HwYR9vQKoB lim;
  struct_gdZsCdVYjdZks1rrDmq8jC safety;
  struct_xe46UU7ReCQJsoezraLOuF setpoint;
  struct_B1Vk66atRZ2ph9uociFBiB landing;
  struct_B1Vk66atRZ2ph9uociFBiB takeoff;
  real_T baseline;
  struct_v7QRUNg0bRzIKbxTGkLU5G adaptive_saturation;
  struct_ni8MyV2eSea2CB8OwzYye lee;
  struct_zS9ZPv1VboOoAtSuxv7pSB rtmpc;
  struct_u2xjbNN0BtlKoljw3A6ZWB rtnmpc;
  struct_za6Z1msdjv4nO78vSPS3MB rtnmpc_ang_acc_lp;
  struct_za6Z1msdjv4nO78vSPS3MB ukf_act_delay;
  struct_RrLi2swEfwBt8aIms8AxPE torque_obs;
  struct_5p9bYaTTEhTX8feCDegopB pos_vel_est;
} struct_qT6B9pjYW863D2bpz1kcaE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_g6gaPCTXvoA8FlBdYhRAtF_
#define DEFINED_TYPEDEF_FOR_struct_g6gaPCTXvoA8FlBdYhRAtF_

typedef struct {
  real_T f;
  real_T T;
} struct_g6gaPCTXvoA8FlBdYhRAtF;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_PovbDhjxK7nz9gwPkFJWfE_
#define DEFINED_TYPEDEF_FOR_struct_PovbDhjxK7nz9gwPkFJWfE_

typedef struct {
  real_T m;
  real_T ixx;
  real_T iyy;
  real_T izz;
  real_T torque_damping;
} struct_PovbDhjxK7nz9gwPkFJWfE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_bsOxv4bUJLWxVy6smMTssG_
#define DEFINED_TYPEDEF_FOR_struct_bsOxv4bUJLWxVy6smMTssG_

typedef struct {
  real_T time;
  real_T n_steps;
  real_T init_val[12];
} struct_bsOxv4bUJLWxVy6smMTssG;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_1x16MxYnJf7oS5TSEa1ILD_
#define DEFINED_TYPEDEF_FOR_struct_1x16MxYnJf7oS5TSEa1ILD_

typedef struct {
  real_T time;
  real_T n_steps;
  real_T init_val[60];
} struct_1x16MxYnJf7oS5TSEa1ILD;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_4HnKuGjcb7cOCUJVaqeEEF_
#define DEFINED_TYPEDEF_FOR_struct_4HnKuGjcb7cOCUJVaqeEEF_

typedef struct {
  struct_bsOxv4bUJLWxVy6smMTssG Vicon;
  struct_1x16MxYnJf7oS5TSEa1ILD actuator;
} struct_4HnKuGjcb7cOCUJVaqeEEF;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_Hk4Z6TSaAlsOnGuIc7gYNE_
#define DEFINED_TYPEDEF_FOR_struct_Hk4Z6TSaAlsOnGuIc7gYNE_

typedef struct {
  real_T en;
} struct_Hk4Z6TSaAlsOnGuIc7gYNE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_KfV94jJYa0IvUQJ0JjwHYD_
#define DEFINED_TYPEDEF_FOR_struct_KfV94jJYa0IvUQJ0JjwHYD_

typedef struct {
  real_T mean;
  real_T var;
  real_T seed;
} struct_KfV94jJYa0IvUQJ0JjwHYD;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_TfPjd5bcXWAi4tLma7cKxD_
#define DEFINED_TYPEDEF_FOR_struct_TfPjd5bcXWAi4tLma7cKxD_

typedef struct {
  struct_Hk4Z6TSaAlsOnGuIc7gYNE pos;
  struct_Hk4Z6TSaAlsOnGuIc7gYNE rot;
  struct_KfV94jJYa0IvUQJ0JjwHYD x;
  struct_KfV94jJYa0IvUQJ0JjwHYD y;
  struct_KfV94jJYa0IvUQJ0JjwHYD z;
  struct_KfV94jJYa0IvUQJ0JjwHYD wx;
  struct_KfV94jJYa0IvUQJ0JjwHYD wy;
  struct_KfV94jJYa0IvUQJ0JjwHYD wz;
} struct_TfPjd5bcXWAi4tLma7cKxD;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_PnJy5R3HzCjafF7TLm4DbE_
#define DEFINED_TYPEDEF_FOR_struct_PnJy5R3HzCjafF7TLm4DbE_

typedef struct {
  real_T enable;
} struct_PnJy5R3HzCjafF7TLm4DbE;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_WWtcgODJFNP4tHc5z1TP3G_
#define DEFINED_TYPEDEF_FOR_struct_WWtcgODJFNP4tHc5z1TP3G_

typedef struct {
  struct_PnJy5R3HzCjafF7TLm4DbE pos;
  struct_PnJy5R3HzCjafF7TLm4DbE rpy;
  real_T pos_sigma[3];
  real_T rpy_sigma[3];
} struct_WWtcgODJFNP4tHc5z1TP3G;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_nBlY7EPQDGdIoVBiDbH2yB_
#define DEFINED_TYPEDEF_FOR_struct_nBlY7EPQDGdIoVBiDbH2yB_

typedef struct {
  real_T en;
  struct_g6gaPCTXvoA8FlBdYhRAtF mdl;
  real_T R0[9];
  real_T w0[3];
  real_T p0[3];
  real_T v0[3];
  struct_PovbDhjxK7nz9gwPkFJWfE rbt;
  struct_4HnKuGjcb7cOCUJVaqeEEF delay;
  struct_TfPjd5bcXWAi4tLma7cKxD dist;
  struct_WWtcgODJFNP4tHc5z1TP3G sensing_noise;
} struct_nBlY7EPQDGdIoVBiDbH2yB;

#endif

#ifndef DEFINED_TYPEDEF_FOR_struct_KhXwpRPEcLAekIa5XUXTOE_
#define DEFINED_TYPEDEF_FOR_struct_KhXwpRPEcLAekIa5XUXTOE_

typedef struct {
  real_T v1[1101];
  real_T T1[1101];
  real_T v2[1251];
  real_T T2[1251];
  real_T v3[1101];
  real_T T3[1101];
  real_T v4[1201];
  real_T T4[1201];
} struct_KhXwpRPEcLAekIa5XUXTOE;

#endif

/* Custom Type definition for MATLAB Function: '<S1>/saturation' */
#ifndef struct_tag_seaWRZTzRUQIpw8HWfb7Zg
#define struct_tag_seaWRZTzRUQIpw8HWfb7Zg

struct tag_seaWRZTzRUQIpw8HWfb7Zg
{
  real_T xstar[4];
  real_T fstar;
  real_T firstorderopt;
  real_T lambda[9];
  int32_T state;
  real_T maxConstr;
  int32_T iterations;
  real_T searchDir[4];
};

#endif                                 /* struct_tag_seaWRZTzRUQIpw8HWfb7Zg */

#ifndef typedef_seaWRZTzRUQIpw8HWfb7Zg_controller13_T
#define typedef_seaWRZTzRUQIpw8HWfb7Zg_controller13_T

typedef struct tag_seaWRZTzRUQIpw8HWfb7Zg seaWRZTzRUQIpw8HWfb7Zg_controller13_T;

#endif                       /* typedef_seaWRZTzRUQIpw8HWfb7Zg_controller13_T */

#ifndef struct_tag_sBdQuBHm0kvJUraEqbpc91F
#define struct_tag_sBdQuBHm0kvJUraEqbpc91F

struct tag_sBdQuBHm0kvJUraEqbpc91F
{
  real_T grad[4];
  real_T Hx[3];
  boolean_T hasLinear;
  int32_T nvar;
  int32_T maxVar;
  real_T beta;
  real_T rho;
  int32_T objtype;
  int32_T prev_objtype;
  int32_T prev_nvar;
  boolean_T prev_hasLinear;
  real_T gammaScalar;
};

#endif                                 /* struct_tag_sBdQuBHm0kvJUraEqbpc91F */

#ifndef typedef_sBdQuBHm0kvJUraEqbpc91F_controller13_T
#define typedef_sBdQuBHm0kvJUraEqbpc91F_controller13_T

typedef struct tag_sBdQuBHm0kvJUraEqbpc91F
  sBdQuBHm0kvJUraEqbpc91F_controller13_T;

#endif                      /* typedef_sBdQuBHm0kvJUraEqbpc91F_controller13_T */

#ifndef struct_tag_sh58oWPwY89XybeLiY7aWPG
#define struct_tag_sh58oWPwY89XybeLiY7aWPG

struct tag_sh58oWPwY89XybeLiY7aWPG
{
  real_T FMat[16];
  int32_T ldm;
  int32_T ndims;
  int32_T info;
  real_T scaleFactor;
  boolean_T ConvexCheck;
  real_T regTol_;
  real_T workspace_[192];
  real_T workspace2_[192];
};

#endif                                 /* struct_tag_sh58oWPwY89XybeLiY7aWPG */

#ifndef typedef_sh58oWPwY89XybeLiY7aWPG_controller13_T
#define typedef_sh58oWPwY89XybeLiY7aWPG_controller13_T

typedef struct tag_sh58oWPwY89XybeLiY7aWPG
  sh58oWPwY89XybeLiY7aWPG_controller13_T;

#endif                      /* typedef_sh58oWPwY89XybeLiY7aWPG_controller13_T */

#ifndef struct_tag_2PsGMppoK4e2vdwpogf6iH
#define struct_tag_2PsGMppoK4e2vdwpogf6iH

struct tag_2PsGMppoK4e2vdwpogf6iH
{
  int32_T isInitialized;
};

#endif                                 /* struct_tag_2PsGMppoK4e2vdwpogf6iH */

#ifndef typedef_robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T
#define typedef_robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T

typedef struct tag_2PsGMppoK4e2vdwpogf6iH
  robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T;

#endif
/* typedef_robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T */

/* Custom Type definition for MATLAB Function: '<S1>/saturation' */
#ifndef struct_tag_sYbuiRVtE6jido5obBecKYC
#define struct_tag_sYbuiRVtE6jido5obBecKYC

struct tag_sYbuiRVtE6jido5obBecKYC
{
  int32_T ldq;
  real_T QR[36];
  real_T Q[16];
  int32_T jpvt[9];
  int32_T mrows;
  int32_T ncols;
  real_T tau[4];
  int32_T minRowCol;
  boolean_T usedPivoting;
};

#endif                                 /* struct_tag_sYbuiRVtE6jido5obBecKYC */

#ifndef typedef_sYbuiRVtE6jido5obBecKYC_controller13_T
#define typedef_sYbuiRVtE6jido5obBecKYC_controller13_T

typedef struct tag_sYbuiRVtE6jido5obBecKYC
  sYbuiRVtE6jido5obBecKYC_controller13_T;

#endif                      /* typedef_sYbuiRVtE6jido5obBecKYC_controller13_T */

#ifndef struct_tag_soJzDMqrGjM1lRoGlt35IJE
#define struct_tag_soJzDMqrGjM1lRoGlt35IJE

struct tag_soJzDMqrGjM1lRoGlt35IJE
{
  real_T workspace_double[36];
  int32_T workspace_int[9];
  int32_T workspace_sort[9];
};

#endif                                 /* struct_tag_soJzDMqrGjM1lRoGlt35IJE */

#ifndef typedef_soJzDMqrGjM1lRoGlt35IJE_controller13_T
#define typedef_soJzDMqrGjM1lRoGlt35IJE_controller13_T

typedef struct tag_soJzDMqrGjM1lRoGlt35IJE
  soJzDMqrGjM1lRoGlt35IJE_controller13_T;

#endif                      /* typedef_soJzDMqrGjM1lRoGlt35IJE_controller13_T */

#ifndef struct_tag_sawH9C58NaQx0EcT16OdroH
#define struct_tag_sawH9C58NaQx0EcT16OdroH

struct tag_sawH9C58NaQx0EcT16OdroH
{
  int32_T mConstr;
  int32_T mConstrOrig;
  int32_T mConstrMax;
  int32_T nVar;
  int32_T nVarOrig;
  int32_T nVarMax;
  int32_T ldA;
  real_T Aineq[32];
  real_T bineq[8];
  real_T lb[4];
  real_T ub[4];
  int32_T indexLB[4];
  int32_T indexUB[4];
  int32_T indexFixed[4];
  int32_T mEqRemoved;
  real_T ATwset[36];
  real_T bwset[9];
  int32_T nActiveConstr;
  real_T maxConstrWorkspace[9];
  int32_T sizes[5];
  int32_T sizesNormal[5];
  int32_T sizesPhaseOne[5];
  int32_T sizesRegularized[5];
  int32_T sizesRegPhaseOne[5];
  int32_T isActiveIdx[6];
  int32_T isActiveIdxNormal[6];
  int32_T isActiveIdxPhaseOne[6];
  int32_T isActiveIdxRegularized[6];
  int32_T isActiveIdxRegPhaseOne[6];
  boolean_T isActiveConstr[9];
  int32_T Wid[9];
  int32_T Wlocalidx[9];
  int32_T nWConstr[5];
  int32_T probType;
  real_T SLACK0;
};

#endif                                 /* struct_tag_sawH9C58NaQx0EcT16OdroH */

#ifndef typedef_sawH9C58NaQx0EcT16OdroH_controller13_T
#define typedef_sawH9C58NaQx0EcT16OdroH_controller13_T

typedef struct tag_sawH9C58NaQx0EcT16OdroH
  sawH9C58NaQx0EcT16OdroH_controller13_T;

#endif                      /* typedef_sawH9C58NaQx0EcT16OdroH_controller13_T */

#ifndef struct_tag_sSOeZ9WO10chPn9Si6PKiCB
#define struct_tag_sSOeZ9WO10chPn9Si6PKiCB

struct tag_sSOeZ9WO10chPn9Si6PKiCB
{
  real_T InitDamping;
  char_T FiniteDifferenceType[7];
  boolean_T SpecifyObjectiveGradient;
  boolean_T ScaleProblem;
  boolean_T SpecifyConstraintGradient;
  boolean_T NonFiniteSupport;
  boolean_T IterDisplaySQP;
  real_T FiniteDifferenceStepSize;
  real_T MaxFunctionEvaluations;
  boolean_T IterDisplayQP;
  real_T PricingTolerance;
  char_T Algorithm[10];
  real_T ObjectiveLimit;
  real_T ConstraintTolerance;
  real_T OptimalityTolerance;
  real_T StepTolerance;
  real_T MaxIterations;
  real_T FunctionTolerance;
  char_T SolverName[8];
  boolean_T CheckGradients;
  char_T Diagnostics[3];
  real_T DiffMaxChange;
  real_T DiffMinChange;
  char_T Display[5];
  char_T FunValCheck[3];
  boolean_T UseParallel;
  char_T LinearSolver[4];
  char_T SubproblemAlgorithm[2];
};

#endif                                 /* struct_tag_sSOeZ9WO10chPn9Si6PKiCB */

#ifndef typedef_sSOeZ9WO10chPn9Si6PKiCB_controller13_T
#define typedef_sSOeZ9WO10chPn9Si6PKiCB_controller13_T

typedef struct tag_sSOeZ9WO10chPn9Si6PKiCB
  sSOeZ9WO10chPn9Si6PKiCB_controller13_T;

#endif                      /* typedef_sSOeZ9WO10chPn9Si6PKiCB_controller13_T */

#ifndef struct_emxArray_real_T_1x1x1
#define struct_emxArray_real_T_1x1x1

struct emxArray_real_T_1x1x1
{
  real_T data;
  int32_T size[3];
};

#endif                                 /* struct_emxArray_real_T_1x1x1 */

#ifndef typedef_emxArray_real_T_1x1x1_controller13_T
#define typedef_emxArray_real_T_1x1x1_controller13_T

typedef struct emxArray_real_T_1x1x1 emxArray_real_T_1x1x1_controller13_T;

#endif                        /* typedef_emxArray_real_T_1x1x1_controller13_T */

#ifndef struct_tag_J1jgYCL4pdtOalsfiLDGbG
#define struct_tag_J1jgYCL4pdtOalsfiLDGbG

struct tag_J1jgYCL4pdtOalsfiLDGbG
{
  emxArray_real_T_1x1x1_controller13_T f1;
};

#endif                                 /* struct_tag_J1jgYCL4pdtOalsfiLDGbG */

#ifndef typedef_cell_wrap_7_controller13_T
#define typedef_cell_wrap_7_controller13_T

typedef struct tag_J1jgYCL4pdtOalsfiLDGbG cell_wrap_7_controller13_T;

#endif                                 /* typedef_cell_wrap_7_controller13_T */

#ifndef struct_tag_YBKAtGZQdrXRSFEiuRSO0
#define struct_tag_YBKAtGZQdrXRSFEiuRSO0

struct tag_YBKAtGZQdrXRSFEiuRSO0
{
  emxArray_real_T_1x1x1_controller13_T f1;
};

#endif                                 /* struct_tag_YBKAtGZQdrXRSFEiuRSO0 */

#ifndef typedef_cell_wrap_4_controller13_T
#define typedef_cell_wrap_4_controller13_T

typedef struct tag_YBKAtGZQdrXRSFEiuRSO0 cell_wrap_4_controller13_T;

#endif                                 /* typedef_cell_wrap_4_controller13_T */

/* Parameters (default storage) */
typedef struct P_controller13_T_ P_controller13_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_controller13_T RT_MODEL_controller13_T;

#endif                                 /* RTW_HEADER_controller13_types_h_ */
