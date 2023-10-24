/*
 * controller13.h
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

#ifndef RTW_HEADER_controller13_h_
#define RTW_HEADER_controller13_h_
#ifndef controller13_COMMON_INCLUDES_
#define controller13_COMMON_INCLUDES_
#include <stdio.h>
#include "ToAsyncQueueTgtAppSvc/ToAsyncQueueTgtAppSvcCIntrf.h"
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "dt_info.h"
#include "ext_work.h"
#include "sldrtdef.h"
#endif                                 /* controller13_COMMON_INCLUDES_ */

#include "controller13_types.h"
#include "rt_nonfinite.h"
#include "rtGetInf.h"
#include "rtGetNaN.h"
#include <stddef.h>
#include <string.h>
#include "rt_defines.h"
#include "zero_crossing_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmGetBlockIO
#define rtmGetBlockIO(rtm)             ((rtm)->blockIO)
#endif

#ifndef rtmSetBlockIO
#define rtmSetBlockIO(rtm, val)        ((rtm)->blockIO = (val))
#endif

#ifndef rtmGetChecksums
#define rtmGetChecksums(rtm)           ((rtm)->Sizes.checksums)
#endif

#ifndef rtmSetChecksums
#define rtmSetChecksums(rtm, val)      ((rtm)->Sizes.checksums = (val))
#endif

#ifndef rtmGetConstBlockIO
#define rtmGetConstBlockIO(rtm)        ((rtm)->constBlockIO)
#endif

#ifndef rtmSetConstBlockIO
#define rtmSetConstBlockIO(rtm, val)   ((rtm)->constBlockIO = (val))
#endif

#ifndef rtmGetContStateDisabled
#define rtmGetContStateDisabled(rtm)   ((rtm)->contStateDisabled)
#endif

#ifndef rtmSetContStateDisabled
#define rtmSetContStateDisabled(rtm, val) ((rtm)->contStateDisabled = (val))
#endif

#ifndef rtmGetContStates
#define rtmGetContStates(rtm)          ((rtm)->contStates)
#endif

#ifndef rtmSetContStates
#define rtmSetContStates(rtm, val)     ((rtm)->contStates = (val))
#endif

#ifndef rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmGetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm) ((rtm)->CTOutputIncnstWithState)
#endif

#ifndef rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag
#define rtmSetContTimeOutputInconsistentWithStateAtMajorStepFlag(rtm, val) ((rtm)->CTOutputIncnstWithState = (val))
#endif

#ifndef rtmGetCtrlRateMdlRefTiming
#define rtmGetCtrlRateMdlRefTiming(rtm) ()
#endif

#ifndef rtmSetCtrlRateMdlRefTiming
#define rtmSetCtrlRateMdlRefTiming(rtm, val) ()
#endif

#ifndef rtmGetCtrlRateMdlRefTimingPtr
#define rtmGetCtrlRateMdlRefTimingPtr(rtm) ()
#endif

#ifndef rtmSetCtrlRateMdlRefTimingPtr
#define rtmSetCtrlRateMdlRefTimingPtr(rtm, val) ()
#endif

#ifndef rtmGetCtrlRateNumTicksToNextHit
#define rtmGetCtrlRateNumTicksToNextHit(rtm) ()
#endif

#ifndef rtmSetCtrlRateNumTicksToNextHit
#define rtmSetCtrlRateNumTicksToNextHit(rtm, val) ()
#endif

#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm)         ()
#endif

#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val)    ()
#endif

#ifndef rtmGetDefaultParam
#define rtmGetDefaultParam(rtm)        ((rtm)->defaultParam)
#endif

#ifndef rtmSetDefaultParam
#define rtmSetDefaultParam(rtm, val)   ((rtm)->defaultParam = (val))
#endif

#ifndef rtmGetDerivCacheNeedsReset
#define rtmGetDerivCacheNeedsReset(rtm) ((rtm)->derivCacheNeedsReset)
#endif

#ifndef rtmSetDerivCacheNeedsReset
#define rtmSetDerivCacheNeedsReset(rtm, val) ((rtm)->derivCacheNeedsReset = (val))
#endif

#ifndef rtmGetDirectFeedThrough
#define rtmGetDirectFeedThrough(rtm)   ((rtm)->Sizes.sysDirFeedThru)
#endif

#ifndef rtmSetDirectFeedThrough
#define rtmSetDirectFeedThrough(rtm, val) ((rtm)->Sizes.sysDirFeedThru = (val))
#endif

#ifndef rtmGetErrorStatusFlag
#define rtmGetErrorStatusFlag(rtm)     ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatusFlag
#define rtmSetErrorStatusFlag(rtm, val) ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmSetFinalTime
#define rtmSetFinalTime(rtm, val)      ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetFirstInitCondFlag
#define rtmGetFirstInitCondFlag(rtm)   ((rtm)->Timing.firstInitCondFlag)
#endif

#ifndef rtmSetFirstInitCondFlag
#define rtmSetFirstInitCondFlag(rtm, val) ((rtm)->Timing.firstInitCondFlag = (val))
#endif

#ifndef rtmGetIntgData
#define rtmGetIntgData(rtm)            ((rtm)->intgData)
#endif

#ifndef rtmSetIntgData
#define rtmSetIntgData(rtm, val)       ((rtm)->intgData = (val))
#endif

#ifndef rtmGetMdlRefGlobalRuntimeEventIndices
#define rtmGetMdlRefGlobalRuntimeEventIndices(rtm) ()
#endif

#ifndef rtmSetMdlRefGlobalRuntimeEventIndices
#define rtmSetMdlRefGlobalRuntimeEventIndices(rtm, val) ()
#endif

#ifndef rtmGetMdlRefGlobalTID
#define rtmGetMdlRefGlobalTID(rtm)     ()
#endif

#ifndef rtmSetMdlRefGlobalTID
#define rtmSetMdlRefGlobalTID(rtm, val) ()
#endif

#ifndef rtmGetMdlRefGlobalTimerIndices
#define rtmGetMdlRefGlobalTimerIndices(rtm) ()
#endif

#ifndef rtmSetMdlRefGlobalTimerIndices
#define rtmSetMdlRefGlobalTimerIndices(rtm, val) ()
#endif

#ifndef rtmGetMdlRefTriggerTID
#define rtmGetMdlRefTriggerTID(rtm)    ()
#endif

#ifndef rtmSetMdlRefTriggerTID
#define rtmSetMdlRefTriggerTID(rtm, val) ()
#endif

#ifndef rtmGetModelMappingInfo
#define rtmGetModelMappingInfo(rtm)    ((rtm)->SpecialInfo.mappingInfo)
#endif

#ifndef rtmSetModelMappingInfo
#define rtmSetModelMappingInfo(rtm, val) ((rtm)->SpecialInfo.mappingInfo = (val))
#endif

#ifndef rtmGetModelName
#define rtmGetModelName(rtm)           ((rtm)->modelName)
#endif

#ifndef rtmSetModelName
#define rtmSetModelName(rtm, val)      ((rtm)->modelName = (val))
#endif

#ifndef rtmGetNonInlinedSFcns
#define rtmGetNonInlinedSFcns(rtm)     ()
#endif

#ifndef rtmSetNonInlinedSFcns
#define rtmSetNonInlinedSFcns(rtm, val) ()
#endif

#ifndef rtmGetNumBlockIO
#define rtmGetNumBlockIO(rtm)          ((rtm)->Sizes.numBlockIO)
#endif

#ifndef rtmSetNumBlockIO
#define rtmSetNumBlockIO(rtm, val)     ((rtm)->Sizes.numBlockIO = (val))
#endif

#ifndef rtmGetNumBlockParams
#define rtmGetNumBlockParams(rtm)      ((rtm)->Sizes.numBlockPrms)
#endif

#ifndef rtmSetNumBlockParams
#define rtmSetNumBlockParams(rtm, val) ((rtm)->Sizes.numBlockPrms = (val))
#endif

#ifndef rtmGetNumBlocks
#define rtmGetNumBlocks(rtm)           ((rtm)->Sizes.numBlocks)
#endif

#ifndef rtmSetNumBlocks
#define rtmSetNumBlocks(rtm, val)      ((rtm)->Sizes.numBlocks = (val))
#endif

#ifndef rtmGetNumContStates
#define rtmGetNumContStates(rtm)       ((rtm)->Sizes.numContStates)
#endif

#ifndef rtmSetNumContStates
#define rtmSetNumContStates(rtm, val)  ((rtm)->Sizes.numContStates = (val))
#endif

#ifndef rtmGetNumDWork
#define rtmGetNumDWork(rtm)            ((rtm)->Sizes.numDwork)
#endif

#ifndef rtmSetNumDWork
#define rtmSetNumDWork(rtm, val)       ((rtm)->Sizes.numDwork = (val))
#endif

#ifndef rtmGetNumInputPorts
#define rtmGetNumInputPorts(rtm)       ((rtm)->Sizes.numIports)
#endif

#ifndef rtmSetNumInputPorts
#define rtmSetNumInputPorts(rtm, val)  ((rtm)->Sizes.numIports = (val))
#endif

#ifndef rtmGetNumNonSampledZCs
#define rtmGetNumNonSampledZCs(rtm)    ((rtm)->Sizes.numNonSampZCs)
#endif

#ifndef rtmSetNumNonSampledZCs
#define rtmSetNumNonSampledZCs(rtm, val) ((rtm)->Sizes.numNonSampZCs = (val))
#endif

#ifndef rtmGetNumOutputPorts
#define rtmGetNumOutputPorts(rtm)      ((rtm)->Sizes.numOports)
#endif

#ifndef rtmSetNumOutputPorts
#define rtmSetNumOutputPorts(rtm, val) ((rtm)->Sizes.numOports = (val))
#endif

#ifndef rtmGetNumPeriodicContStates
#define rtmGetNumPeriodicContStates(rtm) ((rtm)->Sizes.numPeriodicContStates)
#endif

#ifndef rtmSetNumPeriodicContStates
#define rtmSetNumPeriodicContStates(rtm, val) ((rtm)->Sizes.numPeriodicContStates = (val))
#endif

#ifndef rtmGetNumSFcnParams
#define rtmGetNumSFcnParams(rtm)       ((rtm)->Sizes.numSFcnPrms)
#endif

#ifndef rtmSetNumSFcnParams
#define rtmSetNumSFcnParams(rtm, val)  ((rtm)->Sizes.numSFcnPrms = (val))
#endif

#ifndef rtmGetNumSFunctions
#define rtmGetNumSFunctions(rtm)       ((rtm)->Sizes.numSFcns)
#endif

#ifndef rtmSetNumSFunctions
#define rtmSetNumSFunctions(rtm, val)  ((rtm)->Sizes.numSFcns = (val))
#endif

#ifndef rtmGetNumSampleTimes
#define rtmGetNumSampleTimes(rtm)      ((rtm)->Sizes.numSampTimes)
#endif

#ifndef rtmSetNumSampleTimes
#define rtmSetNumSampleTimes(rtm, val) ((rtm)->Sizes.numSampTimes = (val))
#endif

#ifndef rtmGetNumU
#define rtmGetNumU(rtm)                ((rtm)->Sizes.numU)
#endif

#ifndef rtmSetNumU
#define rtmSetNumU(rtm, val)           ((rtm)->Sizes.numU = (val))
#endif

#ifndef rtmGetNumY
#define rtmGetNumY(rtm)                ((rtm)->Sizes.numY)
#endif

#ifndef rtmSetNumY
#define rtmSetNumY(rtm, val)           ((rtm)->Sizes.numY = (val))
#endif

#ifndef rtmGetOdeF
#define rtmGetOdeF(rtm)                ((rtm)->odeF)
#endif

#ifndef rtmSetOdeF
#define rtmSetOdeF(rtm, val)           ((rtm)->odeF = (val))
#endif

#ifndef rtmGetOdeY
#define rtmGetOdeY(rtm)                ((rtm)->odeY)
#endif

#ifndef rtmSetOdeY
#define rtmSetOdeY(rtm, val)           ((rtm)->odeY = (val))
#endif

#ifndef rtmGetOffsetTimeArray
#define rtmGetOffsetTimeArray(rtm)     ((rtm)->Timing.offsetTimesArray)
#endif

#ifndef rtmSetOffsetTimeArray
#define rtmSetOffsetTimeArray(rtm, val) ((rtm)->Timing.offsetTimesArray = (val))
#endif

#ifndef rtmGetOffsetTimePtr
#define rtmGetOffsetTimePtr(rtm)       ((rtm)->Timing.offsetTimes)
#endif

#ifndef rtmSetOffsetTimePtr
#define rtmSetOffsetTimePtr(rtm, val)  ((rtm)->Timing.offsetTimes = (val))
#endif

#ifndef rtmGetOptions
#define rtmGetOptions(rtm)             ((rtm)->Sizes.options)
#endif

#ifndef rtmSetOptions
#define rtmSetOptions(rtm, val)        ((rtm)->Sizes.options = (val))
#endif

#ifndef rtmGetParamIsMalloced
#define rtmGetParamIsMalloced(rtm)     ()
#endif

#ifndef rtmSetParamIsMalloced
#define rtmSetParamIsMalloced(rtm, val) ()
#endif

