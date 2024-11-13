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
        nTotSects     = 20;
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
            section.nData     = 120;
            section.data(120)  = dumData; %prealloc

                    ;% controller14_B.SaturatingRamp
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.Sqrt
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.Gain5
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.Normalization
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 14;

                    ;% controller14_B.Reshape
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 18;

                    ;% controller14_B.Gain
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 21;

                    ;% controller14_B.Switch
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 24;

                    ;% controller14_B.ZeroOrderHold1
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 30;

                    ;% controller14_B.ZeroOrderHold3
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 31;

                    ;% controller14_B.ZeroOrderHold4
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 32;

                    ;% controller14_B.ZeroOrderHold5
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 33;

                    ;% controller14_B.ZeroOrderHold6
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 34;

                    ;% controller14_B.ZeroOrderHold7
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 35;

                    ;% controller14_B.ZeroOrderHold6_f
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 36;

                    ;% controller14_B.p_raw
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 37;

                    ;% controller14_B.ZeroOrderHold3_j
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 40;

                    ;% controller14_B.Merge
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 43;

                    ;% controller14_B.p_dot
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 46;

                    ;% controller14_B.ZeroOrderHold4_c
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 49;

                    ;% controller14_B.p_dotdot
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 52;

                    ;% controller14_B.p_dotdot_a
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 55;

                    ;% controller14_B.ZeroOrderHold5_a
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 58;

                    ;% controller14_B.ZeroOrderHold2
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 61;

                    ;% controller14_B.p_raw_g
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 64;

                    ;% controller14_B.DigitalFilter
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 67;

                    ;% controller14_B.ZeroOrderHold1_b
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 70;

                    ;% controller14_B.Switch_j
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 73;

                    ;% controller14_B.Delay
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 76;

                    ;% controller14_B.Delay2
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 78;

                    ;% controller14_B.Saturation
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 82;

                    ;% controller14_B.NemoBee12
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 86;

                    ;% controller14_B.NemoBee6
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 87;

                    ;% controller14_B.NemoBee14
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 88;

                    ;% controller14_B.NemoBee10
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 89;

                    ;% controller14_B.Switch17
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 90;

                    ;% controller14_B.ComplextoRealImag_o1
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 91;

                    ;% controller14_B.Switch1
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 92;

                    ;% controller14_B.ComplextoRealImag1_o1
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 93;

                    ;% controller14_B.Switch2
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 94;

                    ;% controller14_B.ComplextoRealImag2_o1
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 95;

                    ;% controller14_B.Switch3
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 96;

                    ;% controller14_B.ComplextoRealImag3_o1
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 97;

                    ;% controller14_B.TmpSignalConversionAtDelay2Inport1
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 98;

                    ;% controller14_B.half1
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 102;

                    ;% controller14_B.Gain_e
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 106;

                    ;% controller14_B.Gain4
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 107;

                    ;% controller14_B.SaturatingRamp_d
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 108;

                    ;% controller14_B.Sqrt_b
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 109;

                    ;% controller14_B.Gain_m
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 110;

                    ;% controller14_B.Gain1
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 111;

                    ;% controller14_B.SaturatingRamp_f
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 112;

                    ;% controller14_B.Sqrt_g
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 113;

                    ;% controller14_B.Gain_c
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 114;

                    ;% controller14_B.Gain2
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 115;

                    ;% controller14_B.SaturatingRamp_j
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 116;

                    ;% controller14_B.Sqrt_l
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 117;

                    ;% controller14_B.Gain_i
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 118;

                    ;% controller14_B.Gain3
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 119;

                    ;% controller14_B.DiscreteTimeIntegrator
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 120;

                    ;% controller14_B.Product
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 124;

                    ;% controller14_B.Saturation6
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 128;

                    ;% controller14_B.Saturation7
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 129;

                    ;% controller14_B.Saturation8
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 130;

                    ;% controller14_B.Saturation9
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 131;

                    ;% controller14_B.TmpSignalConversionAtDigitalFilterInport1
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 132;

                    ;% controller14_B.DigitalFilter_j
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 136;

                    ;% controller14_B.Add
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 140;

                    ;% controller14_B.Add_i
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 141;

                    ;% controller14_B.upi
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 142;

                    ;% controller14_B.Gain1_b
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 143;

                    ;% controller14_B.upi1
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 144;

                    ;% controller14_B.upi_i
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 145;

                    ;% controller14_B.Gain1_c
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 146;

                    ;% controller14_B.Add_l
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 147;

                    ;% controller14_B.Add_a
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 148;

                    ;% controller14_B.upi1_p
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 149;

                    ;% controller14_B.upi_k
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 150;

                    ;% controller14_B.Gain1_d
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 151;

                    ;% controller14_B.Add_m
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 152;

                    ;% controller14_B.Add_f
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 153;

                    ;% controller14_B.upi1_k
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 154;

                    ;% controller14_B.upi_m
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 155;

                    ;% controller14_B.Gain1_j
                    section.data(83).logicalSrcIdx = 82;
                    section.data(83).dtTransOffset = 156;

                    ;% controller14_B.Add_p
                    section.data(84).logicalSrcIdx = 83;
                    section.data(84).dtTransOffset = 157;

                    ;% controller14_B.Add_mt
                    section.data(85).logicalSrcIdx = 84;
                    section.data(85).dtTransOffset = 158;

                    ;% controller14_B.upi1_a
                    section.data(86).logicalSrcIdx = 85;
                    section.data(86).dtTransOffset = 159;

                    ;% controller14_B.Reshape1
                    section.data(87).logicalSrcIdx = 86;
                    section.data(87).dtTransOffset = 160;

                    ;% controller14_B.p_raw_h
                    section.data(88).logicalSrcIdx = 87;
                    section.data(88).dtTransOffset = 163;

                    ;% controller14_B.DigitalFilter_f
                    section.data(89).logicalSrcIdx = 88;
                    section.data(89).dtTransOffset = 166;

                    ;% controller14_B.R
                    section.data(90).logicalSrcIdx = 90;
                    section.data(90).dtTransOffset = 169;

                    ;% controller14_B.UnitDelay
                    section.data(91).logicalSrcIdx = 91;
                    section.data(91).dtTransOffset = 178;

                    ;% controller14_B.In2
                    section.data(92).logicalSrcIdx = 92;
                    section.data(92).dtTransOffset = 187;

                    ;% controller14_B.UnitDelay1
                    section.data(93).logicalSrcIdx = 93;
                    section.data(93).dtTransOffset = 188;

                    ;% controller14_B.w
                    section.data(94).logicalSrcIdx = 94;
                    section.data(94).dtTransOffset = 189;

                    ;% controller14_B.en
                    section.data(95).logicalSrcIdx = 96;
                    section.data(95).dtTransOffset = 192;

                    ;% controller14_B.en_o
                    section.data(96).logicalSrcIdx = 97;
                    section.data(96).dtTransOffset = 193;

                    ;% controller14_B.en_out
                    section.data(97).logicalSrcIdx = 98;
                    section.data(97).dtTransOffset = 194;

                    ;% controller14_B.cum_out
                    section.data(98).logicalSrcIdx = 99;
                    section.data(98).dtTransOffset = 195;

                    ;% controller14_B.torque_thrust
                    section.data(99).logicalSrcIdx = 100;
                    section.data(99).dtTransOffset = 196;

                    ;% controller14_B.ext_torque_hat
                    section.data(100).logicalSrcIdx = 107;
                    section.data(100).dtTransOffset = 200;

                    ;% controller14_B.omega_hat
                    section.data(101).logicalSrcIdx = 108;
                    section.data(101).dtTransOffset = 202;

                    ;% controller14_B.torque_x
                    section.data(102).logicalSrcIdx = 109;
                    section.data(102).dtTransOffset = 204;

                    ;% controller14_B.torque_y
                    section.data(103).logicalSrcIdx = 110;
                    section.data(103).dtTransOffset = 205;

                    ;% controller14_B.torque_z
                    section.data(104).logicalSrcIdx = 111;
                    section.data(104).dtTransOffset = 206;

                    ;% controller14_B.F
                    section.data(105).logicalSrcIdx = 112;
                    section.data(105).dtTransOffset = 207;

                    ;% controller14_B.torque_gyro_x
                    section.data(106).logicalSrcIdx = 113;
                    section.data(106).dtTransOffset = 208;

                    ;% controller14_B.torque_gyro_y
                    section.data(107).logicalSrcIdx = 114;
                    section.data(107).dtTransOffset = 209;

                    ;% controller14_B.att_e
                    section.data(108).logicalSrcIdx = 115;
                    section.data(108).dtTransOffset = 210;

                    ;% controller14_B.alt_e
                    section.data(109).logicalSrcIdx = 116;
                    section.data(109).dtTransOffset = 213;

                    ;% controller14_B.state
                    section.data(110).logicalSrcIdx = 117;
                    section.data(110).dtTransOffset = 214;

                    ;% controller14_B.R33
                    section.data(111).logicalSrcIdx = 118;
                    section.data(111).dtTransOffset = 215;

                    ;% controller14_B.eulx
                    section.data(112).logicalSrcIdx = 119;
                    section.data(112).dtTransOffset = 216;

                    ;% controller14_B.eulZYX
                    section.data(113).logicalSrcIdx = 120;
                    section.data(113).dtTransOffset = 217;

                    ;% controller14_B.rd
                    section.data(114).logicalSrcIdx = 121;
                    section.data(114).dtTransOffset = 220;

                    ;% controller14_B.rd_d
                    section.data(115).logicalSrcIdx = 122;
                    section.data(115).dtTransOffset = 223;

                    ;% controller14_B.init_r_out
                    section.data(116).logicalSrcIdx = 126;
                    section.data(116).dtTransOffset = 226;

                    ;% controller14_B.id_out
                    section.data(117).logicalSrcIdx = 127;
                    section.data(117).dtTransOffset = 229;

                    ;% controller14_B.rotm
                    section.data(118).logicalSrcIdx = 128;
                    section.data(118).dtTransOffset = 230;

                    ;% controller14_B.DigitalFilter_o
                    section.data(119).logicalSrcIdx = 129;
                    section.data(119).dtTransOffset = 239;

                    ;% controller14_B.DigitalFilter_n
                    section.data(120).logicalSrcIdx = 130;
                    section.data(120).dtTransOffset = 242;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.PacketInput1_o1
                    section.data(1).logicalSrcIdx = 131;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% controller14_B.PacketInput3_o1
                    section.data(1).logicalSrcIdx = 132;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.UDPuint162
                    section.data(2).logicalSrcIdx = 133;
                    section.data(2).dtTransOffset = 4;

                    ;% controller14_B.UDPuint163
                    section.data(3).logicalSrcIdx = 134;
                    section.data(3).dtTransOffset = 5;

                    ;% controller14_B.UDPuint164
                    section.data(4).logicalSrcIdx = 135;
                    section.data(4).dtTransOffset = 6;

                    ;% controller14_B.Switch_b
                    section.data(5).logicalSrcIdx = 136;
                    section.data(5).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% controller14_B.Compare
                    section.data(1).logicalSrcIdx = 137;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.envelope
                    section.data(2).logicalSrcIdx = 138;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.flip
                    section.data(3).logicalSrcIdx = 139;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.voltage
                    section.data(4).logicalSrcIdx = 140;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_B.Gain9
                    section.data(5).logicalSrcIdx = 141;
                    section.data(5).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.dataready
                    section.data(1).logicalSrcIdx = 142;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix3_j.w
                    section.data(1).logicalSrcIdx = 143;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix2_b.w
                    section.data(1).logicalSrcIdx = 144;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix_p.R
                    section.data(1).logicalSrcIdx = 145;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem_d.In1
                    section.data(1).logicalSrcIdx = 146;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay
                    section.data(2).logicalSrcIdx = 147;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem_d.In2
                    section.data(3).logicalSrcIdx = 148;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay1
                    section.data(4).logicalSrcIdx = 149;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix2.w
                    section.data(1).logicalSrcIdx = 150;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix.R
                    section.data(1).logicalSrcIdx = 151;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem.In1
                    section.data(1).logicalSrcIdx = 152;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay
                    section.data(2).logicalSrcIdx = 153;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem.In2
                    section.data(3).logicalSrcIdx = 154;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay1
                    section.data(4).logicalSrcIdx = 155;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_m.output
                    section.data(1).logicalSrcIdx = 156;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_k.output
                    section.data(1).logicalSrcIdx = 157;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_oq.output
                    section.data(1).logicalSrcIdx = 158;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_lw.output
                    section.data(1).logicalSrcIdx = 159;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_b.output
                    section.data(1).logicalSrcIdx = 160;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_l.output
                    section.data(1).logicalSrcIdx = 161;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_oy.output
                    section.data(1).logicalSrcIdx = 162;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(19) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_i.output
                    section.data(1).logicalSrcIdx = 163;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(20) = section;
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
        nTotSects     = 54;
        sectIdxOffset = 20;

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
            section.nData     = 85;
            section.data(85)  = dumData; %prealloc

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

                    ;% controller14_DW.Delay2_DSTATE
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 7;

                    ;% controller14_DW.Delay1_DSTATE_a
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 11;

                    ;% controller14_DW.Delay_DSTATE_j
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 12;

                    ;% controller14_DW.time_DSTATE
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 13;

                    ;% controller14_DW.DigitalFilter_FILT_STATES
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 14;

                    ;% controller14_DW.Delay1_DSTATE_m
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 20;

                    ;% controller14_DW.Delay_DSTATE_p
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 23;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_k
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 32;

                    ;% controller14_DW.time_DSTATE_m
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 38;

                    ;% controller14_DW.Delay1_DSTATE_d
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 39;

                    ;% controller14_DW.Delay_DSTATE_b
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 42;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_e
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 43;

                    ;% controller14_DW.Delay_DSTATE_e
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 49;

                    ;% controller14_DW.Delay2_DSTATE_i
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 51;

                    ;% controller14_DW.time_DSTATE_k
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 55;

                    ;% controller14_DW.Delay_DSTATE_a
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 56;

                    ;% controller14_DW.Delay2_DSTATE_k
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 57;

                    ;% controller14_DW.Delay3_DSTATE
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 58;

                    ;% controller14_DW.Delay2_DSTATE_c
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 59;

                    ;% controller14_DW.SaturatingRamp_DSTATE_n
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 60;

                    ;% controller14_DW.RampUpOrDown_DSTATE_a
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 61;

                    ;% controller14_DW.omegat1_DSTATE_l
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 62;

                    ;% controller14_DW.Delay_DSTATE_h
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 63;

                    ;% controller14_DW.Delay1_DSTATE_k
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 64;

                    ;% controller14_DW.Delay2_DSTATE_cc
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 66;

                    ;% controller14_DW.SaturatingRamp_DSTATE_o
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 67;

                    ;% controller14_DW.RampUpOrDown_DSTATE_j
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 68;

                    ;% controller14_DW.omegat1_DSTATE_h
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 69;

                    ;% controller14_DW.Delay_DSTATE_i
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 70;

                    ;% controller14_DW.Delay1_DSTATE_a1
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 71;

                    ;% controller14_DW.Delay2_DSTATE_l
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 73;

                    ;% controller14_DW.SaturatingRamp_DSTATE_e
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 74;

                    ;% controller14_DW.RampUpOrDown_DSTATE_d
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 75;

                    ;% controller14_DW.omegat1_DSTATE_f
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 76;

                    ;% controller14_DW.Delay_DSTATE_o
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 77;

                    ;% controller14_DW.Delay1_DSTATE_ka
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 78;

                    ;% controller14_DW.Delay2_DSTATE_d
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 80;

                    ;% controller14_DW.Delay1_DSTATE_l
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 81;

                    ;% controller14_DW.Delay_DSTATE_pg
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 83;

                    ;% controller14_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 87;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_c
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 91;

                    ;% controller14_DW.omegat_DSTATE
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 99;

                    ;% controller14_DW.Delay_DSTATE_at
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 100;

                    ;% controller14_DW.Delay1_DSTATE_b
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 101;

                    ;% controller14_DW.Delay2_DSTATE_g
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 103;

                    ;% controller14_DW.omegat_DSTATE_p
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 104;

                    ;% controller14_DW.Delay_DSTATE_l
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 105;

                    ;% controller14_DW.Delay1_DSTATE_l3
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 106;

                    ;% controller14_DW.Delay2_DSTATE_a
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 108;

                    ;% controller14_DW.omegat_DSTATE_l
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 109;

                    ;% controller14_DW.Delay_DSTATE_n
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 110;

                    ;% controller14_DW.Delay1_DSTATE_j
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 111;

                    ;% controller14_DW.Delay2_DSTATE_o
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 113;

                    ;% controller14_DW.omegat_DSTATE_d
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 114;

                    ;% controller14_DW.Delay_DSTATE_f
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 115;

                    ;% controller14_DW.Delay1_DSTATE_e
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 116;

                    ;% controller14_DW.Delay2_DSTATE_lc
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 118;

                    ;% controller14_DW.Delay_DSTATE_m
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 119;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_m
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 128;

                    ;% controller14_DW.UnitDelay_DSTATE
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 134;

                    ;% controller14_DW.UnitDelay1_DSTATE
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 143;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 144;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_o
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 147;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_c
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 150;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_e
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 153;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_e2
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 157;

                    ;% controller14_DW.R_old
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 160;

                    ;% controller14_DW.R_dot_old
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 169;

                    ;% controller14_DW.dt
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 178;

                    ;% controller14_DW.id
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 179;

                    ;% controller14_DW.som_state
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 180;

                    ;% controller14_DW.t_fall
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 181;

                    ;% controller14_DW.t_dec
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 182;

                    ;% controller14_DW.z_setpoint
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 183;

                    ;% controller14_DW.t_hover
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 184;

                    ;% controller14_DW.t_rot_acc
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 185;

                    ;% controller14_DW.t_safe
                    section.data(83).logicalSrcIdx = 82;
                    section.data(83).dtTransOffset = 186;

                    ;% controller14_DW.id_m
                    section.data(84).logicalSrcIdx = 83;
                    section.data(84).dtTransOffset = 187;

                    ;% controller14_DW.init_r
                    section.data(85).logicalSrcIdx = 84;
                    section.data(85).dtTransOffset = 188;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 35;
            section.data(35)  = dumData; %prealloc

                    ;% controller14_DW.PacketOutput_PWORK
                    section.data(1).logicalSrcIdx = 85;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.PacketInput1_PWORK
                    section.data(2).logicalSrcIdx = 86;
                    section.data(2).dtTransOffset = 2;

                    ;% controller14_DW.PacketInput3_PWORK
                    section.data(3).logicalSrcIdx = 87;
                    section.data(3).dtTransOffset = 3;

                    ;% controller14_DW.highdrivingsignal_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 88;
                    section.data(4).dtTransOffset = 4;

                    ;% controller14_DW.motorthrustsmgf_PWORK.LoggedData
                    section.data(5).logicalSrcIdx = 89;
                    section.data(5).dtTransOffset = 5;

                    ;% controller14_DW.safetyprobe_PWORK.LoggedData
                    section.data(6).logicalSrcIdx = 90;
                    section.data(6).dtTransOffset = 6;

                    ;% controller14_DW.safetytimeenable_PWORK.LoggedData
                    section.data(7).logicalSrcIdx = 91;
                    section.data(7).dtTransOffset = 7;

                    ;% controller14_DW.allstates_PWORK.LoggedData
                    section.data(8).logicalSrcIdx = 92;
                    section.data(8).dtTransOffset = 8;

                    ;% controller14_DW.pvsp_des_PWORK.LoggedData
                    section.data(9).logicalSrcIdx = 93;
                    section.data(9).dtTransOffset = 12;

                    ;% controller14_DW.unsatthrust_PWORK.LoggedData
                    section.data(10).logicalSrcIdx = 94;
                    section.data(10).dtTransOffset = 14;

                    ;% controller14_DW.unsattorque_PWORK.LoggedData
                    section.data(11).logicalSrcIdx = 95;
                    section.data(11).dtTransOffset = 15;

                    ;% controller14_DW.Scope_PWORK.LoggedData
                    section.data(12).logicalSrcIdx = 96;
                    section.data(12).dtTransOffset = 18;

                    ;% controller14_DW.R33_PWORK.LoggedData
                    section.data(13).logicalSrcIdx = 97;
                    section.data(13).dtTransOffset = 20;

                    ;% controller14_DW.eulZXY_PWORK.LoggedData
                    section.data(14).logicalSrcIdx = 98;
                    section.data(14).dtTransOffset = 21;

                    ;% controller14_DW.euly_PWORK.LoggedData
                    section.data(15).logicalSrcIdx = 99;
                    section.data(15).dtTransOffset = 22;

                    ;% controller14_DW.ext_torque_PWORK.LoggedData
                    section.data(16).logicalSrcIdx = 100;
                    section.data(16).dtTransOffset = 23;

                    ;% controller14_DW.gyro_PWORK.LoggedData
                    section.data(17).logicalSrcIdx = 101;
                    section.data(17).dtTransOffset = 24;

                    ;% controller14_DW.somstate_PWORK.LoggedData
                    section.data(18).logicalSrcIdx = 102;
                    section.data(18).dtTransOffset = 26;

                    ;% controller14_DW.intthrust_PWORK.LoggedData
                    section.data(19).logicalSrcIdx = 103;
                    section.data(19).dtTransOffset = 27;

                    ;% controller14_DW.inttorque_PWORK.LoggedData
                    section.data(20).logicalSrcIdx = 104;
                    section.data(20).dtTransOffset = 28;

                    ;% controller14_DW.voltages_PWORK.LoggedData
                    section.data(21).logicalSrcIdx = 105;
                    section.data(21).dtTransOffset = 29;

                    ;% controller14_DW.Scope_PWORK_h.LoggedData
                    section.data(22).logicalSrcIdx = 106;
                    section.data(22).dtTransOffset = 33;

                    ;% controller14_DW.Eul_XYZ_PWORK.LoggedData
                    section.data(23).logicalSrcIdx = 107;
                    section.data(23).dtTransOffset = 35;

                    ;% controller14_DW.omega_b_PWORK.LoggedData
                    section.data(24).logicalSrcIdx = 108;
                    section.data(24).dtTransOffset = 36;

                    ;% controller14_DW.omega_b1_PWORK.LoggedData
                    section.data(25).logicalSrcIdx = 109;
                    section.data(25).dtTransOffset = 38;

                    ;% controller14_DW.p_dot_PWORK.LoggedData
                    section.data(26).logicalSrcIdx = 110;
                    section.data(26).dtTransOffset = 40;

                    ;% controller14_DW.p_dotdot_PWORK.LoggedData
                    section.data(27).logicalSrcIdx = 111;
                    section.data(27).dtTransOffset = 41;

                    ;% controller14_DW.p_raw_PWORK.LoggedData
                    section.data(28).logicalSrcIdx = 112;
                    section.data(28).dtTransOffset = 42;

                    ;% controller14_DW.Scope_PWORK_i.LoggedData
                    section.data(29).logicalSrcIdx = 113;
                    section.data(29).dtTransOffset = 43;

                    ;% controller14_DW.Scope5_PWORK.LoggedData
                    section.data(30).logicalSrcIdx = 114;
                    section.data(30).dtTransOffset = 44;

                    ;% controller14_DW.Scope6_PWORK.LoggedData
                    section.data(31).logicalSrcIdx = 115;
                    section.data(31).dtTransOffset = 45;

                    ;% controller14_DW.Scope7_PWORK.LoggedData
                    section.data(32).logicalSrcIdx = 116;
                    section.data(32).dtTransOffset = 47;

                    ;% controller14_DW.Vicon2bodiesdataready_PWORK.LoggedData
                    section.data(33).logicalSrcIdx = 117;
                    section.data(33).dtTransOffset = 48;

                    ;% controller14_DW.raw_sensor_PWORK.LoggedData
                    section.data(34).logicalSrcIdx = 118;
                    section.data(34).dtTransOffset = 49;

                    ;% controller14_DW.voltages_PWORK_b.LoggedData
                    section.data(35).logicalSrcIdx = 119;
                    section.data(35).dtTransOffset = 50;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% controller14_DW.sfEvent
                    section.data(1).logicalSrcIdx = 120;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.sfEvent_j
                    section.data(2).logicalSrcIdx = 121;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.sfEvent_c
                    section.data(3).logicalSrcIdx = 122;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.sfEvent_l
                    section.data(4).logicalSrcIdx = 123;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.sfEvent_k
                    section.data(5).logicalSrcIdx = 124;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.sfEvent_f
                    section.data(6).logicalSrcIdx = 125;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.sfEvent_a
                    section.data(7).logicalSrcIdx = 126;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.sfEvent_lm
                    section.data(8).logicalSrcIdx = 127;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.sfEvent_e
                    section.data(9).logicalSrcIdx = 128;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.sfEvent_am
                    section.data(10).logicalSrcIdx = 129;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.sfEvent_ez
                    section.data(11).logicalSrcIdx = 130;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.sfEvent_an
                    section.data(12).logicalSrcIdx = 131;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.sfEvent_i
                    section.data(13).logicalSrcIdx = 132;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.obj
                    section.data(1).logicalSrcIdx = 133;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.obj_p
                    section.data(2).logicalSrcIdx = 134;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 135;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.IfActionSubsystem_SubsysRanBC
                    section.data(2).logicalSrcIdx = 136;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(3).logicalSrcIdx = 137;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% controller14_DW.is_active_c31_controller14
                    section.data(1).logicalSrcIdx = 138;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.is_active_c17_controller14
                    section.data(2).logicalSrcIdx = 139;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.is_active_c18_controller14
                    section.data(3).logicalSrcIdx = 140;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.is_active_c51_controller14
                    section.data(4).logicalSrcIdx = 141;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.is_active_c49_controller14
                    section.data(5).logicalSrcIdx = 142;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.is_active_c48_controller14
                    section.data(6).logicalSrcIdx = 143;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.is_active_c20_controller14
                    section.data(7).logicalSrcIdx = 144;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.is_active_c7_controller14
                    section.data(8).logicalSrcIdx = 145;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.is_active_c96_controller14
                    section.data(9).logicalSrcIdx = 146;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.is_active_c10_controller14
                    section.data(10).logicalSrcIdx = 147;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.is_active_c71_controller14
                    section.data(11).logicalSrcIdx = 148;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.is_active_c52_controller14
                    section.data(12).logicalSrcIdx = 149;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.is_active_c46_controller14
                    section.data(13).logicalSrcIdx = 150;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 28;
            section.data(28)  = dumData; %prealloc

                    ;% controller14_DW.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 151;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.objisempty
                    section.data(2).logicalSrcIdx = 152;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.doneDoubleBufferReInit_f
                    section.data(3).logicalSrcIdx = 153;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.doneDoubleBufferReInit_fc
                    section.data(4).logicalSrcIdx = 154;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.R_old_not_empty
                    section.data(5).logicalSrcIdx = 155;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.R_dot_old_not_empty
                    section.data(6).logicalSrcIdx = 156;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.dt_not_empty
                    section.data(7).logicalSrcIdx = 157;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.doneDoubleBufferReInit_g
                    section.data(8).logicalSrcIdx = 158;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.doneDoubleBufferReInit_gj
                    section.data(9).logicalSrcIdx = 159;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.doneDoubleBufferReInit_i
                    section.data(10).logicalSrcIdx = 160;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.doneDoubleBufferReInit_l
                    section.data(11).logicalSrcIdx = 161;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.doneDoubleBufferReInit_o
                    section.data(12).logicalSrcIdx = 162;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.doneDoubleBufferReInit_n
                    section.data(13).logicalSrcIdx = 163;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.doneDoubleBufferReInit_p
                    section.data(14).logicalSrcIdx = 164;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.doneDoubleBufferReInit_d
                    section.data(15).logicalSrcIdx = 165;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.doneDoubleBufferReInit_n2
                    section.data(16).logicalSrcIdx = 166;
                    section.data(16).dtTransOffset = 15;

                    ;% controller14_DW.id_not_empty
                    section.data(17).logicalSrcIdx = 167;
                    section.data(17).dtTransOffset = 16;

                    ;% controller14_DW.som_state_not_empty
                    section.data(18).logicalSrcIdx = 168;
                    section.data(18).dtTransOffset = 17;

                    ;% controller14_DW.t_fall_not_empty
                    section.data(19).logicalSrcIdx = 169;
                    section.data(19).dtTransOffset = 18;

                    ;% controller14_DW.t_dec_not_empty
                    section.data(20).logicalSrcIdx = 170;
                    section.data(20).dtTransOffset = 19;

                    ;% controller14_DW.z_setpoint_not_empty
                    section.data(21).logicalSrcIdx = 171;
                    section.data(21).dtTransOffset = 20;

                    ;% controller14_DW.t_hover_not_empty
                    section.data(22).logicalSrcIdx = 172;
                    section.data(22).dtTransOffset = 21;

                    ;% controller14_DW.t_rot_acc_not_empty
                    section.data(23).logicalSrcIdx = 173;
                    section.data(23).dtTransOffset = 22;

                    ;% controller14_DW.t_safe_not_empty
                    section.data(24).logicalSrcIdx = 174;
                    section.data(24).dtTransOffset = 23;

                    ;% controller14_DW.doneDoubleBufferReInit_ib
                    section.data(25).logicalSrcIdx = 175;
                    section.data(25).dtTransOffset = 24;

                    ;% controller14_DW.id_not_empty_f
                    section.data(26).logicalSrcIdx = 176;
                    section.data(26).dtTransOffset = 25;

                    ;% controller14_DW.init_r_not_empty
                    section.data(27).logicalSrcIdx = 177;
                    section.data(27).dtTransOffset = 26;

                    ;% controller14_DW.objisempty_g
                    section.data(28).logicalSrcIdx = 178;
                    section.data(28).dtTransOffset = 27;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.sfEvent
                    section.data(1).logicalSrcIdx = 179;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.is_active_c16_controller14
                    section.data(1).logicalSrcIdx = 180;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3_j.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 181;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2_b.sfEvent
                    section.data(1).logicalSrcIdx = 182;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2_b.is_active_c16_controller14
                    section.data(1).logicalSrcIdx = 183;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2_b.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 184;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.sfEvent
                    section.data(1).logicalSrcIdx = 185;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.is_active_c15_controller14
                    section.data(1).logicalSrcIdx = 186;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix_p.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 187;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 188;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 189;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 190;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem_m.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 191;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1_i.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 192;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(20) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.sfEvent
                    section.data(1).logicalSrcIdx = 193;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(21) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.is_active_c16_controller14
                    section.data(1).logicalSrcIdx = 194;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(22) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 195;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(23) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.sfEvent
                    section.data(1).logicalSrcIdx = 196;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(24) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.is_active_c15_controller14
                    section.data(1).logicalSrcIdx = 197;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(25) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 198;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(26) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 199;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 200;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(27) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 201;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(28) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 202;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(29) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 203;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(30) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.sfEvent
                    section.data(1).logicalSrcIdx = 204;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(31) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 205;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(32) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 206;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(33) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.sfEvent
                    section.data(1).logicalSrcIdx = 207;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(34) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 208;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(35) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 209;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(36) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.sfEvent
                    section.data(1).logicalSrcIdx = 210;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(37) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 211;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(38) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 212;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(39) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.sfEvent
                    section.data(1).logicalSrcIdx = 213;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(40) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 214;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(41) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 215;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(42) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.sfEvent
                    section.data(1).logicalSrcIdx = 216;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(43) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 217;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(44) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 218;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(45) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.sfEvent
                    section.data(1).logicalSrcIdx = 219;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(46) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 220;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(47) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 221;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(48) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.sfEvent
                    section.data(1).logicalSrcIdx = 222;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(49) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 223;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(50) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 224;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(51) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.sfEvent
                    section.data(1).logicalSrcIdx = 225;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(52) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 226;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(53) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 227;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(54) = section;
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


    targMap.checksum0 = 2755273463;
    targMap.checksum1 = 3077776325;
    targMap.checksum2 = 2038037945;
    targMap.checksum3 = 2536965256;

