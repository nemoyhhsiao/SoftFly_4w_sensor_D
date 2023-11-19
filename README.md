# SoftFly Controller
SoftFly controller/simulator with Simulink Desktop Real-Time (for the 4-wing robot)

## Overview
This repo contains control architecture for performing flights on [MIT SoftFly](https://smrl.mit.edu/research/aerial-robot-powered-by-soft-actuators/) with Matlab Simulink Desktop Real-Time. The controller is designed to receive motion tracking system (e.g. Vicon) data (position and attitude) through UDP and send out four 0 - 10 (Volt) driving signals to a 4-channel DAC (e.g. Arduino + [Aptinex DAC](https://aptinex.com/product/aptinex-4-channel-dac-module-da4c010bi-i2c-digital-to-analog-0-10v-mcp4728/)) through UDP to independently drive four high-voltage amplifiers (e.g. Trek 677B). 

The overall workflow starts with setting up all the model/controller parameters with the Matlab script; then we create a real-time application from the Simulink model (compile the Simulink file into C code) using `slbuild`. After compiling, we establish a connection between the model and the kernel; then we start the execution of the application in real time, and eventually save data logged from the scope. (See [Run in Kernel Mode](https://www.mathworks.com/help/sldrt/ug/run-application-from-simulink.html) and [Command Line](https://www.mathworks.com/help/sldrt/ug/run-application-from-matlab-command-line.html))

In addition to the real-time scheme, the Simulink file contains a 6-DOF simulator, which is customized for simulating SoftFly with user-specified disturbances. The simulator has continuous states handled by the [Simulink ODE solver](https://www.mathworks.com/help/simulink/ug/choose-a-solver.html) and can be run in "Normal" mode (see [Simulink Mode](https://www.mathworks.com/help/simulink/ug/choosing-a-simulation-mode.html)) entirely on the host computer side.

## Controller setup
`step1_setup.m` initiates all the model/controller parameters. `rsim.en = 1` enables simulation, disables all the real-time interfaces, and runs the simulation in "Normal" mode. `rsim.en = 0` compiles the controller and enables all the real-time interface. `ctr.en` is the switch for openloop and closedloop control; for all openloop attempts, the flight time is set to 0.2 s. `mdl.rerun = 1` will run the controller in real-time again using the logged position and attitude data.

## Compile Simulink into C code
`step2_build.m` creates a real-time application from the Simulink model. It reads the Simulink file and compiles it with the [Target Language Compiler](https://www.mathworks.com/help/rtw/tlc/what-is-the-target-language-compiler.html).

## Connect the application to the real-time target
`step3_connect.m` connects the compiled application to the real-time kernel.

## Run and auto save
`step4_run.m` starts the real-time execution and times the rough execution time in Matlab environment (not the real-time kernel clock). After the execution is completed, it saves the logged data in the workspace in the "data" folder.

## Save to designated folder
`step5_save.m` saves all the data in the workspace to the designated folder.

## Analysis
`step6_analysis.m` plots the flight data.