#ifndef rtmGetPath
#define rtmGetPath(rtm)                ((rtm)->path)
#endif

#ifndef rtmSetPath
#define rtmSetPath(rtm, val)           ((rtm)->path = (val))
#endif

#ifndef rtmGetPerTaskSampleHits
#define rtmGetPerTaskSampleHits(rtm)   ()
#endif

#ifndef rtmSetPerTaskSampleHits
#define rtmSetPerTaskSampleHits(rtm, val) ()
#endif

#ifndef rtmGetPerTaskSampleHitsArray
#define rtmGetPerTaskSampleHitsArray(rtm) ((rtm)->Timing.perTaskSampleHitsArray)
#endif

#ifndef rtmSetPerTaskSampleHitsArray
#define rtmSetPerTaskSampleHitsArray(rtm, val) ((rtm)->Timing.perTaskSampleHitsArray = (val))
#endif

#ifndef rtmGetPerTaskSampleHitsPtr
#define rtmGetPerTaskSampleHitsPtr(rtm) ((rtm)->Timing.perTaskSampleHits)
#endif

#ifndef rtmSetPerTaskSampleHitsPtr
#define rtmSetPerTaskSampleHitsPtr(rtm, val) ((rtm)->Timing.perTaskSampleHits = (val))
#endif

#ifndef rtmGetPeriodicContStateIndices
#define rtmGetPeriodicContStateIndices(rtm) ((rtm)->periodicContStateIndices)
#endif

#ifndef rtmSetPeriodicContStateIndices
#define rtmSetPeriodicContStateIndices(rtm, val) ((rtm)->periodicContStateIndices = (val))
#endif

#ifndef rtmGetPeriodicContStateRanges
#define rtmGetPeriodicContStateRanges(rtm) ((rtm)->periodicContStateRanges)
#endif

#ifndef rtmSetPeriodicContStateRanges
#define rtmSetPeriodicContStateRanges(rtm, val) ((rtm)->periodicContStateRanges = (val))
#endif

#ifndef rtmGetPrevZCSigState
#define rtmGetPrevZCSigState(rtm)      ((rtm)->prevZCSigState)
#endif

#ifndef rtmSetPrevZCSigState
#define rtmSetPrevZCSigState(rtm, val) ((rtm)->prevZCSigState = (val))
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmSetRTWExtModeInfo
#define rtmSetRTWExtModeInfo(rtm, val) ((rtm)->extModeInfo = (val))
#endif

#ifndef rtmGetRTWGeneratedSFcn
#define rtmGetRTWGeneratedSFcn(rtm)    ((rtm)->Sizes.rtwGenSfcn)
#endif

#ifndef rtmSetRTWGeneratedSFcn
#define rtmSetRTWGeneratedSFcn(rtm, val) ((rtm)->Sizes.rtwGenSfcn = (val))
#endif

#ifndef rtmGetRTWLogInfo
#define rtmGetRTWLogInfo(rtm)          ()
#endif

#ifndef rtmSetRTWLogInfo
#define rtmSetRTWLogInfo(rtm, val)     ()
#endif

#ifndef rtmGetRTWRTModelMethodsInfo
#define rtmGetRTWRTModelMethodsInfo(rtm) ()
#endif

#ifndef rtmSetRTWRTModelMethodsInfo
#define rtmSetRTWRTModelMethodsInfo(rtm, val) ()
#endif

#ifndef rtmGetRTWSfcnInfo
#define rtmGetRTWSfcnInfo(rtm)         ((rtm)->sfcnInfo)
#endif

#ifndef rtmSetRTWSfcnInfo
#define rtmSetRTWSfcnInfo(rtm, val)    ((rtm)->sfcnInfo = (val))
#endif

#ifndef rtmGetRTWSolverInfo
#define rtmGetRTWSolverInfo(rtm)       ((rtm)->solverInfo)
#endif

#ifndef rtmSetRTWSolverInfo
#define rtmSetRTWSolverInfo(rtm, val)  ((rtm)->solverInfo = (val))
#endif

#ifndef rtmGetRTWSolverInfoPtr
#define rtmGetRTWSolverInfoPtr(rtm)    ((rtm)->solverInfoPtr)
#endif

#ifndef rtmSetRTWSolverInfoPtr
#define rtmSetRTWSolverInfoPtr(rtm, val) ((rtm)->solverInfoPtr = (val))
#endif

#ifndef rtmGetReservedForXPC
#define rtmGetReservedForXPC(rtm)      ((rtm)->SpecialInfo.xpcData)
#endif

#ifndef rtmSetReservedForXPC
#define rtmSetReservedForXPC(rtm, val) ((rtm)->SpecialInfo.xpcData = (val))
#endif

#ifndef rtmGetRootDWork
#define rtmGetRootDWork(rtm)           ((rtm)->dwork)
#endif

#ifndef rtmSetRootDWork
#define rtmSetRootDWork(rtm, val)      ((rtm)->dwork = (val))
#endif

#ifndef rtmGetSFunctions
#define rtmGetSFunctions(rtm)          ((rtm)->childSfunctions)
#endif

#ifndef rtmSetSFunctions
#define rtmSetSFunctions(rtm, val)     ((rtm)->childSfunctions = (val))
#endif

#ifndef rtmGetSampleHitArray
#define rtmGetSampleHitArray(rtm)      ((rtm)->Timing.sampleHitArray)
#endif

#ifndef rtmSetSampleHitArray
#define rtmSetSampleHitArray(rtm, val) ((rtm)->Timing.sampleHitArray = (val))
#endif

#ifndef rtmGetSampleHitPtr
#define rtmGetSampleHitPtr(rtm)        ((rtm)->Timing.sampleHits)
#endif

#ifndef rtmSetSampleHitPtr
#define rtmSetSampleHitPtr(rtm, val)   ((rtm)->Timing.sampleHits = (val))
#endif

#ifndef rtmGetSampleTimeArray
#define rtmGetSampleTimeArray(rtm)     ((rtm)->Timing.sampleTimesArray)
#endif

#ifndef rtmSetSampleTimeArray
#define rtmSetSampleTimeArray(rtm, val) ((rtm)->Timing.sampleTimesArray = (val))
#endif

#ifndef rtmGetSampleTimePtr
#define rtmGetSampleTimePtr(rtm)       ((rtm)->Timing.sampleTimes)
#endif

#ifndef rtmSetSampleTimePtr
#define rtmSetSampleTimePtr(rtm, val)  ((rtm)->Timing.sampleTimes = (val))
#endif

#ifndef rtmGetSampleTimeTaskIDArray
#define rtmGetSampleTimeTaskIDArray(rtm) ((rtm)->Timing.sampleTimeTaskIDArray)
#endif

#ifndef rtmSetSampleTimeTaskIDArray
#define rtmSetSampleTimeTaskIDArray(rtm, val) ((rtm)->Timing.sampleTimeTaskIDArray = (val))
#endif

#ifndef rtmGetSampleTimeTaskIDPtr
#define rtmGetSampleTimeTaskIDPtr(rtm) ((rtm)->Timing.sampleTimeTaskIDPtr)
#endif

#ifndef rtmSetSampleTimeTaskIDPtr
#define rtmSetSampleTimeTaskIDPtr(rtm, val) ((rtm)->Timing.sampleTimeTaskIDPtr = (val))
#endif

#ifndef rtmGetSelf
#define rtmGetSelf(rtm)                ()
#endif

#ifndef rtmSetSelf
#define rtmSetSelf(rtm, val)           ()
#endif

#ifndef rtmGetSimMode
#define rtmGetSimMode(rtm)             ((rtm)->simMode)
#endif

#ifndef rtmSetSimMode
#define rtmSetSimMode(rtm, val)        ((rtm)->simMode = (val))
#endif

#ifndef rtmGetSimTimeStep
#define rtmGetSimTimeStep(rtm)         ((rtm)->Timing.simTimeStep)
#endif

#ifndef rtmSetSimTimeStep
#define rtmSetSimTimeStep(rtm, val)    ((rtm)->Timing.simTimeStep = (val))
#endif

#ifndef rtmGetStartTime
#define rtmGetStartTime(rtm)           ((rtm)->Timing.tStart)
#endif

#ifndef rtmSetStartTime
#define rtmSetStartTime(rtm, val)      ((rtm)->Timing.tStart = (val))
#endif

#ifndef rtmGetStepSize
#define rtmGetStepSize(rtm)            ((rtm)->Timing.stepSize)
#endif

#ifndef rtmSetStepSize
#define rtmSetStepSize(rtm, val)       ((rtm)->Timing.stepSize = (val))
#endif

#ifndef rtmGetStopRequestedFlag
#define rtmGetStopRequestedFlag(rtm)   ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequestedFlag
#define rtmSetStopRequestedFlag(rtm, val) ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetTaskCounters
#define rtmGetTaskCounters(rtm)        ((rtm)->Timing.TaskCounters)
#endif

#ifndef rtmSetTaskCounters
#define rtmSetTaskCounters(rtm, val)   ((rtm)->Timing.TaskCounters = (val))
#endif

#ifndef rtmGetTaskTimeArray
#define rtmGetTaskTimeArray(rtm)       ((rtm)->Timing.tArray)
#endif

#ifndef rtmSetTaskTimeArray
#define rtmSetTaskTimeArray(rtm, val)  ((rtm)->Timing.tArray = (val))
#endif

#ifndef rtmGetTimePtr
#define rtmGetTimePtr(rtm)             ((rtm)->Timing.t)
#endif

#ifndef rtmSetTimePtr
#define rtmSetTimePtr(rtm, val)        ((rtm)->Timing.t = (val))
#endif

#ifndef rtmGetTimingData
#define rtmGetTimingData(rtm)          ((rtm)->Timing.timingData)
#endif

#ifndef rtmSetTimingData
#define rtmSetTimingData(rtm, val)     ((rtm)->Timing.timingData = (val))
#endif

#ifndef rtmGetU
#define rtmGetU(rtm)                   ((rtm)->inputs)
#endif

#ifndef rtmSetU
#define rtmSetU(rtm, val)              ((rtm)->inputs = (val))
#endif

#ifndef rtmGetVarNextHitTimesListPtr
#define rtmGetVarNextHitTimesListPtr(rtm) ((rtm)->Timing.varNextHitTimesList)
#endif

#ifndef rtmSetVarNextHitTimesListPtr
#define rtmSetVarNextHitTimesListPtr(rtm, val) ((rtm)->Timing.varNextHitTimesList = (val))
#endif

#ifndef rtmGetY
#define rtmGetY(rtm)                   ((rtm)->outputs)
#endif

#ifndef rtmSetY
#define rtmSetY(rtm, val)              ((rtm)->outputs = (val))
#endif

#ifndef rtmGetZCCacheNeedsReset
#define rtmGetZCCacheNeedsReset(rtm)   ((rtm)->zCCacheNeedsReset)
#endif

#ifndef rtmSetZCCacheNeedsReset
#define rtmSetZCCacheNeedsReset(rtm, val) ((rtm)->zCCacheNeedsReset = (val))
#endif

#ifndef rtmGetZCSignalValues
#define rtmGetZCSignalValues(rtm)      ((rtm)->zcSignalValues)
#endif

#ifndef rtmSetZCSignalValues
#define rtmSetZCSignalValues(rtm, val) ((rtm)->zcSignalValues = (val))
#endif

#ifndef rtmGet_TimeOfLastOutput
#define rtmGet_TimeOfLastOutput(rtm)   ((rtm)->Timing.timeOfLastOutput)
#endif

#ifndef rtmSet_TimeOfLastOutput
#define rtmSet_TimeOfLastOutput(rtm, val) ((rtm)->Timing.timeOfLastOutput = (val))
#endif

#ifndef rtmGetdX
#define rtmGetdX(rtm)                  ((rtm)->derivs)
#endif

#ifndef rtmSetdX
#define rtmSetdX(rtm, val)             ((rtm)->derivs = (val))
#endif

#ifndef rtmGettimingBridge
#define rtmGettimingBridge(rtm)        ()
#endif

#ifndef rtmSettimingBridge
#define rtmSettimingBridge(rtm, val)   ()
#endif

#ifndef rtmGetChecksumVal
#define rtmGetChecksumVal(rtm, idx)    ((rtm)->Sizes.checksums[idx])
#endif

#ifndef rtmSetChecksumVal
#define rtmSetChecksumVal(rtm, idx, val) ((rtm)->Sizes.checksums[idx] = (val))
#endif

#ifndef rtmGetDWork
#define rtmGetDWork(rtm, idx)          ((rtm)->dwork[idx])
#endif

#ifndef rtmSetDWork
#define rtmSetDWork(rtm, idx, val)     ((rtm)->dwork[idx] = (val))
#endif

#ifndef rtmGetOffsetTime
#define rtmGetOffsetTime(rtm, idx)     ((rtm)->Timing.offsetTimes[idx])
#endif

#ifndef rtmSetOffsetTime
#define rtmSetOffsetTime(rtm, idx, val) ((rtm)->Timing.offsetTimes[idx] = (val))
#endif

#ifndef rtmGetSFunction
#define rtmGetSFunction(rtm, idx)      ((rtm)->childSfunctions[idx])
#endif

