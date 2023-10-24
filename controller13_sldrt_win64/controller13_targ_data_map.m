    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 7;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (controller13_P)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_P.rbt
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_P.lut
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_P.ctr
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_P.rsim
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_P.mdl
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 218;
            section.data(218)  = dumData; %prealloc

                    ;% controller13_P.ukf_P0_flat
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_P.ukf_prediction_time
                    section.data(2).logicalSrcIdx = 6;
                    section.data(2).dtTransOffset = 324;

                    ;% controller13_P.ukf_s0
                    section.data(3).logicalSrcIdx = 7;
                    section.data(3).dtTransOffset = 325;

                    ;% controller13_P.ukf_use_prediction
                    section.data(4).logicalSrcIdx = 8;
                    section.data(4).dtTransOffset = 344;

                    ;% controller13_P.filteredderivative_ICPrevInput
                    section.data(5).logicalSrcIdx = 9;
                    section.data(5).dtTransOffset = 345;

                    ;% controller13_P.filteredderivative_ICPrevOutput
                    section.data(6).logicalSrcIdx = 10;
                    section.data(6).dtTransOffset = 346;

                    ;% controller13_P.uDOFQuaternion_Vm_0
                    section.data(7).logicalSrcIdx = 11;
                    section.data(7).dtTransOffset = 347;

                    ;% controller13_P.filteredderivative_ZeroZ
                    section.data(8).logicalSrcIdx = 12;
                    section.data(8).dtTransOffset = 350;

                    ;% controller13_P.CompareToConstant1_const
                    section.data(9).logicalSrcIdx = 13;
                    section.data(9).dtTransOffset = 351;

                    ;% controller13_P.CompareToConstant_const
                    section.data(10).logicalSrcIdx = 14;
                    section.data(10).dtTransOffset = 352;

                    ;% controller13_P.uDOFQuaternion_eul_0
                    section.data(11).logicalSrcIdx = 15;
                    section.data(11).dtTransOffset = 353;

                    ;% controller13_P.uDOFQuaternion_inertia
                    section.data(12).logicalSrcIdx = 16;
                    section.data(12).dtTransOffset = 356;

                    ;% controller13_P.uDOFQuaternion_k_quat
                    section.data(13).logicalSrcIdx = 17;
                    section.data(13).dtTransOffset = 365;

                    ;% controller13_P.uDOFQuaternion_mass_0
                    section.data(14).logicalSrcIdx = 18;
                    section.data(14).dtTransOffset = 366;

                    ;% controller13_P.uDOFQuaternion_pm_0
                    section.data(15).logicalSrcIdx = 19;
                    section.data(15).dtTransOffset = 367;

                    ;% controller13_P.uDOFQuaternion_xme_0
                    section.data(16).logicalSrcIdx = 20;
                    section.data(16).dtTransOffset = 370;

                    ;% controller13_P.Constant_Value
                    section.data(17).logicalSrcIdx = 21;
                    section.data(17).dtTransOffset = 373;

                    ;% controller13_P.F_ext_const_Value
                    section.data(18).logicalSrcIdx = 22;
                    section.data(18).dtTransOffset = 376;

                    ;% controller13_P.Constant_Value_d
                    section.data(19).logicalSrcIdx = 23;
                    section.data(19).dtTransOffset = 379;

                    ;% controller13_P.Constant_Value_b
                    section.data(20).logicalSrcIdx = 24;
                    section.data(20).dtTransOffset = 380;

                    ;% controller13_P.Constant11_Value
                    section.data(21).logicalSrcIdx = 25;
                    section.data(21).dtTransOffset = 381;

                    ;% controller13_P.disturbanceenable_Value
                    section.data(22).logicalSrcIdx = 26;
                    section.data(22).dtTransOffset = 384;

                    ;% controller13_P.Switch3_Threshold
                    section.data(23).logicalSrcIdx = 27;
                    section.data(23).dtTransOffset = 385;

                    ;% controller13_P.Constant9_Value
                    section.data(24).logicalSrcIdx = 28;
                    section.data(24).dtTransOffset = 386;

                    ;% controller13_P.Constant34_Value
                    section.data(25).logicalSrcIdx = 29;
                    section.data(25).dtTransOffset = 389;

                    ;% controller13_P.Constant35_Value
                    section.data(26).logicalSrcIdx = 30;
                    section.data(26).dtTransOffset = 390;

                    ;% controller13_P.Constant_Value_a
                    section.data(27).logicalSrcIdx = 31;
                    section.data(27).dtTransOffset = 391;

                    ;% controller13_P.Constant_Value_l
                    section.data(28).logicalSrcIdx = 32;
                    section.data(28).dtTransOffset = 392;

                    ;% controller13_P.Constant_Value_k
                    section.data(29).logicalSrcIdx = 33;
                    section.data(29).dtTransOffset = 393;

                    ;% controller13_P.Constant_Value_m
                    section.data(30).logicalSrcIdx = 34;
                    section.data(30).dtTransOffset = 394;

                    ;% controller13_P.Constant_Value_p
                    section.data(31).logicalSrcIdx = 35;
                    section.data(31).dtTransOffset = 395;

                    ;% controller13_P.Constant_Value_c
                    section.data(32).logicalSrcIdx = 36;
                    section.data(32).dtTransOffset = 396;

                    ;% controller13_P.Constant_Value_h
                    section.data(33).logicalSrcIdx = 37;
                    section.data(33).dtTransOffset = 397;

                    ;% controller13_P.Constant_Value_g
                    section.data(34).logicalSrcIdx = 38;
                    section.data(34).dtTransOffset = 398;

                    ;% controller13_P.Constant_Value_kj
                    section.data(35).logicalSrcIdx = 39;
                    section.data(35).dtTransOffset = 399;

                    ;% controller13_P.SaturatingRamp_gainval
                    section.data(36).logicalSrcIdx = 40;
                    section.data(36).dtTransOffset = 400;

                    ;% controller13_P.SaturatingRamp_IC
                    section.data(37).logicalSrcIdx = 41;
                    section.data(37).dtTransOffset = 401;

                    ;% controller13_P.SaturatingRamp_UpperSat
                    section.data(38).logicalSrcIdx = 42;
                    section.data(38).dtTransOffset = 402;

                    ;% controller13_P.SaturatingRamp_LowerSat
                    section.data(39).logicalSrcIdx = 43;
                    section.data(39).dtTransOffset = 403;

                    ;% controller13_P.safetyvoltage_Value
                    section.data(40).logicalSrcIdx = 44;
                    section.data(40).dtTransOffset = 404;

                    ;% controller13_P.RampUpOrDown_gainval
                    section.data(41).logicalSrcIdx = 45;
                    section.data(41).dtTransOffset = 405;

                    ;% controller13_P.RampUpOrDown_IC
                    section.data(42).logicalSrcIdx = 46;
                    section.data(42).dtTransOffset = 406;

                    ;% controller13_P.RampUpOrDown_UpperSat
                    section.data(43).logicalSrcIdx = 47;
                    section.data(43).dtTransOffset = 407;

                    ;% controller13_P.RampUpOrDown_LowerSat
                    section.data(44).logicalSrcIdx = 48;
                    section.data(44).dtTransOffset = 408;

                    ;% controller13_P.phaseoffset_Value
                    section.data(45).logicalSrcIdx = 49;
                    section.data(45).dtTransOffset = 409;

                    ;% controller13_P.degtorad_Gain
                    section.data(46).logicalSrcIdx = 50;
                    section.data(46).dtTransOffset = 410;

                    ;% controller13_P.omegat_gainval
                    section.data(47).logicalSrcIdx = 51;
                    section.data(47).dtTransOffset = 411;

                    ;% controller13_P.omegat_IC
                    section.data(48).logicalSrcIdx = 52;
                    section.data(48).dtTransOffset = 412;

                    ;% controller13_P.Gain1_Gain
                    section.data(49).logicalSrcIdx = 53;
                    section.data(49).dtTransOffset = 413;

                    ;% controller13_P.Delay1_InitialCondition
                    section.data(50).logicalSrcIdx = 54;
                    section.data(50).dtTransOffset = 414;

                    ;% controller13_P.x_offset_Value
                    section.data(51).logicalSrcIdx = 55;
                    section.data(51).dtTransOffset = 415;

                    ;% controller13_P.u2_Gain
                    section.data(52).logicalSrcIdx = 56;
                    section.data(52).dtTransOffset = 416;

                    ;% controller13_P.Gain_Gain
                    section.data(53).logicalSrcIdx = 57;
                    section.data(53).dtTransOffset = 417;

                    ;% controller13_P.Gain_Gain_l
                    section.data(54).logicalSrcIdx = 58;
                    section.data(54).dtTransOffset = 418;

                    ;% controller13_P.Gain_Gain_h
                    section.data(55).logicalSrcIdx = 59;
                    section.data(55).dtTransOffset = 419;

                    ;% controller13_P.Gain_Gain_b
                    section.data(56).logicalSrcIdx = 60;
                    section.data(56).dtTransOffset = 420;

                    ;% controller13_P.Gain_Gain_e
                    section.data(57).logicalSrcIdx = 61;
                    section.data(57).dtTransOffset = 421;

                    ;% controller13_P.Gain_Gain_eu
                    section.data(58).logicalSrcIdx = 62;
                    section.data(58).dtTransOffset = 422;

                    ;% controller13_P.Switch_Threshold
                    section.data(59).logicalSrcIdx = 63;
                    section.data(59).dtTransOffset = 423;

                    ;% controller13_P.y_offset_Value
                    section.data(60).logicalSrcIdx = 64;
                    section.data(60).dtTransOffset = 424;

                    ;% controller13_P.Constant_Value_e
                    section.data(61).logicalSrcIdx = 65;
                    section.data(61).dtTransOffset = 425;

                    ;% controller13_P.Delay2_InitialCondition
                    section.data(62).logicalSrcIdx = 66;
                    section.data(62).dtTransOffset = 426;

                    ;% controller13_P.Delay_InitialCondition
                    section.data(63).logicalSrcIdx = 67;
                    section.data(63).dtTransOffset = 439;

                    ;% controller13_P.time_gainval
                    section.data(64).logicalSrcIdx = 68;
                    section.data(64).dtTransOffset = 440;

                    ;% controller13_P.time_IC
                    section.data(65).logicalSrcIdx = 69;
                    section.data(65).dtTransOffset = 441;

                    ;% controller13_P.lowpass_InitialStates
                    section.data(66).logicalSrcIdx = 70;
                    section.data(66).dtTransOffset = 442;

                    ;% controller13_P.Delay1_InitialCondition_e
                    section.data(67).logicalSrcIdx = 71;
                    section.data(67).dtTransOffset = 443;

                    ;% controller13_P.Constant_Value_mk
                    section.data(68).logicalSrcIdx = 72;
                    section.data(68).dtTransOffset = 444;

                    ;% controller13_P.lowpass1_InitialStates
                    section.data(69).logicalSrcIdx = 73;
                    section.data(69).dtTransOffset = 445;

                    ;% controller13_P.Delay2_InitialCondition_g
                    section.data(70).logicalSrcIdx = 74;
                    section.data(70).dtTransOffset = 446;

                    ;% controller13_P.lowpass2_InitialStates
                    section.data(71).logicalSrcIdx = 75;
                    section.data(71).dtTransOffset = 447;

                    ;% controller13_P.Delay3_InitialCondition
                    section.data(72).logicalSrcIdx = 76;
                    section.data(72).dtTransOffset = 448;

                    ;% controller13_P.Switch_Threshold_k
                    section.data(73).logicalSrcIdx = 77;
                    section.data(73).dtTransOffset = 449;

                    ;% controller13_P.Switch4_Threshold
                    section.data(74).logicalSrcIdx = 78;
                    section.data(74).dtTransOffset = 450;

                    ;% controller13_P.lowpass3_InitialStates
                    section.data(75).logicalSrcIdx = 79;
                    section.data(75).dtTransOffset = 451;

                    ;% controller13_P.Switch5_Threshold
                    section.data(76).logicalSrcIdx = 80;
                    section.data(76).dtTransOffset = 452;

                    ;% controller13_P.Delay1_InitialCondition_d
                    section.data(77).logicalSrcIdx = 81;
                    section.data(77).dtTransOffset = 453;

                    ;% controller13_P.Delay_InitialCondition_j
                    section.data(78).logicalSrcIdx = 82;
                    section.data(78).dtTransOffset = 456;

                    ;% controller13_P.Delay2_InitialCondition_l
                    section.data(79).logicalSrcIdx = 83;
                    section.data(79).dtTransOffset = 459;

                    ;% controller13_P.Switch_Threshold_c
                    section.data(80).logicalSrcIdx = 84;
                    section.data(80).dtTransOffset = 460;

                    ;% controller13_P.Switch1_Threshold
                    section.data(81).logicalSrcIdx = 85;
                    section.data(81).dtTransOffset = 461;

                    ;% controller13_P.Switch2_Threshold
                    section.data(82).logicalSrcIdx = 86;
                    section.data(82).dtTransOffset = 462;

                    ;% controller13_P.Constant2_Value
                    section.data(83).logicalSrcIdx = 87;
                    section.data(83).dtTransOffset = 463;

                    ;% controller13_P.Delay1_InitialCondition_m
                    section.data(84).logicalSrcIdx = 88;
                    section.data(84).dtTransOffset = 464;

                    ;% controller13_P.Delay_InitialCondition_o
                    section.data(85).logicalSrcIdx = 89;
                    section.data(85).dtTransOffset = 468;

                    ;% controller13_P.vintegrator_gainval
                    section.data(86).logicalSrcIdx = 90;
                    section.data(86).dtTransOffset = 471;

                    ;% controller13_P.vintegrator_IC
                    section.data(87).logicalSrcIdx = 91;
                    section.data(87).dtTransOffset = 472;

                    ;% controller13_P.lowpass_InitialStates_k
                    section.data(88).logicalSrcIdx = 92;
                    section.data(88).dtTransOffset = 473;

                    ;% controller13_P.time_gainval_c
                    section.data(89).logicalSrcIdx = 93;
                    section.data(89).dtTransOffset = 474;

                    ;% controller13_P.time_IC_g
                    section.data(90).logicalSrcIdx = 94;
                    section.data(90).dtTransOffset = 475;

                    ;% controller13_P.Delay_InitialCondition_g
                    section.data(91).logicalSrcIdx = 95;
                    section.data(91).dtTransOffset = 476;

                    ;% controller13_P.Delay1_InitialCondition_n
                    section.data(92).logicalSrcIdx = 96;
                    section.data(92).dtTransOffset = 479;

                    ;% controller13_P.Saturation_UpperSat
                    section.data(93).logicalSrcIdx = 97;
                    section.data(93).dtTransOffset = 481;

                    ;% controller13_P.Saturation_LowerSat
                    section.data(94).logicalSrcIdx = 98;
                    section.data(94).dtTransOffset = 484;

                    ;% controller13_P.Switch3_Threshold_g
                    section.data(95).logicalSrcIdx = 99;
                    section.data(95).dtTransOffset = 487;

                    ;% controller13_P.Saturation1_UpperSat
                    section.data(96).logicalSrcIdx = 100;
                    section.data(96).dtTransOffset = 488;

                    ;% controller13_P.Saturation1_LowerSat
                    section.data(97).logicalSrcIdx = 101;
                    section.data(97).dtTransOffset = 491;

                    ;% controller13_P.Saturation_UpperSat_d
                    section.data(98).logicalSrcIdx = 102;
                    section.data(98).dtTransOffset = 494;

                    ;% controller13_P.Saturation_LowerSat_m
                    section.data(99).logicalSrcIdx = 103;
                    section.data(99).dtTransOffset = 495;

                    ;% controller13_P.Constant13_Value
                    section.data(100).logicalSrcIdx = 104;
                    section.data(100).dtTransOffset = 496;

                    ;% controller13_P.Saturation1_UpperSat_c
                    section.data(101).logicalSrcIdx = 105;
                    section.data(101).dtTransOffset = 497;

                    ;% controller13_P.Saturation1_LowerSat_c
                    section.data(102).logicalSrcIdx = 106;
                    section.data(102).dtTransOffset = 498;

                    ;% controller13_P.Delay_InitialCondition_a
                    section.data(103).logicalSrcIdx = 107;
                    section.data(103).dtTransOffset = 499;

                    ;% controller13_P.Constant14_Value
                    section.data(104).logicalSrcIdx = 108;
                    section.data(104).dtTransOffset = 500;

                    ;% controller13_P.Saturation2_UpperSat
                    section.data(105).logicalSrcIdx = 109;
                    section.data(105).dtTransOffset = 501;

                    ;% controller13_P.Saturation2_LowerSat
                    section.data(106).logicalSrcIdx = 110;
                    section.data(106).dtTransOffset = 502;

                    ;% controller13_P.Delay2_InitialCondition_o
                    section.data(107).logicalSrcIdx = 111;
                    section.data(107).dtTransOffset = 503;

                    ;% controller13_P.Constant15_Value
                    section.data(108).logicalSrcIdx = 112;
                    section.data(108).dtTransOffset = 504;

                    ;% controller13_P.Saturation3_UpperSat
                    section.data(109).logicalSrcIdx = 113;
                    section.data(109).dtTransOffset = 505;

                    ;% controller13_P.Saturation3_LowerSat
                    section.data(110).logicalSrcIdx = 114;
                    section.data(110).dtTransOffset = 506;

                    ;% controller13_P.Delay3_InitialCondition_c
                    section.data(111).logicalSrcIdx = 115;
                    section.data(111).dtTransOffset = 507;

                    ;% controller13_P.Constant16_Value
                    section.data(112).logicalSrcIdx = 116;
                    section.data(112).dtTransOffset = 508;

                    ;% controller13_P.Saturation4_UpperSat
                    section.data(113).logicalSrcIdx = 117;
                    section.data(113).dtTransOffset = 509;

                    ;% controller13_P.Saturation4_LowerSat
                    section.data(114).logicalSrcIdx = 118;
                    section.data(114).dtTransOffset = 510;

                    ;% controller13_P.half1_Gain
                    section.data(115).logicalSrcIdx = 119;
                    section.data(115).dtTransOffset = 511;

                    ;% controller13_P.ground_Value
                    section.data(116).logicalSrcIdx = 120;
                    section.data(116).dtTransOffset = 512;

                    ;% controller13_P.Gain4_Gain
                    section.data(117).logicalSrcIdx = 121;
                    section.data(117).dtTransOffset = 513;

                    ;% controller13_P.SaturatingRamp_gainval_a
                    section.data(118).logicalSrcIdx = 122;
                    section.data(118).dtTransOffset = 514;

                    ;% controller13_P.SaturatingRamp_IC_d
                    section.data(119).logicalSrcIdx = 123;
                    section.data(119).dtTransOffset = 515;

                    ;% controller13_P.SaturatingRamp_UpperSat_e
                    section.data(120).logicalSrcIdx = 124;
                    section.data(120).dtTransOffset = 516;

                    ;% controller13_P.SaturatingRamp_LowerSat_p
                    section.data(121).logicalSrcIdx = 125;
                    section.data(121).dtTransOffset = 517;

                    ;% controller13_P.RampUpOrDown_gainval_e
                    section.data(122).logicalSrcIdx = 126;
                    section.data(122).dtTransOffset = 518;

                    ;% controller13_P.RampUpOrDown_IC_c
                    section.data(123).logicalSrcIdx = 127;
                    section.data(123).dtTransOffset = 519;

                    ;% controller13_P.RampUpOrDown_UpperSat_o
                    section.data(124).logicalSrcIdx = 128;
                    section.data(124).dtTransOffset = 520;

                    ;% controller13_P.RampUpOrDown_LowerSat_k
                    section.data(125).logicalSrcIdx = 129;
                    section.data(125).dtTransOffset = 521;

                    ;% controller13_P.phaseoffset_Value_l
                    section.data(126).logicalSrcIdx = 130;
                    section.data(126).dtTransOffset = 522;

                    ;% controller13_P.degtorad_Gain_i
                    section.data(127).logicalSrcIdx = 131;
                    section.data(127).dtTransOffset = 523;

                    ;% controller13_P.omegat_gainval_l
                    section.data(128).logicalSrcIdx = 132;
                    section.data(128).dtTransOffset = 524;

                    ;% controller13_P.omegat_IC_g
                    section.data(129).logicalSrcIdx = 133;
                    section.data(129).dtTransOffset = 525;

                    ;% controller13_P.Gain1_Gain_g
                    section.data(130).logicalSrcIdx = 134;
                    section.data(130).dtTransOffset = 526;

                    ;% controller13_P.ground_Value_a
                    section.data(131).logicalSrcIdx = 135;
                    section.data(131).dtTransOffset = 527;

                    ;% controller13_P.Gain1_Gain_d
                    section.data(132).logicalSrcIdx = 136;
                    section.data(132).dtTransOffset = 528;

                    ;% controller13_P.SaturatingRamp_gainval_j
                    section.data(133).logicalSrcIdx = 137;
                    section.data(133).dtTransOffset = 529;

                    ;% controller13_P.SaturatingRamp_IC_g
                    section.data(134).logicalSrcIdx = 138;
                    section.data(134).dtTransOffset = 530;

                    ;% controller13_P.SaturatingRamp_UpperSat_k
                    section.data(135).logicalSrcIdx = 139;
                    section.data(135).dtTransOffset = 531;

                    ;% controller13_P.SaturatingRamp_LowerSat_o
                    section.data(136).logicalSrcIdx = 140;
                    section.data(136).dtTransOffset = 532;

                    ;% controller13_P.RampUpOrDown_gainval_c
                    section.data(137).logicalSrcIdx = 141;
                    section.data(137).dtTransOffset = 533;

                    ;% controller13_P.RampUpOrDown_IC_b
                    section.data(138).logicalSrcIdx = 142;
                    section.data(138).dtTransOffset = 534;

                    ;% controller13_P.RampUpOrDown_UpperSat_e
                    section.data(139).logicalSrcIdx = 143;
                    section.data(139).dtTransOffset = 535;

                    ;% controller13_P.RampUpOrDown_LowerSat_h
                    section.data(140).logicalSrcIdx = 144;
                    section.data(140).dtTransOffset = 536;

                    ;% controller13_P.phaseoffset_Value_j
                    section.data(141).logicalSrcIdx = 145;
                    section.data(141).dtTransOffset = 537;

                    ;% controller13_P.degtorad_Gain_k
                    section.data(142).logicalSrcIdx = 146;
                    section.data(142).dtTransOffset = 538;

                    ;% controller13_P.omegat_gainval_d
                    section.data(143).logicalSrcIdx = 147;
                    section.data(143).dtTransOffset = 539;

                    ;% controller13_P.omegat_IC_o
                    section.data(144).logicalSrcIdx = 148;
                    section.data(144).dtTransOffset = 540;

                    ;% controller13_P.Gain1_Gain_dj
                    section.data(145).logicalSrcIdx = 149;
                    section.data(145).dtTransOffset = 541;

                    ;% controller13_P.ground_Value_b
                    section.data(146).logicalSrcIdx = 150;
                    section.data(146).dtTransOffset = 542;

                    ;% controller13_P.Gain2_Gain
                    section.data(147).logicalSrcIdx = 151;
                    section.data(147).dtTransOffset = 543;

                    ;% controller13_P.SaturatingRamp_gainval_g
                    section.data(148).logicalSrcIdx = 152;
                    section.data(148).dtTransOffset = 544;

                    ;% controller13_P.SaturatingRamp_IC_p
                    section.data(149).logicalSrcIdx = 153;
                    section.data(149).dtTransOffset = 545;

                    ;% controller13_P.SaturatingRamp_UpperSat_i
                    section.data(150).logicalSrcIdx = 154;
                    section.data(150).dtTransOffset = 546;

                    ;% controller13_P.SaturatingRamp_LowerSat_e
                    section.data(151).logicalSrcIdx = 155;
                    section.data(151).dtTransOffset = 547;

                    ;% controller13_P.RampUpOrDown_gainval_e1
                    section.data(152).logicalSrcIdx = 156;
                    section.data(152).dtTransOffset = 548;

                    ;% controller13_P.RampUpOrDown_IC_j
                    section.data(153).logicalSrcIdx = 157;
                    section.data(153).dtTransOffset = 549;

                    ;% controller13_P.RampUpOrDown_UpperSat_c
                    section.data(154).logicalSrcIdx = 158;
                    section.data(154).dtTransOffset = 550;

                    ;% controller13_P.RampUpOrDown_LowerSat_c
                    section.data(155).logicalSrcIdx = 159;
                    section.data(155).dtTransOffset = 551;

                    ;% controller13_P.phaseoffset_Value_k
                    section.data(156).logicalSrcIdx = 160;
                    section.data(156).dtTransOffset = 552;

                    ;% controller13_P.degtorad_Gain_f
                    section.data(157).logicalSrcIdx = 161;
                    section.data(157).dtTransOffset = 553;

                    ;% controller13_P.omegat_gainval_e
                    section.data(158).logicalSrcIdx = 162;
                    section.data(158).dtTransOffset = 554;

                    ;% controller13_P.omegat_IC_i
                    section.data(159).logicalSrcIdx = 163;
                    section.data(159).dtTransOffset = 555;

                    ;% controller13_P.Gain1_Gain_do
                    section.data(160).logicalSrcIdx = 164;
                    section.data(160).dtTransOffset = 556;

                    ;% controller13_P.ground_Value_l
                    section.data(161).logicalSrcIdx = 165;
                    section.data(161).dtTransOffset = 557;

                    ;% controller13_P.Gain3_Gain
                    section.data(162).logicalSrcIdx = 166;
                    section.data(162).dtTransOffset = 558;

                    ;% controller13_P.Switch7_Threshold
                    section.data(163).logicalSrcIdx = 167;
                    section.data(163).dtTransOffset = 559;

                    ;% controller13_P.Constant3_Value
                    section.data(164).logicalSrcIdx = 168;
                    section.data(164).dtTransOffset = 560;

                    ;% controller13_P.constant_Value
                    section.data(165).logicalSrcIdx = 169;
                    section.data(165).dtTransOffset = 563;

                    ;% controller13_P.constant_Value_k
                    section.data(166).logicalSrcIdx = 170;
                    section.data(166).dtTransOffset = 564;

                    ;% controller13_P.Delay3_InitialCondition_e
                    section.data(167).logicalSrcIdx = 171;
                    section.data(167).dtTransOffset = 565;

                    ;% controller13_P.Saturation5_UpperSat
                    section.data(168).logicalSrcIdx = 172;
                    section.data(168).dtTransOffset = 566;

                    ;% controller13_P.Saturation5_LowerSat
                    section.data(169).logicalSrcIdx = 173;
                    section.data(169).dtTransOffset = 567;

                    ;% controller13_P.Saturation6_UpperSat
                    section.data(170).logicalSrcIdx = 174;
                    section.data(170).dtTransOffset = 568;

                    ;% controller13_P.Saturation6_LowerSat
                    section.data(171).logicalSrcIdx = 175;
                    section.data(171).dtTransOffset = 569;

                    ;% controller13_P.Saturation7_UpperSat
                    section.data(172).logicalSrcIdx = 176;
                    section.data(172).dtTransOffset = 570;

                    ;% controller13_P.Saturation7_LowerSat
                    section.data(173).logicalSrcIdx = 177;
                    section.data(173).dtTransOffset = 571;

                    ;% controller13_P.Saturation8_UpperSat
                    section.data(174).logicalSrcIdx = 178;
                    section.data(174).dtTransOffset = 572;

                    ;% controller13_P.Saturation8_LowerSat
                    section.data(175).logicalSrcIdx = 179;
                    section.data(175).dtTransOffset = 573;

                    ;% controller13_P.Constant10_Value
                    section.data(176).logicalSrcIdx = 180;
                    section.data(176).dtTransOffset = 574;

                    ;% controller13_P.Switch17_Threshold
                    section.data(177).logicalSrcIdx = 181;
                    section.data(177).dtTransOffset = 577;

                    ;% controller13_P.Constant2_Value_n
                    section.data(178).logicalSrcIdx = 182;
                    section.data(178).dtTransOffset = 578;

                    ;% controller13_P.Constant_Value_cc
                    section.data(179).logicalSrcIdx = 183;
                    section.data(179).dtTransOffset = 587;

                    ;% controller13_P.Constant1_Value
                    section.data(180).logicalSrcIdx = 184;
                    section.data(180).dtTransOffset = 588;

                    ;% controller13_P.disturbanceenable1_Value
                    section.data(181).logicalSrcIdx = 185;
                    section.data(181).dtTransOffset = 591;

                    ;% controller13_P.Switch4_Threshold_p
                    section.data(182).logicalSrcIdx = 186;
                    section.data(182).dtTransOffset = 592;

                    ;% controller13_P.Constant2_Value_c
                    section.data(183).logicalSrcIdx = 187;
                    section.data(183).dtTransOffset = 593;

                    ;% controller13_P.Switch6_Threshold
                    section.data(184).logicalSrcIdx = 188;
                    section.data(184).dtTransOffset = 596;

                    ;% controller13_P.SaturatingRamp1_gainval
                    section.data(185).logicalSrcIdx = 189;
                    section.data(185).dtTransOffset = 597;

                    ;% controller13_P.SaturatingRamp1_IC
                    section.data(186).logicalSrcIdx = 190;
                    section.data(186).dtTransOffset = 598;

                    ;% controller13_P.constant1_Value
                    section.data(187).logicalSrcIdx = 191;
                    section.data(187).dtTransOffset = 599;

                    ;% controller13_P.Delay_InitialCondition_gt
                    section.data(188).logicalSrcIdx = 192;
                    section.data(188).dtTransOffset = 600;

                    ;% controller13_P.Delay1_InitialCondition_p
                    section.data(189).logicalSrcIdx = 193;
                    section.data(189).dtTransOffset = 601;

                    ;% controller13_P.constant_Value_m
                    section.data(190).logicalSrcIdx = 194;
                    section.data(190).dtTransOffset = 602;

                    ;% controller13_P.Delay_InitialCondition_l
                    section.data(191).logicalSrcIdx = 195;
                    section.data(191).dtTransOffset = 603;

                    ;% controller13_P.DiscreteTimeIntegrator_gainval
                    section.data(192).logicalSrcIdx = 196;
                    section.data(192).dtTransOffset = 607;

                    ;% controller13_P.DiscreteTimeIntegrator_IC
                    section.data(193).logicalSrcIdx = 197;
                    section.data(193).dtTransOffset = 608;

                    ;% controller13_P.DiscreteTimeIntegrator1_gainval
                    section.data(194).logicalSrcIdx = 198;
                    section.data(194).dtTransOffset = 609;

                    ;% controller13_P.DiscreteTimeIntegrator1_IC
                    section.data(195).logicalSrcIdx = 199;
                    section.data(195).dtTransOffset = 610;

                    ;% controller13_P.heighttoenablecontrol1_Threshold
                    section.data(196).logicalSrcIdx = 200;
                    section.data(196).dtTransOffset = 611;

                    ;% controller13_P.upi_Gain
                    section.data(197).logicalSrcIdx = 201;
                    section.data(197).dtTransOffset = 612;

                    ;% controller13_P.Gain_Gain_m
                    section.data(198).logicalSrcIdx = 202;
                    section.data(198).dtTransOffset = 613;

                    ;% controller13_P.Constant_Value_j
                    section.data(199).logicalSrcIdx = 203;
                    section.data(199).dtTransOffset = 614;

                    ;% controller13_P.Gain_Gain_k
                    section.data(200).logicalSrcIdx = 204;
                    section.data(200).dtTransOffset = 615;

                    ;% controller13_P.Constant_Value_o
                    section.data(201).logicalSrcIdx = 205;
                    section.data(201).dtTransOffset = 616;

                    ;% controller13_P.upi_Gain_o
                    section.data(202).logicalSrcIdx = 206;
                    section.data(202).dtTransOffset = 617;

                    ;% controller13_P.Gain_Gain_j
                    section.data(203).logicalSrcIdx = 207;
                    section.data(203).dtTransOffset = 618;

                    ;% controller13_P.Constant_Value_kj2
                    section.data(204).logicalSrcIdx = 208;
                    section.data(204).dtTransOffset = 619;

                    ;% controller13_P.Gain_Gain_h3
                    section.data(205).logicalSrcIdx = 209;
                    section.data(205).dtTransOffset = 620;

                    ;% controller13_P.Constant_Value_jy
                    section.data(206).logicalSrcIdx = 210;
                    section.data(206).dtTransOffset = 621;

                    ;% controller13_P.upi_Gain_b
                    section.data(207).logicalSrcIdx = 211;
                    section.data(207).dtTransOffset = 622;

                    ;% controller13_P.Gain_Gain_o
                    section.data(208).logicalSrcIdx = 212;
                    section.data(208).dtTransOffset = 623;

                    ;% controller13_P.Constant_Value_mx
                    section.data(209).logicalSrcIdx = 213;
                    section.data(209).dtTransOffset = 624;

                    ;% controller13_P.Gain_Gain_o0
                    section.data(210).logicalSrcIdx = 214;
                    section.data(210).dtTransOffset = 625;

                    ;% controller13_P.Constant_Value_lu
                    section.data(211).logicalSrcIdx = 215;
                    section.data(211).dtTransOffset = 626;

                    ;% controller13_P.upi_Gain_e
                    section.data(212).logicalSrcIdx = 216;
                    section.data(212).dtTransOffset = 627;

                    ;% controller13_P.Gain_Gain_ks
                    section.data(213).logicalSrcIdx = 217;
                    section.data(213).dtTransOffset = 628;

                    ;% controller13_P.Constant_Value_mky
                    section.data(214).logicalSrcIdx = 218;
                    section.data(214).dtTransOffset = 629;

                    ;% controller13_P.Gain_Gain_p
                    section.data(215).logicalSrcIdx = 219;
                    section.data(215).dtTransOffset = 630;

                    ;% controller13_P.Constant_Value_kv
                    section.data(216).logicalSrcIdx = 220;
                    section.data(216).dtTransOffset = 631;

                    ;% controller13_P.Constant1_Value_e
                    section.data(217).logicalSrcIdx = 221;
                    section.data(217).dtTransOffset = 632;

                    ;% controller13_P.ExecutionTime_P1
                    section.data(218).logicalSrcIdx = 222;
                    section.data(218).dtTransOffset = 633;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller13_P.Constant22_Value
                    section.data(1).logicalSrcIdx = 223;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_P.Constant21_Value
                    section.data(2).logicalSrcIdx = 224;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 4;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (controller13_B)
        ;%
            section.nData     = 134;
            section.data(134)  = dumData; %prealloc

                    ;% controller13_B.Product
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_B.xeyeze
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_B.Eul_XYZ
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 4;

                    ;% controller13_B.q0
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 7;

                    ;% controller13_B.q1
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 8;

                    ;% controller13_B.q2
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 9;

                    ;% controller13_B.q3
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 10;

                    ;% controller13_B.TmpSignalConversionAtq0q1q2q3Inport2
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 11;

                    ;% controller13_B.Transpose
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 15;

                    ;% controller13_B.Eul_XYZ_j
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 24;

                    ;% controller13_B.Switch
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 27;

                    ;% controller13_B.u
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 33;

                    ;% controller13_B.u_g
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 34;

                    ;% controller13_B.lowpass
                    section.data(14).logicalSrcIdx = 14;
                    section.data(14).dtTransOffset = 35;

                    ;% controller13_B.lowpass1
                    section.data(15).logicalSrcIdx = 16;
                    section.data(15).dtTransOffset = 36;

                    ;% controller13_B.lowpass2
                    section.data(16).logicalSrcIdx = 18;
                    section.data(16).dtTransOffset = 37;

                    ;% controller13_B.Switch4
                    section.data(17).logicalSrcIdx = 19;
                    section.data(17).dtTransOffset = 38;

                    ;% controller13_B.lowpass3
                    section.data(18).logicalSrcIdx = 20;
                    section.data(18).dtTransOffset = 47;

                    ;% controller13_B.Switch5
                    section.data(19).logicalSrcIdx = 21;
                    section.data(19).dtTransOffset = 56;

                    ;% controller13_B.Switch_fc
                    section.data(20).logicalSrcIdx = 22;
                    section.data(20).dtTransOffset = 59;

                    ;% controller13_B.Switch1_g
                    section.data(21).logicalSrcIdx = 23;
                    section.data(21).dtTransOffset = 62;

                    ;% controller13_B.Switch2_k
                    section.data(22).logicalSrcIdx = 24;
                    section.data(22).dtTransOffset = 65;

                    ;% controller13_B.lowpass_h
                    section.data(23).logicalSrcIdx = 26;
                    section.data(23).dtTransOffset = 68;

                    ;% controller13_B.Multiply
                    section.data(24).logicalSrcIdx = 27;
                    section.data(24).dtTransOffset = 71;

                    ;% controller13_B.Multiply1
                    section.data(25).logicalSrcIdx = 28;
                    section.data(25).dtTransOffset = 74;

                    ;% controller13_B.NMPCF
                    section.data(26).logicalSrcIdx = 29;
                    section.data(26).dtTransOffset = 77;

                    ;% controller13_B.Saturation1
                    section.data(27).logicalSrcIdx = 30;
                    section.data(27).dtTransOffset = 78;

                    ;% controller13_B.Switch17
                    section.data(28).logicalSrcIdx = 31;
                    section.data(28).dtTransOffset = 79;

                    ;% controller13_B.Saturation2
                    section.data(29).logicalSrcIdx = 32;
                    section.data(29).dtTransOffset = 80;

                    ;% controller13_B.Switch1_p
                    section.data(30).logicalSrcIdx = 33;
                    section.data(30).dtTransOffset = 81;

                    ;% controller13_B.Saturation3
                    section.data(31).logicalSrcIdx = 34;
                    section.data(31).dtTransOffset = 82;

                    ;% controller13_B.Switch2_h
                    section.data(32).logicalSrcIdx = 35;
                    section.data(32).dtTransOffset = 83;

                    ;% controller13_B.Saturation4
                    section.data(33).logicalSrcIdx = 36;
                    section.data(33).dtTransOffset = 84;

                    ;% controller13_B.Switch3
                    section.data(34).logicalSrcIdx = 37;
                    section.data(34).dtTransOffset = 85;

                    ;% controller13_B.TmpSignalConversionAtDelayInport1
                    section.data(35).logicalSrcIdx = 38;
                    section.data(35).dtTransOffset = 86;

                    ;% controller13_B.half1
                    section.data(36).logicalSrcIdx = 39;
                    section.data(36).dtTransOffset = 90;

                    ;% controller13_B.Add2
                    section.data(37).logicalSrcIdx = 40;
                    section.data(37).dtTransOffset = 94;

                    ;% controller13_B.OutputWithRamping
                    section.data(38).logicalSrcIdx = 41;
                    section.data(38).dtTransOffset = 95;

                    ;% controller13_B.Gain4
                    section.data(39).logicalSrcIdx = 42;
                    section.data(39).dtTransOffset = 96;

                    ;% controller13_B.Add2_n
                    section.data(40).logicalSrcIdx = 43;
                    section.data(40).dtTransOffset = 97;

                    ;% controller13_B.Gain1
                    section.data(41).logicalSrcIdx = 44;
                    section.data(41).dtTransOffset = 98;

                    ;% controller13_B.Add2_c
                    section.data(42).logicalSrcIdx = 45;
                    section.data(42).dtTransOffset = 99;

                    ;% controller13_B.Gain2
                    section.data(43).logicalSrcIdx = 46;
                    section.data(43).dtTransOffset = 100;

                    ;% controller13_B.Add2_l
                    section.data(44).logicalSrcIdx = 47;
                    section.data(44).dtTransOffset = 101;

                    ;% controller13_B.Gain3
                    section.data(45).logicalSrcIdx = 48;
                    section.data(45).dtTransOffset = 102;

                    ;% controller13_B.raw_tf
                    section.data(46).logicalSrcIdx = 49;
                    section.data(46).dtTransOffset = 103;

                    ;% controller13_B.Switch7
                    section.data(47).logicalSrcIdx = 50;
                    section.data(47).dtTransOffset = 107;

                    ;% controller13_B.observer
                    section.data(48).logicalSrcIdx = 51;
                    section.data(48).dtTransOffset = 110;

                    ;% controller13_B.Constant3
                    section.data(49).logicalSrcIdx = 52;
                    section.data(49).dtTransOffset = 131;

                    ;% controller13_B.att_s
                    section.data(50).logicalSrcIdx = 53;
                    section.data(50).dtTransOffset = 134;

                    ;% controller13_B.PoleYk1UkZeroUk1
                    section.data(51).logicalSrcIdx = 54;
                    section.data(51).dtTransOffset = 143;

                    ;% controller13_B.Product_f
                    section.data(52).logicalSrcIdx = 55;
                    section.data(52).dtTransOffset = 152;

                    ;% controller13_B.UnitConversion
                    section.data(53).logicalSrcIdx = 56;
                    section.data(53).dtTransOffset = 155;

                    ;% controller13_B.VectorConcatenate
                    section.data(54).logicalSrcIdx = 57;
                    section.data(54).dtTransOffset = 158;

                    ;% controller13_B.pqr
                    section.data(55).logicalSrcIdx = 58;
                    section.data(55).dtTransOffset = 161;

                    ;% controller13_B.DigitalClock4
                    section.data(56).logicalSrcIdx = 59;
                    section.data(56).dtTransOffset = 164;

                    ;% controller13_B.Switch17_h
                    section.data(57).logicalSrcIdx = 60;
                    section.data(57).dtTransOffset = 165;

                    ;% controller13_B.Selector1
                    section.data(58).logicalSrcIdx = 61;
                    section.data(58).dtTransOffset = 168;

                    ;% controller13_B.Selector
                    section.data(59).logicalSrcIdx = 62;
                    section.data(59).dtTransOffset = 177;

                    ;% controller13_B.Selector2
                    section.data(60).logicalSrcIdx = 63;
                    section.data(60).dtTransOffset = 186;

                    ;% controller13_B.Reshape
                    section.data(61).logicalSrcIdx = 64;
                    section.data(61).dtTransOffset = 195;

                    ;% controller13_B.TmpSignalConversionAtq0q1q2q3Inport1
                    section.data(62).logicalSrcIdx = 65;
                    section.data(62).dtTransOffset = 198;

                    ;% controller13_B.Switch4_o
                    section.data(63).logicalSrcIdx = 66;
                    section.data(63).dtTransOffset = 202;

                    ;% controller13_B.Product1
                    section.data(64).logicalSrcIdx = 67;
                    section.data(64).dtTransOffset = 205;

                    ;% controller13_B.Sum
                    section.data(65).logicalSrcIdx = 68;
                    section.data(65).dtTransOffset = 208;

                    ;% controller13_B.heighttoenablecontrol1
                    section.data(66).logicalSrcIdx = 69;
                    section.data(66).dtTransOffset = 211;

                    ;% controller13_B.jumpingcontrolenable
                    section.data(67).logicalSrcIdx = 70;
                    section.data(67).dtTransOffset = 212;

                    ;% controller13_B.SumofElements
                    section.data(68).logicalSrcIdx = 71;
                    section.data(68).dtTransOffset = 213;

                    ;% controller13_B.times1
                    section.data(69).logicalSrcIdx = 72;
                    section.data(69).dtTransOffset = 214;

                    ;% controller13_B.upi
                    section.data(70).logicalSrcIdx = 73;
                    section.data(70).dtTransOffset = 215;

                    ;% controller13_B.Add
                    section.data(71).logicalSrcIdx = 74;
                    section.data(71).dtTransOffset = 216;

                    ;% controller13_B.Add_i
                    section.data(72).logicalSrcIdx = 75;
                    section.data(72).dtTransOffset = 217;

                    ;% controller13_B.upi_i
                    section.data(73).logicalSrcIdx = 76;
                    section.data(73).dtTransOffset = 218;

                    ;% controller13_B.Add_l
                    section.data(74).logicalSrcIdx = 77;
                    section.data(74).dtTransOffset = 219;

                    ;% controller13_B.Add_a
                    section.data(75).logicalSrcIdx = 78;
                    section.data(75).dtTransOffset = 220;

                    ;% controller13_B.upi_k
                    section.data(76).logicalSrcIdx = 79;
                    section.data(76).dtTransOffset = 221;

                    ;% controller13_B.Add_m
                    section.data(77).logicalSrcIdx = 80;
                    section.data(77).dtTransOffset = 222;

                    ;% controller13_B.Add_f
                    section.data(78).logicalSrcIdx = 81;
                    section.data(78).dtTransOffset = 223;

                    ;% controller13_B.upi_m
                    section.data(79).logicalSrcIdx = 82;
                    section.data(79).dtTransOffset = 224;

                    ;% controller13_B.Add_p
                    section.data(80).logicalSrcIdx = 83;
                    section.data(80).dtTransOffset = 225;

                    ;% controller13_B.Add_mt
                    section.data(81).logicalSrcIdx = 84;
                    section.data(81).dtTransOffset = 226;

                    ;% controller13_B.ExecutionTime
                    section.data(82).logicalSrcIdx = 85;
                    section.data(82).dtTransOffset = 227;

                    ;% controller13_B.motors_thrust
                    section.data(83).logicalSrcIdx = 86;
                    section.data(83).dtTransOffset = 228;

                    ;% controller13_B.en
                    section.data(84).logicalSrcIdx = 87;
                    section.data(84).dtTransOffset = 232;

                    ;% controller13_B.en_e
                    section.data(85).logicalSrcIdx = 88;
                    section.data(85).dtTransOffset = 233;

                    ;% controller13_B.en_o
                    section.data(86).logicalSrcIdx = 89;
                    section.data(86).dtTransOffset = 234;

                    ;% controller13_B.en_out
                    section.data(87).logicalSrcIdx = 90;
                    section.data(87).dtTransOffset = 235;

                    ;% controller13_B.cum_out
                    section.data(88).logicalSrcIdx = 91;
                    section.data(88).dtTransOffset = 236;

                    ;% controller13_B.thrust
                    section.data(89).logicalSrcIdx = 92;
                    section.data(89).dtTransOffset = 237;

                    ;% controller13_B.torque
                    section.data(90).logicalSrcIdx = 93;
                    section.data(90).dtTransOffset = 238;

                    ;% controller13_B.rotm
                    section.data(91).logicalSrcIdx = 94;
                    section.data(91).dtTransOffset = 241;

                    ;% controller13_B.X_roll
                    section.data(92).logicalSrcIdx = 95;
                    section.data(92).dtTransOffset = 244;

                    ;% controller13_B.Y_pitch
                    section.data(93).logicalSrcIdx = 96;
                    section.data(93).dtTransOffset = 245;

                    ;% controller13_B.Force
                    section.data(94).logicalSrcIdx = 98;
                    section.data(94).dtTransOffset = 246;

                    ;% controller13_B.exitflag
                    section.data(95).logicalSrcIdx = 99;
                    section.data(95).dtTransOffset = 247;

                    ;% controller13_B.r
                    section.data(96).logicalSrcIdx = 101;
                    section.data(96).dtTransOffset = 248;

                    ;% controller13_B.r_dot
                    section.data(97).logicalSrcIdx = 103;
                    section.data(97).dtTransOffset = 251;

                    ;% controller13_B.omega
                    section.data(98).logicalSrcIdx = 104;
                    section.data(98).dtTransOffset = 254;

                    ;% controller13_B.F_ext
                    section.data(99).logicalSrcIdx = 105;
                    section.data(99).dtTransOffset = 257;

                    ;% controller13_B.R_flat
                    section.data(100).logicalSrcIdx = 107;
                    section.data(100).dtTransOffset = 260;

                    ;% controller13_B.z_raw
                    section.data(101).logicalSrcIdx = 108;
                    section.data(101).dtTransOffset = 269;

                    ;% controller13_B.P_flat_si
                    section.data(102).logicalSrcIdx = 109;
                    section.data(102).dtTransOffset = 282;

                    ;% controller13_B.s_out
                    section.data(103).logicalSrcIdx = 110;
                    section.data(103).dtTransOffset = 606;

                    ;% controller13_B.P_out_flat
                    section.data(104).logicalSrcIdx = 111;
                    section.data(104).dtTransOffset = 625;

                    ;% controller13_B.is_init_out
                    section.data(105).logicalSrcIdx = 112;
                    section.data(105).dtTransOffset = 949;

                    ;% controller13_B.s_prediction_out
                    section.data(106).logicalSrcIdx = 114;
                    section.data(106).dtTransOffset = 950;

                    ;% controller13_B.md
                    section.data(107).logicalSrcIdx = 115;
                    section.data(107).dtTransOffset = 969;

                    ;% controller13_B.rpy
                    section.data(108).logicalSrcIdx = 117;
                    section.data(108).dtTransOffset = 970;

                    ;% controller13_B.pos_hat
                    section.data(109).logicalSrcIdx = 118;
                    section.data(109).dtTransOffset = 973;

                    ;% controller13_B.vel_hat
                    section.data(110).logicalSrcIdx = 119;
                    section.data(110).dtTransOffset = 976;

                    ;% controller13_B.id_out
                    section.data(111).logicalSrcIdx = 121;
                    section.data(111).dtTransOffset = 979;

                    ;% controller13_B.w
                    section.data(112).logicalSrcIdx = 122;
                    section.data(112).dtTransOffset = 980;

                    ;% controller13_B.R_a
                    section.data(113).logicalSrcIdx = 123;
                    section.data(113).dtTransOffset = 983;

                    ;% controller13_B.omega_hat
                    section.data(114).logicalSrcIdx = 124;
                    section.data(114).dtTransOffset = 992;

                    ;% controller13_B.rd
                    section.data(115).logicalSrcIdx = 127;
                    section.data(115).dtTransOffset = 994;

                    ;% controller13_B.rd_d
                    section.data(116).logicalSrcIdx = 128;
                    section.data(116).dtTransOffset = 997;

                    ;% controller13_B.B_omega_d
                    section.data(117).logicalSrcIdx = 132;
                    section.data(117).dtTransOffset = 1000;

                    ;% controller13_B.f_cmd
                    section.data(118).logicalSrcIdx = 133;
                    section.data(118).dtTransOffset = 1003;

                    ;% controller13_B.x_in
                    section.data(119).logicalSrcIdx = 134;
                    section.data(119).dtTransOffset = 1004;

                    ;% controller13_B.u_h
                    section.data(120).logicalSrcIdx = 135;
                    section.data(120).dtTransOffset = 1014;

                    ;% controller13_B.obs
                    section.data(121).logicalSrcIdx = 136;
                    section.data(121).dtTransOffset = 1018;

                    ;% controller13_B.ypr_WI
                    section.data(122).logicalSrcIdx = 137;
                    section.data(122).dtTransOffset = 1032;

                    ;% controller13_B.ypr_IB
                    section.data(123).logicalSrcIdx = 138;
                    section.data(123).dtTransOffset = 1035;

                    ;% controller13_B.ypr_WB
                    section.data(124).logicalSrcIdx = 139;
                    section.data(124).dtTransOffset = 1038;

                    ;% controller13_B.q_b
                    section.data(125).logicalSrcIdx = 140;
                    section.data(125).dtTransOffset = 1041;

                    ;% controller13_B.r_origin
                    section.data(126).logicalSrcIdx = 141;
                    section.data(126).dtTransOffset = 1045;

                    ;% controller13_B.time
                    section.data(127).logicalSrcIdx = 142;
                    section.data(127).dtTransOffset = 1048;

                    ;% controller13_B.cmd_B_torque
                    section.data(128).logicalSrcIdx = 143;
                    section.data(128).dtTransOffset = 1049;

                    ;% controller13_B.M_e_att
                    section.data(129).logicalSrcIdx = 144;
                    section.data(129).dtTransOffset = 1052;

                    ;% controller13_B.M_e_angv
                    section.data(130).logicalSrcIdx = 145;
                    section.data(130).dtTransOffset = 1055;

                    ;% controller13_B.M_e_cross
                    section.data(131).logicalSrcIdx = 146;
                    section.data(131).dtTransOffset = 1058;

                    ;% controller13_B.M_e_ang_acc
                    section.data(132).logicalSrcIdx = 147;
                    section.data(132).dtTransOffset = 1061;

                    ;% controller13_B.M_e_ext_tau
                    section.data(133).logicalSrcIdx = 148;
                    section.data(133).dtTransOffset = 1064;

                    ;% controller13_B.Merge
                    section.data(134).logicalSrcIdx = 149;
                    section.data(134).dtTransOffset = 1067;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller13_B.DataTypeConversion
                    section.data(1).logicalSrcIdx = 150;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_B.DataTypeConversion4
                    section.data(2).logicalSrcIdx = 151;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_B.Compare
                    section.data(3).logicalSrcIdx = 152;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_B.Compare_b
                    section.data(4).logicalSrcIdx = 153;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_B.Compare_d
                    section.data(5).logicalSrcIdx = 154;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_B.DataTypeConversion1
                    section.data(6).logicalSrcIdx = 155;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_B.sf_beeunitstoSI1.s_si
                    section.data(1).logicalSrcIdx = 156;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_B.sf_beeunitstoSI.s_si
                    section.data(1).logicalSrcIdx = 157;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 15;
        sectIdxOffset = 4;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (controller13_DW)
        ;%
            section.nData     = 59;
            section.data(59)  = dumData; %prealloc

                    ;% controller13_DW.SaturatingRamp_DSTATE
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.RampUpOrDown_DSTATE
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.omegat_DSTATE
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.Delay1_DSTATE
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.Delay2_DSTATE
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.Delay_DSTATE
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 17;

                    ;% controller13_DW.time_DSTATE
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 18;

                    ;% controller13_DW.lowpass_states
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 19;

                    ;% controller13_DW.Delay1_DSTATE_l
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 21;

                    ;% controller13_DW.lowpass1_states
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 22;

                    ;% controller13_DW.Delay2_DSTATE_c
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 24;

                    ;% controller13_DW.lowpass2_states
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 25;

                    ;% controller13_DW.Delay1_DSTATE_i
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 27;

                    ;% controller13_DW.Delay_DSTATE_l
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 46;

                    ;% controller13_DW.Delay3_DSTATE
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 370;

                    ;% controller13_DW.lowpass3_states
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 371;

                    ;% controller13_DW.Delay1_DSTATE_j
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 380;

                    ;% controller13_DW.Delay_DSTATE_f
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 383;

                    ;% controller13_DW.Delay2_DSTATE_j
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 386;

                    ;% controller13_DW.Delay1_DSTATE_p
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 387;

                    ;% controller13_DW.Delay_DSTATE_k
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 391;

                    ;% controller13_DW.Delay2_DSTATE_o
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 394;

                    ;% controller13_DW.vintegrator_DSTATE
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 395;

                    ;% controller13_DW.lowpass_states_m
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 398;

                    ;% controller13_DW.time_DSTATE_o
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 404;

                    ;% controller13_DW.Delay_DSTATE_a
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 405;

                    ;% controller13_DW.Delay1_DSTATE_jf
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 408;

                    ;% controller13_DW.Delay_DSTATE_at
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 410;

                    ;% controller13_DW.Delay2_DSTATE_k
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 411;

                    ;% controller13_DW.Delay3_DSTATE_j
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 412;

                    ;% controller13_DW.SaturatingRamp_DSTATE_n
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 413;

                    ;% controller13_DW.RampUpOrDown_DSTATE_a
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 414;

                    ;% controller13_DW.omegat_DSTATE_p
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 415;

                    ;% controller13_DW.SaturatingRamp_DSTATE_o
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 416;

                    ;% controller13_DW.RampUpOrDown_DSTATE_j
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 417;

                    ;% controller13_DW.omegat_DSTATE_l
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 418;

                    ;% controller13_DW.SaturatingRamp_DSTATE_e
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 419;

                    ;% controller13_DW.RampUpOrDown_DSTATE_d
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 420;

                    ;% controller13_DW.omegat_DSTATE_d
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 421;

                    ;% controller13_DW.DelayInput_DSTATE
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 422;

                    ;% controller13_DW.DelayOutput_DSTATE
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 431;

                    ;% controller13_DW.Delay3_DSTATE_f
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 440;

                    ;% controller13_DW.SaturatingRamp1_DSTATE
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 442;

                    ;% controller13_DW.Delay_DSTATE_j
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 443;

                    ;% controller13_DW.Delay1_DSTATE_a
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 444;

                    ;% controller13_DW.Delay_DSTATE_g
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 445;

                    ;% controller13_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 449;

                    ;% controller13_DW.DiscreteTimeIntegrator1_DSTATE
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 450;

                    ;% controller13_DW.lowpass_tmp
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 451;

                    ;% controller13_DW.lowpass1_tmp
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 452;

                    ;% controller13_DW.lowpass2_tmp
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 453;

                    ;% controller13_DW.lowpass_tmp_c
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 454;

                    ;% controller13_DW.NextOutput
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 457;

                    ;% controller13_DW.NextOutput_e
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 458;

                    ;% controller13_DW.NextOutput_h
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 459;

                    ;% controller13_DW.Product2_DWORK4
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 460;

                    ;% controller13_DW.NextOutput_o
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 469;

                    ;% controller13_DW.NextOutput_c
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 470;

                    ;% controller13_DW.NextOutput_b
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 471;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 36;
            section.data(36)  = dumData; %prealloc

                    ;% controller13_DW.highdrivingsignal_PWORK.LoggedData
                    section.data(1).logicalSrcIdx = 59;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.motorthrustsmgf_PWORK.LoggedData
                    section.data(2).logicalSrcIdx = 60;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.voltages_PWORK.LoggedData
                    section.data(3).logicalSrcIdx = 61;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_Mux1_at_outport_0_PWORK.AQHandles
                    section.data(4).logicalSrcIdx = 62;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_Mux_at_outport_0_PWORK.AQHandles
                    section.data(5).logicalSrcIdx = 63;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_observer_at_outport_5_PWORK.AQHandles
                    section.data(6).logicalSrcIdx = 64;
                    section.data(6).dtTransOffset = 5;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_observer_at_outport_6_PWORK.AQHandles
                    section.data(7).logicalSrcIdx = 65;
                    section.data(7).dtTransOffset = 6;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_observer_mux_at_outport_0_PWORK.AQHandles
                    section.data(8).logicalSrcIdx = 66;
                    section.data(8).dtTransOffset = 7;

                    ;% controller13_DW.observer_log_PWORK.LoggedData
                    section.data(9).logicalSrcIdx = 67;
                    section.data(9).dtTransOffset = 8;

                    ;% controller13_DW.Scope_PWORK.LoggedData
                    section.data(10).logicalSrcIdx = 68;
                    section.data(10).dtTransOffset = 9;

                    ;% controller13_DW.Scope1_PWORK.LoggedData
                    section.data(11).logicalSrcIdx = 69;
                    section.data(11).dtTransOffset = 10;

                    ;% controller13_DW.Scope2_PWORK.LoggedData
                    section.data(12).logicalSrcIdx = 70;
                    section.data(12).dtTransOffset = 11;

                    ;% controller13_DW.Scope3_PWORK.LoggedData
                    section.data(13).logicalSrcIdx = 71;
                    section.data(13).dtTransOffset = 12;

                    ;% controller13_DW.Scope4_PWORK.LoggedData
                    section.data(14).logicalSrcIdx = 72;
                    section.data(14).dtTransOffset = 13;

                    ;% controller13_DW.Scope5_PWORK.LoggedData
                    section.data(15).logicalSrcIdx = 73;
                    section.data(15).dtTransOffset = 14;

                    ;% controller13_DW.Scope6_PWORK.LoggedData
                    section.data(16).logicalSrcIdx = 74;
                    section.data(16).dtTransOffset = 15;

                    ;% controller13_DW.Scope7_PWORK.LoggedData
                    section.data(17).logicalSrcIdx = 75;
                    section.data(17).dtTransOffset = 16;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_LearnedRTNMPC_at_outport_0_PWORK.AQHandles
                    section.data(18).logicalSrcIdx = 76;
                    section.data(18).dtTransOffset = 17;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_LearnedRTNMPC_at_outport_1_PWORK.AQHandles
                    section.data(19).logicalSrcIdx = 77;
                    section.data(19).dtTransOffset = 18;

                    ;% controller13_DW.Scope1_PWORK_g.LoggedData
                    section.data(20).logicalSrcIdx = 78;
                    section.data(20).dtTransOffset = 19;

                    ;% controller13_DW.Scope2_PWORK_c.LoggedData
                    section.data(21).logicalSrcIdx = 79;
                    section.data(21).dtTransOffset = 20;

                    ;% controller13_DW.Scope_PWORK_p.LoggedData
                    section.data(22).logicalSrcIdx = 80;
                    section.data(22).dtTransOffset = 21;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_beeunitstoSI1_at_outport_0_PWORK.AQHandles
                    section.data(23).logicalSrcIdx = 81;
                    section.data(23).dtTransOffset = 22;

                    ;% controller13_DW.TAQSigLogging_InsertedFor_beeunitstoSI_at_outport_0_PWORK.AQHandles
                    section.data(24).logicalSrcIdx = 82;
                    section.data(24).dtTransOffset = 23;

                    ;% controller13_DW.Scope1_PWORK_gc.LoggedData
                    section.data(25).logicalSrcIdx = 83;
                    section.data(25).dtTransOffset = 24;

                    ;% controller13_DW.Scope19_PWORK.LoggedData
                    section.data(26).logicalSrcIdx = 84;
                    section.data(26).dtTransOffset = 25;

                    ;% controller13_DW.Scope2_PWORK_f.LoggedData
                    section.data(27).logicalSrcIdx = 85;
                    section.data(27).dtTransOffset = 26;

                    ;% controller13_DW.Scope3_PWORK_d.LoggedData
                    section.data(28).logicalSrcIdx = 86;
                    section.data(28).dtTransOffset = 27;

                    ;% controller13_DW.Scope4_PWORK_a.LoggedData
                    section.data(29).logicalSrcIdx = 87;
                    section.data(29).dtTransOffset = 28;

                    ;% controller13_DW.Scope5_PWORK_h.LoggedData
                    section.data(30).logicalSrcIdx = 88;
                    section.data(30).dtTransOffset = 29;

                    ;% controller13_DW.Scope6_PWORK_d.LoggedData
                    section.data(31).logicalSrcIdx = 89;
                    section.data(31).dtTransOffset = 30;

                    ;% controller13_DW.safetyenable_PWORK.LoggedData
                    section.data(32).logicalSrcIdx = 90;
                    section.data(32).dtTransOffset = 31;

                    ;% controller13_DW.Scope_PWORK_o.LoggedData
                    section.data(33).logicalSrcIdx = 91;
                    section.data(33).dtTransOffset = 32;

                    ;% controller13_DW.Scope1_PWORK_o.LoggedData
                    section.data(34).logicalSrcIdx = 92;
                    section.data(34).dtTransOffset = 33;

                    ;% controller13_DW.Scope2_PWORK_h.LoggedData
                    section.data(35).logicalSrcIdx = 93;
                    section.data(35).dtTransOffset = 34;

                    ;% controller13_DW.highexecutiontime_PWORK.LoggedData
                    section.data(36).logicalSrcIdx = 94;
                    section.data(36).dtTransOffset = 35;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 23;
            section.data(23)  = dumData; %prealloc

                    ;% controller13_DW.sfEvent
                    section.data(1).logicalSrcIdx = 95;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.sfEvent_l
                    section.data(2).logicalSrcIdx = 96;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.sfEvent_c
                    section.data(3).logicalSrcIdx = 97;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.sfEvent_k
                    section.data(4).logicalSrcIdx = 98;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.sfEvent_f
                    section.data(5).logicalSrcIdx = 99;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.sfEvent_j
                    section.data(6).logicalSrcIdx = 100;
                    section.data(6).dtTransOffset = 5;

                    ;% controller13_DW.sfEvent_h
                    section.data(7).logicalSrcIdx = 101;
                    section.data(7).dtTransOffset = 6;

                    ;% controller13_DW.sfEvent_d
                    section.data(8).logicalSrcIdx = 102;
                    section.data(8).dtTransOffset = 7;

                    ;% controller13_DW.sfEvent_i
                    section.data(9).logicalSrcIdx = 103;
                    section.data(9).dtTransOffset = 8;

                    ;% controller13_DW.sfEvent_g
                    section.data(10).logicalSrcIdx = 104;
                    section.data(10).dtTransOffset = 9;

                    ;% controller13_DW.sfEvent_hd
                    section.data(11).logicalSrcIdx = 105;
                    section.data(11).dtTransOffset = 10;

                    ;% controller13_DW.sfEvent_lp
                    section.data(12).logicalSrcIdx = 106;
                    section.data(12).dtTransOffset = 11;

                    ;% controller13_DW.sfEvent_m
                    section.data(13).logicalSrcIdx = 107;
                    section.data(13).dtTransOffset = 12;

                    ;% controller13_DW.sfEvent_kk
                    section.data(14).logicalSrcIdx = 108;
                    section.data(14).dtTransOffset = 13;

                    ;% controller13_DW.sfEvent_ls
                    section.data(15).logicalSrcIdx = 109;
                    section.data(15).dtTransOffset = 14;

                    ;% controller13_DW.sfEvent_kn
                    section.data(16).logicalSrcIdx = 110;
                    section.data(16).dtTransOffset = 15;

                    ;% controller13_DW.sfEvent_mr
                    section.data(17).logicalSrcIdx = 111;
                    section.data(17).dtTransOffset = 16;

                    ;% controller13_DW.sfEvent_ks
                    section.data(18).logicalSrcIdx = 112;
                    section.data(18).dtTransOffset = 17;

                    ;% controller13_DW.sfEvent_jf
                    section.data(19).logicalSrcIdx = 113;
                    section.data(19).dtTransOffset = 18;

                    ;% controller13_DW.sfEvent_lw
                    section.data(20).logicalSrcIdx = 114;
                    section.data(20).dtTransOffset = 19;

                    ;% controller13_DW.sfEvent_gr
                    section.data(21).logicalSrcIdx = 115;
                    section.data(21).dtTransOffset = 20;

                    ;% controller13_DW.sfEvent_i4
                    section.data(22).logicalSrcIdx = 116;
                    section.data(22).dtTransOffset = 21;

                    ;% controller13_DW.sfEvent_e
                    section.data(23).logicalSrcIdx = 117;
                    section.data(23).dtTransOffset = 22;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller13_DW.RandSeed
                    section.data(1).logicalSrcIdx = 118;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.RandSeed_c
                    section.data(2).logicalSrcIdx = 119;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.RandSeed_d
                    section.data(3).logicalSrcIdx = 120;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.RandSeed_k
                    section.data(4).logicalSrcIdx = 121;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.RandSeed_n
                    section.data(5).logicalSrcIdx = 122;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.RandSeed_j
                    section.data(6).logicalSrcIdx = 123;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.obj
                    section.data(1).logicalSrcIdx = 124;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.q0q1q2q3_IWORK
                    section.data(1).logicalSrcIdx = 125;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller13_DW.If_ActiveSubsystem
                    section.data(1).logicalSrcIdx = 126;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.IfActionSubsystem2_SubsysRanBC
                    section.data(2).logicalSrcIdx = 127;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(3).logicalSrcIdx = 128;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.IfActionSubsystem_SubsysRanBC
                    section.data(4).logicalSrcIdx = 129;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 23;
            section.data(23)  = dumData; %prealloc

                    ;% controller13_DW.is_active_c31_controller13
                    section.data(1).logicalSrcIdx = 130;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.is_active_c51_controller13
                    section.data(2).logicalSrcIdx = 131;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.is_active_c50_controller13
                    section.data(3).logicalSrcIdx = 132;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.is_active_c49_controller13
                    section.data(4).logicalSrcIdx = 133;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.is_active_c48_controller13
                    section.data(5).logicalSrcIdx = 134;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.is_active_c17_controller13
                    section.data(6).logicalSrcIdx = 135;
                    section.data(6).dtTransOffset = 5;

                    ;% controller13_DW.is_active_c16_controller13
                    section.data(7).logicalSrcIdx = 136;
                    section.data(7).dtTransOffset = 6;

                    ;% controller13_DW.is_active_c62_controller13
                    section.data(8).logicalSrcIdx = 137;
                    section.data(8).dtTransOffset = 7;

                    ;% controller13_DW.is_active_c56_controller13
                    section.data(9).logicalSrcIdx = 138;
                    section.data(9).dtTransOffset = 8;

                    ;% controller13_DW.is_active_c43_controller13
                    section.data(10).logicalSrcIdx = 139;
                    section.data(10).dtTransOffset = 9;

                    ;% controller13_DW.is_active_c42_controller13
                    section.data(11).logicalSrcIdx = 140;
                    section.data(11).dtTransOffset = 10;

                    ;% controller13_DW.is_active_c54_controller13
                    section.data(12).logicalSrcIdx = 141;
                    section.data(12).dtTransOffset = 11;

                    ;% controller13_DW.is_active_c38_controller13
                    section.data(13).logicalSrcIdx = 142;
                    section.data(13).dtTransOffset = 12;

                    ;% controller13_DW.is_active_c37_controller13
                    section.data(14).logicalSrcIdx = 143;
                    section.data(14).dtTransOffset = 13;

                    ;% controller13_DW.is_active_c65_controller13
                    section.data(15).logicalSrcIdx = 144;
                    section.data(15).dtTransOffset = 14;

                    ;% controller13_DW.is_active_c36_controller13
                    section.data(16).logicalSrcIdx = 145;
                    section.data(16).dtTransOffset = 15;

                    ;% controller13_DW.is_active_c11_controller13
                    section.data(17).logicalSrcIdx = 146;
                    section.data(17).dtTransOffset = 16;

                    ;% controller13_DW.is_active_c10_controller13
                    section.data(18).logicalSrcIdx = 147;
                    section.data(18).dtTransOffset = 17;

                    ;% controller13_DW.is_active_c14_controller13
                    section.data(19).logicalSrcIdx = 148;
                    section.data(19).dtTransOffset = 18;

                    ;% controller13_DW.is_active_c70_controller13
                    section.data(20).logicalSrcIdx = 149;
                    section.data(20).dtTransOffset = 19;

                    ;% controller13_DW.is_active_c6_controller13
                    section.data(21).logicalSrcIdx = 150;
                    section.data(21).dtTransOffset = 20;

                    ;% controller13_DW.is_active_c66_controller13
                    section.data(22).logicalSrcIdx = 151;
                    section.data(22).dtTransOffset = 21;

                    ;% controller13_DW.is_active_c68_controller13
                    section.data(23).logicalSrcIdx = 152;
                    section.data(23).dtTransOffset = 22;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 24;
            section.data(24)  = dumData; %prealloc

                    ;% controller13_DW.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 153;
                    section.data(1).dtTransOffset = 0;

                    ;% controller13_DW.doneDoubleBufferReInit_g
                    section.data(2).logicalSrcIdx = 154;
                    section.data(2).dtTransOffset = 1;

                    ;% controller13_DW.doneDoubleBufferReInit_h
                    section.data(3).logicalSrcIdx = 155;
                    section.data(3).dtTransOffset = 2;

                    ;% controller13_DW.doneDoubleBufferReInit_gj
                    section.data(4).logicalSrcIdx = 156;
                    section.data(4).dtTransOffset = 3;

                    ;% controller13_DW.doneDoubleBufferReInit_i
                    section.data(5).logicalSrcIdx = 157;
                    section.data(5).dtTransOffset = 4;

                    ;% controller13_DW.doneDoubleBufferReInit_a
                    section.data(6).logicalSrcIdx = 158;
                    section.data(6).dtTransOffset = 5;

                    ;% controller13_DW.objisempty
                    section.data(7).logicalSrcIdx = 159;
                    section.data(7).dtTransOffset = 6;

                    ;% controller13_DW.doneDoubleBufferReInit_j
                    section.data(8).logicalSrcIdx = 160;
                    section.data(8).dtTransOffset = 7;

                    ;% controller13_DW.doneDoubleBufferReInit_e
                    section.data(9).logicalSrcIdx = 161;
                    section.data(9).dtTransOffset = 8;

                    ;% controller13_DW.doneDoubleBufferReInit_p
                    section.data(10).logicalSrcIdx = 162;
                    section.data(10).dtTransOffset = 9;

                    ;% controller13_DW.doneDoubleBufferReInit_b
                    section.data(11).logicalSrcIdx = 163;
                    section.data(11).dtTransOffset = 10;

                    ;% controller13_DW.doneDoubleBufferReInit_n
                    section.data(12).logicalSrcIdx = 164;
                    section.data(12).dtTransOffset = 11;

                    ;% controller13_DW.doneDoubleBufferReInit_m
                    section.data(13).logicalSrcIdx = 165;
                    section.data(13).dtTransOffset = 12;

                    ;% controller13_DW.doneDoubleBufferReInit_ht
                    section.data(14).logicalSrcIdx = 166;
                    section.data(14).dtTransOffset = 13;

                    ;% controller13_DW.doneDoubleBufferReInit_k
                    section.data(15).logicalSrcIdx = 167;
                    section.data(15).dtTransOffset = 14;

                    ;% controller13_DW.doneDoubleBufferReInit_pi
                    section.data(16).logicalSrcIdx = 168;
                    section.data(16).dtTransOffset = 15;

                    ;% controller13_DW.doneDoubleBufferReInit_nj
                    section.data(17).logicalSrcIdx = 169;
                    section.data(17).dtTransOffset = 16;

                    ;% controller13_DW.doneDoubleBufferReInit_l
                    section.data(18).logicalSrcIdx = 170;
                    section.data(18).dtTransOffset = 17;

                    ;% controller13_DW.doneDoubleBufferReInit_l1
                    section.data(19).logicalSrcIdx = 171;
                    section.data(19).dtTransOffset = 18;

                    ;% controller13_DW.doneDoubleBufferReInit_k5
                    section.data(20).logicalSrcIdx = 172;
                    section.data(20).dtTransOffset = 19;

                    ;% controller13_DW.doneDoubleBufferReInit_gu
                    section.data(21).logicalSrcIdx = 173;
                    section.data(21).dtTransOffset = 20;

                    ;% controller13_DW.doneDoubleBufferReInit_mk
                    section.data(22).logicalSrcIdx = 174;
                    section.data(22).dtTransOffset = 21;

                    ;% controller13_DW.doneDoubleBufferReInit_gi
                    section.data(23).logicalSrcIdx = 175;
                    section.data(23).dtTransOffset = 22;

                    ;% controller13_DW.doneDoubleBufferReInit_g5
                    section.data(24).logicalSrcIdx = 176;
                    section.data(24).dtTransOffset = 23;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI1.sfEvent
                    section.data(1).logicalSrcIdx = 177;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI1.is_active_c15_controller13
                    section.data(1).logicalSrcIdx = 178;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI1.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 179;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI.sfEvent
                    section.data(1).logicalSrcIdx = 180;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI.is_active_c15_controller13
                    section.data(1).logicalSrcIdx = 181;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller13_DW.sf_beeunitstoSI.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 182;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 3140997605;
    targMap.checksum1 = 4165915892;
    targMap.checksum2 = 105004128;
    targMap.checksum3 = 3950719655;

