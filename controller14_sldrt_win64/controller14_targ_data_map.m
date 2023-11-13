    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 16;
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
        ;% Auto data (controller14_P)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.rsim
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.ctr
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.ctr2
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.rbt
                    section.data(1).logicalSrcIdx = 3;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.rbt2
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.mdl
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.lut
                    section.data(1).logicalSrcIdx = 6;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller14_P.PacketInput1_MaxMissedTicks
                    section.data(1).logicalSrcIdx = 9;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.PacketOutput_MaxMissedTicks
                    section.data(2).logicalSrcIdx = 10;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_P.PacketInput1_YieldWhenWaiting
                    section.data(3).logicalSrcIdx = 11;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_P.PacketOutput_YieldWhenWaiting
                    section.data(4).logicalSrcIdx = 12;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_P.CompareToConstant1_const
                    section.data(5).logicalSrcIdx = 13;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_P.CompareToConstant_const
                    section.data(6).logicalSrcIdx = 14;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            paramMap.sections(8) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_P.PacketInput1_PacketID
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.PacketOutput_PacketID
                    section.data(2).logicalSrcIdx = 16;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.FixPtBitwiseOperator1_BitMask
                    section.data(1).logicalSrcIdx = 17;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(10) = section;
            clear section

            section.nData     = 185;
            section.data(185)  = dumData; %prealloc

                    ;% controller14_P.Constant_Value
                    section.data(1).logicalSrcIdx = 18;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.Out1_Y0
                    section.data(2).logicalSrcIdx = 19;
                    section.data(2).dtTransOffset = 9;

                    ;% controller14_P.Output_Y0
                    section.data(3).logicalSrcIdx = 20;
                    section.data(3).dtTransOffset = 10;

                    ;% controller14_P.Output1_Y0
                    section.data(4).logicalSrcIdx = 21;
                    section.data(4).dtTransOffset = 11;

                    ;% controller14_P.Output2_Y0
                    section.data(5).logicalSrcIdx = 22;
                    section.data(5).dtTransOffset = 12;

                    ;% controller14_P.UnitDelay_InitialCondition
                    section.data(6).logicalSrcIdx = 23;
                    section.data(6).dtTransOffset = 13;

                    ;% controller14_P.UnitDelay1_InitialCondition
                    section.data(7).logicalSrcIdx = 24;
                    section.data(7).dtTransOffset = 14;

                    ;% controller14_P.Gain1_Gain
                    section.data(8).logicalSrcIdx = 25;
                    section.data(8).dtTransOffset = 15;

                    ;% controller14_P.Saturation_UpperSat
                    section.data(9).logicalSrcIdx = 26;
                    section.data(9).dtTransOffset = 16;

                    ;% controller14_P.Saturation_LowerSat
                    section.data(10).logicalSrcIdx = 27;
                    section.data(10).dtTransOffset = 17;

                    ;% controller14_P.Constant40_Value
                    section.data(11).logicalSrcIdx = 28;
                    section.data(11).dtTransOffset = 18;

                    ;% controller14_P.Gain6_Gain
                    section.data(12).logicalSrcIdx = 29;
                    section.data(12).dtTransOffset = 21;

                    ;% controller14_P.Constant_Value_l
                    section.data(13).logicalSrcIdx = 30;
                    section.data(13).dtTransOffset = 22;

                    ;% controller14_P.Constant1_Value
                    section.data(14).logicalSrcIdx = 31;
                    section.data(14).dtTransOffset = 23;

                    ;% controller14_P.Constant2_Value
                    section.data(15).logicalSrcIdx = 32;
                    section.data(15).dtTransOffset = 24;

                    ;% controller14_P.Constant3_Value
                    section.data(16).logicalSrcIdx = 33;
                    section.data(16).dtTransOffset = 25;

                    ;% controller14_P.Constant_Value_a
                    section.data(17).logicalSrcIdx = 34;
                    section.data(17).dtTransOffset = 26;

                    ;% controller14_P.Constant_Value_l4
                    section.data(18).logicalSrcIdx = 35;
                    section.data(18).dtTransOffset = 27;

                    ;% controller14_P.Constant_Value_k
                    section.data(19).logicalSrcIdx = 36;
                    section.data(19).dtTransOffset = 28;

                    ;% controller14_P.Constant_Value_m
                    section.data(20).logicalSrcIdx = 37;
                    section.data(20).dtTransOffset = 29;

                    ;% controller14_P.Constant_Value_p
                    section.data(21).logicalSrcIdx = 38;
                    section.data(21).dtTransOffset = 30;

                    ;% controller14_P.Constant_Value_c
                    section.data(22).logicalSrcIdx = 39;
                    section.data(22).dtTransOffset = 31;

                    ;% controller14_P.Constant_Value_h
                    section.data(23).logicalSrcIdx = 40;
                    section.data(23).dtTransOffset = 32;

                    ;% controller14_P.Constant_Value_g
                    section.data(24).logicalSrcIdx = 41;
                    section.data(24).dtTransOffset = 33;

                    ;% controller14_P.Constant_Value_kj
                    section.data(25).logicalSrcIdx = 42;
                    section.data(25).dtTransOffset = 34;

                    ;% controller14_P.time_gainval
                    section.data(26).logicalSrcIdx = 43;
                    section.data(26).dtTransOffset = 35;

                    ;% controller14_P.time_IC
                    section.data(27).logicalSrcIdx = 44;
                    section.data(27).dtTransOffset = 36;

                    ;% controller14_P.Constant4_Value
                    section.data(28).logicalSrcIdx = 45;
                    section.data(28).dtTransOffset = 37;

                    ;% controller14_P.Constant5_Value
                    section.data(29).logicalSrcIdx = 46;
                    section.data(29).dtTransOffset = 40;

                    ;% controller14_P.Switch_Threshold
                    section.data(30).logicalSrcIdx = 47;
                    section.data(30).dtTransOffset = 43;

                    ;% controller14_P.SaturatingRamp1_gainval
                    section.data(31).logicalSrcIdx = 48;
                    section.data(31).dtTransOffset = 44;

                    ;% controller14_P.SaturatingRamp1_IC
                    section.data(32).logicalSrcIdx = 49;
                    section.data(32).dtTransOffset = 45;

                    ;% controller14_P.constant1_Value
                    section.data(33).logicalSrcIdx = 50;
                    section.data(33).dtTransOffset = 46;

                    ;% controller14_P.Switch5_Threshold
                    section.data(34).logicalSrcIdx = 51;
                    section.data(34).dtTransOffset = 47;

                    ;% controller14_P.Delay_InitialCondition
                    section.data(35).logicalSrcIdx = 52;
                    section.data(35).dtTransOffset = 48;

                    ;% controller14_P.Gain_Gain
                    section.data(36).logicalSrcIdx = 53;
                    section.data(36).dtTransOffset = 51;

                    ;% controller14_P.Switch1_Threshold
                    section.data(37).logicalSrcIdx = 54;
                    section.data(37).dtTransOffset = 52;

                    ;% controller14_P.Delay1_InitialCondition
                    section.data(38).logicalSrcIdx = 55;
                    section.data(38).dtTransOffset = 53;

                    ;% controller14_P.Delay1_InitialCondition_e
                    section.data(39).logicalSrcIdx = 56;
                    section.data(39).dtTransOffset = 56;

                    ;% controller14_P.Switch2_Threshold
                    section.data(40).logicalSrcIdx = 57;
                    section.data(40).dtTransOffset = 59;

                    ;% controller14_P.x_offset_Value
                    section.data(41).logicalSrcIdx = 58;
                    section.data(41).dtTransOffset = 60;

                    ;% controller14_P.y_offset_Value
                    section.data(42).logicalSrcIdx = 59;
                    section.data(42).dtTransOffset = 61;

                    ;% controller14_P.Switch18_Threshold
                    section.data(43).logicalSrcIdx = 60;
                    section.data(43).dtTransOffset = 62;

                    ;% controller14_P.Delay_InitialCondition_f
                    section.data(44).logicalSrcIdx = 61;
                    section.data(44).dtTransOffset = 63;

                    ;% controller14_P.Gain_Gain_b
                    section.data(45).logicalSrcIdx = 62;
                    section.data(45).dtTransOffset = 72;

                    ;% controller14_P.Switch1_Threshold_l
                    section.data(46).logicalSrcIdx = 63;
                    section.data(46).dtTransOffset = 73;

                    ;% controller14_P.time_gainval_e
                    section.data(47).logicalSrcIdx = 64;
                    section.data(47).dtTransOffset = 74;

                    ;% controller14_P.time_IC_d
                    section.data(48).logicalSrcIdx = 65;
                    section.data(48).dtTransOffset = 75;

                    ;% controller14_P.Delay_InitialCondition_p
                    section.data(49).logicalSrcIdx = 66;
                    section.data(49).dtTransOffset = 76;

                    ;% controller14_P.Delay2_InitialCondition
                    section.data(50).logicalSrcIdx = 67;
                    section.data(50).dtTransOffset = 77;

                    ;% controller14_P.Gain_Gain_l
                    section.data(51).logicalSrcIdx = 68;
                    section.data(51).dtTransOffset = 81;

                    ;% controller14_P.Gain1_Gain_b
                    section.data(52).logicalSrcIdx = 69;
                    section.data(52).dtTransOffset = 82;

                    ;% controller14_P.Switch1_Threshold_o
                    section.data(53).logicalSrcIdx = 70;
                    section.data(53).dtTransOffset = 83;

                    ;% controller14_P.Constant13_Value
                    section.data(54).logicalSrcIdx = 71;
                    section.data(54).dtTransOffset = 84;

                    ;% controller14_P.Saturation1_UpperSat
                    section.data(55).logicalSrcIdx = 72;
                    section.data(55).dtTransOffset = 85;

                    ;% controller14_P.Saturation1_LowerSat
                    section.data(56).logicalSrcIdx = 73;
                    section.data(56).dtTransOffset = 86;

                    ;% controller14_P.Constant14_Value
                    section.data(57).logicalSrcIdx = 74;
                    section.data(57).dtTransOffset = 87;

                    ;% controller14_P.Saturation2_UpperSat
                    section.data(58).logicalSrcIdx = 75;
                    section.data(58).dtTransOffset = 88;

                    ;% controller14_P.Saturation2_LowerSat
                    section.data(59).logicalSrcIdx = 76;
                    section.data(59).dtTransOffset = 89;

                    ;% controller14_P.Constant15_Value
                    section.data(60).logicalSrcIdx = 77;
                    section.data(60).dtTransOffset = 90;

                    ;% controller14_P.Saturation3_UpperSat
                    section.data(61).logicalSrcIdx = 78;
                    section.data(61).dtTransOffset = 91;

                    ;% controller14_P.Saturation3_LowerSat
                    section.data(62).logicalSrcIdx = 79;
                    section.data(62).dtTransOffset = 92;

                    ;% controller14_P.Constant16_Value
                    section.data(63).logicalSrcIdx = 80;
                    section.data(63).dtTransOffset = 93;

                    ;% controller14_P.Saturation4_UpperSat
                    section.data(64).logicalSrcIdx = 81;
                    section.data(64).dtTransOffset = 94;

                    ;% controller14_P.Saturation4_LowerSat
                    section.data(65).logicalSrcIdx = 82;
                    section.data(65).dtTransOffset = 95;

                    ;% controller14_P.Delay1_InitialCondition_p
                    section.data(66).logicalSrcIdx = 83;
                    section.data(66).dtTransOffset = 96;

                    ;% controller14_P.Delay_InitialCondition_g
                    section.data(67).logicalSrcIdx = 84;
                    section.data(67).dtTransOffset = 97;

                    ;% controller14_P.Switch_Threshold_l
                    section.data(68).logicalSrcIdx = 85;
                    section.data(68).dtTransOffset = 98;

                    ;% controller14_P.SaturatingRamp_gainval
                    section.data(69).logicalSrcIdx = 86;
                    section.data(69).dtTransOffset = 99;

                    ;% controller14_P.SaturatingRamp_IC
                    section.data(70).logicalSrcIdx = 87;
                    section.data(70).dtTransOffset = 100;

                    ;% controller14_P.SaturatingRamp_UpperSat
                    section.data(71).logicalSrcIdx = 88;
                    section.data(71).dtTransOffset = 101;

                    ;% controller14_P.SaturatingRamp_LowerSat
                    section.data(72).logicalSrcIdx = 89;
                    section.data(72).dtTransOffset = 102;

                    ;% controller14_P.safetyvoltage_Value
                    section.data(73).logicalSrcIdx = 90;
                    section.data(73).dtTransOffset = 103;

                    ;% controller14_P.RampUpOrDown_gainval
                    section.data(74).logicalSrcIdx = 91;
                    section.data(74).dtTransOffset = 104;

                    ;% controller14_P.RampUpOrDown_IC
                    section.data(75).logicalSrcIdx = 92;
                    section.data(75).dtTransOffset = 105;

                    ;% controller14_P.RampUpOrDown_UpperSat
                    section.data(76).logicalSrcIdx = 93;
                    section.data(76).dtTransOffset = 106;

                    ;% controller14_P.RampUpOrDown_LowerSat
                    section.data(77).logicalSrcIdx = 94;
                    section.data(77).dtTransOffset = 107;

                    ;% controller14_P.phaseoffset_Value
                    section.data(78).logicalSrcIdx = 95;
                    section.data(78).dtTransOffset = 108;

                    ;% controller14_P.degtorad_Gain
                    section.data(79).logicalSrcIdx = 96;
                    section.data(79).dtTransOffset = 109;

                    ;% controller14_P.omegat_gainval
                    section.data(80).logicalSrcIdx = 97;
                    section.data(80).dtTransOffset = 110;

                    ;% controller14_P.omegat_IC
                    section.data(81).logicalSrcIdx = 98;
                    section.data(81).dtTransOffset = 111;

                    ;% controller14_P.Gain1_Gain_o
                    section.data(82).logicalSrcIdx = 99;
                    section.data(82).dtTransOffset = 112;

                    ;% controller14_P.Delay_InitialCondition_g2
                    section.data(83).logicalSrcIdx = 100;
                    section.data(83).dtTransOffset = 113;

                    ;% controller14_P.Delay1_InitialCondition_g
                    section.data(84).logicalSrcIdx = 101;
                    section.data(84).dtTransOffset = 114;

                    ;% controller14_P.Delay1_InitialCondition_g1
                    section.data(85).logicalSrcIdx = 102;
                    section.data(85).dtTransOffset = 116;

                    ;% controller14_P.Delay_InitialCondition_a
                    section.data(86).logicalSrcIdx = 103;
                    section.data(86).dtTransOffset = 117;

                    ;% controller14_P.Delay2_InitialCondition_o
                    section.data(87).logicalSrcIdx = 104;
                    section.data(87).dtTransOffset = 118;

                    ;% controller14_P.Delay3_InitialCondition
                    section.data(88).logicalSrcIdx = 105;
                    section.data(88).dtTransOffset = 119;

                    ;% controller14_P.half1_Gain
                    section.data(89).logicalSrcIdx = 106;
                    section.data(89).dtTransOffset = 120;

                    ;% controller14_P.Delay2_InitialCondition_a
                    section.data(90).logicalSrcIdx = 107;
                    section.data(90).dtTransOffset = 121;

                    ;% controller14_P.ground_Value
                    section.data(91).logicalSrcIdx = 108;
                    section.data(91).dtTransOffset = 122;

                    ;% controller14_P.Gain4_Gain
                    section.data(92).logicalSrcIdx = 109;
                    section.data(92).dtTransOffset = 123;

                    ;% controller14_P.c1JP1_Gain
                    section.data(93).logicalSrcIdx = 110;
                    section.data(93).dtTransOffset = 124;

                    ;% controller14_P.SaturatingRamp_gainval_a
                    section.data(94).logicalSrcIdx = 111;
                    section.data(94).dtTransOffset = 125;

                    ;% controller14_P.SaturatingRamp_IC_d
                    section.data(95).logicalSrcIdx = 112;
                    section.data(95).dtTransOffset = 126;

                    ;% controller14_P.SaturatingRamp_UpperSat_e
                    section.data(96).logicalSrcIdx = 113;
                    section.data(96).dtTransOffset = 127;

                    ;% controller14_P.SaturatingRamp_LowerSat_p
                    section.data(97).logicalSrcIdx = 114;
                    section.data(97).dtTransOffset = 128;

                    ;% controller14_P.RampUpOrDown_gainval_e
                    section.data(98).logicalSrcIdx = 115;
                    section.data(98).dtTransOffset = 129;

                    ;% controller14_P.RampUpOrDown_IC_c
                    section.data(99).logicalSrcIdx = 116;
                    section.data(99).dtTransOffset = 130;

                    ;% controller14_P.RampUpOrDown_UpperSat_o
                    section.data(100).logicalSrcIdx = 117;
                    section.data(100).dtTransOffset = 131;

                    ;% controller14_P.RampUpOrDown_LowerSat_k
                    section.data(101).logicalSrcIdx = 118;
                    section.data(101).dtTransOffset = 132;

                    ;% controller14_P.phaseoffset_Value_l
                    section.data(102).logicalSrcIdx = 119;
                    section.data(102).dtTransOffset = 133;

                    ;% controller14_P.degtorad_Gain_i
                    section.data(103).logicalSrcIdx = 120;
                    section.data(103).dtTransOffset = 134;

                    ;% controller14_P.omegat_gainval_l
                    section.data(104).logicalSrcIdx = 121;
                    section.data(104).dtTransOffset = 135;

                    ;% controller14_P.omegat_IC_g
                    section.data(105).logicalSrcIdx = 122;
                    section.data(105).dtTransOffset = 136;

                    ;% controller14_P.Gain1_Gain_g
                    section.data(106).logicalSrcIdx = 123;
                    section.data(106).dtTransOffset = 137;

                    ;% controller14_P.Delay_InitialCondition_fd
                    section.data(107).logicalSrcIdx = 124;
                    section.data(107).dtTransOffset = 138;

                    ;% controller14_P.Delay1_InitialCondition_f
                    section.data(108).logicalSrcIdx = 125;
                    section.data(108).dtTransOffset = 139;

                    ;% controller14_P.Delay2_InitialCondition_m
                    section.data(109).logicalSrcIdx = 126;
                    section.data(109).dtTransOffset = 141;

                    ;% controller14_P.ground_Value_a
                    section.data(110).logicalSrcIdx = 127;
                    section.data(110).dtTransOffset = 142;

                    ;% controller14_P.Gain1_Gain_d
                    section.data(111).logicalSrcIdx = 128;
                    section.data(111).dtTransOffset = 143;

                    ;% controller14_P.c2B1_Gain
                    section.data(112).logicalSrcIdx = 129;
                    section.data(112).dtTransOffset = 144;

                    ;% controller14_P.SaturatingRamp_gainval_j
                    section.data(113).logicalSrcIdx = 130;
                    section.data(113).dtTransOffset = 145;

                    ;% controller14_P.SaturatingRamp_IC_g
                    section.data(114).logicalSrcIdx = 131;
                    section.data(114).dtTransOffset = 146;

                    ;% controller14_P.SaturatingRamp_UpperSat_k
                    section.data(115).logicalSrcIdx = 132;
                    section.data(115).dtTransOffset = 147;

                    ;% controller14_P.SaturatingRamp_LowerSat_o
                    section.data(116).logicalSrcIdx = 133;
                    section.data(116).dtTransOffset = 148;

                    ;% controller14_P.RampUpOrDown_gainval_c
                    section.data(117).logicalSrcIdx = 134;
                    section.data(117).dtTransOffset = 149;

                    ;% controller14_P.RampUpOrDown_IC_b
                    section.data(118).logicalSrcIdx = 135;
                    section.data(118).dtTransOffset = 150;

                    ;% controller14_P.RampUpOrDown_UpperSat_e
                    section.data(119).logicalSrcIdx = 136;
                    section.data(119).dtTransOffset = 151;

                    ;% controller14_P.RampUpOrDown_LowerSat_h
                    section.data(120).logicalSrcIdx = 137;
                    section.data(120).dtTransOffset = 152;

                    ;% controller14_P.phaseoffset_Value_j
                    section.data(121).logicalSrcIdx = 138;
                    section.data(121).dtTransOffset = 153;

                    ;% controller14_P.degtorad_Gain_k
                    section.data(122).logicalSrcIdx = 139;
                    section.data(122).dtTransOffset = 154;

                    ;% controller14_P.omegat_gainval_d
                    section.data(123).logicalSrcIdx = 140;
                    section.data(123).dtTransOffset = 155;

                    ;% controller14_P.omegat_IC_o
                    section.data(124).logicalSrcIdx = 141;
                    section.data(124).dtTransOffset = 156;

                    ;% controller14_P.Gain1_Gain_dj
                    section.data(125).logicalSrcIdx = 142;
                    section.data(125).dtTransOffset = 157;

                    ;% controller14_P.Delay_InitialCondition_o
                    section.data(126).logicalSrcIdx = 143;
                    section.data(126).dtTransOffset = 158;

                    ;% controller14_P.Delay1_InitialCondition_a
                    section.data(127).logicalSrcIdx = 144;
                    section.data(127).dtTransOffset = 159;

                    ;% controller14_P.Delay2_InitialCondition_e
                    section.data(128).logicalSrcIdx = 145;
                    section.data(128).dtTransOffset = 161;

                    ;% controller14_P.ground_Value_b
                    section.data(129).logicalSrcIdx = 146;
                    section.data(129).dtTransOffset = 162;

                    ;% controller14_P.Gain2_Gain
                    section.data(130).logicalSrcIdx = 147;
                    section.data(130).dtTransOffset = 163;

                    ;% controller14_P.c3W11_Gain
                    section.data(131).logicalSrcIdx = 148;
                    section.data(131).dtTransOffset = 164;

                    ;% controller14_P.SaturatingRamp_gainval_g
                    section.data(132).logicalSrcIdx = 149;
                    section.data(132).dtTransOffset = 165;

                    ;% controller14_P.SaturatingRamp_IC_p
                    section.data(133).logicalSrcIdx = 150;
                    section.data(133).dtTransOffset = 166;

                    ;% controller14_P.SaturatingRamp_UpperSat_i
                    section.data(134).logicalSrcIdx = 151;
                    section.data(134).dtTransOffset = 167;

                    ;% controller14_P.SaturatingRamp_LowerSat_e
                    section.data(135).logicalSrcIdx = 152;
                    section.data(135).dtTransOffset = 168;

                    ;% controller14_P.RampUpOrDown_gainval_e1
                    section.data(136).logicalSrcIdx = 153;
                    section.data(136).dtTransOffset = 169;

                    ;% controller14_P.RampUpOrDown_IC_j
                    section.data(137).logicalSrcIdx = 154;
                    section.data(137).dtTransOffset = 170;

                    ;% controller14_P.RampUpOrDown_UpperSat_c
                    section.data(138).logicalSrcIdx = 155;
                    section.data(138).dtTransOffset = 171;

                    ;% controller14_P.RampUpOrDown_LowerSat_c
                    section.data(139).logicalSrcIdx = 156;
                    section.data(139).dtTransOffset = 172;

                    ;% controller14_P.phaseoffset_Value_k
                    section.data(140).logicalSrcIdx = 157;
                    section.data(140).dtTransOffset = 173;

                    ;% controller14_P.degtorad_Gain_f
                    section.data(141).logicalSrcIdx = 158;
                    section.data(141).dtTransOffset = 174;

                    ;% controller14_P.omegat_gainval_e
                    section.data(142).logicalSrcIdx = 159;
                    section.data(142).dtTransOffset = 175;

                    ;% controller14_P.omegat_IC_i
                    section.data(143).logicalSrcIdx = 160;
                    section.data(143).dtTransOffset = 176;

                    ;% controller14_P.Gain1_Gain_do
                    section.data(144).logicalSrcIdx = 161;
                    section.data(144).dtTransOffset = 177;

                    ;% controller14_P.Delay_InitialCondition_i
                    section.data(145).logicalSrcIdx = 162;
                    section.data(145).dtTransOffset = 178;

                    ;% controller14_P.Delay1_InitialCondition_i
                    section.data(146).logicalSrcIdx = 163;
                    section.data(146).dtTransOffset = 179;

                    ;% controller14_P.Delay2_InitialCondition_eq
                    section.data(147).logicalSrcIdx = 164;
                    section.data(147).dtTransOffset = 181;

                    ;% controller14_P.ground_Value_l
                    section.data(148).logicalSrcIdx = 165;
                    section.data(148).dtTransOffset = 182;

                    ;% controller14_P.Gain3_Gain
                    section.data(149).logicalSrcIdx = 166;
                    section.data(149).dtTransOffset = 183;

                    ;% controller14_P.c4JP2_Gain
                    section.data(150).logicalSrcIdx = 167;
                    section.data(150).dtTransOffset = 184;

                    ;% controller14_P.Saturation_UpperSat_a
                    section.data(151).logicalSrcIdx = 168;
                    section.data(151).dtTransOffset = 185;

                    ;% controller14_P.Saturation_LowerSat_g
                    section.data(152).logicalSrcIdx = 169;
                    section.data(152).dtTransOffset = 186;

                    ;% controller14_P.Gain_Gain_i
                    section.data(153).logicalSrcIdx = 170;
                    section.data(153).dtTransOffset = 187;

                    ;% controller14_P.Gain1_Gain_j
                    section.data(154).logicalSrcIdx = 171;
                    section.data(154).dtTransOffset = 188;

                    ;% controller14_P.Gain2_Gain_g
                    section.data(155).logicalSrcIdx = 172;
                    section.data(155).dtTransOffset = 189;

                    ;% controller14_P.Gain3_Gain_g
                    section.data(156).logicalSrcIdx = 173;
                    section.data(156).dtTransOffset = 190;

                    ;% controller14_P.time_gainval_o
                    section.data(157).logicalSrcIdx = 174;
                    section.data(157).dtTransOffset = 191;

                    ;% controller14_P.time_IC_b
                    section.data(158).logicalSrcIdx = 175;
                    section.data(158).dtTransOffset = 192;

                    ;% controller14_P.DiscreteTimeIntegrator_gainval
                    section.data(159).logicalSrcIdx = 176;
                    section.data(159).dtTransOffset = 193;

                    ;% controller14_P.DiscreteTimeIntegrator_IC
                    section.data(160).logicalSrcIdx = 177;
                    section.data(160).dtTransOffset = 194;

                    ;% controller14_P.constant_Value
                    section.data(161).logicalSrcIdx = 178;
                    section.data(161).dtTransOffset = 198;

                    ;% controller14_P.constant_Value_a
                    section.data(162).logicalSrcIdx = 179;
                    section.data(162).dtTransOffset = 199;

                    ;% controller14_P.constant_Value_m
                    section.data(163).logicalSrcIdx = 180;
                    section.data(163).dtTransOffset = 200;

                    ;% controller14_P.upi_Gain
                    section.data(164).logicalSrcIdx = 181;
                    section.data(164).dtTransOffset = 201;

                    ;% controller14_P.Gain_Gain_m
                    section.data(165).logicalSrcIdx = 182;
                    section.data(165).dtTransOffset = 202;

                    ;% controller14_P.Constant_Value_j
                    section.data(166).logicalSrcIdx = 183;
                    section.data(166).dtTransOffset = 203;

                    ;% controller14_P.Gain_Gain_k
                    section.data(167).logicalSrcIdx = 184;
                    section.data(167).dtTransOffset = 204;

                    ;% controller14_P.Constant_Value_o
                    section.data(168).logicalSrcIdx = 185;
                    section.data(168).dtTransOffset = 205;

                    ;% controller14_P.upi_Gain_o
                    section.data(169).logicalSrcIdx = 186;
                    section.data(169).dtTransOffset = 206;

                    ;% controller14_P.Gain_Gain_j
                    section.data(170).logicalSrcIdx = 187;
                    section.data(170).dtTransOffset = 207;

                    ;% controller14_P.Constant_Value_kj2
                    section.data(171).logicalSrcIdx = 188;
                    section.data(171).dtTransOffset = 208;

                    ;% controller14_P.Gain_Gain_h
                    section.data(172).logicalSrcIdx = 189;
                    section.data(172).dtTransOffset = 209;

                    ;% controller14_P.Constant_Value_jy
                    section.data(173).logicalSrcIdx = 190;
                    section.data(173).dtTransOffset = 210;

                    ;% controller14_P.upi_Gain_b
                    section.data(174).logicalSrcIdx = 191;
                    section.data(174).dtTransOffset = 211;

                    ;% controller14_P.Gain_Gain_o
                    section.data(175).logicalSrcIdx = 192;
                    section.data(175).dtTransOffset = 212;

                    ;% controller14_P.Constant_Value_mx
                    section.data(176).logicalSrcIdx = 193;
                    section.data(176).dtTransOffset = 213;

                    ;% controller14_P.Gain_Gain_o0
                    section.data(177).logicalSrcIdx = 194;
                    section.data(177).dtTransOffset = 214;

                    ;% controller14_P.Constant_Value_lu
                    section.data(178).logicalSrcIdx = 195;
                    section.data(178).dtTransOffset = 215;

                    ;% controller14_P.upi_Gain_e
                    section.data(179).logicalSrcIdx = 196;
                    section.data(179).dtTransOffset = 216;

                    ;% controller14_P.Gain_Gain_ks
                    section.data(180).logicalSrcIdx = 197;
                    section.data(180).dtTransOffset = 217;

                    ;% controller14_P.Constant_Value_mk
                    section.data(181).logicalSrcIdx = 198;
                    section.data(181).dtTransOffset = 218;

                    ;% controller14_P.Gain_Gain_p
                    section.data(182).logicalSrcIdx = 199;
                    section.data(182).dtTransOffset = 219;

                    ;% controller14_P.Constant_Value_kv
                    section.data(183).logicalSrcIdx = 200;
                    section.data(183).dtTransOffset = 220;

                    ;% controller14_P.constant_Value_j
                    section.data(184).logicalSrcIdx = 201;
                    section.data(184).dtTransOffset = 221;

                    ;% controller14_P.ExecutionTime_P1
                    section.data(185).logicalSrcIdx = 202;
                    section.data(185).dtTransOffset = 222;

            nTotData = nTotData + section.nData;
            paramMap.sections(11) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_P.constant1_Value_g
                    section.data(1).logicalSrcIdx = 203;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.constant2_Value
                    section.data(2).logicalSrcIdx = 204;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            paramMap.sections(12) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller14_P.TriggeredSubsystem_d.Out1_Y0
                    section.data(1).logicalSrcIdx = 205;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.TriggeredSubsystem_d.Output_Y0
                    section.data(2).logicalSrcIdx = 206;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_P.TriggeredSubsystem_d.Output1_Y0
                    section.data(3).logicalSrcIdx = 207;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_P.TriggeredSubsystem_d.Output2_Y0
                    section.data(4).logicalSrcIdx = 208;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_P.TriggeredSubsystem_d.UnitDelay_InitialCondition
                    section.data(5).logicalSrcIdx = 209;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_P.TriggeredSubsystem_d.UnitDelay1_InitialCondition
                    section.data(6).logicalSrcIdx = 210;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            paramMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.IfActionSubsystem1_i.Constant_Value
                    section.data(1).logicalSrcIdx = 211;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(14) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller14_P.TriggeredSubsystem.Out1_Y0
                    section.data(1).logicalSrcIdx = 212;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_P.TriggeredSubsystem.Output_Y0
                    section.data(2).logicalSrcIdx = 213;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_P.TriggeredSubsystem.Output1_Y0
                    section.data(3).logicalSrcIdx = 214;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_P.TriggeredSubsystem.Output2_Y0
                    section.data(4).logicalSrcIdx = 215;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_P.TriggeredSubsystem.UnitDelay_InitialCondition
                    section.data(5).logicalSrcIdx = 216;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_P.TriggeredSubsystem.UnitDelay1_InitialCondition
                    section.data(6).logicalSrcIdx = 217;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            paramMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_P.IfActionSubsystem1.Constant_Value
                    section.data(1).logicalSrcIdx = 218;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(16) = section;
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
        nTotSects     = 13;
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
        ;% Auto data (controller14_B)
        ;%
            section.nData     = 68;
            section.data(68)  = dumData; %prealloc

                    ;% controller14_B.ZeroOrderHold6
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.p_raw
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.ZeroOrderHold3
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 4;

                    ;% controller14_B.Gain
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 7;

                    ;% controller14_B.Merge
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 10;

                    ;% controller14_B.p_dot
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 13;

                    ;% controller14_B.ZeroOrderHold4
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 16;

                    ;% controller14_B.p_dotdot
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 19;

                    ;% controller14_B.ZeroOrderHold5
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 22;

                    ;% controller14_B.EulXYZ
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 25;

                    ;% controller14_B.ZeroOrderHold2
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 28;

                    ;% controller14_B.p_raw_h
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 31;

                    ;% controller14_B.ZeroOrderHold1
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 34;

                    ;% controller14_B.Delay2
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 37;

                    ;% controller14_B.times2
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 41;

                    ;% controller14_B.times1
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 45;

                    ;% controller14_B.ZeroOrderHold7
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 46;

                    ;% controller14_B.Product
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 47;

                    ;% controller14_B.Gain1
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 48;

                    ;% controller14_B.Switch17
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 49;

                    ;% controller14_B.Switch1
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 50;

                    ;% controller14_B.Switch2
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 51;

                    ;% controller14_B.Switch3
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 52;

                    ;% controller14_B.half1
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 53;

                    ;% controller14_B.Gain4
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 57;

                    ;% controller14_B.Gain1_c
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 58;

                    ;% controller14_B.Gain1_b
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 59;

                    ;% controller14_B.Gain1_d
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 60;

                    ;% controller14_B.Gain2
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 61;

                    ;% controller14_B.Gain1_j
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 62;

                    ;% controller14_B.Gain3
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 63;

                    ;% controller14_B.DiscreteTimeIntegrator
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 64;

                    ;% controller14_B.Product_f
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 68;

                    ;% controller14_B.DigitalFilter
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 72;

                    ;% controller14_B.upi
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 75;

                    ;% controller14_B.Add
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 76;

                    ;% controller14_B.Add_i
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 77;

                    ;% controller14_B.upi_i
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 78;

                    ;% controller14_B.Add_l
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 79;

                    ;% controller14_B.Add_a
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 80;

                    ;% controller14_B.upi_k
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 81;

                    ;% controller14_B.Add_m
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 82;

                    ;% controller14_B.Add_f
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 83;

                    ;% controller14_B.upi_m
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 84;

                    ;% controller14_B.Add_p
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 85;

                    ;% controller14_B.Add_mt
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 86;

                    ;% controller14_B.ExecutionTime
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 87;

                    ;% controller14_B.Timestamp
                    section.data(48).logicalSrcIdx = 48;
                    section.data(48).dtTransOffset = 88;

                    ;% controller14_B.R
                    section.data(49).logicalSrcIdx = 49;
                    section.data(49).dtTransOffset = 89;

                    ;% controller14_B.UnitDelay
                    section.data(50).logicalSrcIdx = 50;
                    section.data(50).dtTransOffset = 98;

                    ;% controller14_B.In2
                    section.data(51).logicalSrcIdx = 51;
                    section.data(51).dtTransOffset = 107;

                    ;% controller14_B.UnitDelay1
                    section.data(52).logicalSrcIdx = 52;
                    section.data(52).dtTransOffset = 108;

                    ;% controller14_B.R_i
                    section.data(53).logicalSrcIdx = 53;
                    section.data(53).dtTransOffset = 109;

                    ;% controller14_B.en
                    section.data(54).logicalSrcIdx = 54;
                    section.data(54).dtTransOffset = 118;

                    ;% controller14_B.en_out
                    section.data(55).logicalSrcIdx = 57;
                    section.data(55).dtTransOffset = 119;

                    ;% controller14_B.cum_out
                    section.data(56).logicalSrcIdx = 58;
                    section.data(56).dtTransOffset = 120;

                    ;% controller14_B.a
                    section.data(57).logicalSrcIdx = 63;
                    section.data(57).dtTransOffset = 121;

                    ;% controller14_B.alt_e
                    section.data(58).logicalSrcIdx = 64;
                    section.data(58).dtTransOffset = 122;

                    ;% controller14_B.omega_hat
                    section.data(59).logicalSrcIdx = 66;
                    section.data(59).dtTransOffset = 123;

                    ;% controller14_B.ext_torque_hat
                    section.data(60).logicalSrcIdx = 67;
                    section.data(60).dtTransOffset = 125;

                    ;% controller14_B.torque_x
                    section.data(61).logicalSrcIdx = 68;
                    section.data(61).dtTransOffset = 127;

                    ;% controller14_B.torque_y
                    section.data(62).logicalSrcIdx = 69;
                    section.data(62).dtTransOffset = 128;

                    ;% controller14_B.torque_z
                    section.data(63).logicalSrcIdx = 70;
                    section.data(63).dtTransOffset = 129;

                    ;% controller14_B.att_e
                    section.data(64).logicalSrcIdx = 71;
                    section.data(64).dtTransOffset = 130;

                    ;% controller14_B.rd
                    section.data(65).logicalSrcIdx = 72;
                    section.data(65).dtTransOffset = 133;

                    ;% controller14_B.id_out
                    section.data(66).logicalSrcIdx = 77;
                    section.data(66).dtTransOffset = 136;

                    ;% controller14_B.enable
                    section.data(67).logicalSrcIdx = 78;
                    section.data(67).dtTransOffset = 137;

                    ;% controller14_B.DigitalFilter_o
                    section.data(68).logicalSrcIdx = 79;
                    section.data(68).dtTransOffset = 138;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.PacketInput1_o1
                    section.data(1).logicalSrcIdx = 80;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.UDPuint162
                    section.data(1).logicalSrcIdx = 81;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.UDPuint163
                    section.data(2).logicalSrcIdx = 82;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.UDPuint164
                    section.data(3).logicalSrcIdx = 83;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.Switch
                    section.data(4).logicalSrcIdx = 84;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller14_B.Compare
                    section.data(1).logicalSrcIdx = 85;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.Compare_b
                    section.data(2).logicalSrcIdx = 86;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.Compare_d
                    section.data(3).logicalSrcIdx = 87;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.DataTypeConversion
                    section.data(4).logicalSrcIdx = 88;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_B.DataTypeConversion4
                    section.data(5).logicalSrcIdx = 89;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_B.ZeroOrderHold2_e
                    section.data(6).logicalSrcIdx = 90;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.dataready
                    section.data(1).logicalSrcIdx = 91;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_k.output
                    section.data(1).logicalSrcIdx = 92;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_lw.output
                    section.data(1).logicalSrcIdx = 93;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_l.output
                    section.data(1).logicalSrcIdx = 94;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_i.output
                    section.data(1).logicalSrcIdx = 95;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix3.w
                    section.data(1).logicalSrcIdx = 96;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix2.w
                    section.data(1).logicalSrcIdx = 97;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem_d.In1
                    section.data(1).logicalSrcIdx = 98;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay
                    section.data(2).logicalSrcIdx = 99;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem_d.In2
                    section.data(3).logicalSrcIdx = 100;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay1
                    section.data(4).logicalSrcIdx = 101;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem.In1
                    section.data(1).logicalSrcIdx = 102;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay
                    section.data(2).logicalSrcIdx = 103;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem.In2
                    section.data(3).logicalSrcIdx = 104;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay1
                    section.data(4).logicalSrcIdx = 105;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
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
        nTotSects     = 35;
        sectIdxOffset = 13;

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
        ;% Auto data (controller14_DW)
        ;%
            section.nData     = 49;
            section.data(49)  = dumData; %prealloc

                    ;% controller14_DW.time_DSTATE
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.SaturatingRamp1_DSTATE
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.Delay_DSTATE
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.DigitalFilter_FILT_STATES
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 5;

                    ;% controller14_DW.Delay1_DSTATE
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 11;

                    ;% controller14_DW.Delay1_DSTATE_m
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 14;

                    ;% controller14_DW.Delay_DSTATE_m
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 17;

                    ;% controller14_DW.time_DSTATE_m
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 26;

                    ;% controller14_DW.Delay_DSTATE_b
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 27;

                    ;% controller14_DW.Delay2_DSTATE
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 28;

                    ;% controller14_DW.Delay_DSTATE_e
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 32;

                    ;% controller14_DW.Delay1_DSTATE_a
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 34;

                    ;% controller14_DW.Delay_DSTATE_j
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 35;

                    ;% controller14_DW.SaturatingRamp_DSTATE
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 36;

                    ;% controller14_DW.RampUpOrDown_DSTATE
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 37;

                    ;% controller14_DW.omegat_DSTATE
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 38;

                    ;% controller14_DW.Delay_DSTATE_a
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 39;

                    ;% controller14_DW.Delay1_DSTATE_b
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 40;

                    ;% controller14_DW.Delay1_DSTATE_f
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 42;

                    ;% controller14_DW.Delay_DSTATE_at
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 43;

                    ;% controller14_DW.Delay2_DSTATE_k
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 44;

                    ;% controller14_DW.Delay3_DSTATE
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 45;

                    ;% controller14_DW.Delay2_DSTATE_g
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 46;

                    ;% controller14_DW.SaturatingRamp_DSTATE_n
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 47;

                    ;% controller14_DW.RampUpOrDown_DSTATE_a
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 48;

                    ;% controller14_DW.omegat_DSTATE_p
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 49;

                    ;% controller14_DW.Delay_DSTATE_l
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 50;

                    ;% controller14_DW.Delay1_DSTATE_l
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 51;

                    ;% controller14_DW.Delay2_DSTATE_a
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 53;

                    ;% controller14_DW.SaturatingRamp_DSTATE_o
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 54;

                    ;% controller14_DW.RampUpOrDown_DSTATE_j
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 55;

                    ;% controller14_DW.omegat_DSTATE_l
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 56;

                    ;% controller14_DW.Delay_DSTATE_n
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 57;

                    ;% controller14_DW.Delay1_DSTATE_j
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 58;

                    ;% controller14_DW.Delay2_DSTATE_o
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 60;

                    ;% controller14_DW.SaturatingRamp_DSTATE_e
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 61;

                    ;% controller14_DW.RampUpOrDown_DSTATE_d
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 62;

                    ;% controller14_DW.omegat_DSTATE_d
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 63;

                    ;% controller14_DW.Delay_DSTATE_f
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 64;

                    ;% controller14_DW.Delay1_DSTATE_e
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 65;

                    ;% controller14_DW.Delay2_DSTATE_l
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 67;

                    ;% controller14_DW.Delay1_DSTATE_lm
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 68;

                    ;% controller14_DW.time_DSTATE_k
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 70;

                    ;% controller14_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 71;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_m
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 75;

                    ;% controller14_DW.UnitDelay_DSTATE
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 81;

                    ;% controller14_DW.UnitDelay1_DSTATE
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 90;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 91;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_e
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 94;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 21;
            section.data(21)  = dumData; %prealloc

                    ;% controller14_DW.PacketInput1_PWORK
                    section.data(1).logicalSrcIdx = 49;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.Scope_PWORK.LoggedData
                    section.data(2).logicalSrcIdx = 50;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.PacketOutput_PWORK
                    section.data(3).logicalSrcIdx = 51;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.highdrivingsignal_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 52;
                    section.data(4).dtTransOffset = 4;

                    ;% controller14_DW.voltages_PWORK.LoggedData
                    section.data(5).logicalSrcIdx = 53;
                    section.data(5).dtTransOffset = 5;

                    ;% controller14_DW.Scope_PWORK_b.LoggedData
                    section.data(6).logicalSrcIdx = 54;
                    section.data(6).dtTransOffset = 6;

                    ;% controller14_DW.Scope1_PWORK.LoggedData
                    section.data(7).logicalSrcIdx = 55;
                    section.data(7).dtTransOffset = 8;

                    ;% controller14_DW.Scope2_PWORK.LoggedData
                    section.data(8).logicalSrcIdx = 56;
                    section.data(8).dtTransOffset = 11;

                    ;% controller14_DW.Scope_PWORK_j.LoggedData
                    section.data(9).logicalSrcIdx = 57;
                    section.data(9).dtTransOffset = 12;

                    ;% controller14_DW.Scope1_PWORK_p.LoggedData
                    section.data(10).logicalSrcIdx = 58;
                    section.data(10).dtTransOffset = 13;

                    ;% controller14_DW.Scope2_PWORK_p.LoggedData
                    section.data(11).logicalSrcIdx = 59;
                    section.data(11).dtTransOffset = 14;

                    ;% controller14_DW.safetyenable_PWORK.LoggedData
                    section.data(12).logicalSrcIdx = 60;
                    section.data(12).dtTransOffset = 15;

                    ;% controller14_DW.Eul_XYZ_PWORK.LoggedData
                    section.data(13).logicalSrcIdx = 61;
                    section.data(13).dtTransOffset = 16;

                    ;% controller14_DW.omega_b_PWORK.LoggedData
                    section.data(14).logicalSrcIdx = 62;
                    section.data(14).dtTransOffset = 17;

                    ;% controller14_DW.p_dot_PWORK.LoggedData
                    section.data(15).logicalSrcIdx = 63;
                    section.data(15).dtTransOffset = 19;

                    ;% controller14_DW.p_raw_PWORK.LoggedData
                    section.data(16).logicalSrcIdx = 64;
                    section.data(16).dtTransOffset = 20;

                    ;% controller14_DW.Vicon2bodiesdataready_PWORK.LoggedData
                    section.data(17).logicalSrcIdx = 65;
                    section.data(17).dtTransOffset = 21;

                    ;% controller14_DW.Scope1_PWORK_o.LoggedData
                    section.data(18).logicalSrcIdx = 66;
                    section.data(18).dtTransOffset = 22;

                    ;% controller14_DW.Scope2_PWORK_h.LoggedData
                    section.data(19).logicalSrcIdx = 67;
                    section.data(19).dtTransOffset = 23;

                    ;% controller14_DW.highexecutiontime_PWORK.LoggedData
                    section.data(20).logicalSrcIdx = 68;
                    section.data(20).dtTransOffset = 24;

                    ;% controller14_DW.Scope_PWORK_f.LoggedData
                    section.data(21).logicalSrcIdx = 69;
                    section.data(21).dtTransOffset = 25;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% controller14_DW.sfEvent
                    section.data(1).logicalSrcIdx = 70;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.sfEvent_i
                    section.data(2).logicalSrcIdx = 71;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.sfEvent_l
                    section.data(3).logicalSrcIdx = 72;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.sfEvent_c
                    section.data(4).logicalSrcIdx = 73;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.sfEvent_k
                    section.data(5).logicalSrcIdx = 74;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.sfEvent_f
                    section.data(6).logicalSrcIdx = 75;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.sfEvent_e
                    section.data(7).logicalSrcIdx = 76;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.sfEvent_a
                    section.data(8).logicalSrcIdx = 77;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.sfEvent_am
                    section.data(9).logicalSrcIdx = 78;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.sfEvent_ez
                    section.data(10).logicalSrcIdx = 79;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.sfEvent_an
                    section.data(11).logicalSrcIdx = 80;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.sfEvent_i1
                    section.data(12).logicalSrcIdx = 81;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.sfEvent_lm
                    section.data(13).logicalSrcIdx = 82;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% controller14_DW.obj
                    section.data(1).logicalSrcIdx = 83;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.obj_o
                    section.data(2).logicalSrcIdx = 84;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.obj_p
                    section.data(3).logicalSrcIdx = 85;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 86;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.IfActionSubsystem_SubsysRanBC
                    section.data(2).logicalSrcIdx = 87;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(3).logicalSrcIdx = 88;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% controller14_DW.is_active_c31_controller14
                    section.data(1).logicalSrcIdx = 89;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.is_active_c64_controller14
                    section.data(2).logicalSrcIdx = 90;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.is_active_c51_controller14
                    section.data(3).logicalSrcIdx = 91;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.is_active_c50_controller14
                    section.data(4).logicalSrcIdx = 92;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.is_active_c49_controller14
                    section.data(5).logicalSrcIdx = 93;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.is_active_c48_controller14
                    section.data(6).logicalSrcIdx = 94;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.is_active_c96_controller14
                    section.data(7).logicalSrcIdx = 95;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.is_active_c72_controller14
                    section.data(8).logicalSrcIdx = 96;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.is_active_c10_controller14
                    section.data(9).logicalSrcIdx = 97;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.is_active_c71_controller14
                    section.data(10).logicalSrcIdx = 98;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.is_active_c52_controller14
                    section.data(11).logicalSrcIdx = 99;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.is_active_c46_controller14
                    section.data(12).logicalSrcIdx = 100;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.is_active_c7_controller14
                    section.data(13).logicalSrcIdx = 101;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 16;
            section.data(16)  = dumData; %prealloc

                    ;% controller14_DW.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 102;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.doneDoubleBufferReInit_k
                    section.data(2).logicalSrcIdx = 103;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.doneDoubleBufferReInit_g
                    section.data(3).logicalSrcIdx = 104;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.doneDoubleBufferReInit_h
                    section.data(4).logicalSrcIdx = 105;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.doneDoubleBufferReInit_gj
                    section.data(5).logicalSrcIdx = 106;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.doneDoubleBufferReInit_i
                    section.data(6).logicalSrcIdx = 107;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.objisempty
                    section.data(7).logicalSrcIdx = 108;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.objisempty_f
                    section.data(8).logicalSrcIdx = 109;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.doneDoubleBufferReInit_n
                    section.data(9).logicalSrcIdx = 110;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.doneDoubleBufferReInit_c
                    section.data(10).logicalSrcIdx = 111;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.doneDoubleBufferReInit_p
                    section.data(11).logicalSrcIdx = 112;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.doneDoubleBufferReInit_d
                    section.data(12).logicalSrcIdx = 113;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.doneDoubleBufferReInit_n2
                    section.data(13).logicalSrcIdx = 114;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.doneDoubleBufferReInit_ib
                    section.data(14).logicalSrcIdx = 115;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.objisempty_g
                    section.data(15).logicalSrcIdx = 116;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.doneDoubleBufferReInit_o
                    section.data(16).logicalSrcIdx = 117;
                    section.data(16).dtTransOffset = 15;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.sfEvent
                    section.data(1).logicalSrcIdx = 118;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 119;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 120;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.sfEvent
                    section.data(1).logicalSrcIdx = 121;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 122;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 123;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.sfEvent
                    section.data(1).logicalSrcIdx = 124;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 125;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 126;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.sfEvent
                    section.data(1).logicalSrcIdx = 127;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 128;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 129;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.sfEvent
                    section.data(1).logicalSrcIdx = 130;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(20) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 131;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(21) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 132;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(22) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.sfEvent
                    section.data(1).logicalSrcIdx = 133;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(23) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 134;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(24) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 135;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(25) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 136;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 137;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(26) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.Scope_PWORK.LoggedData
                    section.data(1).logicalSrcIdx = 138;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(27) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 139;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(28) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem_m.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 140;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(29) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1_i.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 141;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(30) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 142;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 143;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(31) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.Scope_PWORK.LoggedData
                    section.data(1).logicalSrcIdx = 144;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(32) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 145;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(33) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 146;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(34) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 147;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(35) = section;
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


    targMap.checksum0 = 2043136624;
    targMap.checksum1 = 2178419900;
    targMap.checksum2 = 2685142031;
    targMap.checksum3 = 3170111709;