#ifndef rtmSetSFunction
#define rtmSetSFunction(rtm, idx, val) ((rtm)->childSfunctions[idx] = (val))
#endif

#ifndef rtmGetSampleTime
#define rtmGetSampleTime(rtm, idx)     ((rtm)->Timing.sampleTimes[idx])
#endif

#ifndef rtmSetSampleTime
#define rtmSetSampleTime(rtm, idx, val) ((rtm)->Timing.sampleTimes[idx] = (val))
#endif

#ifndef rtmGetSampleTimeTaskID
#define rtmGetSampleTimeTaskID(rtm, idx) ((rtm)->Timing.sampleTimeTaskIDPtr[idx])
#endif

#ifndef rtmSetSampleTimeTaskID
#define rtmSetSampleTimeTaskID(rtm, idx, val) ((rtm)->Timing.sampleTimeTaskIDPtr[idx] = (val))
#endif

#ifndef rtmGetVarNextHitTimeList
#define rtmGetVarNextHitTimeList(rtm, idx) ((rtm)->Timing.varNextHitTimesList[idx])
#endif

#ifndef rtmSetVarNextHitTimeList
#define rtmSetVarNextHitTimeList(rtm, idx, val) ((rtm)->Timing.varNextHitTimesList[idx] = (val))
#endif

#ifndef rtmIsContinuousTask
#define rtmIsContinuousTask(rtm, tid)  ((tid) == 0)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmSetFirstInitCond
#define rtmSetFirstInitCond(rtm, val)  ((rtm)->Timing.firstInitCondFlag = (val))
#endif

#ifndef rtmIsFirstInitCond
#define rtmIsFirstInitCond(rtm)        ((rtm)->Timing.firstInitCondFlag)
#endif

#ifndef rtmIsMajorTimeStep
#define rtmIsMajorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MAJOR_TIME_STEP)
#endif

#ifndef rtmIsMinorTimeStep
#define rtmIsMinorTimeStep(rtm)        (((rtm)->Timing.simTimeStep) == MINOR_TIME_STEP)
#endif

#ifndef rtmIsSampleHit
#define rtmIsSampleHit(rtm, sti, tid)  ((rtmIsMajorTimeStep((rtm)) && (rtm)->Timing.sampleHits[(rtm)->Timing.sampleTimeTaskIDPtr[sti]]))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   (rtmGetTPtr((rtm))[0])
#endif

#ifndef rtmSetT
#define rtmSetT(rtm, val)                                        /* Do Nothing */
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmSetTFinal
#define rtmSetTFinal(rtm, val)         ((rtm)->Timing.tFinal = (val))
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                ((rtm)->Timing.t)
#endif

#ifndef rtmSetTPtr
#define rtmSetTPtr(rtm, val)           ((rtm)->Timing.t = (val))
#endif

#ifndef rtmGetTStart
#define rtmGetTStart(rtm)              ((rtm)->Timing.tStart)
#endif

#ifndef rtmSetTStart
#define rtmSetTStart(rtm, val)         ((rtm)->Timing.tStart = (val))
#endif

#ifndef rtmGetTaskTime
#define rtmGetTaskTime(rtm, sti)       (rtmGetTPtr((rtm))[(rtm)->Timing.sampleTimeTaskIDPtr[sti]])
#endif

#ifndef rtmSetTaskTime
#define rtmSetTaskTime(rtm, sti, val)  (rtmGetTPtr((rtm))[sti] = (val))
#endif

#ifndef rtmGetTimeOfLastOutput
#define rtmGetTimeOfLastOutput(rtm)    ((rtm)->Timing.timeOfLastOutput)
#endif

#ifdef rtmGetRTWSolverInfo
#undef rtmGetRTWSolverInfo
#endif

#define rtmGetRTWSolverInfo(rtm)       &((rtm)->solverInfo)

/* Definition for use in the target main file */
#define controller13_rtModel           RT_MODEL_controller13_T

/* Block signals for system '<S32>/bee units to SI' */
typedef struct {
  real_T s_si[19];                     /* '<S32>/bee units to SI' */
} B_beeunitstoSI_controller13_T;

/* Block states (default storage) for system '<S32>/bee units to SI' */
typedef struct {
  int32_T sfEvent;                     /* '<S32>/bee units to SI' */
  uint8_T is_active_c15_controller13;  /* '<S32>/bee units to SI' */
  boolean_T doneDoubleBufferReInit;    /* '<S32>/bee units to SI' */
} DW_beeunitstoSI_controller13_T;

/* Block signals (default storage) */
typedef struct {
  real_T Product;                      /* '<S97>/Product' */
  real_T xeyeze[3];                    /* '<S40>/xe,ye,ze' */
  real_T Eul_XYZ[3];                   /* '<S2>/Zero-Order Hold7' */
  real_T q0;                           /* '<S52>/q0' */
  real_T q1;                           /* '<S52>/q1' */
  real_T q2;                           /* '<S52>/q2' */
  real_T q3;                           /* '<S52>/q3' */
  real_T TmpSignalConversionAtq0q1q2q3Inport2[4];
                                    /* '<S42>/Rotation Angles to Quaternions' */
  real_T Transpose[9];                 /* '<S2>/Transpose' */
  real_T Eul_XYZ_j[3];                 /* '<S2>/Zero-Order Hold6' */
  real_T Switch[6];                    /* '<Root>/Switch' */
  real_T u;                            /* '<S3>/ ' */
  real_T u_g;                          /* '<S3>/  ' */
  real_T lowpass;                      /* '<S12>/low pass' */
  real_T lowpass1;                     /* '<S12>/low pass1' */
  real_T lowpass2;                     /* '<S12>/low pass2' */
  real_T Switch4[9];                   /* '<S12>/Switch4' */
  real_T lowpass3[9];                  /* '<S26>/low pass3' */
  real_T Switch5[3];                   /* '<S12>/Switch5' */
  real_T Switch_fc[3];                 /* '<S12>/Switch' */
  real_T Switch1_g[3];                 /* '<S12>/Switch1' */
  real_T Switch2_k[3];                 /* '<S12>/Switch2' */
  real_T lowpass_h[3];                 /* '<S9>/low pass' */
  real_T Multiply[3];                  /* '<S12>/Multiply' */
  real_T Multiply1[3];                 /* '<S12>/Multiply1' */
  real_T NMPCF;                        /* '<S9>/Gain1' */
  real_T Saturation1;                  /* '<Root>/Saturation1' */
  real_T Switch17;                     /* '<S8>/Switch17' */
  real_T Saturation2;                  /* '<Root>/Saturation2' */
  real_T Switch1_p;                    /* '<S8>/Switch1' */
  real_T Saturation3;                  /* '<Root>/Saturation3' */
  real_T Switch2_h;                    /* '<S8>/Switch2' */
  real_T Saturation4;                  /* '<Root>/Saturation4' */
  real_T Switch3;                      /* '<S8>/Switch3' */
  real_T TmpSignalConversionAtDelayInport1[4];
  real_T half1[4];                     /* '<S6>/half1' */
  real_T Add2;                         /* '<S91>/Add2' */
  real_T OutputWithRamping;            /* '<S91>/OutputWithRamping' */
  real_T Gain4;                        /* '<S6>/Gain4' */
  real_T Add2_n;                       /* '<S92>/Add2' */
  real_T Gain1;                        /* '<S6>/Gain1' */
  real_T Add2_c;                       /* '<S93>/Add2' */
  real_T Gain2;                        /* '<S6>/Gain2' */
  real_T Add2_l;                       /* '<S94>/Add2' */
  real_T Gain3;                        /* '<S6>/Gain3' */
  real_T raw_tf[4];
  /* '<S1>/TmpSignal ConversionAtTAQSigLogging_InsertedFor_Mux_at_outport_0Inport1' */
  real_T Switch7[3];                   /* '<S12>/Switch7' */
  real_T observer[21];
  /* '<S1>/TmpSignal ConversionAtTAQSigLogging_InsertedFor_observer_mux_at_outport_0Inport1' */
  real_T Constant3[3];                 /* '<S9>/Constant3' */
  real_T att_s[9];                     /* '<S26>/att_s' */
  real_T PoleYk1UkZeroUk1[9];          /* '<S27>/Sum' */
  real_T Product_f[3];                 /* '<S49>/Product' */
  real_T UnitConversion[3];            /* '<S47>/Unit Conversion' */
  real_T VectorConcatenate[3];         /* '<S67>/Vector Concatenate' */
  real_T pqr[3];                       /* '<S40>/p,q,r ' */
  real_T DigitalClock4;                /* '<S2>/Digital Clock4' */
  real_T Switch17_h[3];                /* '<S2>/Switch17' */
  real_T Selector1[9];                 /* '<S43>/Selector1' */
  real_T Selector[9];                  /* '<S43>/Selector' */
  real_T Selector2[9];                 /* '<S43>/Selector2' */
  real_T Reshape[3];                   /* '<S43>/Reshape' */
  real_T TmpSignalConversionAtq0q1q2q3Inport1[4];/* '<S42>/qdot' */
  real_T Switch4_o[3];                 /* '<S2>/Switch4' */
  real_T Product1[3];                  /* '<S2>/Product1' */
  real_T Sum[3];                       /* '<S40>/Sum' */
  real_T heighttoenablecontrol1;       /* '<S4>/height to enable control1' */
  real_T jumpingcontrolenable;         /* '<S4>/Product' */
  real_T SumofElements;                /* '<S4>/Sum of Elements' */
  real_T times1;                       /* '<Root>/times1' */
  real_T upi;                          /* '<S91>/2pi' */
  real_T Add;                          /* '<S95>/Add' */
  real_T Add_i;                        /* '<S99>/Add' */
  real_T upi_i;                        /* '<S92>/2pi' */
  real_T Add_l;                        /* '<S101>/Add' */
  real_T Add_a;                        /* '<S105>/Add' */
  real_T upi_k;                        /* '<S93>/2pi' */
  real_T Add_m;                        /* '<S107>/Add' */
  real_T Add_f;                        /* '<S111>/Add' */
  real_T upi_m;                        /* '<S94>/2pi' */
  real_T Add_p;                        /* '<S113>/Add' */
  real_T Add_mt;                       /* '<S117>/Add' */
  real_T ExecutionTime;                /* '<Root>/Execution Time' */
  real_T motors_thrust[4];             /* '<Root>/motor thrust mapping' */
  real_T en;                           /* '<S82>/voltage check' */
  real_T en_e;                         /* '<S88>/landing_cond' */
  real_T en_o;                         /* '<S82>/envelope check' */
  real_T en_out;                       /* '<S82>/MATLAB Function' */
  real_T cum_out;                      /* '<S82>/MATLAB Function' */
  real_T thrust;                       /* '<S2>/power_distribution_1' */
  real_T torque[3];                    /* '<S2>/power_distribution_1' */
  real_T rotm[3];             /* '<S2>/Coordinate Transformation Conversion1' */
  real_T X_roll;                       /* '<S1>/saturation' */
  real_T Y_pitch;                      /* '<S1>/saturation' */
  real_T Force;                        /* '<S1>/saturation' */
  real_T exitflag;                     /* '<S1>/saturation' */
  real_T r[3];                         /* '<S29>/unpack state' */
  real_T r_dot[3];                     /* '<S29>/unpack state' */
  real_T omega[3];                     /* '<S29>/unpack state' */
  real_T F_ext[3];                     /* '<S29>/unpack state' */
  real_T R_flat[9];                  /* '<S29>/quaternion to rotation matrix' */
  real_T z_raw[13];                    /* '<S29>/pack measurement vector' */
  real_T P_flat_si[324];               /* '<S32>/bee cov to SI cov' */
  real_T s_out[19];                    /* '<S32>/UKF update then predict' */
  real_T P_out_flat[324];              /* '<S32>/UKF update then predict' */
  real_T is_init_out;                  /* '<S32>/UKF update then predict' */
  real_T s_prediction_out[19];         /* '<S32>/UKF update then predict' */
  real_T md;                           /* '<S32>/UKF update then predict' */
  real_T rpy[3];                       /* '<S12>/Rotm2rpy1' */
  real_T pos_hat[3];   /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  real_T vel_hat[3];   /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  real_T id_out;       /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  real_T w[3];                         /* '<S22>/Rotation Matrix1' */
  real_T R_a[9];                       /* '<S22>/Rotation Matrix' */
  real_T omega_hat[2];                 /* '<S12>/External Torque Observer' */
  real_T rd[3];                        /* '<S1>/adaptive setpoint rd' */
  real_T rd_d[3];                      /* '<S1>/adaptive setpoint rd' */
  real_T B_omega_d[3];                 /* '<S9>/Learned RTNMPC' */
  real_T f_cmd;                        /* '<S9>/Learned RTNMPC' */
  real_T x_in[10];                     /* '<S9>/Learned RTNMPC' */
  real_T u_h[4];                       /* '<S9>/Learned RTNMPC' */
  real_T obs[14];                      /* '<S9>/Learned RTNMPC' */
  real_T ypr_WI[3];                    /* '<S9>/Learned RTNMPC' */
  real_T ypr_IB[3];                    /* '<S9>/Learned RTNMPC' */
  real_T ypr_WB[3];                    /* '<S9>/Learned RTNMPC' */
  real_T q_b[4];                       /* '<S9>/Learned RTNMPC' */
  real_T r_origin[3];                  /* '<S9>/Learned RTNMPC' */
  real_T time;                         /* '<S9>/Learned RTNMPC' */
  real_T cmd_B_torque[3];             /* '<S9>/Geometric Attitude Controller' */
  real_T M_e_att[3];                  /* '<S9>/Geometric Attitude Controller' */
  real_T M_e_angv[3];                 /* '<S9>/Geometric Attitude Controller' */
  real_T M_e_cross[3];                /* '<S9>/Geometric Attitude Controller' */
  real_T M_e_ang_acc[3];              /* '<S9>/Geometric Attitude Controller' */
  real_T M_e_ext_tau[3];              /* '<S9>/Geometric Attitude Controller' */
  real_T Merge;                        /* '<S69>/Merge' */
  uint8_T DataTypeConversion;          /* '<S82>/Data Type Conversion' */
  uint8_T DataTypeConversion4;         /* '<S82>/Data Type Conversion4' */
  uint8_T Compare;                     /* '<S84>/Compare' */
  uint8_T Compare_b;                   /* '<S86>/Compare' */
  uint8_T Compare_d;                   /* '<S83>/Compare' */
  uint8_T DataTypeConversion1;         /* '<S82>/Data Type Conversion1' */
  B_beeunitstoSI_controller13_T sf_beeunitstoSI1;/* '<S32>/bee units to SI1' */
  B_beeunitstoSI_controller13_T sf_beeunitstoSI;/* '<S32>/bee units to SI' */
} B_controller13_T;

