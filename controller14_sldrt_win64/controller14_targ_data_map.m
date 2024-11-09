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
        nTotSects     = 17;
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
            section.nData     = 111;
            section.data(111)  = dumData; %prealloc

                    ;% controller14_B.SaturatingRamp
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.Sqrt
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.Switch
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.ZeroOrderHold1
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 8;

                    ;% controller14_B.ZeroOrderHold3
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 9;

                    ;% controller14_B.ZeroOrderHold4
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 10;

                    ;% controller14_B.ZeroOrderHold5
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 11;

                    ;% controller14_B.ZeroOrderHold6
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 12;

                    ;% controller14_B.ZeroOrderHold7
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 13;

                    ;% controller14_B.ZeroOrderHold6_f
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 14;

                    ;% controller14_B.p_raw
                    section.data(11).logicalSrcIdx = 10;
                    section.data(11).dtTransOffset = 15;

                    ;% controller14_B.ZeroOrderHold3_j
                    section.data(12).logicalSrcIdx = 11;
                    section.data(12).dtTransOffset = 18;

                    ;% controller14_B.Merge
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 21;

                    ;% controller14_B.p_dot
                    section.data(14).logicalSrcIdx = 13;
                    section.data(14).dtTransOffset = 24;

                    ;% controller14_B.ZeroOrderHold4_c
                    section.data(15).logicalSrcIdx = 14;
                    section.data(15).dtTransOffset = 27;

                    ;% controller14_B.p_dotdot
                    section.data(16).logicalSrcIdx = 15;
                    section.data(16).dtTransOffset = 30;

                    ;% controller14_B.p_dotdot_a
                    section.data(17).logicalSrcIdx = 16;
                    section.data(17).dtTransOffset = 33;

                    ;% controller14_B.ZeroOrderHold5_a
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 36;

                    ;% controller14_B.Reshape1
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 39;

                    ;% controller14_B.ZeroOrderHold2
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 42;

                    ;% controller14_B.p_raw_h
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 45;

                    ;% controller14_B.DigitalFilter
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 48;

                    ;% controller14_B.ZeroOrderHold1_b
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 51;

                    ;% controller14_B.Delay
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 54;

                    ;% controller14_B.Delay2
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 56;

                    ;% controller14_B.Saturation
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 60;

                    ;% controller14_B.NemoBee12
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 64;

                    ;% controller14_B.NemoBee6
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 65;

                    ;% controller14_B.NemoBee14
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 66;

                    ;% controller14_B.NemoBee10
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 67;

                    ;% controller14_B.Switch17
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 68;

                    ;% controller14_B.ComplextoRealImag_o1
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 69;

                    ;% controller14_B.Switch1
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 70;

                    ;% controller14_B.ComplextoRealImag1_o1
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 71;

                    ;% controller14_B.Switch2
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 72;

                    ;% controller14_B.ComplextoRealImag2_o1
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 73;

                    ;% controller14_B.Switch3
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 74;

                    ;% controller14_B.ComplextoRealImag3_o1
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 75;

                    ;% controller14_B.TmpSignalConversionAtDelay2Inport1
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 76;

                    ;% controller14_B.half1
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 80;

                    ;% controller14_B.Gain
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 84;

                    ;% controller14_B.Gain4
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 85;

                    ;% controller14_B.SaturatingRamp_d
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 86;

                    ;% controller14_B.Sqrt_b
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 87;

                    ;% controller14_B.Gain_m
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 88;

                    ;% controller14_B.Gain1
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 89;

                    ;% controller14_B.SaturatingRamp_f
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 90;

                    ;% controller14_B.Sqrt_g
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 91;

                    ;% controller14_B.Gain_c
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 92;

                    ;% controller14_B.Gain2
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 93;

                    ;% controller14_B.SaturatingRamp_j
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 94;

                    ;% controller14_B.Sqrt_l
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 95;

                    ;% controller14_B.Gain_i
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 96;

                    ;% controller14_B.Gain3
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 97;

                    ;% controller14_B.DiscreteTimeIntegrator
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 98;

                    ;% controller14_B.Product
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 102;

                    ;% controller14_B.Saturation6
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 106;

                    ;% controller14_B.Saturation7
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 107;

                    ;% controller14_B.Saturation8
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 108;

                    ;% controller14_B.Saturation9
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 109;

                    ;% controller14_B.TmpSignalConversionAtDigitalFilterInport1
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 110;

                    ;% controller14_B.DigitalFilter_j
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 114;

                    ;% controller14_B.Add
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 118;

                    ;% controller14_B.Add_i
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 119;

                    ;% controller14_B.upi
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 120;

                    ;% controller14_B.Gain1_b
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 121;

                    ;% controller14_B.upi1
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 122;

                    ;% controller14_B.upi_i
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 123;

                    ;% controller14_B.Gain1_c
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 124;

                    ;% controller14_B.Add_l
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 125;

                    ;% controller14_B.Add_a
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 126;

                    ;% controller14_B.upi1_p
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 127;

                    ;% controller14_B.upi_k
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 128;

                    ;% controller14_B.Gain1_d
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 129;

                    ;% controller14_B.Add_m
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 130;

                    ;% controller14_B.Add_f
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 131;

                    ;% controller14_B.upi1_k
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 132;

                    ;% controller14_B.upi_m
                    section.data(78).logicalSrcIdx = 77;
                    section.data(78).dtTransOffset = 133;

                    ;% controller14_B.Gain1_j
                    section.data(79).logicalSrcIdx = 78;
                    section.data(79).dtTransOffset = 134;

                    ;% controller14_B.Add_p
                    section.data(80).logicalSrcIdx = 79;
                    section.data(80).dtTransOffset = 135;

                    ;% controller14_B.Add_mt
                    section.data(81).logicalSrcIdx = 80;
                    section.data(81).dtTransOffset = 136;

                    ;% controller14_B.upi1_a
                    section.data(82).logicalSrcIdx = 81;
                    section.data(82).dtTransOffset = 137;

                    ;% controller14_B.R
                    section.data(83).logicalSrcIdx = 83;
                    section.data(83).dtTransOffset = 138;

                    ;% controller14_B.UnitDelay
                    section.data(84).logicalSrcIdx = 84;
                    section.data(84).dtTransOffset = 147;

                    ;% controller14_B.In2
                    section.data(85).logicalSrcIdx = 85;
                    section.data(85).dtTransOffset = 156;

                    ;% controller14_B.UnitDelay1
                    section.data(86).logicalSrcIdx = 86;
                    section.data(86).dtTransOffset = 157;

                    ;% controller14_B.R_i
                    section.data(87).logicalSrcIdx = 87;
                    section.data(87).dtTransOffset = 158;

                    ;% controller14_B.en
                    section.data(88).logicalSrcIdx = 88;
                    section.data(88).dtTransOffset = 167;

                    ;% controller14_B.en_o
                    section.data(89).logicalSrcIdx = 89;
                    section.data(89).dtTransOffset = 168;

                    ;% controller14_B.en_out
                    section.data(90).logicalSrcIdx = 90;
                    section.data(90).dtTransOffset = 169;

                    ;% controller14_B.cum_out
                    section.data(91).logicalSrcIdx = 91;
                    section.data(91).dtTransOffset = 170;

                    ;% controller14_B.torque_thrust
                    section.data(92).logicalSrcIdx = 92;
                    section.data(92).dtTransOffset = 171;

                    ;% controller14_B.ext_torque_hat
                    section.data(93).logicalSrcIdx = 99;
                    section.data(93).dtTransOffset = 175;

                    ;% controller14_B.omega_hat
                    section.data(94).logicalSrcIdx = 100;
                    section.data(94).dtTransOffset = 177;

                    ;% controller14_B.torque_x
                    section.data(95).logicalSrcIdx = 101;
                    section.data(95).dtTransOffset = 179;

                    ;% controller14_B.torque_y
                    section.data(96).logicalSrcIdx = 102;
                    section.data(96).dtTransOffset = 180;

                    ;% controller14_B.torque_z
                    section.data(97).logicalSrcIdx = 103;
                    section.data(97).dtTransOffset = 181;

                    ;% controller14_B.F
                    section.data(98).logicalSrcIdx = 104;
                    section.data(98).dtTransOffset = 182;

                    ;% controller14_B.torque_gyro_x
                    section.data(99).logicalSrcIdx = 105;
                    section.data(99).dtTransOffset = 183;

                    ;% controller14_B.torque_gyro_y
                    section.data(100).logicalSrcIdx = 106;
                    section.data(100).dtTransOffset = 184;

                    ;% controller14_B.att_e
                    section.data(101).logicalSrcIdx = 107;
                    section.data(101).dtTransOffset = 185;

                    ;% controller14_B.alt_e
                    section.data(102).logicalSrcIdx = 108;
                    section.data(102).dtTransOffset = 188;

                    ;% controller14_B.state
                    section.data(103).logicalSrcIdx = 109;
                    section.data(103).dtTransOffset = 189;

                    ;% controller14_B.R33
                    section.data(104).logicalSrcIdx = 110;
                    section.data(104).dtTransOffset = 190;

                    ;% controller14_B.eulx
                    section.data(105).logicalSrcIdx = 111;
                    section.data(105).dtTransOffset = 191;

                    ;% controller14_B.eulZYX
                    section.data(106).logicalSrcIdx = 112;
                    section.data(106).dtTransOffset = 192;

                    ;% controller14_B.rd
                    section.data(107).logicalSrcIdx = 113;
                    section.data(107).dtTransOffset = 195;

                    ;% controller14_B.init_r_out
                    section.data(108).logicalSrcIdx = 118;
                    section.data(108).dtTransOffset = 198;

                    ;% controller14_B.id_out
                    section.data(109).logicalSrcIdx = 119;
                    section.data(109).dtTransOffset = 201;

                    ;% controller14_B.rotm
                    section.data(110).logicalSrcIdx = 120;
                    section.data(110).dtTransOffset = 202;

                    ;% controller14_B.DigitalFilter_o
                    section.data(111).logicalSrcIdx = 121;
                    section.data(111).dtTransOffset = 211;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.PacketInput1_o1
                    section.data(1).logicalSrcIdx = 122;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.UDPuint162
                    section.data(1).logicalSrcIdx = 123;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.UDPuint163
                    section.data(2).logicalSrcIdx = 124;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.UDPuint164
                    section.data(3).logicalSrcIdx = 125;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.Switch_b
                    section.data(4).logicalSrcIdx = 126;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(3) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.Compare
                    section.data(1).logicalSrcIdx = 127;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.envelope
                    section.data(2).logicalSrcIdx = 128;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_B.flip
                    section.data(3).logicalSrcIdx = 129;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_B.voltage
                    section.data(4).logicalSrcIdx = 130;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.dataready
                    section.data(1).logicalSrcIdx = 131;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix3.w
                    section.data(1).logicalSrcIdx = 132;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_RotationMatrix2.w
                    section.data(1).logicalSrcIdx = 133;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(7) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem_d.In1
                    section.data(1).logicalSrcIdx = 134;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay
                    section.data(2).logicalSrcIdx = 135;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem_d.In2
                    section.data(3).logicalSrcIdx = 136;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem_d.UnitDelay1
                    section.data(4).logicalSrcIdx = 137;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(8) = section;
            clear section

            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% controller14_B.TriggeredSubsystem.In1
                    section.data(1).logicalSrcIdx = 138;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay
                    section.data(2).logicalSrcIdx = 139;
                    section.data(2).dtTransOffset = 3;

                    ;% controller14_B.TriggeredSubsystem.In2
                    section.data(3).logicalSrcIdx = 140;
                    section.data(3).dtTransOffset = 6;

                    ;% controller14_B.TriggeredSubsystem.UnitDelay1
                    section.data(4).logicalSrcIdx = 141;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_m.output
                    section.data(1).logicalSrcIdx = 142;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_k.output
                    section.data(1).logicalSrcIdx = 143;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_oq.output
                    section.data(1).logicalSrcIdx = 144;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_lw.output
                    section.data(1).logicalSrcIdx = 145;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_b.output
                    section.data(1).logicalSrcIdx = 146;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_l.output
                    section.data(1).logicalSrcIdx = 147;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_oy.output
                    section.data(1).logicalSrcIdx = 148;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_B.sf_MATLABFunction_i.output
                    section.data(1).logicalSrcIdx = 149;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(17) = section;
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
        nTotSects     = 45;
        sectIdxOffset = 17;

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
            section.nData     = 77;
            section.data(77)  = dumData; %prealloc

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

                    ;% controller14_DW.Delay_DSTATE_m
                    section.data(13).logicalSrcIdx = 12;
                    section.data(13).dtTransOffset = 23;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_m
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

                    ;% controller14_DW.Delay_DSTATE_e
                    section.data(18).logicalSrcIdx = 17;
                    section.data(18).dtTransOffset = 43;

                    ;% controller14_DW.Delay2_DSTATE_i
                    section.data(19).logicalSrcIdx = 18;
                    section.data(19).dtTransOffset = 45;

                    ;% controller14_DW.time_DSTATE_k
                    section.data(20).logicalSrcIdx = 19;
                    section.data(20).dtTransOffset = 49;

                    ;% controller14_DW.Delay_DSTATE_a
                    section.data(21).logicalSrcIdx = 20;
                    section.data(21).dtTransOffset = 50;

                    ;% controller14_DW.Delay2_DSTATE_k
                    section.data(22).logicalSrcIdx = 21;
                    section.data(22).dtTransOffset = 51;

                    ;% controller14_DW.Delay3_DSTATE
                    section.data(23).logicalSrcIdx = 22;
                    section.data(23).dtTransOffset = 52;

                    ;% controller14_DW.Delay2_DSTATE_c
                    section.data(24).logicalSrcIdx = 23;
                    section.data(24).dtTransOffset = 53;

                    ;% controller14_DW.SaturatingRamp_DSTATE_n
                    section.data(25).logicalSrcIdx = 24;
                    section.data(25).dtTransOffset = 54;

                    ;% controller14_DW.RampUpOrDown_DSTATE_a
                    section.data(26).logicalSrcIdx = 25;
                    section.data(26).dtTransOffset = 55;

                    ;% controller14_DW.omegat1_DSTATE_l
                    section.data(27).logicalSrcIdx = 26;
                    section.data(27).dtTransOffset = 56;

                    ;% controller14_DW.Delay_DSTATE_h
                    section.data(28).logicalSrcIdx = 27;
                    section.data(28).dtTransOffset = 57;

                    ;% controller14_DW.Delay1_DSTATE_k
                    section.data(29).logicalSrcIdx = 28;
                    section.data(29).dtTransOffset = 58;

                    ;% controller14_DW.Delay2_DSTATE_cc
                    section.data(30).logicalSrcIdx = 29;
                    section.data(30).dtTransOffset = 60;

                    ;% controller14_DW.SaturatingRamp_DSTATE_o
                    section.data(31).logicalSrcIdx = 30;
                    section.data(31).dtTransOffset = 61;

                    ;% controller14_DW.RampUpOrDown_DSTATE_j
                    section.data(32).logicalSrcIdx = 31;
                    section.data(32).dtTransOffset = 62;

                    ;% controller14_DW.omegat1_DSTATE_h
                    section.data(33).logicalSrcIdx = 32;
                    section.data(33).dtTransOffset = 63;

                    ;% controller14_DW.Delay_DSTATE_i
                    section.data(34).logicalSrcIdx = 33;
                    section.data(34).dtTransOffset = 64;

                    ;% controller14_DW.Delay1_DSTATE_a1
                    section.data(35).logicalSrcIdx = 34;
                    section.data(35).dtTransOffset = 65;

                    ;% controller14_DW.Delay2_DSTATE_l
                    section.data(36).logicalSrcIdx = 35;
                    section.data(36).dtTransOffset = 67;

                    ;% controller14_DW.SaturatingRamp_DSTATE_e
                    section.data(37).logicalSrcIdx = 36;
                    section.data(37).dtTransOffset = 68;

                    ;% controller14_DW.RampUpOrDown_DSTATE_d
                    section.data(38).logicalSrcIdx = 37;
                    section.data(38).dtTransOffset = 69;

                    ;% controller14_DW.omegat1_DSTATE_f
                    section.data(39).logicalSrcIdx = 38;
                    section.data(39).dtTransOffset = 70;

                    ;% controller14_DW.Delay_DSTATE_o
                    section.data(40).logicalSrcIdx = 39;
                    section.data(40).dtTransOffset = 71;

                    ;% controller14_DW.Delay1_DSTATE_ka
                    section.data(41).logicalSrcIdx = 40;
                    section.data(41).dtTransOffset = 72;

                    ;% controller14_DW.Delay2_DSTATE_d
                    section.data(42).logicalSrcIdx = 41;
                    section.data(42).dtTransOffset = 74;

                    ;% controller14_DW.Delay1_DSTATE_l
                    section.data(43).logicalSrcIdx = 42;
                    section.data(43).dtTransOffset = 75;

                    ;% controller14_DW.Delay_DSTATE_p
                    section.data(44).logicalSrcIdx = 43;
                    section.data(44).dtTransOffset = 77;

                    ;% controller14_DW.DiscreteTimeIntegrator_DSTATE
                    section.data(45).logicalSrcIdx = 44;
                    section.data(45).dtTransOffset = 81;

                    ;% controller14_DW.DigitalFilter_FILT_STATES_c
                    section.data(46).logicalSrcIdx = 45;
                    section.data(46).dtTransOffset = 85;

                    ;% controller14_DW.omegat_DSTATE
                    section.data(47).logicalSrcIdx = 46;
                    section.data(47).dtTransOffset = 93;

                    ;% controller14_DW.Delay_DSTATE_at
                    section.data(48).logicalSrcIdx = 47;
                    section.data(48).dtTransOffset = 94;

                    ;% controller14_DW.Delay1_DSTATE_b
                    section.data(49).logicalSrcIdx = 48;
                    section.data(49).dtTransOffset = 95;

                    ;% controller14_DW.Delay2_DSTATE_g
                    section.data(50).logicalSrcIdx = 49;
                    section.data(50).dtTransOffset = 97;

                    ;% controller14_DW.omegat_DSTATE_p
                    section.data(51).logicalSrcIdx = 50;
                    section.data(51).dtTransOffset = 98;

                    ;% controller14_DW.Delay_DSTATE_l
                    section.data(52).logicalSrcIdx = 51;
                    section.data(52).dtTransOffset = 99;

                    ;% controller14_DW.Delay1_DSTATE_l3
                    section.data(53).logicalSrcIdx = 52;
                    section.data(53).dtTransOffset = 100;

                    ;% controller14_DW.Delay2_DSTATE_a
                    section.data(54).logicalSrcIdx = 53;
                    section.data(54).dtTransOffset = 102;

                    ;% controller14_DW.omegat_DSTATE_l
                    section.data(55).logicalSrcIdx = 54;
                    section.data(55).dtTransOffset = 103;

                    ;% controller14_DW.Delay_DSTATE_n
                    section.data(56).logicalSrcIdx = 55;
                    section.data(56).dtTransOffset = 104;

                    ;% controller14_DW.Delay1_DSTATE_j
                    section.data(57).logicalSrcIdx = 56;
                    section.data(57).dtTransOffset = 105;

                    ;% controller14_DW.Delay2_DSTATE_o
                    section.data(58).logicalSrcIdx = 57;
                    section.data(58).dtTransOffset = 107;

                    ;% controller14_DW.omegat_DSTATE_d
                    section.data(59).logicalSrcIdx = 58;
                    section.data(59).dtTransOffset = 108;

                    ;% controller14_DW.Delay_DSTATE_f
                    section.data(60).logicalSrcIdx = 59;
                    section.data(60).dtTransOffset = 109;

                    ;% controller14_DW.Delay1_DSTATE_e
                    section.data(61).logicalSrcIdx = 60;
                    section.data(61).dtTransOffset = 110;

                    ;% controller14_DW.Delay2_DSTATE_lc
                    section.data(62).logicalSrcIdx = 61;
                    section.data(62).dtTransOffset = 112;

                    ;% controller14_DW.UnitDelay_DSTATE
                    section.data(63).logicalSrcIdx = 62;
                    section.data(63).dtTransOffset = 113;

                    ;% controller14_DW.UnitDelay1_DSTATE
                    section.data(64).logicalSrcIdx = 63;
                    section.data(64).dtTransOffset = 122;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES
                    section.data(65).logicalSrcIdx = 64;
                    section.data(65).dtTransOffset = 123;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_e
                    section.data(66).logicalSrcIdx = 65;
                    section.data(66).dtTransOffset = 126;

                    ;% controller14_DW.DigitalFilter_TEMP_STATES_eq
                    section.data(67).logicalSrcIdx = 66;
                    section.data(67).dtTransOffset = 129;

                    ;% controller14_DW.id
                    section.data(68).logicalSrcIdx = 67;
                    section.data(68).dtTransOffset = 133;

                    ;% controller14_DW.som_state
                    section.data(69).logicalSrcIdx = 68;
                    section.data(69).dtTransOffset = 134;

                    ;% controller14_DW.t_fall
                    section.data(70).logicalSrcIdx = 69;
                    section.data(70).dtTransOffset = 135;

                    ;% controller14_DW.t_dec
                    section.data(71).logicalSrcIdx = 70;
                    section.data(71).dtTransOffset = 136;

                    ;% controller14_DW.z_setpoint
                    section.data(72).logicalSrcIdx = 71;
                    section.data(72).dtTransOffset = 137;

                    ;% controller14_DW.t_hover
                    section.data(73).logicalSrcIdx = 72;
                    section.data(73).dtTransOffset = 138;

                    ;% controller14_DW.t_rot_acc
                    section.data(74).logicalSrcIdx = 73;
                    section.data(74).dtTransOffset = 139;

                    ;% controller14_DW.t_safe
                    section.data(75).logicalSrcIdx = 74;
                    section.data(75).dtTransOffset = 140;

                    ;% controller14_DW.id_m
                    section.data(76).logicalSrcIdx = 75;
                    section.data(76).dtTransOffset = 141;

                    ;% controller14_DW.init_r
                    section.data(77).logicalSrcIdx = 76;
                    section.data(77).dtTransOffset = 142;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 27;
            section.data(27)  = dumData; %prealloc

                    ;% controller14_DW.PacketOutput_PWORK
                    section.data(1).logicalSrcIdx = 77;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.PacketInput1_PWORK
                    section.data(2).logicalSrcIdx = 78;
                    section.data(2).dtTransOffset = 2;

                    ;% controller14_DW.highdrivingsignal_PWORK.LoggedData
                    section.data(3).logicalSrcIdx = 79;
                    section.data(3).dtTransOffset = 3;

                    ;% controller14_DW.motorthrustsmgf_PWORK.LoggedData
                    section.data(4).logicalSrcIdx = 80;
                    section.data(4).dtTransOffset = 4;

                    ;% controller14_DW.safetyprobe_PWORK.LoggedData
                    section.data(5).logicalSrcIdx = 81;
                    section.data(5).dtTransOffset = 5;

                    ;% controller14_DW.safetytimeenable_PWORK.LoggedData
                    section.data(6).logicalSrcIdx = 82;
                    section.data(6).dtTransOffset = 6;

                    ;% controller14_DW.allstates_PWORK.LoggedData
                    section.data(7).logicalSrcIdx = 83;
                    section.data(7).dtTransOffset = 7;

                    ;% controller14_DW.pvsp_des_PWORK.LoggedData
                    section.data(8).logicalSrcIdx = 84;
                    section.data(8).dtTransOffset = 11;

                    ;% controller14_DW.unsatthrust_PWORK.LoggedData
                    section.data(9).logicalSrcIdx = 85;
                    section.data(9).dtTransOffset = 13;

                    ;% controller14_DW.unsattorque_PWORK.LoggedData
                    section.data(10).logicalSrcIdx = 86;
                    section.data(10).dtTransOffset = 14;

                    ;% controller14_DW.R33_PWORK.LoggedData
                    section.data(11).logicalSrcIdx = 87;
                    section.data(11).dtTransOffset = 17;

                    ;% controller14_DW.eulZXY_PWORK.LoggedData
                    section.data(12).logicalSrcIdx = 88;
                    section.data(12).dtTransOffset = 18;

                    ;% controller14_DW.euly_PWORK.LoggedData
                    section.data(13).logicalSrcIdx = 89;
                    section.data(13).dtTransOffset = 19;

                    ;% controller14_DW.ext_torque_PWORK.LoggedData
                    section.data(14).logicalSrcIdx = 90;
                    section.data(14).dtTransOffset = 20;

                    ;% controller14_DW.gyro_PWORK.LoggedData
                    section.data(15).logicalSrcIdx = 91;
                    section.data(15).dtTransOffset = 21;

                    ;% controller14_DW.somstate_PWORK.LoggedData
                    section.data(16).logicalSrcIdx = 92;
                    section.data(16).dtTransOffset = 23;

                    ;% controller14_DW.intthrust_PWORK.LoggedData
                    section.data(17).logicalSrcIdx = 93;
                    section.data(17).dtTransOffset = 24;

                    ;% controller14_DW.inttorque_PWORK.LoggedData
                    section.data(18).logicalSrcIdx = 94;
                    section.data(18).dtTransOffset = 25;

                    ;% controller14_DW.voltages_PWORK.LoggedData
                    section.data(19).logicalSrcIdx = 95;
                    section.data(19).dtTransOffset = 26;

                    ;% controller14_DW.Scope_PWORK.LoggedData
                    section.data(20).logicalSrcIdx = 96;
                    section.data(20).dtTransOffset = 30;

                    ;% controller14_DW.Eul_XYZ_PWORK.LoggedData
                    section.data(21).logicalSrcIdx = 97;
                    section.data(21).dtTransOffset = 32;

                    ;% controller14_DW.omega_b_PWORK.LoggedData
                    section.data(22).logicalSrcIdx = 98;
                    section.data(22).dtTransOffset = 33;

                    ;% controller14_DW.p_dot_PWORK.LoggedData
                    section.data(23).logicalSrcIdx = 99;
                    section.data(23).dtTransOffset = 35;

                    ;% controller14_DW.p_dotdot_PWORK.LoggedData
                    section.data(24).logicalSrcIdx = 100;
                    section.data(24).dtTransOffset = 36;

                    ;% controller14_DW.p_raw_PWORK.LoggedData
                    section.data(25).logicalSrcIdx = 101;
                    section.data(25).dtTransOffset = 37;

                    ;% controller14_DW.Vicon2bodiesdataready_PWORK.LoggedData
                    section.data(26).logicalSrcIdx = 102;
                    section.data(26).dtTransOffset = 38;

                    ;% controller14_DW.voltages_PWORK_b.LoggedData
                    section.data(27).logicalSrcIdx = 103;
                    section.data(27).dtTransOffset = 39;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% controller14_DW.sfEvent
                    section.data(1).logicalSrcIdx = 104;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.sfEvent_i
                    section.data(2).logicalSrcIdx = 105;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.sfEvent_l
                    section.data(3).logicalSrcIdx = 106;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.sfEvent_k
                    section.data(4).logicalSrcIdx = 107;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.sfEvent_f
                    section.data(5).logicalSrcIdx = 108;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.sfEvent_a
                    section.data(6).logicalSrcIdx = 109;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.sfEvent_lm
                    section.data(7).logicalSrcIdx = 110;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.sfEvent_e
                    section.data(8).logicalSrcIdx = 111;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.sfEvent_am
                    section.data(9).logicalSrcIdx = 112;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.sfEvent_ez
                    section.data(10).logicalSrcIdx = 113;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.sfEvent_an
                    section.data(11).logicalSrcIdx = 114;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.sfEvent_i1
                    section.data(12).logicalSrcIdx = 115;
                    section.data(12).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.obj
                    section.data(1).logicalSrcIdx = 116;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 117;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.IfActionSubsystem_SubsysRanBC
                    section.data(2).logicalSrcIdx = 118;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.IfActionSubsystem1_SubsysRanBC
                    section.data(3).logicalSrcIdx = 119;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 12;
            section.data(12)  = dumData; %prealloc

                    ;% controller14_DW.is_active_c31_controller14
                    section.data(1).logicalSrcIdx = 120;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.is_active_c64_controller14
                    section.data(2).logicalSrcIdx = 121;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.is_active_c51_controller14
                    section.data(3).logicalSrcIdx = 122;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.is_active_c49_controller14
                    section.data(4).logicalSrcIdx = 123;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.is_active_c48_controller14
                    section.data(5).logicalSrcIdx = 124;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.is_active_c20_controller14
                    section.data(6).logicalSrcIdx = 125;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.is_active_c7_controller14
                    section.data(7).logicalSrcIdx = 126;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.is_active_c96_controller14
                    section.data(8).logicalSrcIdx = 127;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.is_active_c10_controller14
                    section.data(9).logicalSrcIdx = 128;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.is_active_c71_controller14
                    section.data(10).logicalSrcIdx = 129;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.is_active_c52_controller14
                    section.data(11).logicalSrcIdx = 130;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.is_active_c46_controller14
                    section.data(12).logicalSrcIdx = 131;
                    section.data(12).dtTransOffset = 11;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 23;
            section.data(23)  = dumData; %prealloc

                    ;% controller14_DW.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 132;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.doneDoubleBufferReInit_k
                    section.data(2).logicalSrcIdx = 133;
                    section.data(2).dtTransOffset = 1;

                    ;% controller14_DW.doneDoubleBufferReInit_g
                    section.data(3).logicalSrcIdx = 134;
                    section.data(3).dtTransOffset = 2;

                    ;% controller14_DW.doneDoubleBufferReInit_gj
                    section.data(4).logicalSrcIdx = 135;
                    section.data(4).dtTransOffset = 3;

                    ;% controller14_DW.doneDoubleBufferReInit_i
                    section.data(5).logicalSrcIdx = 136;
                    section.data(5).dtTransOffset = 4;

                    ;% controller14_DW.doneDoubleBufferReInit_l
                    section.data(6).logicalSrcIdx = 137;
                    section.data(6).dtTransOffset = 5;

                    ;% controller14_DW.doneDoubleBufferReInit_o
                    section.data(7).logicalSrcIdx = 138;
                    section.data(7).dtTransOffset = 6;

                    ;% controller14_DW.doneDoubleBufferReInit_n
                    section.data(8).logicalSrcIdx = 139;
                    section.data(8).dtTransOffset = 7;

                    ;% controller14_DW.doneDoubleBufferReInit_p
                    section.data(9).logicalSrcIdx = 140;
                    section.data(9).dtTransOffset = 8;

                    ;% controller14_DW.doneDoubleBufferReInit_d
                    section.data(10).logicalSrcIdx = 141;
                    section.data(10).dtTransOffset = 9;

                    ;% controller14_DW.doneDoubleBufferReInit_n2
                    section.data(11).logicalSrcIdx = 142;
                    section.data(11).dtTransOffset = 10;

                    ;% controller14_DW.id_not_empty
                    section.data(12).logicalSrcIdx = 143;
                    section.data(12).dtTransOffset = 11;

                    ;% controller14_DW.som_state_not_empty
                    section.data(13).logicalSrcIdx = 144;
                    section.data(13).dtTransOffset = 12;

                    ;% controller14_DW.t_fall_not_empty
                    section.data(14).logicalSrcIdx = 145;
                    section.data(14).dtTransOffset = 13;

                    ;% controller14_DW.t_dec_not_empty
                    section.data(15).logicalSrcIdx = 146;
                    section.data(15).dtTransOffset = 14;

                    ;% controller14_DW.z_setpoint_not_empty
                    section.data(16).logicalSrcIdx = 147;
                    section.data(16).dtTransOffset = 15;

                    ;% controller14_DW.t_hover_not_empty
                    section.data(17).logicalSrcIdx = 148;
                    section.data(17).dtTransOffset = 16;

                    ;% controller14_DW.t_rot_acc_not_empty
                    section.data(18).logicalSrcIdx = 149;
                    section.data(18).dtTransOffset = 17;

                    ;% controller14_DW.t_safe_not_empty
                    section.data(19).logicalSrcIdx = 150;
                    section.data(19).dtTransOffset = 18;

                    ;% controller14_DW.doneDoubleBufferReInit_ib
                    section.data(20).logicalSrcIdx = 151;
                    section.data(20).dtTransOffset = 19;

                    ;% controller14_DW.id_not_empty_f
                    section.data(21).logicalSrcIdx = 152;
                    section.data(21).dtTransOffset = 20;

                    ;% controller14_DW.init_r_not_empty
                    section.data(22).logicalSrcIdx = 153;
                    section.data(22).dtTransOffset = 21;

                    ;% controller14_DW.objisempty
                    section.data(23).logicalSrcIdx = 154;
                    section.data(23).dtTransOffset = 22;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.sfEvent
                    section.data(1).logicalSrcIdx = 155;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 156;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix3.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 157;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.sfEvent
                    section.data(1).logicalSrcIdx = 158;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.is_active_c1_controller14
                    section.data(1).logicalSrcIdx = 159;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_RotationMatrix2.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 160;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 161;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem_d.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 162;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem_d.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 163;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem_m.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 164;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1_i.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 165;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay_DSTATE
                    section.data(1).logicalSrcIdx = 166;
                    section.data(1).dtTransOffset = 0;

                    ;% controller14_DW.TriggeredSubsystem.UnitDelay1_DSTATE
                    section.data(2).logicalSrcIdx = 167;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.TriggeredSubsystem.TriggeredSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 168;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
                    section.data(1).logicalSrcIdx = 169;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(20) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.IfActionSubsystem1.IfActionSubsystem1_SubsysRanBC
                    section.data(1).logicalSrcIdx = 170;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(21) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.sfEvent
                    section.data(1).logicalSrcIdx = 171;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(22) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 172;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(23) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_m.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 173;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(24) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.sfEvent
                    section.data(1).logicalSrcIdx = 174;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(25) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 175;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(26) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_k.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 176;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(27) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.sfEvent
                    section.data(1).logicalSrcIdx = 177;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(28) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 178;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(29) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oq.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 179;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(30) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.sfEvent
                    section.data(1).logicalSrcIdx = 180;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(31) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 181;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(32) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_lw.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 182;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(33) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.sfEvent
                    section.data(1).logicalSrcIdx = 183;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(34) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 184;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(35) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_b.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 185;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(36) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.sfEvent
                    section.data(1).logicalSrcIdx = 186;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(37) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 187;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(38) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_l.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 188;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(39) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.sfEvent
                    section.data(1).logicalSrcIdx = 189;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(40) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 190;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(41) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_oy.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 191;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(42) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.sfEvent
                    section.data(1).logicalSrcIdx = 192;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(43) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.is_active_c6_controller14
                    section.data(1).logicalSrcIdx = 193;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(44) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% controller14_DW.sf_MATLABFunction_i.doneDoubleBufferReInit
                    section.data(1).logicalSrcIdx = 194;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(45) = section;
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


    targMap.checksum0 = 1526742060;
    targMap.checksum1 = 2433129293;
    targMap.checksum2 = 2607144183;
    targMap.checksum3 = 2337343193;

