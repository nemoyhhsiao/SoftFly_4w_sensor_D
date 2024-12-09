    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 0;
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
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (controller14_P)
        ;%

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
        nTotSects     = 19;
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
            section.nData     = 127;
            section.data(127)  = dumData; %prealloc

                    ;% controller14_B.SaturatingRamp
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.Sqrt
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.Reshape
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.Gain5
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 5;

                    ;% controller14_B.Switch
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 17;

                    ;% controller14_B.opti_xy
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 20;

                    ;% controller14_B.mmtom
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 22;

                    ;% controller14_B.Reshapexhat
                    section.data(8).logicalSrcIdx = 8;
                    section.data(8).dtTransOffset = 23;

                    ;% controller14_B.Add10
                    section.data(9).logicalSrcIdx = 9;
                    section.data(9).dtTransOffset = 25;

                    ;% controller14_B.Vicon_p
                    section.data(10).logicalSrcIdx = 10;
                    section.data(10).dtTransOffset = 28;

                    ;% controller14_B.Merge
                    section.data(11).logicalSrcIdx = 11;
                    section.data(11).dtTransOffset = 31;

                    ;% controller14_B.Vicon_p_dot
                    section.data(12).logicalSrcIdx = 12;
                    section.data(12).dtTransOffset = 34;

                    ;% controller14_B.Switch3
                    section.data(13).logicalSrcIdx = 13;
                    section.data(13).dtTransOffset = 37;

                    ;% controller14_B.DigitalFilter
                    section.data(14).logicalSrcIdx = 14;
                    section.data(14).dtTransOffset = 39;

                    ;% controller14_B.Switch4
                    section.data(15).logicalSrcIdx = 15;
                    section.data(15).dtTransOffset = 42;

                    ;% controller14_B.Reshape1
                    section.data(16).logicalSrcIdx = 16;
                    section.data(16).dtTransOffset = 45;

                    ;% controller14_B.DiscreteTimeIntegrator
                    section.data(17).logicalSrcIdx = 17;
                    section.data(17).dtTransOffset = 48;

                    ;% controller14_B.Switch6
                    section.data(18).logicalSrcIdx = 18;
                    section.data(18).dtTransOffset = 50;

                    ;% controller14_B.ZeroOrderHold1
                    section.data(19).logicalSrcIdx = 19;
                    section.data(19).dtTransOffset = 52;

                    ;% controller14_B.ZeroOrderHold3
                    section.data(20).logicalSrcIdx = 20;
                    section.data(20).dtTransOffset = 53;

                    ;% controller14_B.ZeroOrderHold4
                    section.data(21).logicalSrcIdx = 21;
                    section.data(21).dtTransOffset = 54;

                    ;% controller14_B.ZeroOrderHold5
                    section.data(22).logicalSrcIdx = 22;
                    section.data(22).dtTransOffset = 55;

                    ;% controller14_B.ZeroOrderHold6
                    section.data(23).logicalSrcIdx = 23;
                    section.data(23).dtTransOffset = 56;

                    ;% controller14_B.ZeroOrderHold7
                    section.data(24).logicalSrcIdx = 24;
                    section.data(24).dtTransOffset = 57;

                    ;% controller14_B.ZeroOrderHold3_j
                    section.data(25).logicalSrcIdx = 25;
                    section.data(25).dtTransOffset = 58;

                    ;% controller14_B.Switch7
                    section.data(26).logicalSrcIdx = 26;
                    section.data(26).dtTransOffset = 61;

                    ;% controller14_B.ZeroOrderHold4_c
                    section.data(27).logicalSrcIdx = 27;
                    section.data(27).dtTransOffset = 63;

                    ;% controller14_B.ZeroOrderHold2
                    section.data(28).logicalSrcIdx = 28;
                    section.data(28).dtTransOffset = 66;

                    ;% controller14_B.ZeroOrderHold1_b
                    section.data(29).logicalSrcIdx = 29;
                    section.data(29).dtTransOffset = 69;

                    ;% controller14_B.Switch_j
                    section.data(30).logicalSrcIdx = 30;
                    section.data(30).dtTransOffset = 72;

                    ;% controller14_B.Delay
                    section.data(31).logicalSrcIdx = 31;
                    section.data(31).dtTransOffset = 75;

                    ;% controller14_B.Delay2
                    section.data(32).logicalSrcIdx = 32;
                    section.data(32).dtTransOffset = 77;

                    ;% controller14_B.Switch17
                    section.data(33).logicalSrcIdx = 33;
                    section.data(33).dtTransOffset = 81;

                    ;% controller14_B.ComplextoRealImag_o1
                    section.data(34).logicalSrcIdx = 34;
                    section.data(34).dtTransOffset = 82;

                    ;% controller14_B.Switch1
                    section.data(35).logicalSrcIdx = 35;
                    section.data(35).dtTransOffset = 83;

                    ;% controller14_B.ComplextoRealImag1_o1
                    section.data(36).logicalSrcIdx = 36;
                    section.data(36).dtTransOffset = 84;

                    ;% controller14_B.Switch2
                    section.data(37).logicalSrcIdx = 37;
                    section.data(37).dtTransOffset = 85;

                    ;% controller14_B.ComplextoRealImag2_o1
                    section.data(38).logicalSrcIdx = 38;
                    section.data(38).dtTransOffset = 86;

                    ;% controller14_B.Switch3_p
                    section.data(39).logicalSrcIdx = 39;
                    section.data(39).dtTransOffset = 87;

                    ;% controller14_B.ComplextoRealImag3_o1
                    section.data(40).logicalSrcIdx = 40;
                    section.data(40).dtTransOffset = 88;

                    ;% controller14_B.TmpSignalConversionAtDelay2Inport1
                    section.data(41).logicalSrcIdx = 41;
                    section.data(41).dtTransOffset = 89;

                    ;% controller14_B.half1
                    section.data(42).logicalSrcIdx = 42;
                    section.data(42).dtTransOffset = 93;

                    ;% controller14_B.Gain
                    section.data(43).logicalSrcIdx = 43;
                    section.data(43).dtTransOffset = 97;

                    ;% controller14_B.Gain4
                    section.data(44).logicalSrcIdx = 44;
                    section.data(44).dtTransOffset = 98;

                    ;% controller14_B.SaturatingRamp_d
                    section.data(45).logicalSrcIdx = 45;
                    section.data(45).dtTransOffset = 99;

                    ;% controller14_B.Sqrt_b
                    section.data(46).logicalSrcIdx = 46;
                    section.data(46).dtTransOffset = 100;

                    ;% controller14_B.Gain_m
                    section.data(47).logicalSrcIdx = 47;
                    section.data(47).dtTransOffset = 101;

                    ;% controller14_B.Gain1
                    section.data(48).logicalSrcIdx = 48;
                    section.data(48).dtTransOffset = 102;

                    ;% controller14_B.SaturatingRamp_f
                    section.data(49).logicalSrcIdx = 49;
                    section.data(49).dtTransOffset = 103;

                    ;% controller14_B.Sqrt_g
                    section.data(50).logicalSrcIdx = 50;
                    section.data(50).dtTransOffset = 104;

                    ;% controller14_B.Gain_c
                    section.data(51).logicalSrcIdx = 51;
                    section.data(51).dtTransOffset = 105;

                    ;% controller14_B.Gain2
                    section.data(52).logicalSrcIdx = 52;
                    section.data(52).dtTransOffset = 106;

                    ;% controller14_B.SaturatingRamp_j
                    section.data(53).logicalSrcIdx = 53;
                    section.data(53).dtTransOffset = 107;

                    ;% controller14_B.Sqrt_l
                    section.data(54).logicalSrcIdx = 54;
                    section.data(54).dtTransOffset = 108;

                    ;% controller14_B.Gain_i
                    section.data(55).logicalSrcIdx = 55;
                    section.data(55).dtTransOffset = 109;

                    ;% controller14_B.Gain3
                    section.data(56).logicalSrcIdx = 56;
                    section.data(56).dtTransOffset = 110;

                    ;% controller14_B.DiscreteTimeIntegrator_g
                    section.data(57).logicalSrcIdx = 57;
                    section.data(57).dtTransOffset = 111;

                    ;% controller14_B.Product
                    section.data(58).logicalSrcIdx = 58;
                    section.data(58).dtTransOffset = 115;

                    ;% controller14_B.Saturation6
                    section.data(59).logicalSrcIdx = 59;
                    section.data(59).dtTransOffset = 119;

                    ;% controller14_B.Saturation7
                    section.data(60).logicalSrcIdx = 60;
                    section.data(60).dtTransOffset = 120;

                    ;% controller14_B.Saturation8
                    section.data(61).logicalSrcIdx = 61;
                    section.data(61).dtTransOffset = 121;

                    ;% controller14_B.Saturation9
                    section.data(62).logicalSrcIdx = 62;
                    section.data(62).dtTransOffset = 122;

                    ;% controller14_B.TmpSignalConversionAtDigitalFilterInport1
                    section.data(63).logicalSrcIdx = 63;
                    section.data(63).dtTransOffset = 123;

                    ;% controller14_B.DigitalFilter_j
                    section.data(64).logicalSrcIdx = 64;
                    section.data(64).dtTransOffset = 127;

                    ;% controller14_B.Add
                    section.data(65).logicalSrcIdx = 65;
                    section.data(65).dtTransOffset = 131;

                    ;% controller14_B.Add_i
                    section.data(66).logicalSrcIdx = 66;
                    section.data(66).dtTransOffset = 132;

                    ;% controller14_B.upi
                    section.data(67).logicalSrcIdx = 67;
                    section.data(67).dtTransOffset = 133;

                    ;% controller14_B.Gain1_b
                    section.data(68).logicalSrcIdx = 68;
                    section.data(68).dtTransOffset = 134;

                    ;% controller14_B.upi1
                    section.data(69).logicalSrcIdx = 69;
                    section.data(69).dtTransOffset = 135;

                    ;% controller14_B.upi_i
                    section.data(70).logicalSrcIdx = 70;
                    section.data(70).dtTransOffset = 136;

                    ;% controller14_B.Gain1_c
                    section.data(71).logicalSrcIdx = 71;
                    section.data(71).dtTransOffset = 137;

                    ;% controller14_B.Add_l
                    section.data(72).logicalSrcIdx = 72;
                    section.data(72).dtTransOffset = 138;

                    ;% controller14_B.Add_a
                    section.data(73).logicalSrcIdx = 73;
                    section.data(73).dtTransOffset = 139;

                    ;% controller14_B.upi1_p
                    section.data(74).logicalSrcIdx = 74;
                    section.data(74).dtTransOffset = 140;

                    ;% controller14_B.upi_k
                    section.data(75).logicalSrcIdx = 75;
                    section.data(75).dtTransOffset = 141;

                    ;% controller14_B.Gain1_d
                    section.data(76).logicalSrcIdx = 76;
                    section.data(76).dtTransOffset = 142;

                    ;% controller14_B.Add_m
                    section.data(77).logicalSrcIdx = 77;
                    section.data(77).dtTransOffset = 143;

                    ;% controller14_B.Add_f
                    section.data(78).logicalSrcIdx = 78;
                    section.data(78).dtTransOffset = 144;

                    ;% controller14_B.upi1_k
                    section.data(79).logicalSrcIdx = 79;
                    section.data(79).dtTransOffset = 145;

                    ;% controller14_B.upi_m
                    section.data(80).logicalSrcIdx = 80;
                    section.data(80).dtTransOffset = 146;

                    ;% controller14_B.Gain1_j
                    section.data(81).logicalSrcIdx = 81;
                    section.data(81).dtTransOffset = 147;

                    ;% controller14_B.Add_p
                    section.data(82).logicalSrcIdx = 82;
                    section.data(82).dtTransOffset = 148;

                    ;% controller14_B.Add_mt
                    section.data(83).logicalSrcIdx = 83;
                    section.data(83).dtTransOffset = 149;

                    ;% controller14_B.upi1_a
                    section.data(84).logicalSrcIdx = 84;
                    section.data(84).dtTransOffset = 150;

                    ;% controller14_B.DigitalFilter_n
                    section.data(85).logicalSrcIdx = 85;
                    section.data(85).dtTransOffset = 151;

                    ;% controller14_B.RateTransition1
                    section.data(86).logicalSrcIdx = 86;
                    section.data(86).dtTransOffset = 153;

                    ;% controller14_B.envelope
                    section.data(87).logicalSrcIdx = 87;
                    section.data(87).dtTransOffset = 154;

                    ;% controller14_B.flip
                    section.data(88).logicalSrcIdx = 88;
                    section.data(88).dtTransOffset = 155;

                    ;% controller14_B.voltage
                    section.data(89).logicalSrcIdx = 89;
                    section.data(89).dtTransOffset = 156;

                    ;% controller14_B.omega
                    section.data(90).logicalSrcIdx = 90;
                    section.data(90).dtTransOffset = 157;

                    ;% controller14_B.Add_c
                    section.data(91).logicalSrcIdx = 91;
                    section.data(91).dtTransOffset = 160;

                    ;% controller14_B.total_thrust
                    section.data(92).logicalSrcIdx = 93;
                    section.data(92).dtTransOffset = 162;

                    ;% controller14_B.x_hat_new
                    section.data(93).logicalSrcIdx = 95;
                    section.data(93).dtTransOffset = 163;

                    ;% controller14_B.Product2
                    section.data(94).logicalSrcIdx = 97;
                    section.data(94).dtTransOffset = 165;

                    ;% controller14_B.Product3
                    section.data(95).logicalSrcIdx = 98;
                    section.data(95).dtTransOffset = 167;

                    ;% controller14_B.v_new
                    section.data(96).logicalSrcIdx = 105;
                    section.data(96).dtTransOffset = 169;

                    ;% controller14_B.R
                    section.data(97).logicalSrcIdx = 107;
                    section.data(97).dtTransOffset = 172;

                    ;% controller14_B.UnitDelay
                    section.data(98).logicalSrcIdx = 108;
                    section.data(98).dtTransOffset = 181;

                    ;% controller14_B.In2
                    section.data(99).logicalSrcIdx = 109;
                    section.data(99).dtTransOffset = 190;

                    ;% controller14_B.UnitDelay1
                    section.data(100).logicalSrcIdx = 110;
                    section.data(100).dtTransOffset = 191;

                    ;% controller14_B.en
                    section.data(101).logicalSrcIdx = 111;
                    section.data(101).dtTransOffset = 192;

                    ;% controller14_B.en_p
                    section.data(102).logicalSrcIdx = 112;
                    section.data(102).dtTransOffset = 193;

                    ;% controller14_B.en_out
                    section.data(103).logicalSrcIdx = 114;
                    section.data(103).dtTransOffset = 194;

                    ;% controller14_B.cum_out
                    section.data(104).logicalSrcIdx = 115;
                    section.data(104).dtTransOffset = 195;

                    ;% controller14_B.w
                    section.data(105).logicalSrcIdx = 116;
                    section.data(105).dtTransOffset = 196;

                    ;% controller14_B.torque_thrust
                    section.data(106).logicalSrcIdx = 118;
                    section.data(106).dtTransOffset = 199;

                    ;% controller14_B.ext_torque_hat
                    section.data(107).logicalSrcIdx = 125;
                    section.data(107).dtTransOffset = 203;

                    ;% controller14_B.omega_hat
                    section.data(108).logicalSrcIdx = 126;
                    section.data(108).dtTransOffset = 205;

                    ;% controller14_B.torque_x
                    section.data(109).logicalSrcIdx = 127;
                    section.data(109).dtTransOffset = 207;

                    ;% controller14_B.torque_y
                    section.data(110).logicalSrcIdx = 128;
                    section.data(110).dtTransOffset = 208;

                    ;% controller14_B.torque_z
                    section.data(111).logicalSrcIdx = 129;
                    section.data(111).dtTransOffset = 209;

                    ;% controller14_B.F
                    section.data(112).logicalSrcIdx = 130;
                    section.data(112).dtTransOffset = 210;

                    ;% controller14_B.torque_gyro_x
                    section.data(113).logicalSrcIdx = 131;
                    section.data(113).dtTransOffset = 211;

                    ;% controller14_B.torque_gyro_y
                    section.data(114).logicalSrcIdx = 132;
                    section.data(114).dtTransOffset = 212;

                    ;% controller14_B.att_e
                    section.data(115).logicalSrcIdx = 133;
                    section.data(115).dtTransOffset = 213;

                    ;% controller14_B.alt_e
                    section.data(116).logicalSrcIdx = 134;
                    section.data(116).dtTransOffset = 216;

                    ;% controller14_B.state
                    section.data(117).logicalSrcIdx = 135;
                    section.data(117).dtTransOffset = 217;

                    ;% controller14_B.R33
                    section.data(118).logicalSrcIdx = 136;
                    section.data(118).dtTransOffset = 218;

                    ;% controller14_B.eulx
                    section.data(119).logicalSrcIdx = 137;
                    section.data(119).dtTransOffset = 219;

                    ;% controller14_B.eulZYX
                    section.data(120).logicalSrcIdx = 138;
                    section.data(120).dtTransOffset = 220;

                    ;% controller14_B.rd
                    section.data(121).logicalSrcIdx = 139;
                    section.data(121).dtTransOffset = 223;

                    ;% controller14_B.rd_d
                    section.data(122).logicalSrcIdx = 140;
                    section.data(122).dtTransOffset = 226;

                    ;% controller14_B.init_r_out
                    section.data(123).logicalSrcIdx = 144;
                    section.data(123).dtTransOffset = 229;

                    ;% controller14_B.id_out
                    section.data(124).logicalSrcIdx = 145;
                    section.data(124).dtTransOffset = 232;

                    ;% controller14_B.rotm
                    section.data(125).logicalSrcIdx = 146;
                    section.data(125).dtTransOffset = 233;

                    ;% controller14_B.DigitalFilter_o
                    section.data(126).logicalSrcIdx = 147;
                    section.data(126).dtTransOffset = 242;

                    ;% controller14_B.DigitalFilter_ne
                    section.data(127).logicalSrcIdx = 148;
                    section.data(127).dtTransOffset = 245;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.PacketInput1_o1
                    section.data(1).logicalSrcIdx = 149;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% controller14_B.PacketInput3_o1
                    section.data(1).logicalSrcIdx = 150;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.UDPuint162
                    section.data(2).logicalSrcIdx = 151;
                    section.data(2).dtTransOffset = 11;

                    ;% controller14_B.UDPuint163
                    section.data(3).logicalSrcIdx = 152;
                    section.data(3).dtTransOffset = 12;

                    ;% controller14_B.UDPuint164
                    section.data(4).logicalSrcIdx = 153;
                    section.data(4).dtTransOffset = 13;

                    ;% controller14_B.Switch_b
                    section.data(5).logicalSrcIdx = 154;
                    section.data(5).dtTransOffset = 14;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.Compare
                    section.data(1).logicalSrcIdx = 156;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.Compare_c
                    section.data(1).logicalSrcIdx = 157;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.CoordinateTransformationConversion_pn.CoordinateTransformationConversion
                    section.data(1).logicalSrcIdx = 158;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.CoordinateTransformationConversion_p.CoordinateTransformationConversion
                    section.data(1).logicalSrcIdx = 159;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix_p.R
                    section.data(1).logicalSrcIdx = 162;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem_d.In1
                    section.data(1).logicalSrcIdx = 163;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay
                    section.data(2).logicalSrcIdx = 164;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem_d.In2
                    section.data(3).logicalSrcIdx = 165;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay1
                    section.data(4).logicalSrcIdx = 166;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix.R
                    section.data(1).logicalSrcIdx = 167;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem.In1
                    section.data(1).logicalSrcIdx = 168;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay
                    section.data(2).logicalSrcIdx = 169;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem.In2
                    section.data(3).logicalSrcIdx = 170;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay1
                    section.data(4).logicalSrcIdx = 171;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_m.output
                    section.data(1).logicalSrcIdx = 172;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_k.output
                    section.data(1).logicalSrcIdx = 173;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_oq.output
                    section.data(1).logicalSrcIdx = 174;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_lw.output
                    section.data(1).logicalSrcIdx = 175;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_b.output
                    section.data(1).logicalSrcIdx = 176;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_l.output
                    section.data(1).logicalSrcIdx = 177;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_o.output
                    section.data(1).logicalSrcIdx = 178;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_i.output
                    section.data(1).logicalSrcIdx = 179;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(19) = section;
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
        nTotSects     = 55;
        sectIdxOffset = 19;

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
            section.nData     = 96;
            section.data(96)  = dumData; %prealloc

                    ;% controller14_DW.SaturatingRamp_DSTATE
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.RampUpOrDown_DSTATE
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.omegat1_DSTATE
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.Delay_DSTATE
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.Delay1_DSTATE
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.Delay1_DSTATE_f
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 6;

                    ;% controller14_DW.time1_DSTATE
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 7;

                    ;% controller14_DW.MemoryX_DSTATE
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 8;

                    ;% controller14_DW.DigitalFilter_FILT_STATES
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 10;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_k
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 16;

                    ;% controller14_DW.time_DSTATE
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 22;

                    ;% controller14_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 23;

                    ;% controller14_DW.Delay2_DSTATE
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 25;

                    ;% controller14_DW.Delay1_DSTATE_e
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 29;

                    ;% controller14_DW.Delay_DSTATE_n
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 30;

                    ;% controller14_DW.time_DSTATE_l
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 31;

                    ;% controller14_DW.time_DSTATE_m
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 32;

                    ;% controller14_DW.Delay1_DSTATE_d
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 33;

                    ;% controller14_DW.Delay_DSTATE_b
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 36;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_e
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 37;

                    ;% controller14_DW.Delay_DSTATE_e
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 43;

                    ;% controller14_DW.Delay2_DSTATE_i
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 45;

                    ;% controller14_DW.time_DSTATE_k
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 49;

                    ;% controller14_DW.Delay_DSTATE_a
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 50;

                    ;% controller14_DW.Delay2_DSTATE_k
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 51;

                    ;% controller14_DW.Delay3_DSTATE
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 52;

                    ;% controller14_DW.Delay2_DSTATE_c
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 53;

                    ;% controller14_DW.SaturatingRamp_DSTATE_n
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 54;

                    ;% controller14_DW.RampUpOrDown_DSTATE_a
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 55;

                    ;% controller14_DW.omegat1_DSTATE_l
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 56;

                    ;% controller14_DW.Delay_DSTATE_h
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 57;

                    ;% controller14_DW.Delay1_DSTATE_k
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 58;

                    ;% controller14_DW.Delay2_DSTATE_cc
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 60;

                    ;% controller14_DW.SaturatingRamp_DSTATE_o
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 61;

                    ;% controller14_DW.RampUpOrDown_DSTATE_j
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 62;

                    ;% controller14_DW.omegat1_DSTATE_h
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 63;

                    ;% controller14_DW.Delay_DSTATE_i
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 64;

                    ;% controller14_DW.Delay1_DSTATE_a
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 65;

                    ;% controller14_DW.Delay2_DSTATE_l
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 67;

                    ;% controller14_DW.SaturatingRamp_DSTATE_e
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 68;

                    ;% controller14_DW.RampUpOrDown_DSTATE_d
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 69;

                    ;% controller14_DW.omegat1_DSTATE_f
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 70;

                    ;% controller14_DW.Delay_DSTATE_o
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 71;

                    ;% controller14_DW.Delay1_DSTATE_ka
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 72;

                    ;% controller14_DW.Delay2_DSTATE_d
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 74;

                    ;% controller14_DW.Delay1_DSTATE_l
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 75;

                    ;% controller14_DW.Delay_DSTATE_p
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 77;

                    ;% controller14_DW.DiscreteTimeIntegrator_DSTATE_a
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 81;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_c
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 85;

                    ;% controller14_DW.omegat_DSTATE
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 93;

                    ;% controller14_DW.Delay_DSTATE_at
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 94;

                    ;% controller14_DW.Delay1_DSTATE_b
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 95;

                    ;% controller14_DW.Delay2_DSTATE_g
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 97;

                    ;% controller14_DW.omegat_DSTATE_p
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 98;

                    ;% controller14_DW.Delay_DSTATE_l
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 99;

                    ;% controller14_DW.Delay1_DSTATE_l3
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 100;

                    ;% controller14_DW.Delay2_DSTATE_a
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 102;

                    ;% controller14_DW.omegat_DSTATE_l
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 103;

                    ;% controller14_DW.Delay_DSTATE_nh
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 104;

                    ;% controller14_DW.Delay1_DSTATE_j
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 105;

                    ;% controller14_DW.Delay2_DSTATE_o
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 107;

                    ;% controller14_DW.omegat_DSTATE_d
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 108;

                    ;% controller14_DW.Delay_DSTATE_f
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 109;

                    ;% controller14_DW.Delay1_DSTATE_el
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 110;

                    ;% controller14_DW.Delay2_DSTATE_lc
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 112;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_a
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 113;

                    ;% controller14_DW.Delay_DSTATE_m
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 117;

                    ;% controller14_DW.UnitDelay_DSTATE
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 126;

                    ;% controller14_DW.UnitDelay1_DSTATE
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 135;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 136;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_o
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 139;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_c
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 142;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_e
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 145;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_j
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 149;

                    ;% controller14_DW.RateTransition1_Buffer0
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 151;

                    ;% controller14_DW.time
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 152;

                    ;% controller14_DW.time_i
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 153;

                    ;% controller14_DW.rgf_constant
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 154;

                    ;% controller14_DW.time_g
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 155;

                    ;% controller14_DW.x_hat_old
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 156;

                    ;% controller14_DW.v_old
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 158;

                    ;% controller14_DW.time_k
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 161;

                    ;% controller14_DW.z_zero_count
                    section.data(83).logicalSrcIdx = 82;
                    section.data(83).dtTransOffset = 162;

                    ;% controller14_DW.R_old
                    section.data(84).logicalSrcIdx = 83;
                    section.data(84).dtTransOffset = 163;

                    ;% controller14_DW.R_dot_old
                    section.data(85).logicalSrcIdx = 84;
                    section.data(85).dtTransOffset = 172;

                    ;% controller14_DW.dt
                    section.data(86).logicalSrcIdx = 85;
                    section.data(86).dtTransOffset = 181;

                    ;% controller14_DW.id
                    section.data(87).logicalSrcIdx = 86;
                    section.data(87).dtTransOffset = 182;

                    ;% controller14_DW.som_state
                    section.data(88).logicalSrcIdx = 87;
                    section.data(88).dtTransOffset = 183;

                    ;% controller14_DW.t_fall
                    section.data(89).logicalSrcIdx = 88;
                    section.data(89).dtTransOffset = 184;

                    ;% controller14_DW.t_dec
                    section.data(90).logicalSrcIdx = 89;
                    section.data(90).dtTransOffset = 185;

                    ;% controller14_DW.z_setpoint
                    section.data(91).logicalSrcIdx = 90;
                    section.data(91).dtTransOffset = 186;

                    ;% controller14_DW.t_hover
                    section.data(92).logicalSrcIdx = 91;
                    section.data(92).dtTransOffset = 187;

                    ;% controller14_DW.t_rot_acc
                    section.data(93).logicalSrcIdx = 92;
                    section.data(93).dtTransOffset = 188;

                    ;% controller14_DW.t_safe
                    section.data(94).logicalSrcIdx = 93;
                    section.data(94).dtTransOffset = 189;

                    ;% controller14_DW.id_m
                    section.data(95).logicalSrcIdx = 94;
                    section.data(95).dtTransOffset = 190;

                    ;% controller14_DW.init_r
                    section.data(96).logicalSrcIdx = 95;
                    section.data(96).dtTransOffset = 191;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 31;
            section.data(31)  = dumData; %prealloc

                    ;% controller14_DW.PacketOutput_PWORK
                    section.data(1).logicalSrcIdx = 96;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.PacketInput3_PWORK
                    section.data(2).logicalSrcIdx = 97;
                    section.data(2).dtTransOffset = 2;

                    ;% controller14_DW.PacketInput1_PWORK
                    section.data(3).logicalSrcIdx = 98;
                    section.data(3).dtTransOffset = 3;

                    ;% controller14_DW.highdrivingsignal_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 99;
                    section.data(4).dtTransOffset = 4;

                    ;% controller14_DW.allstates_PWORK.LoggedData
                    section.data(5).logicalSrcIdx = 100;
                    section.data(5).dtTransOffset = 5;

                    ;% controller14_DW.pvsp_des_PWORK.LoggedData
                    section.data(6).logicalSrcIdx = 101;
                    section.data(6).dtTransOffset = 9;

                    ;% controller14_DW.unsatthrust_PWORK.LoggedData
                    section.data(7).logicalSrcIdx = 102;
                    section.data(7).dtTransOffset = 11;

                    ;% controller14_DW.unsattorque_PWORK.LoggedData
                    section.data(8).logicalSrcIdx = 103;
                    section.data(8).dtTransOffset = 12;

                    ;% controller14_DW.Scope_PWORK.LoggedData
                    section.data(9).logicalSrcIdx = 104;
                    section.data(9).dtTransOffset = 15;

                    ;% controller14_DW.R33_PWORK.LoggedData
                    section.data(10).logicalSrcIdx = 105;
                    section.data(10).dtTransOffset = 17;

                    ;% controller14_DW.eulZXY_PWORK.LoggedData
                    section.data(11).logicalSrcIdx = 106;
                    section.data(11).dtTransOffset = 18;

                    ;% controller14_DW.euly_PWORK.LoggedData
                    section.data(12).logicalSrcIdx = 107;
                    section.data(12).dtTransOffset = 19;

                    ;% controller14_DW.ext_torque_PWORK.LoggedData
                    section.data(13).logicalSrcIdx = 108;
                    section.data(13).dtTransOffset = 20;

                    ;% controller14_DW.gyro_PWORK.LoggedData
                    section.data(14).logicalSrcIdx = 109;
                    section.data(14).dtTransOffset = 21;

                    ;% controller14_DW.somstate_PWORK.LoggedData
                    section.data(15).logicalSrcIdx = 110;
                    section.data(15).dtTransOffset = 23;

                    ;% controller14_DW.intthrust_PWORK.LoggedData
                    section.data(16).logicalSrcIdx = 111;
                    section.data(16).dtTransOffset = 24;

                    ;% controller14_DW.inttorque_PWORK.LoggedData
                    section.data(17).logicalSrcIdx = 112;
                    section.data(17).dtTransOffset = 25;

                    ;% controller14_DW.Scope_PWORK_h.LoggedData
                    section.data(18).logicalSrcIdx = 113;
                    section.data(18).dtTransOffset = 26;

                    ;% controller14_DW.p_PWORK.LoggedData
                    section.data(19).logicalSrcIdx = 114;
                    section.data(19).dtTransOffset = 28;

                    ;% controller14_DW.p_dot_PWORK.LoggedData
                    section.data(20).logicalSrcIdx = 115;
                    section.data(20).dtTransOffset = 29;

                    ;% controller14_DW.p_dot_xy_compare_PWORK.LoggedData
                    section.data(21).logicalSrcIdx = 116;
                    section.data(21).dtTransOffset = 30;

                    ;% controller14_DW.p_xy_compare_PWORK.LoggedData
                    section.data(22).logicalSrcIdx = 117;
                    section.data(22).dtTransOffset = 34;

                    ;% controller14_DW.safetyprobe_PWORK.LoggedData
                    section.data(23).logicalSrcIdx = 118;
                    section.data(23).dtTransOffset = 36;

                    ;% controller14_DW.sensor_omega_PWORK.LoggedData
                    section.data(24).logicalSrcIdx = 119;
                    section.data(24).dtTransOffset = 40;

                    ;% controller14_DW.z_compare_PWORK.LoggedData
                    section.data(25).logicalSrcIdx = 120;
                    section.data(25).dtTransOffset = 43;

                    ;% controller14_DW.z_dot_compare_PWORK.LoggedData
                    section.data(26).logicalSrcIdx = 121;
                    section.data(26).dtTransOffset = 47;

                    ;% controller14_DW.Scope2_PWORK.LoggedData
                    section.data(27).logicalSrcIdx = 122;
                    section.data(27).dtTransOffset = 50;

                    ;% controller14_DW.Scope10_PWORK.LoggedData
                    section.data(28).logicalSrcIdx = 123;
                    section.data(28).dtTransOffset = 51;

                    ;% controller14_DW.Scope7_PWORK.LoggedData
                    section.data(29).logicalSrcIdx = 124;
                    section.data(29).dtTransOffset = 52;

                    ;% controller14_DW.Scope9_PWORK.LoggedData
                    section.data(30).logicalSrcIdx = 125;
                    section.data(30).dtTransOffset = 53;

                    ;% controller14_DW.voltages_PWORK.LoggedData
                    section.data(31).logicalSrcIdx = 126;
                    section.data(31).dtTransOffset = 54;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 25;
            section.data(25)  = dumData; %prealloc

                    ;% controller14_DW.sfEvent
                    section.data(1).logicalSrcIdx = 127;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.sfEvent_j
                    section.data(2).logicalSrcIdx = 128;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.sfEvent_o
                    section.data(3).logicalSrcIdx = 129;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.sfEvent_n
                    section.data(4).logicalSrcIdx = 130;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.sfEvent_a
                    section.data(5).logicalSrcIdx = 131;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.sfEvent_e
                    section.data(6).logicalSrcIdx = 132;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.sfEvent_c
                    section.data(7).logicalSrcIdx = 133;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.sfEvent_p
                    section.data(8).logicalSrcIdx = 134;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.sfEvent_oo
                    section.data(9).logicalSrcIdx = 135;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.sfEvent_ep
                    section.data(10).logicalSrcIdx = 136;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.sfEvent_k
                    section.data(11).logicalSrcIdx = 137;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.sfEvent_on
                    section.data(12).logicalSrcIdx = 138;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.sfEvent_f
                    section.data(13).logicalSrcIdx = 139;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.sfEvent_g
                    section.data(14).logicalSrcIdx = 140;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.sfEvent_onc
                    section.data(15).logicalSrcIdx = 141;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.sfEvent_ck
                    section.data(16).logicalSrcIdx = 142;
                    section.data(16).dtTransOffset = 15;

                    ;% controller14_DW.sfEvent_jm
                    section.data(17).logicalSrcIdx = 143;
                    section.data(17).dtTransOffset = 16;

                    ;% controller14_DW.sfEvent_c2
                    section.data(18).logicalSrcIdx = 144;
                    section.data(18).dtTransOffset = 17;

                    ;% controller14_DW.sfEvent_af
                    section.data(19).logicalSrcIdx = 145;
                    section.data(19).dtTransOffset = 18;

                    ;% controller14_DW.sfEvent_l
                    section.data(20).logicalSrcIdx = 146;
                    section.data(20).dtTransOffset = 19;

                    ;% controller14_DW.sfEvent_en
                    section.data(21).logicalSrcIdx = 147;
                    section.data(21).dtTransOffset = 20;

                    ;% controller14_DW.sfEvent_am
                    section.data(22).logicalSrcIdx = 148;
                    section.data(22).dtTransOffset = 21;

                    ;% controller14_DW.sfEvent_ez
                    section.data(23).logicalSrcIdx = 149;
                    section.data(23).dtTransOffset = 22;

                    ;% controller14_DW.sfEvent_an
                    section.data(24).logicalSrcIdx = 150;
                    section.data(24).dtTransOffset = 23;

                    ;% controller14_DW.sfEvent_i
                    section.data(25).logicalSrcIdx = 151;
                    section.data(25).dtTransOffset = 24;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.obj
                    section.data(1).logicalSrcIdx = 152;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.obj_p
                    section.data(2).logicalSrcIdx = 153;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% controller14_DW.DiscreteTimeIntegrator_PrevResetState
                    section.data(1).logicalSrcIdx = 154;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.EnabledSubsystem_SubsysRanBC
                    section.data(2).logicalSrcIdx = 155;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.MeasurementUpdate_SubsysRanBC
                    section.data(3).logicalSrcIdx = 156;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.TriggeredSubsystem_SubsysRanBC
                    section.data(4).logicalSrcIdx = 157;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.IfActionSubsystem_SubsysRanBC
                    section.data(5).logicalSrcIdx = 158;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(6).logicalSrcIdx = 159;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 25;
            section.data(25)  = dumData; %prealloc

                    ;% controller14_DW.is_active_c31_controller14
                    section.data(1).logicalSrcIdx = 160;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.is_active_c34_controller14
                    section.data(2).logicalSrcIdx = 161;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.is_active_c16_controller14
                    section.data(3).logicalSrcIdx = 162;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.is_active_c35_controller14
                    section.data(4).logicalSrcIdx = 163;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.is_active_c27_controller14
                    section.data(5).logicalSrcIdx = 164;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.is_active_c26_controller14
                    section.data(6).logicalSrcIdx = 165;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.is_active_c7_ctrlSharedLib
                    section.data(7).logicalSrcIdx = 166;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.is_active_c21_controller14
                    section.data(8).logicalSrcIdx = 167;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.is_active_c22_controller14
                    section.data(9).logicalSrcIdx = 168;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.is_active_c29_controller14
                    section.data(10).logicalSrcIdx = 169;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.is_active_c33_controller14
                    section.data(11).logicalSrcIdx = 170;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.is_active_c19_controller14
                    section.data(12).logicalSrcIdx = 171;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.is_active_c25_controller14
                    section.data(13).logicalSrcIdx = 172;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.is_active_c24_controller14
                    section.data(14).logicalSrcIdx = 173;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.is_active_c28_controller14
                    section.data(15).logicalSrcIdx = 174;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.is_active_c23_controller14
                    section.data(16).logicalSrcIdx = 175;
                    section.data(16).dtTransOffset = 15;

                    ;% controller14_DW.is_active_c17_controller14
                    section.data(17).logicalSrcIdx = 176;
                    section.data(17).dtTransOffset = 16;

                    ;% controller14_DW.is_active_c18_controller14
                    section.data(18).logicalSrcIdx = 177;
                    section.data(18).dtTransOffset = 17;

                    ;% controller14_DW.is_active_c20_controller14
                    section.data(19).logicalSrcIdx = 178;
                    section.data(19).dtTransOffset = 18;

                    ;% controller14_DW.is_active_c7_controller14
                    section.data(20).logicalSrcIdx = 179;
                    section.data(20).dtTransOffset = 19;

                    ;% controller14_DW.is_active_c96_controller14
                    section.data(21).logicalSrcIdx = 180;
                    section.data(21).dtTransOffset = 20;

                    ;% controller14_DW.is_active_c10_controller14
                    section.data(22).logicalSrcIdx = 181;
                    section.data(22).dtTransOffset = 21;

                    ;% controller14_DW.is_active_c71_controller14
                    section.data(23).logicalSrcIdx = 182;
                    section.data(23).dtTransOffset = 22;

                    ;% controller14_DW.is_active_c52_controller14
                    section.data(24).logicalSrcIdx = 183;
                    section.data(24).dtTransOffset = 23;

                    ;% controller14_DW.is_active_c46_controller14
                    section.data(25).logicalSrcIdx = 184;
                    section.data(25).dtTransOffset = 24;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 51;
            section.data(51)  = dumData; %prealloc

                    ;% controller14_DW.icLoad
                    section.data(1).logicalSrcIdx = 185;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.doneDoubleBufferReInit
                    section.data(2).logicalSrcIdx = 186;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.doneDoubleBufferReInit_n
                    section.data(3).logicalSrcIdx = 187;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.objisempty
                    section.data(4).logicalSrcIdx = 188;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.doneDoubleBufferReInit_f
                    section.data(5).logicalSrcIdx = 189;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.time_not_empty
                    section.data(6).logicalSrcIdx = 190;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.doneDoubleBufferReInit_nu
                    section.data(7).logicalSrcIdx = 191;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.time_not_empty_j
                    section.data(8).logicalSrcIdx = 192;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.rgf_constant_not_empty
                    section.data(9).logicalSrcIdx = 193;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.doneDoubleBufferReInit_b
                    section.data(10).logicalSrcIdx = 194;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.time_not_empty_f
                    section.data(11).logicalSrcIdx = 195;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.x_hat_old_not_empty
                    section.data(12).logicalSrcIdx = 196;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.doneDoubleBufferReInit_d
                    section.data(13).logicalSrcIdx = 197;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.doneDoubleBufferReInit_e
                    section.data(14).logicalSrcIdx = 198;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.doneDoubleBufferReInit_dy
                    section.data(15).logicalSrcIdx = 199;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.doneDoubleBufferReInit_dl
                    section.data(16).logicalSrcIdx = 200;
                    section.data(16).dtTransOffset = 15;

                    ;% controller14_DW.doneDoubleBufferReInit_i
                    section.data(17).logicalSrcIdx = 201;
                    section.data(17).dtTransOffset = 16;

                    ;% controller14_DW.doneDoubleBufferReInit_m
                    section.data(18).logicalSrcIdx = 202;
                    section.data(18).dtTransOffset = 17;

                    ;% controller14_DW.v_old_not_empty
                    section.data(19).logicalSrcIdx = 203;
                    section.data(19).dtTransOffset = 18;

                    ;% controller14_DW.time_not_empty_k
                    section.data(20).logicalSrcIdx = 204;
                    section.data(20).dtTransOffset = 19;

                    ;% controller14_DW.doneDoubleBufferReInit_l
                    section.data(21).logicalSrcIdx = 205;
                    section.data(21).dtTransOffset = 20;

                    ;% controller14_DW.doneDoubleBufferReInit_k
                    section.data(22).logicalSrcIdx = 206;
                    section.data(22).dtTransOffset = 21;

                    ;% controller14_DW.doneDoubleBufferReInit_p
                    section.data(23).logicalSrcIdx = 207;
                    section.data(23).dtTransOffset = 22;

                    ;% controller14_DW.doneDoubleBufferReInit_nf
                    section.data(24).logicalSrcIdx = 208;
                    section.data(24).dtTransOffset = 23;

                    ;% controller14_DW.z_zero_count_not_empty
                    section.data(25).logicalSrcIdx = 209;
                    section.data(25).dtTransOffset = 24;

                    ;% controller14_DW.doneDoubleBufferReInit_d3
                    section.data(26).logicalSrcIdx = 210;
                    section.data(26).dtTransOffset = 25;

                    ;% controller14_DW.doneDoubleBufferReInit_fg
                    section.data(27).logicalSrcIdx = 211;
                    section.data(27).dtTransOffset = 26;

                    ;% controller14_DW.doneDoubleBufferReInit_fc
                    section.data(28).logicalSrcIdx = 212;
                    section.data(28).dtTransOffset = 27;

                    ;% controller14_DW.R_old_not_empty
                    section.data(29).logicalSrcIdx = 213;
                    section.data(29).dtTransOffset = 28;

                    ;% controller14_DW.R_dot_old_not_empty
                    section.data(30).logicalSrcIdx = 214;
                    section.data(30).dtTransOffset = 29;

                    ;% controller14_DW.dt_not_empty
                    section.data(31).logicalSrcIdx = 215;
                    section.data(31).dtTransOffset = 30;

                    ;% controller14_DW.doneDoubleBufferReInit_l5
                    section.data(32).logicalSrcIdx = 216;
                    section.data(32).dtTransOffset = 31;

                    ;% controller14_DW.doneDoubleBufferReInit_o
                    section.data(33).logicalSrcIdx = 217;
                    section.data(33).dtTransOffset = 32;

                    ;% controller14_DW.doneDoubleBufferReInit_ns
                    section.data(34).logicalSrcIdx = 218;
                    section.data(34).dtTransOffset = 33;

                    ;% controller14_DW.doneDoubleBufferReInit_ps
                    section.data(35).logicalSrcIdx = 219;
                    section.data(35).dtTransOffset = 34;

                    ;% controller14_DW.doneDoubleBufferReInit_dn
                    section.data(36).logicalSrcIdx = 220;
                    section.data(36).dtTransOffset = 35;

                    ;% controller14_DW.doneDoubleBufferReInit_n2
                    section.data(37).logicalSrcIdx = 221;
                    section.data(37).dtTransOffset = 36;

                    ;% controller14_DW.id_not_empty
                    section.data(38).logicalSrcIdx = 222;
                    section.data(38).dtTransOffset = 37;

                    ;% controller14_DW.som_state_not_empty
                    section.data(39).logicalSrcIdx = 223;
                    section.data(39).dtTransOffset = 38;

                    ;% controller14_DW.t_fall_not_empty
                    section.data(40).logicalSrcIdx = 224;
                    section.data(40).dtTransOffset = 39;

                    ;% controller14_DW.t_dec_not_empty
                    section.data(41).logicalSrcIdx = 225;
                    section.data(41).dtTransOffset = 40;

                    ;% controller14_DW.z_setpoint_not_empty
                    section.data(42).logicalSrcIdx = 226;
                    section.data(42).dtTransOffset = 41;

                    ;% controller14_DW.t_hover_not_empty
                    section.data(43).logicalSrcIdx = 227;
                    section.data(43).dtTransOffset = 42;

                    ;% controller14_DW.t_rot_acc_not_empty
                    section.data(44).logicalSrcIdx = 228;
                    section.data(44).dtTransOffset = 43;

                    ;% controller14_DW.t_safe_not_empty
                    section.data(45).logicalSrcIdx = 229;
                    section.data(45).dtTransOffset = 44;

                    ;% controller14_DW.doneDoubleBufferReInit_ib
                    section.data(46).logicalSrcIdx = 230;
                    section.data(46).dtTransOffset = 45;

                    ;% controller14_DW.id_not_empty_f
                    section.data(47).logicalSrcIdx = 231;
                    section.data(47).dtTransOffset = 46;

                    ;% controller14_DW.init_r_not_empty
                    section.data(48).logicalSrcIdx = 232;
                    section.data(48).dtTransOffset = 47;

                    ;% controller14_DW.objisempty_g
                    section.data(49).logicalSrcIdx = 233;
                    section.data(49).dtTransOffset = 48;

                    ;% controller14_DW.EnabledSubsystem_MODE
                    section.data(50).logicalSrcIdx = 234;
                    section.data(50).dtTransOffset = 49;

                    ;% controller14_DW.MeasurementUpdate_MODE
                    section.data(51).logicalSrcIdx = 235;
                    section.data(51).dtTransOffset = 50;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.CoordinateTransformationConversion_pn.obj
                    section.data(1).logicalSrcIdx = 236;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.CoordinateTransformationConversion_pn.objisempty
                    section.data(1).logicalSrcIdx = 237;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.CoordinateTransformationConversion_p.obj
                    section.data(1).logicalSrcIdx = 238;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.CoordinateTransformationConversion_p.objisempty
                    section.data(1).logicalSrcIdx = 239;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.sfEvent
                    section.data(1).logicalSrcIdx = 240;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 241;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 242;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.sfEvent
                    section.data(1).logicalSrcIdx = 243;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 244;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 245;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.sfEvent
                    section.data(1).logicalSrcIdx = 246;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.is_active_c15_controller14
                    section.data(1).logicalSrcIdx = 247;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 248;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(20) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 249;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 250;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(21) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 251;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(22) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem_m.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 252;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(23) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1_i.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 253;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(24) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.sfEvent
                    section.data(1).logicalSrcIdx = 254;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(25) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.is_active_c15_controller14
                    section.data(1).logicalSrcIdx = 255;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(26) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 256;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(27) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 257;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 258;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(28) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 259;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(29) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 260;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(30) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 261;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(31) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.sfEvent
                    section.data(1).logicalSrcIdx = 262;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(32) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 263;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(33) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 264;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(34) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.sfEvent
                    section.data(1).logicalSrcIdx = 265;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(35) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 266;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(36) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 267;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(37) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.sfEvent
                    section.data(1).logicalSrcIdx = 268;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(38) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 269;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(39) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 270;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(40) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.sfEvent
                    section.data(1).logicalSrcIdx = 271;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(41) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 272;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(42) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 273;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(43) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.sfEvent
                    section.data(1).logicalSrcIdx = 274;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(44) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 275;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(45) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 276;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(46) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.sfEvent
                    section.data(1).logicalSrcIdx = 277;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(47) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 278;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(48) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 279;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(49) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_o.sfEvent
                    section.data(1).logicalSrcIdx = 280;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(50) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_o.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 281;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(51) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_o.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 282;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(52) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.sfEvent
                    section.data(1).logicalSrcIdx = 283;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(53) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 284;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(54) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 285;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(55) = section;
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


    targMap.checksum0 = 1146310629;
    targMap.checksum1 = 2735867042;
    targMap.checksum2 = 691307083;
    targMap.checksum3 = 3161261877;