/* Block states (default storage) for system '<Root>' */
typedef struct {
  real_T SaturatingRamp_DSTATE;        /* '<S97>/SaturatingRamp' */
  real_T RampUpOrDown_DSTATE;          /* '<S91>/RampUpOrDown' */
  real_T omegat_DSTATE;                /* '<S91>/omega*t' */
  real_T Delay1_DSTATE;                /* '<S8>/Delay1' */
  real_T Delay2_DSTATE[13];            /* '<S32>/Delay2' */
  real_T Delay_DSTATE;                 /* '<S1>/Delay' */
  real_T time_DSTATE;                  /* '<S14>/time' */
  real_T lowpass_states[2];            /* '<S12>/low pass' */
  real_T Delay1_DSTATE_l;              /* '<S1>/Delay1' */
  real_T lowpass1_states[2];           /* '<S12>/low pass1' */
  real_T Delay2_DSTATE_c;              /* '<S1>/Delay2' */
  real_T lowpass2_states[2];           /* '<S12>/low pass2' */
  real_T Delay1_DSTATE_i[19];          /* '<S32>/Delay1' */
  real_T Delay_DSTATE_l[324];          /* '<S32>/Delay' */
  real_T Delay3_DSTATE;                /* '<S32>/Delay3' */
  real_T lowpass3_states[9];           /* '<S26>/low pass3' */
  real_T Delay1_DSTATE_j[3];           /* '<S23>/Delay1' */
  real_T Delay_DSTATE_f[3];            /* '<S23>/Delay' */
  real_T Delay2_DSTATE_j;              /* '<S23>/Delay2' */
  real_T Delay1_DSTATE_p[4];           /* '<S9>/Delay1' */
  real_T Delay_DSTATE_k[3];            /* '<S9>/Delay' */
  real_T Delay2_DSTATE_o;              /* '<S9>/Delay2' */
  real_T vintegrator_DSTATE[3];        /* '<S9>/v integrator' */
  real_T lowpass_states_m[6];          /* '<S9>/low pass' */
  real_T time_DSTATE_o;                /* '<S21>/time' */
  real_T Delay_DSTATE_a[3];            /* '<S12>/Delay' */
  real_T Delay1_DSTATE_jf[2];          /* '<S12>/Delay1' */
  real_T Delay_DSTATE_at;              /* '<S8>/Delay' */
  real_T Delay2_DSTATE_k;              /* '<S8>/Delay2' */
  real_T Delay3_DSTATE_j;              /* '<S8>/Delay3' */
  real_T SaturatingRamp_DSTATE_n;      /* '<S103>/SaturatingRamp' */
  real_T RampUpOrDown_DSTATE_a;        /* '<S92>/RampUpOrDown' */
  real_T omegat_DSTATE_p;              /* '<S92>/omega*t' */
  real_T SaturatingRamp_DSTATE_o;      /* '<S109>/SaturatingRamp' */
  real_T RampUpOrDown_DSTATE_j;        /* '<S93>/RampUpOrDown' */
  real_T omegat_DSTATE_l;              /* '<S93>/omega*t' */
  real_T SaturatingRamp_DSTATE_e;      /* '<S115>/SaturatingRamp' */
  real_T RampUpOrDown_DSTATE_d;        /* '<S94>/RampUpOrDown' */
  real_T omegat_DSTATE_d;              /* '<S94>/omega*t' */
  real_T DelayInput_DSTATE[9];         /* '<S27>/Delay Input' */
  real_T DelayOutput_DSTATE[9];        /* '<S27>/Delay Output' */
  real_T Delay3_DSTATE_f[2];           /* '<Root>/Delay3' */
  real_T SaturatingRamp1_DSTATE;       /* '<S88>/SaturatingRamp1' */
  real_T Delay_DSTATE_j;               /* '<S82>/Delay' */
  real_T Delay1_DSTATE_a;              /* '<S82>/Delay1' */
  real_T Delay_DSTATE_g[4];            /* '<S4>/Delay' */
  real_T DiscreteTimeIntegrator_DSTATE;/* '<S4>/Discrete-Time Integrator' */
  real_T DiscreteTimeIntegrator1_DSTATE;/* '<S4>/Discrete-Time Integrator1' */
  real_T lowpass_tmp;                  /* '<S12>/low pass' */
  real_T lowpass1_tmp;                 /* '<S12>/low pass1' */
  real_T lowpass2_tmp;                 /* '<S12>/low pass2' */
  real_T lowpass_tmp_c[3];             /* '<S9>/low pass' */
  real_T NextOutput;                   /* '<S2>/Random Number3' */
  real_T NextOutput_e;                 /* '<S2>/Random Number4' */
  real_T NextOutput_h;                 /* '<S2>/Random Number5' */
  real_T Product2_DWORK4[9];           /* '<S43>/Product2' */
  real_T NextOutput_o;                 /* '<S2>/Random Number1' */
  real_T NextOutput_c;                 /* '<S2>/Random Number2' */
  real_T NextOutput_b;                 /* '<S2>/Random Number6' */
  struct {
    void *LoggedData;
  } highdrivingsignal_PWORK;           /* '<Root>/high driving signal' */

  struct {
    void *LoggedData;
  } motorthrustsmgf_PWORK;             /* '<Root>/motor thrusts (mgf)' */

  struct {
    void *LoggedData;
  } voltages_PWORK;                    /* '<Root>/voltages' */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_Mux1_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_Mux_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_observer_at_outport_5_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_observer_at_outport_6_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_observer_mux_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *LoggedData;
  } observer_log_PWORK;                /* '<S1>/observer_log' */

  struct {
    void *LoggedData;
  } Scope_PWORK;                       /* '<S9>/Scope' */

  struct {
    void *LoggedData;
  } Scope1_PWORK;                      /* '<S9>/Scope1' */

  struct {
    void *LoggedData;
  } Scope2_PWORK;                      /* '<S9>/Scope2' */

  struct {
    void *LoggedData;
  } Scope3_PWORK;                      /* '<S9>/Scope3' */

  struct {
    void *LoggedData;
  } Scope4_PWORK;                      /* '<S9>/Scope4' */

  struct {
    void *LoggedData;
  } Scope5_PWORK;                      /* '<S9>/Scope5' */

  struct {
    void *LoggedData;
  } Scope6_PWORK;                      /* '<S9>/Scope6' */

  struct {
    void *LoggedData;
  } Scope7_PWORK;                      /* '<S9>/Scope7' */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_LearnedRTNMPC_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_LearnedRTNMPC_at_outport_1_PWORK;/* synthesized block */

  struct {
    void *LoggedData;
  } Scope1_PWORK_g;                    /* '<S23>/Scope1' */

  struct {
    void *LoggedData;
  } Scope2_PWORK_c;                    /* '<S23>/Scope2' */

  struct {
    void *LoggedData;
  } Scope_PWORK_p;                     /* '<S32>/Scope' */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_beeunitstoSI1_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *AQHandles;
  } TAQSigLogging_InsertedFor_beeunitstoSI_at_outport_0_PWORK;/* synthesized block */

  struct {
    void *LoggedData;
  } Scope1_PWORK_gc;                   /* '<S2>/Scope1' */

  struct {
    void *LoggedData;
  } Scope19_PWORK;                     /* '<S2>/Scope19' */

  struct {
    void *LoggedData;
  } Scope2_PWORK_f;                    /* '<S2>/Scope2' */

  struct {
    void *LoggedData;
  } Scope3_PWORK_d;                    /* '<S2>/Scope3' */

  struct {
    void *LoggedData;
  } Scope4_PWORK_a;                    /* '<S2>/Scope4' */

  struct {
    void *LoggedData;
  } Scope5_PWORK_h;                    /* '<S2>/Scope5' */

  struct {
    void *LoggedData;
  } Scope6_PWORK_d;                    /* '<S2>/Scope6' */

  struct {
    void *LoggedData;
  } safetyenable_PWORK;                /* '<S82>/safety enable' */

  struct {
    void *LoggedData;
  } Scope_PWORK_o;                     /* '<S91>/Scope' */

  struct {
    void *LoggedData;
  } Scope1_PWORK_o;                    /* '<S91>/Scope1' */

  struct {
    void *LoggedData;
  } Scope2_PWORK_h;                    /* '<S91>/Scope2' */

  struct {
    void *LoggedData;
  } highexecutiontime_PWORK;           /* '<Root>/high execution time' */

  int32_T sfEvent;                     /* '<Root>/motor thrust mapping' */
  int32_T sfEvent_l;                   /* '<S82>/voltage check' */
  int32_T sfEvent_c;                   /* '<S88>/landing_cond' */
  int32_T sfEvent_k;                   /* '<S82>/envelope check' */
  int32_T sfEvent_f;                   /* '<S82>/MATLAB Function' */
  int32_T sfEvent_j;                   /* '<S2>/power_distribution_1' */
  int32_T sfEvent_h;                   /* '<S1>/saturation' */
  int32_T sfEvent_d;                   /* '<S20>/eul to rotation matrix' */
  int32_T sfEvent_i;                   /* '<S29>/unpack state' */
  int32_T sfEvent_g;                 /* '<S29>/quaternion to rotation matrix' */
  int32_T sfEvent_hd;                  /* '<S29>/pack measurement vector' */
  int32_T sfEvent_lp;                  /* '<S32>/bee cov to SI cov' */
  int32_T sfEvent_m;                   /* '<S32>/UKF update then predict' */
  int32_T sfEvent_kk;                  /* '<S29>/R_flat to quat' */
  int32_T sfEvent_ls;                  /* '<S12>/Rotm2rpy1' */
  int32_T sfEvent_kn;  /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  int32_T sfEvent_mr;                  /* '<S22>/Rotation Matrix1' */
  int32_T sfEvent_ks;                  /* '<S22>/Rotation Matrix' */
  int32_T sfEvent_jf;                  /* '<S12>/External Torque Observer' */
  int32_T sfEvent_lw;                  /* '<S1>/correct force' */
  int32_T sfEvent_gr;                  /* '<S1>/adaptive setpoint rd' */
  int32_T sfEvent_i4;                  /* '<S9>/Learned RTNMPC' */
  int32_T sfEvent_e;                  /* '<S9>/Geometric Attitude Controller' */
  uint32_T RandSeed;                   /* '<S2>/Random Number3' */
  uint32_T RandSeed_c;                 /* '<S2>/Random Number4' */
  uint32_T RandSeed_d;                 /* '<S2>/Random Number5' */
  uint32_T RandSeed_k;                 /* '<S2>/Random Number1' */
  uint32_T RandSeed_n;                 /* '<S2>/Random Number2' */
  uint32_T RandSeed_j;                 /* '<S2>/Random Number6' */
  robotics_slcore_internal_block_CoordinateTransformationConversion_controller13_T
    obj;                      /* '<S2>/Coordinate Transformation Conversion1' */
  int_T q0q1q2q3_IWORK;                /* '<S42>/q0 q1 q2 q3' */
  int8_T If_ActiveSubsystem;           /* '<S69>/If' */
  int8_T IfActionSubsystem2_SubsysRanBC;/* '<S69>/If Action Subsystem2' */
  int8_T IfActionSubsystem1_SubsysRanBC;/* '<S69>/If Action Subsystem1' */
  int8_T IfActionSubsystem_SubsysRanBC;/* '<S69>/If Action Subsystem' */
  uint8_T is_active_c31_controller13;  /* '<Root>/motor thrust mapping' */
  uint8_T is_active_c51_controller13;  /* '<S82>/voltage check' */
  uint8_T is_active_c50_controller13;  /* '<S88>/landing_cond' */
  uint8_T is_active_c49_controller13;  /* '<S82>/envelope check' */
  uint8_T is_active_c48_controller13;  /* '<S82>/MATLAB Function' */
  uint8_T is_active_c17_controller13;  /* '<S2>/power_distribution_1' */
  uint8_T is_active_c16_controller13;  /* '<S1>/saturation' */
  uint8_T is_active_c62_controller13;  /* '<S20>/eul to rotation matrix' */
  uint8_T is_active_c56_controller13;  /* '<S29>/unpack state' */
  uint8_T is_active_c43_controller13;/* '<S29>/quaternion to rotation matrix' */
  uint8_T is_active_c42_controller13;  /* '<S29>/pack measurement vector' */
  uint8_T is_active_c54_controller13;  /* '<S32>/bee cov to SI cov' */
  uint8_T is_active_c38_controller13;  /* '<S32>/UKF update then predict' */
  uint8_T is_active_c37_controller13;  /* '<S29>/R_flat to quat' */
  uint8_T is_active_c65_controller13;  /* '<S12>/Rotm2rpy1' */
  uint8_T is_active_c36_controller13;
                       /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  uint8_T is_active_c11_controller13;  /* '<S22>/Rotation Matrix1' */
  uint8_T is_active_c10_controller13;  /* '<S22>/Rotation Matrix' */
  uint8_T is_active_c14_controller13;  /* '<S12>/External Torque Observer' */
  uint8_T is_active_c70_controller13;  /* '<S1>/correct force' */
  uint8_T is_active_c6_controller13;   /* '<S1>/adaptive setpoint rd' */
  uint8_T is_active_c66_controller13;  /* '<S9>/Learned RTNMPC' */
  uint8_T is_active_c68_controller13; /* '<S9>/Geometric Attitude Controller' */
  boolean_T doneDoubleBufferReInit;    /* '<Root>/motor thrust mapping' */
  boolean_T doneDoubleBufferReInit_g;  /* '<S82>/voltage check' */
  boolean_T doneDoubleBufferReInit_h;  /* '<S88>/landing_cond' */
  boolean_T doneDoubleBufferReInit_gj; /* '<S82>/envelope check' */
  boolean_T doneDoubleBufferReInit_i;  /* '<S82>/MATLAB Function' */
  boolean_T doneDoubleBufferReInit_a;  /* '<S2>/power_distribution_1' */
  boolean_T objisempty;       /* '<S2>/Coordinate Transformation Conversion1' */
  boolean_T doneDoubleBufferReInit_j;  /* '<S1>/saturation' */
  boolean_T doneDoubleBufferReInit_e;  /* '<S20>/eul to rotation matrix' */
  boolean_T doneDoubleBufferReInit_p;  /* '<S29>/unpack state' */
  boolean_T doneDoubleBufferReInit_b;/* '<S29>/quaternion to rotation matrix' */
  boolean_T doneDoubleBufferReInit_n;  /* '<S29>/pack measurement vector' */
  boolean_T doneDoubleBufferReInit_m;  /* '<S32>/bee cov to SI cov' */
  boolean_T doneDoubleBufferReInit_ht; /* '<S32>/UKF update then predict' */
  boolean_T doneDoubleBufferReInit_k;  /* '<S29>/R_flat to quat' */
  boolean_T doneDoubleBufferReInit_pi; /* '<S12>/Rotm2rpy1' */
  boolean_T doneDoubleBufferReInit_nj;
                       /* '<S23>/Translational Dynamics & Kinamatics Lin Obs' */
  boolean_T doneDoubleBufferReInit_l;  /* '<S22>/Rotation Matrix1' */
  boolean_T doneDoubleBufferReInit_l1; /* '<S22>/Rotation Matrix' */
  boolean_T doneDoubleBufferReInit_k5; /* '<S12>/External Torque Observer' */
  boolean_T doneDoubleBufferReInit_gu; /* '<S1>/correct force' */
  boolean_T doneDoubleBufferReInit_mk; /* '<S1>/adaptive setpoint rd' */
  boolean_T doneDoubleBufferReInit_gi; /* '<S9>/Learned RTNMPC' */
  boolean_T doneDoubleBufferReInit_g5;/* '<S9>/Geometric Attitude Controller' */
  DW_beeunitstoSI_controller13_T sf_beeunitstoSI1;/* '<S32>/bee units to SI1' */
  DW_beeunitstoSI_controller13_T sf_beeunitstoSI;/* '<S32>/bee units to SI' */
} DW_controller13_T;

/* Continuous states (default storage) */
typedef struct {
  real_T xeyeze_CSTATE[3];             /* '<S40>/xe,ye,ze' */
  real_T q0q1q2q3_CSTATE[4];           /* '<S42>/q0 q1 q2 q3' */
  real_T ubvbwb_CSTATE[3];             /* '<S40>/ub,vb,wb' */
  real_T pqr_CSTATE[3];                /* '<S40>/p,q,r ' */
} X_controller13_T;

/* State derivatives (default storage) */
typedef struct {
  real_T xeyeze_CSTATE[3];             /* '<S40>/xe,ye,ze' */
  real_T q0q1q2q3_CSTATE[4];           /* '<S42>/q0 q1 q2 q3' */
  real_T ubvbwb_CSTATE[3];             /* '<S40>/ub,vb,wb' */
  real_T pqr_CSTATE[3];                /* '<S40>/p,q,r ' */
} XDot_controller13_T;

/* State disabled  */
typedef struct {
  boolean_T xeyeze_CSTATE[3];          /* '<S40>/xe,ye,ze' */
  boolean_T q0q1q2q3_CSTATE[4];        /* '<S42>/q0 q1 q2 q3' */
  boolean_T ubvbwb_CSTATE[3];          /* '<S40>/ub,vb,wb' */
  boolean_T pqr_CSTATE[3];             /* '<S40>/p,q,r ' */
} XDis_controller13_T;

#ifndef ODE3_INTG
#define ODE3_INTG

/* ODE3 Integration Data */
typedef struct {
  real_T *y;                           /* output */
  real_T *f[3];                        /* derivatives */
} ODE3_IntgData;

#endif

/* Backward compatible GRT Identifiers */
#define rtB                            controller13_B
#define BlockIO                        B_controller13_T
#define rtX                            controller13_X
#define ContinuousStates               X_controller13_T
#define rtXdot                         controller13_XDot
#define StateDerivatives               XDot_controller13_T
#define tXdis                          controller13_XDis
#define StateDisabled                  XDis_controller13_T
#define rtP                            controller13_P
#define Parameters                     P_controller13_T
#define rtDWork                        controller13_DW
#define D_Work                         DW_controller13_T

/* Parameters (default storage) */
struct P_controller13_T_ {
  struct_Wa8sJQmUGLqlUCHjNRY8jH rbt;   /* Variable: rbt
                                        * Referenced by:
                                        *   '<Root>/motor thrust mapping'
                                        *   '<S1>/correct force'
                                        *   '<S1>/saturation'
                                        *   '<S1>/Constant1'
                                        *   '<S2>/power_distribution_1'
                                        *   '<S9>/Geometric Attitude Controller'
                                        *   '<S9>/Learned RTNMPC'
                                        *   '<S9>/Gain1'
                                        *   '<S12>/External Torque Observer'
                                        *   '<S23>/Translational Dynamics & Kinamatics Lin Obs'
                                        */
  struct_KhXwpRPEcLAekIa5XUXTOE lut;   /* Variable: lut
                                        * Referenced by:
                                        *   '<Root>/Nemo Bee 10'
                                        *   '<Root>/Nemo Bee 12'
                                        *   '<Root>/Nemo Bee 14'
                                        *   '<Root>/Nemo Bee 6'
                                        *   '<S2>/Nemo Bee 1'
                                        *   '<S2>/Nemo Bee 2'
                                        *   '<S2>/Nemo Bee 3'
                                        *   '<S2>/Nemo Bee 4'
                                        */
  struct_qT6B9pjYW863D2bpz1kcaE ctr;   /* Variable: ctr
                                        * Referenced by:
                                        *   '<Root>/Flapping Freq (Hz)'
                                        *   '<S1>/adaptive setpoint rd'
                                        *   '<S1>/saturation'
                                        *   '<S9>/Geometric Attitude Controller'
                                        *   '<S9>/Learned RTNMPC'
                                        *   '<S9>/low pass'
                                        *   '<S12>/External Torque Observer'
                                        *   '<S12>/Multiply'
                                        *   '<S12>/Multiply1'
                                        *   '<S12>/low pass'
                                        *   '<S12>/low pass1'
                                        *   '<S12>/low pass2'
                                        *   '<S82>/MATLAB Function'
                                        *   '<S82>/envelope check'
                                        *   '<S82>/voltage check'
                                        *   '<S88>/landing_cond'
                                        *   '<S23>/Translational Dynamics & Kinamatics Lin Obs'
                                        */
  struct_nBlY7EPQDGdIoVBiDbH2yB rsim;  /* Variable: rsim
                                        * Referenced by:
                                        *   '<Root>/Constant'
                                        *   '<S2>/Gain10'
                                        *   '<S2>/Random Number1'
                                        *   '<S2>/Random Number2'
                                        *   '<S2>/Random Number3'
                                        *   '<S2>/Random Number4'
                                        *   '<S2>/Random Number5'
                                        *   '<S2>/Random Number6'
                                        */
  struct_swDfGweWqG74EXQcL13RhH mdl;   /* Variable: mdl
                                        * Referenced by:
                                        *   '<S1>/adaptive setpoint rd'
                                        *   '<S1>/Constant1'
                                        *   '<S1>/Switch'
                                        *   '<S1>/Switch1'
                                        *   '<S1>/Switch2'
                                        *   '<S2>/Gain10'
                                        *   '<S4>/Switch9'
                                        *   '<S9>/Geometric Attitude Controller'
                                        *   '<S9>/Learned RTNMPC'
                                        *   '<S9>/Delay2'
                                        *   '<S12>/External Torque Observer'
                                        *   '<S82>/MATLAB Function'
                                        *   '<S88>/constant2'
                                        *   '<S23>/Translational Dynamics & Kinamatics Lin Obs'
                                        *   '<S26>/att_s'
                                        *   '<S26>/low pass3'
                                        *   '<S27>/GainPole'
                                        */
  real_T ukf_P0_flat[324];             /* Variable: ukf_P0_flat
                                        * Referenced by: '<S32>/Delay'
                                        */
  real_T ukf_prediction_time;          /* Variable: ukf_prediction_time
                                        * Referenced by: '<S20>/ukf_prediction_time'
                                        */
  real_T ukf_s0[19];                   /* Variable: ukf_s0
                                        * Referenced by: '<S32>/Delay1'
                                        */
  real_T ukf_use_prediction;           /* Variable: ukf_use_prediction
                                        * Referenced by: '<S29>/use prediction'
                                        */
  real_T filteredderivative_ICPrevInput;
                               /* Mask Parameter: filteredderivative_ICPrevInput
                                * Referenced by: '<S27>/Delay Input'
                                */
  real_T filteredderivative_ICPrevOutput;
                              /* Mask Parameter: filteredderivative_ICPrevOutput
                               * Referenced by: '<S27>/Delay Output'
                               */
  real_T uDOFQuaternion_Vm_0[3];       /* Mask Parameter: uDOFQuaternion_Vm_0
                                        * Referenced by: '<S40>/ub,vb,wb'
                                        */
  real_T filteredderivative_ZeroZ;   /* Mask Parameter: filteredderivative_ZeroZ
                                      * Referenced by: '<S27>/GainZero'
                                      */
  real_T CompareToConstant1_const;   /* Mask Parameter: CompareToConstant1_const
                                      * Referenced by: '<S84>/Constant'
                                      */
  real_T CompareToConstant_const;     /* Mask Parameter: CompareToConstant_const
                                       * Referenced by: '<S83>/Constant'
                                       */
  real_T uDOFQuaternion_eul_0[3];      /* Mask Parameter: uDOFQuaternion_eul_0
                                        * Referenced by: '<S42>/Initial Euler Angles'
                                        */
  real_T uDOFQuaternion_inertia[9];    /* Mask Parameter: uDOFQuaternion_inertia
                                        * Referenced by: '<S44>/Constant1'
                                        */
  real_T uDOFQuaternion_k_quat;        /* Mask Parameter: uDOFQuaternion_k_quat
                                        * Referenced by: '<S53>/High Gain Quaternion Normalization'
                                        */
  real_T uDOFQuaternion_mass_0;        /* Mask Parameter: uDOFQuaternion_mass_0
                                        * Referenced by: '<S44>/Constant'
                                        */
  real_T uDOFQuaternion_pm_0[3];       /* Mask Parameter: uDOFQuaternion_pm_0
                                        * Referenced by: '<S40>/p,q,r '
                                        */
  real_T uDOFQuaternion_xme_0[3];      /* Mask Parameter: uDOFQuaternion_xme_0
                                        * Referenced by: '<S40>/xe,ye,ze'
                                        */
  real_T Constant_Value[3];            /* Expression: zeros(3,1)
                                        * Referenced by: '<S20>/Constant'
                                        */
  real_T F_ext_const_Value[3];         /* Expression: zeros(3,1)
                                        * Referenced by: '<S12>/F_ext_const'
                                        */
  real_T Constant_Value_d;             /* Expression: 1
                                        * Referenced by: '<S70>/Constant'
                                        */
  real_T Constant_Value_b;             /* Expression: 1
                                        * Referenced by: '<S71>/Constant'
                                        */
  real_T Constant11_Value[3];          /* Expression: [0;0;0;]
                                        * Referenced by: '<S2>/Constant11'
                                        */
  real_T disturbanceenable_Value;      /* Expression: 0
                                        * Referenced by: '<S2>/disturbance enable'
                                        */
  real_T Switch3_Threshold;            /* Expression: 1
                                        * Referenced by: '<S2>/Switch3'
                                        */
  real_T Constant9_Value[3];           /* Expression: [0;0;0;]
                                        * Referenced by: '<S2>/Constant9'
                                        */
  real_T Constant34_Value;             /* Expression: 1
                                        * Referenced by: '<S4>/Constant34'
                                        */
  real_T Constant35_Value;             /* Expression: 0
                                        * Referenced by: '<S4>/Constant35'
                                        */
  real_T Constant_Value_a;             /* Expression: 0
                                        * Referenced by: '<S86>/Constant'
                                        */
  real_T Constant_Value_l;             /* Expression: 0
                                        * Referenced by: '<S98>/Constant'
                                        */
  real_T Constant_Value_k;             /* Expression: 0
                                        * Referenced by: '<S100>/Constant'
                                        */
  real_T Constant_Value_m;             /* Expression: 0
                                        * Referenced by: '<S104>/Constant'
                                        */
  real_T Constant_Value_p;             /* Expression: 0
                                        * Referenced by: '<S106>/Constant'
                                        */
  real_T Constant_Value_c;             /* Expression: 0
                                        * Referenced by: '<S110>/Constant'
                                        */
  real_T Constant_Value_h;             /* Expression: 0
                                        * Referenced by: '<S112>/Constant'
                                        */
  real_T Constant_Value_g;             /* Expression: 0
                                        * Referenced by: '<S116>/Constant'
                                        */
  real_T Constant_Value_kj;            /* Expression: 0
                                        * Referenced by: '<S118>/Constant'
                                        */
  real_T SaturatingRamp_gainval;   /* Computed Parameter: SaturatingRamp_gainval
                                    * Referenced by: '<S97>/SaturatingRamp'
                                    */
  real_T SaturatingRamp_IC;            /* Expression: 0
                                        * Referenced by: '<S97>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_UpperSat;      /* Expression: 1
                                        * Referenced by: '<S97>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_LowerSat;      /* Expression: 0
                                        * Referenced by: '<S97>/SaturatingRamp'
                                        */
  real_T safetyvoltage_Value;          /* Expression: max(ctr.safety.volt)
                                        * Referenced by: '<Root>/safety voltage'
                                        */
  real_T RampUpOrDown_gainval;       /* Computed Parameter: RampUpOrDown_gainval
                                      * Referenced by: '<S91>/RampUpOrDown'
                                      */
  real_T RampUpOrDown_IC;              /* Expression: 0
                                        * Referenced by: '<S91>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_UpperSat;        /* Expression: 1
                                        * Referenced by: '<S91>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_LowerSat;        /* Expression: 0
                                        * Referenced by: '<S91>/RampUpOrDown'
                                        */
  real_T phaseoffset_Value;            /* Expression: 0
                                        * Referenced by: '<S91>/phase offset'
                                        */
  real_T degtorad_Gain;                /* Expression: pi/180
                                        * Referenced by: '<S91>/deg to rad'
                                        */
  real_T omegat_gainval;               /* Computed Parameter: omegat_gainval
                                        * Referenced by: '<S91>/omega*t'
                                        */
  real_T omegat_IC;                    /* Expression: 0
                                        * Referenced by: '<S91>/omega*t'
                                        */
  real_T Gain1_Gain;                   /* Expression: -1
                                        * Referenced by: '<S91>/Gain1'
                                        */
  real_T Delay1_InitialCondition;      /* Expression: 0.0
                                        * Referenced by: '<S8>/Delay1'
                                        */
  real_T x_offset_Value;               /* Expression: 0
                                        * Referenced by: '<S3>/x_offset'
                                        */
  real_T u2_Gain;                      /* Expression: 0.5
                                        * Referenced by: '<S52>/1//2'
                                        */
  real_T Gain_Gain;                    /* Expression: 2
                                        * Referenced by: '<S57>/Gain'
                                        */
  real_T Gain_Gain_l;                  /* Expression: 2
                                        * Referenced by: '<S60>/Gain'
                                        */
  real_T Gain_Gain_h;                  /* Expression: 2
                                        * Referenced by: '<S55>/Gain'
                                        */
  real_T Gain_Gain_b;                  /* Expression: 2
                                        * Referenced by: '<S61>/Gain'
                                        */
  real_T Gain_Gain_e;                  /* Expression: 2
                                        * Referenced by: '<S56>/Gain'
                                        */
  real_T Gain_Gain_eu;                 /* Expression: 2
                                        * Referenced by: '<S59>/Gain'
                                        */
  real_T Switch_Threshold;             /* Expression: 0
                                        * Referenced by: '<Root>/Switch'
                                        */
  real_T y_offset_Value;               /* Expression: 0
                                        * Referenced by: '<S3>/y_offset'
                                        */
  real_T Constant_Value_e;             /* Expression: -1
                                        * Referenced by: '<S12>/Constant'
                                        */
  real_T Delay2_InitialCondition[13];
                                  /* Expression: [0,0,0, 1,0,0,0,0, 0,0,0, 0,0]'
                                   * Referenced by: '<S32>/Delay2'
                                   */
  real_T Delay_InitialCondition;       /* Expression: 0.0
                                        * Referenced by: '<S1>/Delay'
                                        */
  real_T time_gainval;                 /* Computed Parameter: time_gainval
                                        * Referenced by: '<S14>/time'
                                        */
  real_T time_IC;                      /* Expression: 0
                                        * Referenced by: '<S14>/time'
                                        */
  real_T lowpass_InitialStates;        /* Expression: 0
                                        * Referenced by: '<S12>/low pass'
                                        */
  real_T Delay1_InitialCondition_e;    /* Expression: 0.0
                                        * Referenced by: '<S1>/Delay1'
                                        */
  real_T Constant_Value_mk;            /* Expression: 0
                                        * Referenced by: '<S1>/Constant'
                                        */
  real_T lowpass1_InitialStates;       /* Expression: 0
                                        * Referenced by: '<S12>/low pass1'
                                        */
  real_T Delay2_InitialCondition_g;    /* Expression: 0.0
                                        * Referenced by: '<S1>/Delay2'
                                        */
  real_T lowpass2_InitialStates;       /* Expression: 0
                                        * Referenced by: '<S12>/low pass2'
                                        */
  real_T Delay3_InitialCondition;      /* Expression: 0
                                        * Referenced by: '<S32>/Delay3'
                                        */
  real_T Switch_Threshold_k;           /* Expression: 0
                                        * Referenced by: '<S29>/Switch'
                                        */
  real_T Switch4_Threshold;            /* Expression: 0
                                        * Referenced by: '<S12>/Switch4'
                                        */
  real_T lowpass3_InitialStates;       /* Expression: 0
                                        * Referenced by: '<S26>/low pass3'
                                        */
  real_T Switch5_Threshold;            /* Expression: 0
                                        * Referenced by: '<S12>/Switch5'
                                        */
  real_T Delay1_InitialCondition_d[3]; /* Expression: zeros(3,1)
                                        * Referenced by: '<S23>/Delay1'
                                        */
  real_T Delay_InitialCondition_j[3];  /* Expression: zeros(3,1)
                                        * Referenced by: '<S23>/Delay'
                                        */
  real_T Delay2_InitialCondition_l;    /* Expression: 1
                                        * Referenced by: '<S23>/Delay2'
                                        */
  real_T Switch_Threshold_c;           /* Expression: 0
                                        * Referenced by: '<S12>/Switch'
                                        */
  real_T Switch1_Threshold;            /* Expression: 0
                                        * Referenced by: '<S12>/Switch1'
                                        */
  real_T Switch2_Threshold;            /* Expression: 0
                                        * Referenced by: '<S12>/Switch2'
                                        */
  real_T Constant2_Value;              /* Expression: 1
                                        * Referenced by: '<S1>/Constant2'
                                        */
  real_T Delay1_InitialCondition_m[4]; /* Expression: [0; 0; 0; 1]
                                        * Referenced by: '<S9>/Delay1'
                                        */
  real_T Delay_InitialCondition_o[3];  /* Expression: zeros(3,1)
                                        * Referenced by: '<S9>/Delay'
                                        */
  real_T vintegrator_gainval;         /* Computed Parameter: vintegrator_gainval
                                       * Referenced by: '<S9>/v integrator'
                                       */
  real_T vintegrator_IC;               /* Expression: 0
                                        * Referenced by: '<S9>/v integrator'
                                        */
  real_T lowpass_InitialStates_k;      /* Expression: 0
                                        * Referenced by: '<S9>/low pass'
                                        */
  real_T time_gainval_c;               /* Computed Parameter: time_gainval_c
                                        * Referenced by: '<S21>/time'
                                        */
  real_T time_IC_g;                    /* Expression: 0
                                        * Referenced by: '<S21>/time'
                                        */
  real_T Delay_InitialCondition_g[3];
  /* Expression: [ctr.torque_obs.initial_torque.x; ctr.torque_obs.initial_torque.y; 0.0]
   * Referenced by: '<S12>/Delay'
   */
  real_T Delay1_InitialCondition_n[2]; /* Expression: [0.0; 0.0]
                                        * Referenced by: '<S12>/Delay1'
                                        */
  real_T Saturation_UpperSat[3];       /* Expression: 1.8*1e-5.*ones(3,1)
                                        * Referenced by: '<S12>/Saturation'
                                        */
  real_T Saturation_LowerSat[3];       /* Expression: -1.8*1e-5.*ones(3,1)
                                        * Referenced by: '<S12>/Saturation'
                                        */
  real_T Switch3_Threshold_g;          /* Expression: 0
                                        * Referenced by: '<S12>/Switch3'
                                        */
  real_T Saturation1_UpperSat[3];      /* Expression: 1.8*1e-5.*ones(3,1)
                                        * Referenced by: '<S12>/Saturation1'
                                        */
  real_T Saturation1_LowerSat[3];      /* Expression: -1.8*1e-5.*ones(3,1)
                                        * Referenced by: '<S12>/Saturation1'
                                        */
  real_T Saturation_UpperSat_d;        /* Expression: 600
                                        * Referenced by: '<Root>/Saturation'
                                        */
  real_T Saturation_LowerSat_m;        /* Expression: 0
                                        * Referenced by: '<Root>/Saturation'
                                        */
  real_T Constant13_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/Constant13'
                                        */
  real_T Saturation1_UpperSat_c;       /* Expression: 1750
                                        * Referenced by: '<Root>/Saturation1'
                                        */
  real_T Saturation1_LowerSat_c;       /* Expression: 0
                                        * Referenced by: '<Root>/Saturation1'
                                        */
  real_T Delay_InitialCondition_a;     /* Expression: 0.0
                                        * Referenced by: '<S8>/Delay'
                                        */
  real_T Constant14_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/Constant14'
                                        */
  real_T Saturation2_UpperSat;         /* Expression: 1800
                                        * Referenced by: '<Root>/Saturation2'
                                        */
  real_T Saturation2_LowerSat;         /* Expression: 0
                                        * Referenced by: '<Root>/Saturation2'
                                        */
  real_T Delay2_InitialCondition_o;    /* Expression: 0.0
                                        * Referenced by: '<S8>/Delay2'
                                        */
  real_T Constant15_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/Constant15'
                                        */
  real_T Saturation3_UpperSat;         /* Expression: 1800
                                        * Referenced by: '<Root>/Saturation3'
                                        */
  real_T Saturation3_LowerSat;         /* Expression: 0
                                        * Referenced by: '<Root>/Saturation3'
                                        */
  real_T Delay3_InitialCondition_c;    /* Expression: 0.0
                                        * Referenced by: '<S8>/Delay3'
                                        */
  real_T Constant16_Value;             /* Expression: 0
                                        * Referenced by: '<Root>/Constant16'
                                        */
  real_T Saturation4_UpperSat;         /* Expression: 1800
                                        * Referenced by: '<Root>/Saturation4'
                                        */
  real_T Saturation4_LowerSat;         /* Expression: 0
                                        * Referenced by: '<Root>/Saturation4'
                                        */
  real_T half1_Gain;                   /* Expression: 0.5
                                        * Referenced by: '<S6>/half1'
                                        */
  real_T ground_Value;                 /* Expression: 1
                                        * Referenced by: '<S96>/ground'
                                        */
  real_T Gain4_Gain;                   /* Expression: 0.005
                                        * Referenced by: '<S6>/Gain4'
                                        */
  real_T SaturatingRamp_gainval_a;
                                 /* Computed Parameter: SaturatingRamp_gainval_a
                                  * Referenced by: '<S103>/SaturatingRamp'
                                  */
  real_T SaturatingRamp_IC_d;          /* Expression: 0
                                        * Referenced by: '<S103>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_UpperSat_e;    /* Expression: 1
                                        * Referenced by: '<S103>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_LowerSat_p;    /* Expression: 0
                                        * Referenced by: '<S103>/SaturatingRamp'
                                        */
  real_T RampUpOrDown_gainval_e;   /* Computed Parameter: RampUpOrDown_gainval_e
                                    * Referenced by: '<S92>/RampUpOrDown'
                                    */
  real_T RampUpOrDown_IC_c;            /* Expression: 0
                                        * Referenced by: '<S92>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_UpperSat_o;      /* Expression: 1
                                        * Referenced by: '<S92>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_LowerSat_k;      /* Expression: 0
                                        * Referenced by: '<S92>/RampUpOrDown'
                                        */
  real_T phaseoffset_Value_l;          /* Expression: 0
                                        * Referenced by: '<S92>/phase offset'
                                        */
  real_T degtorad_Gain_i;              /* Expression: pi/180
                                        * Referenced by: '<S92>/deg to rad'
                                        */
  real_T omegat_gainval_l;             /* Computed Parameter: omegat_gainval_l
                                        * Referenced by: '<S92>/omega*t'
                                        */
  real_T omegat_IC_g;                  /* Expression: 0
                                        * Referenced by: '<S92>/omega*t'
                                        */
  real_T Gain1_Gain_g;                 /* Expression: -1
                                        * Referenced by: '<S92>/Gain1'
                                        */
  real_T ground_Value_a;               /* Expression: 1
                                        * Referenced by: '<S102>/ground'
                                        */
  real_T Gain1_Gain_d;                 /* Expression: 0.005
                                        * Referenced by: '<S6>/Gain1'
                                        */
  real_T SaturatingRamp_gainval_j;
                                 /* Computed Parameter: SaturatingRamp_gainval_j
                                  * Referenced by: '<S109>/SaturatingRamp'
                                  */
  real_T SaturatingRamp_IC_g;          /* Expression: 0
                                        * Referenced by: '<S109>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_UpperSat_k;    /* Expression: 1
                                        * Referenced by: '<S109>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_LowerSat_o;    /* Expression: 0
                                        * Referenced by: '<S109>/SaturatingRamp'
                                        */
  real_T RampUpOrDown_gainval_c;   /* Computed Parameter: RampUpOrDown_gainval_c
                                    * Referenced by: '<S93>/RampUpOrDown'
                                    */
  real_T RampUpOrDown_IC_b;            /* Expression: 0
                                        * Referenced by: '<S93>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_UpperSat_e;      /* Expression: 1
                                        * Referenced by: '<S93>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_LowerSat_h;      /* Expression: 0
                                        * Referenced by: '<S93>/RampUpOrDown'
                                        */
  real_T phaseoffset_Value_j;          /* Expression: 0
                                        * Referenced by: '<S93>/phase offset'
                                        */
  real_T degtorad_Gain_k;              /* Expression: pi/180
                                        * Referenced by: '<S93>/deg to rad'
                                        */
  real_T omegat_gainval_d;             /* Computed Parameter: omegat_gainval_d
                                        * Referenced by: '<S93>/omega*t'
                                        */
  real_T omegat_IC_o;                  /* Expression: 0
                                        * Referenced by: '<S93>/omega*t'
                                        */
  real_T Gain1_Gain_dj;                /* Expression: -1
                                        * Referenced by: '<S93>/Gain1'
                                        */
  real_T ground_Value_b;               /* Expression: 1
                                        * Referenced by: '<S108>/ground'
                                        */
  real_T Gain2_Gain;                   /* Expression: 0.005
                                        * Referenced by: '<S6>/Gain2'
                                        */
  real_T SaturatingRamp_gainval_g;
                                 /* Computed Parameter: SaturatingRamp_gainval_g
                                  * Referenced by: '<S115>/SaturatingRamp'
                                  */
  real_T SaturatingRamp_IC_p;          /* Expression: 0
                                        * Referenced by: '<S115>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_UpperSat_i;    /* Expression: 1
                                        * Referenced by: '<S115>/SaturatingRamp'
                                        */
  real_T SaturatingRamp_LowerSat_e;    /* Expression: 0
                                        * Referenced by: '<S115>/SaturatingRamp'
                                        */
  real_T RampUpOrDown_gainval_e1; /* Computed Parameter: RampUpOrDown_gainval_e1
                                   * Referenced by: '<S94>/RampUpOrDown'
                                   */
  real_T RampUpOrDown_IC_j;            /* Expression: 0
                                        * Referenced by: '<S94>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_UpperSat_c;      /* Expression: 1
                                        * Referenced by: '<S94>/RampUpOrDown'
                                        */
  real_T RampUpOrDown_LowerSat_c;      /* Expression: 0
                                        * Referenced by: '<S94>/RampUpOrDown'
                                        */
  real_T phaseoffset_Value_k;          /* Expression: 0
                                        * Referenced by: '<S94>/phase offset'
                                        */
  real_T degtorad_Gain_f;              /* Expression: pi/180
                                        * Referenced by: '<S94>/deg to rad'
                                        */
  real_T omegat_gainval_e;             /* Computed Parameter: omegat_gainval_e
                                        * Referenced by: '<S94>/omega*t'
                                        */
  real_T omegat_IC_i;                  /* Expression: 0
                                        * Referenced by: '<S94>/omega*t'
                                        */
  real_T Gain1_Gain_do;                /* Expression: -1
                                        * Referenced by: '<S94>/Gain1'
                                        */
  real_T ground_Value_l;               /* Expression: 1
                                        * Referenced by: '<S114>/ground'
                                        */
  real_T Gain3_Gain;                   /* Expression: 0.005
                                        * Referenced by: '<S6>/Gain3'
                                        */
  real_T Switch7_Threshold;            /* Expression: 0
                                        * Referenced by: '<S12>/Switch7'
                                        */
  real_T Constant3_Value[3];           /* Expression: zeros(3,1)
                                        * Referenced by: '<S9>/Constant3'
                                        */
  real_T constant_Value;               /* Expression: 1
                                        * Referenced by: '<S21>/constant'
                                        */
  real_T constant_Value_k;             /* Expression: 1
                                        * Referenced by: '<S14>/constant'
                                        */
  real_T Delay3_InitialCondition_e;    /* Expression: 1
                                        * Referenced by: '<Root>/Delay3'
                                        */
  real_T Saturation5_UpperSat;         /* Expression: 600
                                        * Referenced by: '<S2>/Saturation5'
                                        */
  real_T Saturation5_LowerSat;         /* Expression: 0
                                        * Referenced by: '<S2>/Saturation5'
                                        */
  real_T Saturation6_UpperSat;         /* Expression: 600
                                        * Referenced by: '<S2>/Saturation6'
                                        */
  real_T Saturation6_LowerSat;         /* Expression: 0
                                        * Referenced by: '<S2>/Saturation6'
                                        */
  real_T Saturation7_UpperSat;         /* Expression: 600
                                        * Referenced by: '<S2>/Saturation7'
                                        */
  real_T Saturation7_LowerSat;         /* Expression: 0
                                        * Referenced by: '<S2>/Saturation7'
                                        */
  real_T Saturation8_UpperSat;         /* Expression: 600
                                        * Referenced by: '<S2>/Saturation8'
                                        */
  real_T Saturation8_LowerSat;         /* Expression: 0
                                        * Referenced by: '<S2>/Saturation8'
                                        */
  real_T Constant10_Value[3];          /* Expression: [0;0;0;]
                                        * Referenced by: '<S2>/Constant10'
                                        */
  real_T Switch17_Threshold;           /* Expression: 0.1
                                        * Referenced by: '<S2>/Switch17'
                                        */
  real_T Constant2_Value_n[9];         /* Expression: zeros(3)
                                        * Referenced by: '<S44>/Constant2'
                                        */
  real_T Constant_Value_cc;            /* Expression: 1
                                        * Referenced by: '<S53>/Constant'
                                        */
  real_T Constant1_Value[3];           /* Expression: [0;0;1]
                                        * Referenced by: '<S2>/Constant1'
                                        */
  real_T disturbanceenable1_Value;     /* Expression: 0
                                        * Referenced by: '<S2>/disturbance enable1'
                                        */
  real_T Switch4_Threshold_p;          /* Expression: 1
                                        * Referenced by: '<S2>/Switch4'
                                        */
  real_T Constant2_Value_c[3];         /* Expression: [0;0;1]
                                        * Referenced by: '<S2>/Constant2'
                                        */
  real_T Switch6_Threshold;            /* Expression: 0.1
                                        * Referenced by: '<S2>/Switch6'
                                        */
  real_T SaturatingRamp1_gainval; /* Computed Parameter: SaturatingRamp1_gainval
                                   * Referenced by: '<S88>/SaturatingRamp1'
                                   */
  real_T SaturatingRamp1_IC;           /* Expression: 0
                                        * Referenced by: '<S88>/SaturatingRamp1'
                                        */
  real_T constant1_Value;              /* Expression: 2
                                        * Referenced by: '<S88>/constant1'
                                        */
  real_T Delay_InitialCondition_gt;    /* Expression: 0.0
                                        * Referenced by: '<S82>/Delay'
                                        */
  real_T Delay1_InitialCondition_p;    /* Expression: 1
                                        * Referenced by: '<S82>/Delay1'
                                        */
  real_T constant_Value_m;             /* Expression: 1
                                        * Referenced by: '<S88>/constant'
                                        */
  real_T Delay_InitialCondition_l[4];  /* Expression: [0;0;0;0;]
                                        * Referenced by: '<S4>/Delay'
                                        */
  real_T DiscreteTimeIntegrator_gainval;
                           /* Computed Parameter: DiscreteTimeIntegrator_gainval
                            * Referenced by: '<S4>/Discrete-Time Integrator'
                            */
  real_T DiscreteTimeIntegrator_IC;    /* Expression: 0
                                        * Referenced by: '<S4>/Discrete-Time Integrator'
                                        */
  real_T DiscreteTimeIntegrator1_gainval;
                          /* Computed Parameter: DiscreteTimeIntegrator1_gainval
                           * Referenced by: '<S4>/Discrete-Time Integrator1'
                           */
  real_T DiscreteTimeIntegrator1_IC;   /* Expression: 0
                                        * Referenced by: '<S4>/Discrete-Time Integrator1'
                                        */
  real_T heighttoenablecontrol1_Threshold;/* Expression: 0
                                           * Referenced by: '<S4>/height to enable control1'
                                           */
  real_T upi_Gain;                     /* Expression: 2*pi
                                        * Referenced by: '<S91>/2pi'
                                        */
  real_T Gain_Gain_m;                  /* Expression: 2
                                        * Referenced by: '<S95>/Gain'
                                        */
  real_T Constant_Value_j;             /* Expression: 1
                                        * Referenced by: '<S95>/Constant'
                                        */
  real_T Gain_Gain_k;                  /* Expression: 2
                                        * Referenced by: '<S99>/Gain'
                                        */
  real_T Constant_Value_o;             /* Expression: 1
                                        * Referenced by: '<S99>/Constant'
                                        */
  real_T upi_Gain_o;                   /* Expression: 2*pi
                                        * Referenced by: '<S92>/2pi'
                                        */
  real_T Gain_Gain_j;                  /* Expression: 2
                                        * Referenced by: '<S101>/Gain'
                                        */
  real_T Constant_Value_kj2;           /* Expression: 1
                                        * Referenced by: '<S101>/Constant'
                                        */
  real_T Gain_Gain_h3;                 /* Expression: 2
                                        * Referenced by: '<S105>/Gain'
                                        */
  real_T Constant_Value_jy;            /* Expression: 1
                                        * Referenced by: '<S105>/Constant'
                                        */
  real_T upi_Gain_b;                   /* Expression: 2*pi
                                        * Referenced by: '<S93>/2pi'
                                        */
  real_T Gain_Gain_o;                  /* Expression: 2
                                        * Referenced by: '<S107>/Gain'
                                        */
  real_T Constant_Value_mx;            /* Expression: 1
                                        * Referenced by: '<S107>/Constant'
                                        */
  real_T Gain_Gain_o0;                 /* Expression: 2
                                        * Referenced by: '<S111>/Gain'
                                        */
  real_T Constant_Value_lu;            /* Expression: 1
                                        * Referenced by: '<S111>/Constant'
                                        */
  real_T upi_Gain_e;                   /* Expression: 2*pi
                                        * Referenced by: '<S94>/2pi'
                                        */
  real_T Gain_Gain_ks;                 /* Expression: 2
                                        * Referenced by: '<S113>/Gain'
                                        */
  real_T Constant_Value_mky;           /* Expression: 1
                                        * Referenced by: '<S113>/Constant'
                                        */
  real_T Gain_Gain_p;                  /* Expression: 2
                                        * Referenced by: '<S117>/Gain'
                                        */
  real_T Constant_Value_kv;            /* Expression: 1
                                        * Referenced by: '<S117>/Constant'
                                        */
  real_T Constant1_Value_e;            /* Expression: 1
                                        * Referenced by: '<S6>/Constant1'
                                        */
  real_T ExecutionTime_P1;             /* Expression: ShowTaskTimes
                                        * Referenced by: '<Root>/Execution Time'
                                        */
  boolean_T Constant22_Value;          /* Expression: false
                                        * Referenced by: '<S4>/Constant22'
                                        */
  boolean_T Constant21_Value;          /* Expression: true
                                        * Referenced by: '<S4>/Constant21'
                                        */
};

/* Real-time Model Data Structure */
struct tag_RTM_controller13_T {
  const char_T *path;
  const char_T *modelName;
  struct SimStruct_tag * *childSfunctions;
  const char_T *errorStatus;
  SS_SimMode simMode;
  RTWExtModeInfo *extModeInfo;
  RTWSolverInfo solverInfo;
  RTWSolverInfo *solverInfoPtr;
  void *sfcnInfo;
  void *blockIO;
  const void *constBlockIO;
  void *defaultParam;
  ZCSigState *prevZCSigState;
  real_T *contStates;
  int_T *periodicContStateIndices;
  real_T *periodicContStateRanges;
  real_T *derivs;
  void *zcSignalValues;
  void *inputs;
  void *outputs;
  boolean_T *contStateDisabled;
  boolean_T zCCacheNeedsReset;
  boolean_T derivCacheNeedsReset;
  boolean_T CTOutputIncnstWithState;
  real_T odeY[13];
  real_T odeF[3][13];
  ODE3_IntgData intgData;
  void *dwork;

  /*
   * Sizes:
   * The following substructure contains sizes information
   * for many of the model attributes such as inputs, outputs,
   * dwork, sample times, etc.
   */
  struct {
    uint32_T checksums[4];
    uint32_T options;
    int_T numContStates;
    int_T numPeriodicContStates;
    int_T numU;
    int_T numY;
    int_T numSampTimes;
    int_T numBlocks;
    int_T numBlockIO;
    int_T numBlockPrms;
    int_T numDwork;
    int_T numSFcnPrms;
    int_T numSFcns;
    int_T numIports;
    int_T numOports;
    int_T numNonSampZCs;
    int_T sysDirFeedThru;
    int_T rtwGenSfcn;
  } Sizes;

  /*
   * SpecialInfo:
   * The following substructure contains special information
   * related to other components that are dependent on RTW.
   */
  struct {
    const void *mappingInfo;
    void *xpcData;
  } SpecialInfo;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    time_T stepSize;
    uint32_T clockTick0;
    uint32_T clockTickH0;
    time_T stepSize0;
    uint32_T clockTick1;
    uint32_T clockTickH1;
    time_T stepSize1;
    uint32_T clockTick2;
    uint32_T clockTickH2;
    time_T stepSize2;
    uint32_T clockTick3;
    uint32_T clockTickH3;
    time_T stepSize3;
    boolean_T firstInitCondFlag;
    struct {
      uint8_T TID[4];
    } TaskCounters;

    time_T tStart;
    time_T tFinal;
    time_T timeOfLastOutput;
    void *timingData;
    real_T *varNextHitTimesList;
    SimTimeStep simTimeStep;
    boolean_T stopRequestedFlag;
    time_T *sampleTimes;
    time_T *offsetTimes;
    int_T *sampleTimeTaskIDPtr;
    int_T *sampleHits;
    int_T *perTaskSampleHits;
    time_T *t;
    time_T sampleTimesArray[4];
    time_T offsetTimesArray[4];
    int_T sampleTimeTaskIDArray[4];
    int_T sampleHitArray[4];
    int_T perTaskSampleHitsArray[16];
    time_T tArray[4];
  } Timing;
};

/* Block parameters (default storage) */
extern P_controller13_T controller13_P;

/* Block signals (default storage) */
extern B_controller13_T controller13_B;

/* Continuous states (default storage) */
extern X_controller13_T controller13_X;

/* Block states (default storage) */
extern DW_controller13_T controller13_DW;

/* Model entry point functions */
extern void controller13_initialize(void);
extern void controller13_output(void);
extern void controller13_update(void);
extern void controller13_terminate(void);

/*====================*
 * External functions *
 *====================*/
extern controller13_rtModel *controller13(void);
extern void MdlInitializeSizes(void);
extern void MdlInitializeSampleTimes(void);
extern void MdlInitialize(void);
extern void MdlStart(void);
extern void MdlOutputs(int_T tid);
extern void MdlUpdate(int_T tid);
extern void MdlTerminate(void);

/* Real-time Model object */
extern RT_MODEL_controller13_T *const controller13_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'controller13'
 * '<S1>'   : 'controller13/Adaptive Controller'
 * '<S2>'   : 'controller13/Flying Simulation'
 * '<S3>'   : 'controller13/Measurement manager'
 * '<S4>'   : 'controller13/counter 2'
 * '<S5>'   : 'controller13/motor thrust mapping'
 * '<S6>'   : 'controller13/signal generator1'
 * '<S7>'   : 'controller13/signal safety (no imag & NaN)'
 * '<S8>'   : 'controller13/voltage safety (no imag & NaN)'
 * '<S9>'   : 'controller13/Adaptive Controller/Attitude and thrust learned NMPC'
 * '<S10>'  : 'controller13/Adaptive Controller/adaptive setpoint rd'
 * '<S11>'  : 'controller13/Adaptive Controller/correct force'
 * '<S12>'  : 'controller13/Adaptive Controller/observer'
 * '<S13>'  : 'controller13/Adaptive Controller/saturation'
 * '<S14>'  : 'controller13/Adaptive Controller/time'
 * '<S15>'  : 'controller13/Adaptive Controller/Attitude and thrust learned NMPC/Geometric Attitude Controller'
 * '<S16>'  : 'controller13/Adaptive Controller/Attitude and thrust learned NMPC/Learned RTNMPC'
 * '<S17>'  : 'controller13/Adaptive Controller/observer/External Torque Observer'
 * '<S18>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)'
 * '<S19>'  : 'controller13/Adaptive Controller/observer/Rotm2rpy1'
 * '<S20>'  : 'controller13/Adaptive Controller/observer/UKF'
 * '<S21>'  : 'controller13/Adaptive Controller/observer/time'
 * '<S22>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/Rotaion'
 * '<S23>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/lateral KF observer'
 * '<S24>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/Rotaion/Rotation Matrix'
 * '<S25>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/Rotaion/Rotation Matrix1'
 * '<S26>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/Rotaion/filtered derivative'
 * '<S27>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/Rotaion/filtered derivative/filtered derivative'
 * '<S28>'  : 'controller13/Adaptive Controller/observer/Linear Observer (ICRA'23)/lateral KF observer/Translational Dynamics & Kinamatics Lin Obs'
 * '<S29>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1'
 * '<S30>'  : 'controller13/Adaptive Controller/observer/UKF/eul to rotation matrix'
 * '<S31>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/R_flat to quat'
 * '<S32>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/UKF_inner'
 * '<S33>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/pack measurement vector'
 * '<S34>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/quaternion to rotation matrix'
 * '<S35>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/unpack state'
 * '<S36>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/UKF_inner/UKF update then predict'
 * '<S37>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/UKF_inner/bee cov to SI cov'
 * '<S38>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/UKF_inner/bee units to SI'
 * '<S39>'  : 'controller13/Adaptive Controller/observer/UKF/UKF1/UKF_inner/bee units to SI1'
 * '<S40>'  : 'controller13/Flying Simulation/6DOF (Quaternion)'
 * '<S41>'  : 'controller13/Flying Simulation/power_distribution_1'
 * '<S42>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles'
 * '<S43>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot'
 * '<S44>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Determine Force,  Mass & Inertia'
 * '<S45>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Vbxw'
 * '<S46>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Velocity Conversion'
 * '<S47>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Velocity Conversion1'
 * '<S48>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Velocity Conversion2'
 * '<S49>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/transform to Inertial axes '
 * '<S50>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix'
 * '<S51>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles'
 * '<S52>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Rotation Angles to Quaternions'
 * '<S53>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/qdot'
 * '<S54>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A11'
 * '<S55>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A12'
 * '<S56>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A13'
 * '<S57>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A21'
 * '<S58>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A22'
 * '<S59>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A23'
 * '<S60>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A31'
 * '<S61>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A32'
 * '<S62>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/A33'
 * '<S63>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/Create 3x3 Matrix'
 * '<S64>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/Quaternion Normalize'
 * '<S65>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/Quaternion Normalize/Quaternion Modulus'
 * '<S66>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to  Direction Cosine Matrix/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S67>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Angle Calculation'
 * '<S68>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Quaternion Normalize'
 * '<S69>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input'
 * '<S70>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem'
 * '<S71>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem1'
 * '<S72>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem2'
 * '<S73>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus'
 * '<S74>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate DCM & Euler Angles/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'
 * '<S75>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot/3x3 Cross Product'
 * '<S76>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot/I x w'
 * '<S77>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot/I x w1'
 * '<S78>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot/3x3 Cross Product/Subsystem'
 * '<S79>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Calculate omega_dot/3x3 Cross Product/Subsystem1'
 * '<S80>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Vbxw/Subsystem'
 * '<S81>'  : 'controller13/Flying Simulation/6DOF (Quaternion)/Vbxw/Subsystem1'
 * '<S82>'  : 'controller13/Measurement manager/safety check system'
 * '<S83>'  : 'controller13/Measurement manager/safety check system/Compare To Constant'
 * '<S84>'  : 'controller13/Measurement manager/safety check system/Compare To Constant1'
 * '<S85>'  : 'controller13/Measurement manager/safety check system/MATLAB Function'
 * '<S86>'  : 'controller13/Measurement manager/safety check system/cp'
 * '<S87>'  : 'controller13/Measurement manager/safety check system/envelope check'
 * '<S88>'  : 'controller13/Measurement manager/safety check system/landing condition'
 * '<S89>'  : 'controller13/Measurement manager/safety check system/voltage check'
 * '<S90>'  : 'controller13/Measurement manager/safety check system/landing condition/landing_cond'
 * '<S91>'  : 'controller13/signal generator1/signal generator 1'
 * '<S92>'  : 'controller13/signal generator1/signal generator 2'
 * '<S93>'  : 'controller13/signal generator1/signal generator 3'
 * '<S94>'  : 'controller13/signal generator1/signal generator 4'
 * '<S95>'  : 'controller13/signal generator1/signal generator 1/SignalForRamp_binary'
 * '<S96>'  : 'controller13/signal generator1/signal generator 1/SignalSaturationLimit4'
 * '<S97>'  : 'controller13/signal generator1/signal generator 1/get max voltage'
 * '<S98>'  : 'controller13/signal generator1/signal generator 1/SignalForRamp_binary/Compare To Zero'
 * '<S99>'  : 'controller13/signal generator1/signal generator 1/get max voltage/SIgnalForRamp_binary'
 * '<S100>' : 'controller13/signal generator1/signal generator 1/get max voltage/SIgnalForRamp_binary/Compare To Zero'
 * '<S101>' : 'controller13/signal generator1/signal generator 2/SignalForRamp_binary'
 * '<S102>' : 'controller13/signal generator1/signal generator 2/SignalSaturationLimit4'
 * '<S103>' : 'controller13/signal generator1/signal generator 2/get max voltage'
 * '<S104>' : 'controller13/signal generator1/signal generator 2/SignalForRamp_binary/Compare To Zero'
 * '<S105>' : 'controller13/signal generator1/signal generator 2/get max voltage/SIgnalForRamp_binary'
 * '<S106>' : 'controller13/signal generator1/signal generator 2/get max voltage/SIgnalForRamp_binary/Compare To Zero'
 * '<S107>' : 'controller13/signal generator1/signal generator 3/SignalForRamp_binary'
 * '<S108>' : 'controller13/signal generator1/signal generator 3/SignalSaturationLimit4'
 * '<S109>' : 'controller13/signal generator1/signal generator 3/get max voltage'
 * '<S110>' : 'controller13/signal generator1/signal generator 3/SignalForRamp_binary/Compare To Zero'
 * '<S111>' : 'controller13/signal generator1/signal generator 3/get max voltage/SIgnalForRamp_binary'
 * '<S112>' : 'controller13/signal generator1/signal generator 3/get max voltage/SIgnalForRamp_binary/Compare To Zero'
 * '<S113>' : 'controller13/signal generator1/signal generator 4/SignalForRamp_binary'
 * '<S114>' : 'controller13/signal generator1/signal generator 4/SignalSaturationLimit4'
 * '<S115>' : 'controller13/signal generator1/signal generator 4/get max voltage'
 * '<S116>' : 'controller13/signal generator1/signal generator 4/SignalForRamp_binary/Compare To Zero'
 * '<S117>' : 'controller13/signal generator1/signal generator 4/get max voltage/SIgnalForRamp_binary'
 * '<S118>' : 'controller13/signal generator1/signal generator 4/get max voltage/SIgnalForRamp_binary/Compare To Zero'
 */
#endif                                 /* RTW_HEADER_controller13_h_ */
